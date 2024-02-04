var gantt_D;
var url;
var respuesta;

async function cargarActividades() {
    try {
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/demo/gantt/actividades`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}

async function cargarLinks() {
    try {
        url = await fetch(`https://saf.aicsacorp.com/ords/safws/saf40/demo/gantt/actividades/link`);
        respuesta = await url.json();

        return respuesta.items;
    } catch (error) {
        console.log(error);

        return null;
    }
}
async function gantt_init(gantt_id) {
    let actividades = await cargarActividades();
    let links = await cargarLinks();

    gantt.plugins({
        tooltip: true,
        fullscreen: true,
        marker: true,
        critical_path: true,
        auto_scheduling: true
    });

    gantt.config.open_tree_initially = true;
    gantt.config.grid_elastic_columns = true;
    gantt.config.show_unscheduled = false;
    gantt.config.date_grid = "%d-%M-%Y";
    //gantt.config.xml_date = "%Y-%m-%d %H:%i:%s"
    gantt.config.xml_date = "%Y-%m-%d"
    gantt.config.task_height = 15;
    gantt.config.bar_height = 20;
    gantt.config.row_height = 40;
    gantt.config.scale_height = 60;
    gantt.config.auto_scheduling = true;
    //gantt.config.resize_rows = true;
    //gantt.config.min_task_grid_row_height = 45;

    gantt.config.columns = [
        { name: "text", tree: true, width:"*", min_width: 400, resize: true, label: "Nombre" },
        { name: "start_date", label: "Fecha Inicio", align: "center", resize: true, width: 100, min_width: 100},
        { name: "end_date", label: "Fecha Fin", align: "center", resize: true, width: 100, min_width: 100 },
        { name: "duration", label: "Duracion", align: "center", resize: true, width: 90, min_width: 90 }
    ];

    gantt.config.scales = [
        {unit: "year", step: 1, format: "%Y"},
        {unit: "month", step: 1, format: "%F"},
        {unit: "day", step: 1, format: "%j, %D"}
    ];

    gantt.attachEvent("onTaskLoading", function(task){
        task.planned_start = gantt.date.parseDate(task.planned_start, "xml_date");
        task.planned_end = gantt.date.parseDate(task.planned_end, "xml_date");
        return true;
    });

    gantt.addTaskLayer(function draw_planned(task) {
        if (task.planned_start && task.planned_end) {
            var sizes = gantt.getTaskPosition(task, task.planned_start, task.planned_end);
            var el = document.createElement('div');
            el.className = 'baseline';
            el.style.left = sizes.left + 'px';
            el.style.width = sizes.width + 'px';
            el.style.top = sizes.top + gantt.config.task_height  + 13 + 'px';
            return el;
        }
        return false;
    });

    gantt.config.lightbox.sections = [
        {name: "description", height: 70, map_to: "text", type: "textarea", focus: true},
        {name: "time", height: 72, map_to: "auto", type: "duration"},
        {name: "baseline", height: 72, map_to: {
                start_date: "planned_start", end_date: "planned_end"}, type: "duration"}
    ];
    gantt.locale.labels.section_baseline = "Planned";

    gantt.init(gantt_id);
    gantt.parse({
        data: actividades,
        links: links
    });

    gantt.sort("start_date", false);

    gantt.i18n.setLocale({
        date: {
            month_full: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
                "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            month_short: ["En", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
                "Ag", "Sep", "Oct", "Nov", "Dic"],
            day_full: ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes",
                "Sábado", "Domingo"],
            day_short: ["Lun", "Mar", "Miérc", "Juev", "Vier", "Sáb", "Dom"]
        },
        labels: {
            new_task: "New task",
            icon_save: "Save",
            icon_cancel: "Cancel",
            icon_details: "Details",
            icon_edit: "Edit",
            icon_delete: "Delete",
            gantt_save_btn: "Save",
            gantt_cancel_btn: "Cancel",
            gantt_delete_btn: "Delete",
            confirm_closing: "",// Your changes will be lost, are you sure?
            confirm_deleting: "Task will be deleted permanently, are you sure?",
            section_description: "Description",
            section_time: "Time period",
            section_type: "Type",

            /* grid columns */
            column_wbs: "WBS",
            column_text: "Task name",
            column_start_date: "Start time",
            column_duration: "Duration",
            column_add: "",

            /* link confirmation */
            link: "Enlace",
            link_start: " (inicio)",
            link_end: " (final)",

            type_task: "Tarea",
            type_project: "Proyecto",
            type_milestone: "Hito",

            minutes: "Minutos",
            hours: "Horas",
            days: "Dias",
            weeks: "Semanas",
            months: "Meses",
            years: "Años",

            /* message popup */
            message_ok: "OK",
            message_cancel: "Cancel",

            /* constraints */
            section_constraint: "Constraint",
            constraint_type: "Constraint type",
            constraint_date: "Constraint date",
            asap: "As Soon As Possible",
            alap: "As Late As Possible",
            snet: "Start No Earlier Than",
            snlt: "Start No Later Than",
            fnet: "Finish No Earlier Than",
            fnlt: "Finish No Later Than",
            mso: "Must Start On",
            mfo: "Must Finish On",

            /* resource control */
            resources_filter_placeholder: "type to filter",
            resources_filter_label: "hide empty"
        }
    });

    var dateToStr = gantt.date.date_to_str(gantt.config.task_date);
    var markerId = gantt.addMarker({
        start_date: new Date(),
        css: "today",
        text: "Now",
        title: dateToStr( new Date())
    });

    gantt.templates.tooltip_text = function(start,end,task){
        return "<b>Actividad:</b> "+task.text+"<br/><b>Duration:</b> " + task.duration;
    };
}