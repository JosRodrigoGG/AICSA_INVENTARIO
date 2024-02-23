

function g_MostrarNumeroLineasIR(idRegion){
    i_cambiarElemento(idRegion,'Líneas','IR');
}

function g_MostrarNumeroRegistrosIR(idRegion){
    i_cambiarElemento(idRegion,'Registros','IR');
}

function g_MostrarLineasCR(idRegion){
    i_cambiarElemento(idRegion,'Líneas','CR');
}

function i_cambiarElemento(idRegion, texto, tipoRepote){
    try{
        let elemento;

        if(tipoRepote=='CR'){
            elemento = $(`#${idRegion} .t-Report-paginationText`);
        }else{
            elemento = $(`#${idRegion}_data_panel .a-IRR-pagination-label`)
        }
        let result=elemento.html().substring(elemento.html().indexOf("-")+1)+` ${texto}`;

        elemento.html(result);
    }catch{
        console.log('¡ERR!');
    }
}

function g_MostrarNumeroRegistrosIR_texto(idRegion, texto) {
    try{
        let elemento = $(`#${idRegion}_data_panel .a-IRR-pagination-label`);

        let result =
            `
                <span id="${idRegion}_contador" class="a-IRR-pagination-label">${elemento.html().substring(elemento.html().indexOf("-")+1)} Registros</span>
                <br>
                <span id="${idRegion}_texto" class="a-IRR-pagination-label">${texto}</span>
            `;

        elemento.html(result);
    }catch{
        console.log('¡ERR!');
    }
}

function g_MostrarRegistrosDirectos(idRegion, texto){
    try{
        let elemento=$(`#${idRegion}_data_panel .a-IRR-pagination-label`)
        elemento.html(`${texto}`+` Registros`);
    }catch{
        console.log('¡ERR!');
    }
}
function cargaLogo(global_empresa){
    if(global_empresa !='' && global_empresa!=' ' && global_empresa != null){
        var url;
        url = "https://saf.aicsacorp.com/ords/safws/IMAGENES_SAF/img_empresa_unidad/"+global_empresa;
        $(".logo_empresa").attr("src",url).attr("onerror","this.style.display='none'");
    }else{
        $(".logo_empresa").hide();
    }
}


function read_only_pop_lov(arrLov){
    arrLov.map( val => {
        $(`#${val}_CONTAINER`).css({  "pointer-events":"none", "opacity":1});
        $(`#${val}_CONTAINER input`).css({"background-color": "#f7f7f7"}).attr('tabindex', "-1");
        $(`#${val}_CONTAINER button`).css({"opacity":0.5});

    })
}

//------------------------------------------------------------------------------
//--------------------- READ ONLY CUALQUIER ITEM -------------------------------
//------------------------------------------------------------------------------

let popup_lov_readonly = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"none", "opacity":1});
    $(`#${itemId}_CONTAINER input`).css({"background-color": "#f7f7f7"}).attr('tabindex', "-1");
    $(`#${itemId}_CONTAINER button`).css({"opacity":0.5});
}

let select_readonly = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"none", "opacity":1});
    $(`#${itemId}`).css({"background-color": "#f7f7f7"}).attr('tabindex', "-1");
}

let item_readonly = itemId => {
    $(`#${itemId}`).attr("readonly", "readonly");
}

let datepicket_readonly = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"none", "opacity":1});
    $(`#${itemId}_input`).css({"background-color": "#f7f7f7"}).attr('tabindex', "-1");
}

let switch_readonly = itemId => {
    $(`#${itemId}_CONTAINER > .t-Form-inputContainer`).css({  "pointer-events":"none", "opacity":0.5});
    $(`#${itemId}_LABEL`).css({"pointer-events": "none"});
}

let checkbox_readonly = itemId => {
    $(`#${itemId}`).attr('onclick', 'return false;');
}

function read_only_item_any_type(arrLov){
    arrLov.map( val => {
        let itemId = $(`#${val}`)

        // VALIDA SI ES POPUP LOV
        if (itemId.hasClass('popup_lov')) popup_lov_readonly(val);

        // VALIDA SI ES SELECT
        if (itemId.hasClass('selectlist')) select_readonly(val);

        // VALIDA SI ES TEXTAREA, NUMBER FIELD O TEXT FIELD
        if (itemId.hasClass('text_field') || itemId.hasClass('number_field') || itemId.hasClass('textarea')) item_readonly(val);

        // VALIDA SI ES DATEPICKER
        if ($(`#${val}_input`).hasClass('apex-item-datepicker')) datepicket_readonly(val);

        // VALIDA SI ES SWITCH
        if(itemId.closest('span.a-Switch').hasClass('a-Switch')) switch_readonly(val);

        // VALIDAR SI ES CHECKBOX
        if(itemId.is(':checkbox')) checkbox_readonly(val);

    })
}


//------------------------------------------------------------------------------
//--------------------- QUITAR READ ONLY CUALQUIER ITEM -------------------------------
//------------------------------------------------------------------------------
let popup_lov_readonly_remove = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"", "opacity":""});
    $(`#${itemId}_CONTAINER input`).css({"background-color": ""}).removeAttr('tabindex');
    $(`#${itemId}_CONTAINER button`).css({"opacity":""});
}

