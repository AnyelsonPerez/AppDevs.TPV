var Usuario = null;
var Clave = null;
var Mensaje = null;
var Recuerdame = null;
var AjaxPendiente;

$(document).on({
    ajaxStart: function () {
        $("#dProcesando").modal({ backdrop: false, show: true });
    },
    ajaxComplete: function (e) {
        if (!!e && !!e.d && !!e.d.Result && e.d.Result == "ERROR")
            MostrarMensaje("Error", e.d.Message, "error");
        $("#dProcesando").modal('hide');
    },
    ajaxError: function (e, ex) {
        if (!!ex && !!ex.responseJSON && !!ex.responseJSON.Message)
            console.error(ex.responseJSON.Message, ex);
        else if (!!ex.responseText)
            console.error(ex.responseText, ex);
        MostrarMensaje("Ha ocurrido un error", "Por favor verifique los datos y vuelva a intentar", "error");
    }
});

$(document).ready(function () {

});


$(window).load(function () {

});

function GetPermisos() {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/Utils/Utilidades.asmx/GetPermisos",
        dataType: "json",
        async: false,
        success: function (result) {
            if (result.d.Result == 'OK') {
                Permisos = result.d;
            } else {
                Permisos = null;
                //alert("Error cargado los años de referencias");
                //imprimirMensaje('Error', result.d.Message);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            console.error("error en GetPermisions", xhr);
            console.error("error en GetPermisions", ajaxOptions);
            console.error("error en GetPermisions", thrownError);
            Permisos = null;
        }
    });
    return Permisos;
}

function CargarDropDown(urlServicio, id, data) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: urlServicio,
        data: JSON.stringify(data),
        dataType: "json",
        success: function (result) {
            if (result.d.Result == 'OK') {
                for (var i = 0; i < result.d.Options.length; i++) {
                    var value = result.d.Options[i].Value;
                    var displayText = result.d.Options[i].DisplayText;
                    $('#' + id).append($('<option value="' + value + '">' + displayText + '</option>'));
                }
            } else {
                MostrarMensaje(result.d.Message, "Error");
                //imprimirMensaje('Error', result.d.Message);
            }
        }
    });
}

function ImagenNoEncontrada(img) {
    img.style.display = "none";
}

function toFloat(valor) {
    if (typeof valor === 'string' || valor instanceof String) {
        if (valor.indexOf(",") > -1)
            valor = valor.replace(",", ".");

        return parseFloat(valor);
    } else {
        return valor;
    }
}

function MostrarMensaje(titulo, mensaje, headerClass) {
    if (!headerClass) headerClass = "success";

    div = '<div class="modal fade" id="dMensaje" role="dialog">' +
        '<div class="modal-dialog"><div class="modal-content"><div class="modal-header ' + headerClass + '">' +
        '<button type="button" class="close" data-dismiss="modal">&times;</button><h4 class="modal-title">' + titulo + '</h4></div>' +
        '<div class="modal-body"><p>' + mensaje + '</p></div><div class="modal-footer">' +
        '<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div></div></div></div>';

    $(div).modal("show");
}

function parseJsonDate(jsonDateString, includeTime) {
    var dat = '';
    if (jsonDateString != null && jsonDateString.length > 4) {

        var date = new Date(parseInt(jsonDateString.substr(6)))
        var d = date.getDate(), m = date.getMonth() + 1, y;
        if (date.getFullYear) { y = date.getFullYear(); }
        else { y = 2000 + (date.getYear() % 100); }
        dat = (10 > d ? '0' : '') + d + (10 > m ? '/0' : '/') + m + '/' + y;

        if (includeTime === true) {
            dat = dat + ' ' + date.getHours() + ':' + date.getMinutes();
        }
    }
    return dat;
}

String.prototype.to = function (format) {
    var date = new Date(parseInt(this.substr(6)));

    return date.to(format);
};

Date.prototype.to = function (format) {
    if (!format) format = "yyyy/mm/dd HH:MM A"
    var AmPm = "";
    var hora = this.getHours();
    var minutos = this.getMinutes();
    if (format.indexOf("A") > -1){
        if (hora == 24) {
            hora = 0;
            AmPm = "AM";
        }
        else if (hora > 12) {
            hora = hora - 12;
            AmPm = "PM";
        }
        else {
            AmPm = "AM";
        }
    }
    var result =
        format
            .replace("yyyy", this.getFullYear())
            .replace("yy", this.getFullYear().toString().substr(2))
            .replace("mm", ((this.getMonth() + 1) < 10 ? '0' : '') + (this.getMonth() + 1))
            .replace("dd", (this.getDate() < 10 ? '0' : '') + this.getDate())
            .replace("HH", (this.getHours() < 10 ? '0' : '') + this.getHours())
            .replace("MM", (minutos < 10 ? '0' : '') + minutos)
            .replace("A", AmPm);

    return result
};

function SetRequestsPendientes(AjaxRequest) {
    AjaxPendiente = AjaxRequest;
}
function CancelarRequestsPendientes() {
    if (AjaxPendiente && AjaxPendiente.readyState > 0 && AjaxPendiente.readyState < 4) {
        AjaxPendiente.abort();
    }
}