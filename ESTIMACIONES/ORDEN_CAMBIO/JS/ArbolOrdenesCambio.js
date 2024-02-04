// Varables de contruccion de reporte
var treeGrid;
var unidadMedida;
var form; //Fase de desarrollo aun --Minino---

// Variables de carga de informacion
var url;
var respuesta;

//Variables de carga de estilos
var style;

// Formato de Moneda para las columnas con el simbolo de moneda
function formatoMoneda(value, simbolo_moneda, row) {
    return value ? `<div${row.codigo_db && row.nivel < 4 ? " class='style_footer'" : ''}>${simbolo_moneda} ${value}</div>` : "";
};

//Formato para datos en general
function formatoGeneral(value, row) {
    return value ? `<div${row.codigo_db && row.nivel < 4 ? " class='style_footer'" : ''}>${value}</div>` : "";
}

function formatoArbolIcono(value, row) {
    return value ? `<div><span class='${row.codigo_db && row.nivel < 4 ? "fa fa-folder" : "fa fa-package"}' style='color:#F4BC1C; padding-left:0; padding-right:2px;'></span><span class='${row.codigo_db && row.nivel < 4 ? 'style_footer' : ''}'>${value}</span></div>` : "";
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

async function cargarDatos(valor_orden_cambio,valor_idcontrato) {
    try {
        //Carga de Headers
        const headersHojaCostos = new Headers({
            'ID_ORDEN_CAMBIO': valor_orden_cambio,
            'ID_CONTRATO': valor_idcontrato
        });

        // Cargar datos por medio de la URL
        const urlHojaCostos = await fetch('https://saf.aicsacorp.com/ords/safws/saf40/ordescambio/renglonesactividades', {
            headers: headersHojaCostos
        });

        const respuesta = await urlHojaCostos.json();
        //Esto es importante
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
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/obras_administrativas_setting/unidad/medida/`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function initGrid(valor_orden_cambio,valor_idcontrato,treegrid_container, simbolo_moneda) {
    let respuesta;
    let unidadMedida;

    if (treeGrid) {
        treeGrid.destructor();
    }

    respuesta = await cargarDatos(valor_orden_cambio,valor_idcontrato);
    unidadMedida = await cargarUnidadMedida();

    treeGrid = new dhx.TreeGrid(treegrid_container,
        {
            rootParent: 'parent',
            headerRowHeight: 30,
            columns: [
                { id: "id_bloque", type: "string",
                    header: [
                        { text: "ID", align: "center" },
                        //{ content: "inputFilter", tooltipTemplate: () => "Buscar codigo" }
                    ],
                    adjust: "data",
                    minWidth: 100, htmlEnable: true,
                    autoWidth: true, align: "left", resizable: true
                },
                { id: "nombre", type: "string", header: [{ text: "Nombre", align: "center"}],
                    adjust: "data",
                    minWidth: 200, align: "left",
                    footer : [{
                        text: '<div class="style_footer">Total</div>',
                        align: "right"
                    }],
                    htmlEnable: true,
                },
                { id: "cantidad", type: "number", header: [{ text: "Cantidad", align: "center" }],
                    width: 100, align: "center",
                    htmlEnable: true,
                },
                { id: "descripcion_medida", type: "string", header: [{ text: "UM", align: "center"}],
                    width: 100, align: "center",
                    htmlEnable: true,
                },
                { id: "costo_unitario", type: "number", header: [{ text: "Costo Unitario", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    footer : [{
                        content: 'sum'
                    }],
                    htmlEnable: true,
                    format: "#,#.00"
                },
                { id: "costo_total", type: "number", header: [{ text: "Costo Total", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    footer : [{
                        content: 'sum'
                    }],
                    htmlEnable: true,
                    format: "#,#.00"
                },
                { id: "indirecto", type: "number", header: [{ text: "Indirecto", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    footer : [{
                        content: 'sum'
                    }],
                    htmlEnable: true,
                    format: "#,#.00"
                },
                { id: "precio_unitario", type: "number", header: [{ text: "Precio Unitario", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    footer : [{
                        content: 'sum'
                    }],
                    htmlEnable: true,
                    format: "#,#.00"
                },
                { id: "precio_total", type: "number", header: [{ text: "Precio Total", align: "center" }],
                    width: 150, minWidth: 150, align: "right",
                    template: (value, row) => {
                        return formatoMoneda(value, simbolo_moneda, row);
                    },
                    footer : [{
                        content: 'sum'
                    }],
                    htmlEnable: true,
                    format: "#,#.00"
                }
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
            css: "style_table",
            //collapsed: true
        }
    );

    treeGrid.data.sort({
        by: 'id',
        dir: 'asc',
        as: function (value) { return value ? value : "" }
    });

    //Evento del click
    treeGrid.events.on('cellDblClick', function () {
        //console.log("El  ",arguments);
        //var idColumnas = ['id_bloque'];
        if(arguments.length != 0){
            //var columnaId = arguments[1].id_bloque;
            //console.log("Ingreso ", arguments[1].id);
            //if (!idColumnas.includes(columnaId)) {
            apex.item("P82001_ID").setValue(arguments[0].codigo_db);
            apex.item("P82001_CODIGO_RENGLON").setValue(arguments[0].parent);
            apex.item("P82001_ES_PADRE").setValue(arguments[0].es_padre);
            $('#splitter_renglones_splitter').splitter({collapsed:false,position:540})
            $.event.trigger('lateralDerecho');
            console.log("Ingreso Click");
            //};
        };
    });

    treeGrid.events.on('cellRightClick', function (row, column, e) {
        if (arguments.length != 0) {
            apex.item('P82001_CODIGO_DB_T').setValue(JSON.stringify(arguments[0].codigo_db));
            apex.item('P82001_TIPO_REGISTRO_T').setValue(JSON.stringify(arguments[0].es_padre));
            apex.item('P82001_NIVEL_T').setValue(JSON.stringify(arguments[0].nivel));
            apex.item('P82001_ORDEN_T').setValue(JSON.stringify(arguments[0].orden));
            apex.item('P82001_MAX_NIVEL_T').setValue(JSON.stringify(arguments[0].max_nivel));
            apex.item('P82001_MIN_NIVEL_T').setValue(JSON.stringify(arguments[0].min_nivel));
            apex.item('P82001_CONTADOR_DERECHA_T').setValue(JSON.stringify(arguments[0].contador_derecha));
            apex.item("P82001_CODIGO_RENGLON_T").setValue(arguments[0].parent);
            apex.item("P82001_ES_PADRE_T").setValue(arguments[0].es_padre);
        }
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
}