let select_readonly_remove = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"", "opacity":""});
    $(`#${itemId}`).css({"background-color": ""}).removeAttr('tabindex');
}

let item_readonly_remove = itemId => {
    $(`#${itemId}`).removeAttr("readonly");
}

let datepicket_readonly_remove = itemId => {
    $(`#${itemId}_CONTAINER`).css({  "pointer-events":"", "opacity":""});
    $(`#${itemId}_input`).css({"background-color": ""}).removeAttr('tabindex');
}

let switch_readonly_remove = itemId => {
    $(`#${itemId}_CONTAINER > .t-Form-inputContainer`).css({  "pointer-events":"", "opacity":""});
    $(`#${itemId}_LABEL`).css({"pointer-events": ""});
}

let checkbox_readonly_remove = itemId => {
    $(`#${itemId}`).removeAttr('onclick');
}

function read_only_item_any_type_remove(arrLov){
    arrLov.map( val => {
        let itemId = $(`#${val}`)

        // VALIDA SI ES POPUP LOV
        if (itemId.hasClass('popup_lov')) popup_lov_readonly_remove(val);

        // VALIDA SI ES SELECT
        if (itemId.hasClass('selectlist')) select_readonly_remove(val);

        // VALIDA SI ES TEXTAREA, NUMBER FIELD O TEXT FIELD
        if (itemId.hasClass('text_field') || itemId.hasClass('number_field') || itemId.hasClass('textarea')) item_readonly_remove(val);

        // VALIDA SI ES DATEPICKER
        if ($(`#${val}_input`).hasClass('apex-item-datepicker')) datepicket_readonly_remove(val);

        // VALIDA SI ES SWITCH
        if(itemId.closest('span.a-Switch').hasClass('a-Switch')) switch_readonly_remove(val);

        // VALIDAR SI ES CHECKBOX
        if(itemId.is(':checkbox')) checkbox_readonly_remove(val);

    })
}

// Validacion para saber si todos los campos estan llenos para realizar una accion
// Se manda un vector con el nombre de cada input
function validarCamposRequeridos(elementos) {
    for (let i = 0; i < elementos.length; i++) {
        if (apex.item(elementos[i]).getValue() == '') {
            return false;
        }
    }
    return true;
}

// Validar si un numero es valido y si es mayor a 0
// Entrada de cadena por medio de formato 999G999G999G999G990D00
function validarNumerosDecimales(cadena) {
    if (cadena.length != 0) {
        var patron = /^\d+(\.\d+)?$/;
        return patron.test(cadena.replaceAll(',',''));
    }
}

// Validar si un numero es valido, quitando los simbolos de moneda
// Entrada de cadena por medio de formato 999G999G999G999G990D00
function validarNumerosDecimalesMoneda(cadena, simbolo_moneda) {
    if (cadena.length != 0) {
        var patron = /^-?\d+(\.\d+)?$/;
        return patron.test(cadena.replaceAll(',','').replaceAll(simbolo_moneda,''));
    }
}

// Validar si un numero es valido y si esta entre dos numeros
// Entrada de cadena por medio de formato 999G999G999G999G990D00
function validarNumerosDecimalesEnRango(cadena, rangoMinimo, rangoMaximo) {
    if (cadena.length != 0) {
        var patron = /^-?\d+(\.\d+)?$/;
        if (!patron.test(cadena.replaceAll(',',''))) {
            return false;
        }

        var numero = parseFloat(cadena.replaceAll(',',''));
        return numero >= rangoMinimo && numero <= rangoMaximo;
    }
    return true;
}

// Aplica disenio de requerido a los campos mandados
function createRequiredItem(idItem, textItem) {
    const createSpan = (text, fontWeight, color) => {
        const span = document.createElement('span');
        span.style.fontWeight = fontWeight;
        span.style.color = color;
        span.textContent = text;
        return span;
    };

    const req = createSpan('* ', 'bold', '#D63B25');
    const text = createSpan(textItem, 'bold', '#161513B3');
    req.appendChild(text);

    const label = document.getElementById(`${idItem}_LABEL`);
    label.textContent = '';
    label.appendChild(req);
}

// Aplica disenio de no requerido a los campos mandados
function deleteRequiredItem(idItem, textItem) {
    const createSpan = (text, fontWeight, color) => {
        const span = document.createElement('span');
        span.style.fontWeight = fontWeight;
        span.style.color = color;
        span.textContent = text;
        return span;
    };

    const text = createSpan(textItem, 'bold', '#161513B3');

    const label = document.getElementById(`${idItem}_LABEL`);
    label.textContent = '';
    label.appendChild(text);
}


