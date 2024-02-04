// Varables de contruccion de reporte
var treeGrid, unidadMedida, form;

// Variables de carga de informacion
var url, respuesta;

//Variables de carga de estilos
var style;

// Variables para conservar seleccion de columna y fila
var row_temp, column_temp;

// Formato de Moneda para las columnas con el simbolo de moneda
function formatoMoneda(value, simbolo_moneda, row) {
    return value ? `<div${row.codigo_db && row.contador_hijo >= 1 ? " class='style_footer'" : ''}>${simbolo_moneda} ${value}</div>` : "";
};

//Formato para datos en general
function formatoGeneral(value, row) {
    return value ? `<div${row.codigo_db && row.contador_hijo >= 1 ? " class='style_footer'" : ''}>${value}</div>` : "";
}

function formatoArbolIcono(value, row) {
    return value ? `<div><span class='${row.codigo_db && row.tipo_dato == 1 ? "fa fa-folder" : "fa fa-package"}' style='color:#F4BC1C; padding-left:0; padding-right:2px;'></span><span class='${row.codigo_db && row.tipo_dato == 1 ? 'style_footer' : ''}'>${value}</span></div>` : "";
}

// Cargar columnas y filas temporales
function cargarRowColumn() {
    if (row_temp && column_temp) {
        /*if (treeGrid.selection.getCell(row_temp, column_temp)) {
            treeGrid.selection.setCell(row_temp, column_temp);
        }*/
        treeGrid.selection.setCell(row_temp, column_temp);
    }
}

