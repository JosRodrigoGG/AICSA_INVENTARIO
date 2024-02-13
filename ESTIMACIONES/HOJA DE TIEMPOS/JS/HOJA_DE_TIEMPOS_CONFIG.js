var treeGrid;
var url, respuesta;
var style;
var row_temp, column_temp;
var x_temp, y_temp = 0;

async function cargarDatos(id_hoja_tiempo, fecha, tipo_vista) {
    try {
        const header = new Headers({
            'ID_HOJA_TIEMPO': id_hoja_tiempo,
            'FECHA': fecha,
            'TIPO_VISTA': tipo_vista
        });

        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/hoja/tiempos`, {
            headers: header
        });
        respuesta = await url.json();

        respuesta.items.forEach(obj => {
            if (obj.parent == null) { delete obj.parent }
        });

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function cargarTotalesFooter(id_hoja_tiempo, fecha, tipo_vista) {
    try {
        const header = new Headers({
            'ID_HOJA_TIEMPO': id_hoja_tiempo,
            'NUMERO_FECHA': fecha,
            'TIPO_TOTAL': tipo_vista
        });

        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/hoja/tiempos/totales/footer`, {
            headers: header
        });
        respuesta = await url.json();

        return respuesta.TOTAL ? respuesta.TOTAL : 0;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function cargarTotalesFila(id_hoja_tiempo, tipo_vista) {
    try {
        const header = new Headers({
            'TIPO_REGISTRO': tipo_vista,
            'ID_HOJA_TIEMPO': id_hoja_tiempo
        });

        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/hoja/tiempos/totales`, {
            headers: header
        });
        respuesta = await url.json();

        return respuesta.TOTAL ? respuesta.TOTAL : 0;
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

function formatoGeneral(value, row) {
    return value ? `<div${row.tipo === 'CS' ? " class='style_cs'" : ''}>${value}</div>` : "";
}

function tituloFechas(fecha, dias) {
    var fechaResultante = new Date(fecha);

    fechaResultante.setDate(fechaResultante.getDate() + dias);

    return fechaResultante;
}

function lpad(originalString, targetLength, padString) {
    originalString = originalString.toString();

    while (originalString.length < targetLength) {
        originalString = padString + originalString;
    }

    return originalString.length > targetLength ? originalString.substring(originalString.length - targetLength) : originalString;
}

function cargarScroll() {
    if (treeGrid) {
        treeGrid.scroll(x_temp, y_temp);
    }
}

function cargarRowColumn() {
    if (row_temp && column_temp) {
        treeGrid.selection.setCell(row_temp, column_temp);
    }
}

function obtenerNombreDia(fecha) {
    var dias = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
    var dia = fecha.getDay();
    return dias[dia];
}

async function initGrid_HT(treegrid_container, semanas, id_hoja_tiempo, fecha) {
    let respuestaT;
    let unidadMedida;
    let configColumn;

    const heigthRegion = $(window).height() - 275;
    const widthRegion = $(window).width() - 96;

    const numero_dias = (semana) => {
       if (semana == 1) {
           return 7;
       } else {
           return 14;
       }
    };

    if (treeGrid) {
        treeGrid.destructor();
    }

    respuestaT = await cargarDatos(id_hoja_tiempo, fecha, semanas);
    //unidadMedida = await cargarUnidadMedida();

    configColumn =
    [
        { id: "id", type: "string",
            header: [
                { text: "ID", align: "center" }],
            align: "left", editable: false },
        { id: "orden", type: "number",
            header: [
                { text: "ORDEN", align: "center" }],
            align: "left", editable: false },
        { id: "parent", type: "string",
            header: [
                { text: "PARENT", align: "center" }],
            align: "left", editable: false },
        { id: "nivel", type: "number",
            header: [
                { text: "NIVEL", align: "center" }],
            align: "left", editable: false },
        { id: "titulo", type: "string",
            header: [{ text: "Descripcion", align: "center" }],
            footer : [
                { text: '<div class="style_footer">Total Horas Facturables</div>', align: "right" },
                { text: '<div class="style_footer">Total Horas Administrativas</div>', align: "right" },
                { text: '<div class="style_footer">Total</div>', align: "right" }],
            width: 790, minWidth: 400, align: "left", editable: false, htmlEnable: true,
            template: (value, row) => {
                return formatoGeneral(value, row);
            }},
        { id: "tipo", type: "string",
            header: [
                { text: "TIPO", align: "center" }],
            align: "left", editable: false }
    ];

    var partes = fecha.split('-');

    var diaF = partes[0];
    var mesF = partes[1] - 1;
    var anioF = partes[2];

    for (let i = 1; i <= numero_dias(semanas); i++) {
        var dia = tituloFechas(new Date(anioF, mesF, diaF), i-1).getDate();
        var mes = tituloFechas(new Date(anioF, mesF, diaF), i-1).getMonth() + 1;
        var anio = tituloFechas(new Date(anioF, mesF, diaF), i-1).getFullYear();

        var total1 = await cargarTotalesFooter(id_hoja_tiempo, i, 1);
        var total2 = await cargarTotalesFooter(id_hoja_tiempo, i, 2);
        var total3 = total1 + total2;

        configColumn.push(
            { id: i.toString(), type: "number", minWidth: 120, maxWidth: 120, width: 120,
                header: [
                    { text: `${lpad(dia, 2, '0')}/${lpad(mes, 2, '0')}/${anio}`, align: "center" }],
                align: "center", editable: true, htmlEnable: true,
                footer : [
                    { align: "center", text: `<div class="style_footer_datos">${total1}</div>` },
                    { align: "center", text: `<div class="style_footer_datos">${total2}</div>` },
                    { align: "center", text: `<div class="style_footer_datos">${total3}</div>` }]
            }
        )
    }

    var total1 = await cargarTotalesFila(id_hoja_tiempo, 1);
    var total2 = await cargarTotalesFila(id_hoja_tiempo, 2);
    var total3 = total1 + total2;

    configColumn.push(
        { id: 'totales', type: "number", minWidth: 120, maxWidth: 120, width: 120,
                header: [
                    { text: `Totales`, align: "center" }],
                align: "center", editable: false, htmlEnable: true,
                footer : [
                    { align: "center", text: `<div> ${total1}</div>` },
                    { align: "center", text: `<div> ${total2}</div>` },
                    { align: "center", text: `<div> ${total3}</div>` }]
            }
    );

    treeGrid = new dhx.TreeGrid(treegrid_container,
        {
            columns: configColumn,
            data: respuestaT,
            htmlEnable: true,
            autoWidth: true,
            keyNavigation: true,
            tooltip: false,
            resizable: true,
            rootParent: 'parent',
            selection: 'complex',
            leftSplit: 2,
            rowHeight: 35,
            footerRowHeight: 35,
            headerRowHeight: 35,
            autoHeight: false,
            footerAutoHeight: true,
            css: "style_table",
            height: heigthRegion,
            width: widthRegion,
            rowCss: function (row) {
                return row.tipo === 'CS' ? 'style_row_cs' : row.tipo === 'TA' ? 'style_row_ta' : '';
            }
        }
    )

    treeGrid.events.on('beforeEditEnd', function (row, column, e) {
        apex.item('P84020_NUEVO_VALOR').setValue(row);
        apex.item('P84020_TIPO_REGISTRO').setValue(column.tipo);
        apex.item('P84020_CODIGO_REGLON').setValue(column.id);
        apex.item('P84020_ID_FECHA').setValue(e.id);
        apex.item('P84020_NIVEL').setValue(column.nivel);

        $.event.trigger('CARGAR_VALOR_HORA');
    });

    treeGrid.events.on('cellDblClick', function (row, column, e) {
        row_temp = row;
        column_temp = column;

        y_temp = treeGrid.getScrollState().y ? treeGrid.getScrollState().y : 0;
        x_temp = treeGrid.getScrollState().x ? treeGrid.getScrollState().x : 0;
    })

    treeGrid.data.sort({
        by: 'orden',
        dir: 'asc',
        as: function (value) { return value ? value : "" }
    });

    treeGrid.hideColumn('id');
    treeGrid.hideColumn('orden');
    treeGrid.hideColumn('parent');
    treeGrid.hideColumn('tipo');
    treeGrid.hideColumn('nivel');

    style = document.createElement('style');
    style.innerHTML = `
        .style_table {
            --dhx-color-primary: #FF0000;
            --dhx-s-grid-selection-background: #7EB0F3;
        }
        
        .style_cs {
            font-weight: bold;
        }

        .style_footer {
            font-weight: bold;
        }
        
        .style_footer_datos {
            font-weight: bold;
        }
        
        .style_row_cs {
            background: #9fc5f8;
        }
        
        .style_row_ta {
            background: #dddddd;
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

    treeGrid.scroll(x_temp ? x_temp : 0, y_temp ? y_temp : 0);
    if (row_temp && column_temp) {
        treeGrid.selection.setCell(row_temp, column_temp);
    }
}