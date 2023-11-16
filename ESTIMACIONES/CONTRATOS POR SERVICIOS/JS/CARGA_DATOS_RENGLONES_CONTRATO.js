// Varables de contruccion de reporte
var treeGrid;
var unidadMedida;

// Variables de carga de informacion
var url;
var respuesta;

function ocultarACtividades(treegrid_container) {
    if (treeGrid) {
        let temp = [];
        let contenedor = document.getElementById(treegrid_container);
        let elementos = contenedor.querySelectorAll('[data-dhx-id]');

        treeGrid.data.forEach(obj => {
            if (obj.tipo_dato == 2) {
                temp.push(obj.id);
            }
        });

        elementos.forEach(obj => {
            if (validarVector(temp, obj.getAttribute('data-dhx-id'))) {
                obj.style.display = 'none';
            }
        });
    }
}

function validarVector(vector_a, valor) {
    return vector_a.includes(valor);
}

function formatoMoneda(value, simbolo_moneda) {
    if (!value) return ""
        return `<div">${simbolo_moneda} ${value}</div>`;
};

async function cargarDatos(contratoID) {
    try {
        // Cargar datos por medio de la URL
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/contratoservicio/contrato/renglones/${contratoID}`);
        respuesta = await url.json();

        respuesta.items.forEach(obj => {
            if (obj.parent == null) { delete obj.parent }
        });

        // Inicializacion del reporte con la informacion
        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function cargarUnidadMedida() {
    try {
        // Cargar datos por medio de la URL
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/contratoservicio/unidad/medida/`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function initGrid(contratoID, treegrid_container, simbolo_moneda) {
    let respuesta;
    let unidadMedida;

    if (treeGrid) {
        treeGrid.destructor();
    }

    respuesta = await cargarDatos(contratoID);
    unidadMedida = await cargarUnidadMedida();

    treeGrid = new dhx.TreeGrid(treegrid_container,
        {
            rootParent: 'parent',
            headerRowHeight: 30,
            columns: [
                { id: "id", type: "string", 
                    header: [
                            { text: "ID", align: "center" },
                            { content: "inputFilter", tooltipTemplate: () => "Buscar codigo" }], 
                    autoWidth: true, minWidth: 300, width: 300, align: "left", resizable: true, editable: true },
                { id: "titulo", type: "string", header: [{ text: "Nombre", align: "center", rowspan: 2 }], width: 500, align: "left", editable: true, resizable: true },
                { id: "cantidad", type: "number", header: [{ text: "Cantidad", align: "center", rowspan: 2 }], width: 100, align: "center", format: "#,#.00", editable: true },
                { id: "codigo_medida", type: "number", 
                    header: [
                            { text: "UM", align: "center" },
                            { content: "selectFilter" }],
                    width: 130, align: "center",
                    editorType: "combobox",
                    options: unidadMedida, editable: true },
                { id: "tipo_costo", type: "number", 
                    header: [
                            { text: "Tipo Costo", align: "center", rowspan: 2 }], 
                    width: 100, align: "center",
                    editorType: "combobox",
                    options: (col, row) => {
                        if (row.tipo_dato == 1) return [{ id: 1, value: "GLOBAL"}, { id: 2, value: "UNITARIO"}]
                            return [{ id: 3, value: " "}];
                    },
                    editable: true },
                { id: "costo_unitario", type: "number", header: [{ text: "Costo Unitario", align: "center", rowspan: 2 }], width: 150, align: "right",
                    template: (value) => {
                        return formatoMoneda(value, simbolo_moneda);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "costo_total", type: "number", header: [{ text: "Costo Total", align: "center", rowspan: 2 }], width: 150, align: "right",
                    template: (value) => {
                        return formatoMoneda(value, simbolo_moneda);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "indirecto", type: "number", header: [{ text: "Indirecto", align: "center", rowspan: 2 }], width: 150, align: "right",
                    template: (value) => {
                        return formatoMoneda(value, simbolo_moneda);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "precio_unitario", type: "number", header: [{ text: "Precio Unitario", align: "center", rowspan: 2 }], width: 150, align: "right",
                    template: (value) => {
                        return formatoMoneda(value, simbolo_moneda);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "precio_total", type: "number", header: [{ text: "Precio Total", align: "center", rowspan: 2 }], width: 150, align: "right",
                    template: (value) => {
                        return formatoMoneda(value, simbolo_moneda);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "estado", type: "number", header: [{ text: "Estado", align: "center", rowspan: 2 }], align: "center", autoWidth: true, width: 100 },
                { id: "tipo_dato", type: "number", header: [{ text: "Tipo Dato", align: "center", rowspan: 2 }], align: "center", autoWidth: true, width: 100 },
                { id: "codigo_db", type: "number", header: [{ text: "Codigo DB", align: "center", rowspan: 2 }], align: "center", autoWidth: true, width: 100 }
            ],
            data: respuesta,
            autoWidth: true,
            autoHeight: true,
            keyNavigation: true,
            selection: "row",
            keyNavigation: true,
            leftSplit: 1,
            tooltip: false
        }
    );

    treeGrid.hideColumn('estado');
    treeGrid.hideColumn('tipo_dato');
    treeGrid.hideColumn('codigo_db');

    treeGrid.events.on('cellClick', function () {
        if (arguments.length != 0) {
            console.log(JSON.stringify(arguments[0]));
        }
    });

    treeGrid.events.on('beforeEditEnd', function () {
        if (arguments.length != 0) {
            console.log(JSON.stringify(arguments));
        }
    });
}