// Cargar informacion de Contratos de Servicio
async function cargarDatos(contratoID) {
    try {
        // Cargar headers
        const header = new Headers({
            'CONTRATO_ID': contratoID
        });

        // Cargar datos por medio de la URL
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/contrato/servicio/renglones/`, {
            headers: header
        });
        respuesta = await url.json();

        // Eliminar la propiedad de parent solo al objeto padre maximo (parent == null)
        // Requerimiento de la libreria
        //Obligatorio
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

// Cargar las medidas para obras administrativas
async function cargarUnidadMedida() {
    try {
        // Cargar datos por medio de la URL
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/obras_administrativas_setting/unidad/medida/`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

// Cargar tipo costo para obras administrativas
async function cargarTipoCosto() {
    try {
        // Cargar datos por medio de la URL
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/obras_administrativas_setting/unidad/tipo_costo`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

// Funcion para inicializar el reporte
async function initGrid_Renglones(contratoID, treegrid_container, simbolo_moneda, name_form) {
    let respuesta;
    let unidadMedida;
    let tipo_costo;

    // Destruccion del reporte para poder inizializar
    // Obligatorio
    if (treeGrid) {
        treeGrid.destructor();
    }

    if (form) {
        form.destructor();
    }

    // Carga de datos
    respuesta = await cargarDatos(contratoID);
    unidadMedida = await cargarUnidadMedida();
    tipo_costo = await cargarTipoCosto();

    // Configuracion del reporte
    treeGrid = new dhx.TreeGrid(treegrid_container,
        {
            rootParent: 'parent',
            headerRowHeight: 30,
            columns: [
                { id: "id", type: "string",
                    header: [
                        { text: "ID", align: "center" }],
                    template: (value, row) => {
                        return formatoGeneral(value, row);
                    },
                    htmlEnable: true,
                    width: 100, minWidth: 100,
                    autoWidth: true, align: "left", editable: false },
                { id: "titulo", type: "string",
                    header: [{ text: "Nombre", align: "center" }],
                    footer : [{
                        text: '<div class="style_footer">Total</div>',
                        align: "right"
                    }],
                    template: (value, row) => {
                        return formatoGeneral(value, row);
                    },
                    htmlEnable: true,
                    autoWidth: true, minWidth: 200,  align: "left", editable: false,  width: 200 },
                { id: "tipo_costo", type: "number",
                    header: [
                        { text: "Tipo Costo", align: "center" }],
                    template: (value, row) => {
                        return formatoGeneral(value, row);
                    },
                    htmlEnable: true,
                    width: 100, minWidth: 100, align: "center",
                    editorType: "combobox",
                    //options: [{ id: 1, value: "GLOBAL"}, { id: 2, value: "UNITARIO"}],
                    options: tipo_costo,
                    editable: true },
                { id: "cantidad", type: "number",
                    header: [{ text: "Cantidad", align: "center" }], width: 100, minWidth: 100, align: "center",
                    format: "#,#.00", editable: false,
                    template: (value, row) => {
                        return formatoGeneral(value, row);
                    },
                    htmlEnable: true },
                { id: "codigo_medida", type: "number",
                    header: [{ text: "UM", align: "center" }],
                    width: 130, minWidth: 130, align: "center",
                    editorType: "combobox",
                    options: unidadMedida, editable: true,
                    template: (value, row) => {
                        return formatoGeneral(value, row);
                    },
                    htmlEnable: true },
                { id: "costo_unitario", type: "number",
                    header: [{ text: "Costo Unitario", align: "center" }], width: 150,
                    align: "right", minWidth: 150,
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    htmlEnable: true,
                    format: "#,#.00", editable: false },
                { id: "costo_total", type: "number", header: [{ text: "Costo Total", align: "center" }],
                    footer : [{
                        content: 'sum'
                    }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "indirecto", type: "number", header: [{ text: "Indirecto", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    footer : [{
                        content: 'sum'
                    }],
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    htmlEnable: true,
                    format: "#,#.00", editable: false },
                { id: "precio_unitario", type: "number", header: [{ text: "Precio Unitario", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    htmlEnable: true,
                    format: "#,#.00" },
                { id: "precio_total", type: "number", header: [{ text: "Precio Total", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    footer : [{
                        content: 'sum'
                    }],
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    htmlEnable: true,
                    format: "#,#.00" }
            ],
            data: respuesta,
            autoWidth: true,
            keyNavigation: true,
            selection: 'row',
            leftSplit: 2,
            tooltip: false,
            resizable: true,
            rowHeight: 35,
            footerRowHeight: 35,
            headerRowHeight: 35,
            css: "style_table"
        }
    );

    treeGrid.data.sort({
        by: 'id',
        dir: 'asc',
        as: function (value) { return value ? value : "" }
    });

    treeGrid.events.on('cellRightClick', function (row, column, e) {
        if (arguments.length != 0) {
            apex.item('P85002_CODIGO_DB_T').setValue(JSON.stringify(arguments[0].codigo_db));
            apex.item('P85002_TIPO_REGISTRO_T').setValue(JSON.stringify(arguments[0].tipo_dato));
            apex.item('P85002_NIVEL_T').setValue(JSON.stringify(arguments[0].nivel));
            apex.item('P85002_ORDEN_T').setValue(JSON.stringify(arguments[0].orden));
            apex.item('P85002_MAX_NIVEL_T').setValue(JSON.stringify(arguments[0].max_nivel));
            apex.item('P85002_MIN_NIVEL_T').setValue(JSON.stringify(arguments[0].min_nivel));
            apex.item('P85002_CONTADOR_DERECHA_T').setValue(JSON.stringify(arguments[0].contador_derecha));
            apex.item('P85002_TABLA_EDITAR').setValue(treegrid_container);

            row_temp = row;
            column_temp = column;
            cargarRowColumn();
        }
    });

    treeGrid.events.on('cellClick', function (row, column, e) {
        if (arguments.length != 0) {
            apex.item('P85002_CODIGO_DB_T').setValue(JSON.stringify(arguments[0].codigo_db));
            apex.item('P85002_CODIGO_RENGLON_T').setValue(JSON.stringify(arguments[0].id));
            apex.item('P85002_TIPO_REGISTRO_T').setValue(JSON.stringify(arguments[0].tipo_dato));
            apex.item('P85002_TABLA_EDITAR').setValue(treegrid_container);

            row_temp = row;
            column_temp = column;
            cargarRowColumn();
        }
    });

    treeGrid.events.on('footerCellRightClick', function () {
        apex.item('P85002_CODIGO_DB_T').setValue('');
        apex.item('P85002_TIPO_REGISTRO_T').setValue('');
        apex.item('P85002_TABLA_EDITAR').setValue('');
    });

    style = document.createElement('style');
    style.innerHTML = `
        .style_table {
            --dhx-color-primary: #FF0000;
            --dhx-s-grid-selection-background: #7EB0F3;
        }

        .style_footer {
            font-weight: bold;
        }

        .dhx_grid-footer-cell {
            background-color: #FFF9C4;
        }

        .dhx_grid-footer-cell-text > div,
        .dhx_grid-header-cell-text_content {
            font-weight: bold;
        }
    `;
    document.body.appendChild(style);

    /*form = new dhx.Form("formBuscadorRenglones", {
        rows: [
            {
                type: "input",
                label: "Buscador",
                icon: "dxi dxi-magnify",
                name: "buscador",
                hiddenLabel: true,
            },
        ]
    });*/
}

function cambiarLeftSplit(nuevoValor) {
    // Verifica si la instancia de treeGrid existe
    if (treeGrid) {
        // Actualiza la propiedad leftSplit con el nuevo valor
        treeGrid.config.leftSplit = nuevoValor;

        // Intenta utilizar treeGrid.render() o treeGrid.paint()
        if (treeGrid.paint) {
            treeGrid.paint();
        } else if (treeGrid.render) {
            treeGrid.render();
        } else {
            console.error("No se pudo encontrar un método para renderizar la grid.");
        }
    }
}