

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
            elemento=$(`#${idRegion} .t-Report-paginationText`);
        }else{
            elemento=$(`#${idRegion}_data_panel .a-IRR-pagination-label`)
        }
        let result=elemento.html().substring(elemento.html().indexOf("-")+1)+` ${texto}`;
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


// Funcion para reportes PDF por medio de jsPDF
function importRegiontoDPF(name_file, margin_doc, widthInPixel, heightInPixel, idRegion) {
    var widthInInches = (widthInPixel / 96) + (margin_doc * 2);
    var heightInInches = (heightInPixel / 96) + (margin_doc * 2);
    
    let options = {
        filename: name_file + '.pdf',
        margin: margin_doc,
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: [(heightInInches + (margin_doc * 2)), widthInInches], orientation: 'landscape' },
    };

    html2pdf().set(options).from(document.getElementById(idRegion)).save();
}