//Funcion para hacer consultas al API
async function methodData(url = '', data = {}, method_URL) {
    try {
        const response = await fetch(url, {
            method: method_URL,
            mode: 'cors',
            cache: 'no-cache',
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/json'
            },
            redirect: 'follow',
            referrerPolicy: 'no-referrer',
            body: JSON.stringify(data)
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        return await response.json();
    } catch (error) {
        console.error(`Error en la solicitud ${method_URL}:`, error);
    }
}

// Tamanio de region principal
// Pantalla principal NETO
//id : ID interactive report
function heigthPantalla(id) {
    try {
        var region = document.getElementById(`${id}_ir`);
        var height = $(window).height() - 240;

        region.querySelector(`#${id}_worksheet_region`).querySelector(`#${id}_full_view`).querySelector(`#${id}_content`)
            .querySelector(`#${id}_data_panel`).querySelector('.a-IRR-tableContainer').querySelector('.t-fht-wrapper')
            .querySelector('.t-fht-tbody').style.height = `${height}px`;
    } catch (e) {
        console.error(e);
    }
}

// Tamanio contenido de FOS
// NETO
function heigthFosContent() {
    $(".t-TabsRegionN2 .t-TabsRegion-itemsN2 .a-Tabs-panel").css("height",$(window).height() - 205);
}

// Tamanio de FOS
// Retorna tamanio calculado en px
function heigthAppPageFos(app, page) {
    const heightAdjustments = {
        238: {
            default: 125,
            155: 131,
            82001: 95,
            400: 80
        },
        227: {
            2: 118
        },
        230: {
            266: 120,
            82000: 115
        },
        202: {
            21: 124
        },
        220: {
            default: 115,
            300: 80
        },
        103: {
            default: 115
        },
        205: {
            26: 115
        },
        218: {
            16: 115
        },
        244: {
            116: 115
        },
        240: {
            2: 120
        },
        248: {
            1: 115
        }
    };

    const appConfig = heightAdjustments[app] || {};
    if (!appConfig) {
        console.error(`App ${app} no registrada en la funcion heightAppPageFos(app, page)`);
        return 0;
    }

    const pageHeightAdjustment = appConfig[page] || appConfig.default;
    if (pageHeightAdjustment === undefined) {
        console.error(`Page ${page} no registrada en App ${app} en la funcion heightAppPageFos(app, page)`);
        return 0;
    }

    return $(window).height() - pageHeightAdjustment;
}

// Tamanio de la region principal
// id = Static ID del interactive report
function heigthAppPage(id, app, page) {
    const heightAdjustments = {
        238: {
            default: 240,
            155: 270,
            600: 317,
            400: 260
        },
        227: {
            2: 240
        },
        230: {
            default: 240,
            266: 244
        },
        202: {
            21: 246
        },
        103: {
            default: 240
        },
        205: {
            26: 240
        },
        218: {
            16: 240
        },
        244: {
            116: 240
        },
        240: {
            2: 240
        },
        220: {
            default: 240,
            300: 200
        },
        248: {
            1: 240
        }
    };

    try {
        const appConfig = heightAdjustments[app] || {};
        if (!appConfig) {
            throw new Error(`App ${app} no registrada en la funcion heightAppPage(id, app, page)`);
        }

        const pageHeight = appConfig[page] || appConfig.default;
        if (pageHeight === undefined) {
            throw new Error(`Page ${page} no registrada en App ${app} en la funcion heightAppPage(id, app, page)`);
        }

        const height = $(window).height() - pageHeight;
        $(`#${id}_worksheet_region #${id}_full_view #${id}_content #${id}_data_panel .a-IRR-tableContainer .t-fht-wrapper .t-fht-tbody`).css("height", height);
    } catch (e) {
        console.error(e.message);
    }
}

//Tamanio lateral derecho
function heigthFosContentAppPage(app, page) {
    const heightAdjustments = {
        238: {
            default: 200,
            266: 215,
            300: 215
        },
        227: {
            default: 205
        },
        230: {
            default: 215,
            85000: 205
        },
        202: {
            21: 205
        },
        103: {
            20: 215,
            27: 205
        },
        205: {
            26: 205
        },
        218: {
            16: 205
        },
        244: {
            116: 205
        },
        240: {
            2: 205
        },
        220: {
            200: 205,
            300: 190
        },
        248: {
            1: 205
        }
    };

    try {
        const appConfig = heightAdjustments[app] || {};
        const heightAdjustment = appConfig[page] || appConfig.default;

        if (heightAdjustment === undefined) {
            console.error(`Page ${page} no registrada en App ${app} en la funcion heightFosContentAppPage(app, page)`);
            return;
        }

        const height = $(window).height() - heightAdjustment;
        $(".t-TabsRegionN2 .t-TabsRegion-itemsN2 .a-Tabs-panel").css("height", height);
    } catch (e) {
        console.error(e);
    }
}

//Quitar fos de interactive report en renglon principal contenido en split para
//tener opcion de 2 lineas de registros
function deleteContentFosIR(idRegion, idFOS) {
    try {
        const height = $(window).height() - heightAdjustment;
        $(`#${idRegion}_splitter > #${idRegion}_splitter_first > div > #${idFOS} > .container`).css("display", "none");
    } catch (e) {
        console.error(e);
    }
}