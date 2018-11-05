<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MesasOld.aspx.cs" Inherits="AppDevs.TPV.Admin.MesasOld" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Mesas</title>
    <style>
        .mesa {
            border: 2px solid black;
            border-radius: 5px 5px;
            display: table;
            position: relative;
            float: left;
            min-height: 50px;
            min-width: 50px;
            /*cursor: pointer;*/
            /*box-shadow: 2px 2px 2px 2px #464646;
            -webkit-box-shadow: 2px 2px 2px 2px #464646;
            -moz-box-shadow: 2px 2px 2px 2px #464646;*/
        }

            .mesa > i {
                text-align: center;
                vertical-align: middle;
                display: table-cell;
                font-weight: bold;
                color: white;
                text-shadow: 2px 2px 2px #464646;
                -webkit-text-shadow: 2px 2px 2px #464646;
                -moz-text-shadow: 2px 2px 2px #464646;
            }

        .draggable {
            /*width: 90px;
            height: 90px;*/
            padding: 0.5em;
            float: left;
            margin: 0 10px 10px 0;
            border: 2px solid black;
            /*background-color: white;*/
        }

        #dArea {
            position: relative;
            height: calc(100vh - 305px);
        }

        @media (min-width:768px) {
            #dArea {
                height: calc(100vh - 225px);
            }
        }

        #PanelMantenimiento {
            background-color: #fff;
            color: #337ab7;
            position: absolute;
            top: 5px;
            right: 5px;
        }

        .seleccionado {
            cursor: nwse-resize;
            border: dashed 2px #337ab7;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Mesas</h1>
        </div>
    </div>
    <div class="row">
        <ul id="uListaAreas" class="nav nav-tabs nav-justified"></ul>
        <div id="dArea">
            <div id="PanelMantenimiento" class="modal-content">
                <i id="btnAgregarMesa" class="fa fa-plus fa-2x fa-fw pointer" title="Agregar"></i>
                <i id="btnEditarMesa" disabled="disabled" class="fa fa-pencil-square-o fa-2x fa-fw disabled" title="Renombrar"></i>
                <i id="btnGuardarCambios" class="fa fa-floppy-o fa-2x fa-fw pointer" title="Guardar"></i>
                <i id="btnEliminarMesa" disabled="disabled" class="fa fa-trash-o fa-2x fa-fw disabled" title="Eliminar"></i>
            </div>
        </div>
    </div>
    <div id="dEditarMesa" title="Editar" class="ui-dialog">
        <div class="row">
            <div class="form-group">
                <label>Nombre</label>
                <input type="text" class="form-control" id="txtNombreMesa" />
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label>Color</label>
                <input type="text" class="form-control" id="txtColorMesa" />
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label>Ancho</label>
                <input type="text" class="form-control" id="txtAncho" />
            </div>
        </div>
        <div class="row">
            <div class="form-group">
                <label>Alto</label>
                <input type="text" class="form-control" id="txtAlto" />
            </div>
        </div>
    </div>
    <div id="dConfirmarEliminar" title="Eliminar Mesa" class="ui-dialog">
        <div class="row">
            <div class="form-group">
                <p>¿Está seguro de que desea eliminar esta mesa?</p>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var mesa;
        var ul = document.getElementById("uListaAreas");
        var dArea = document.getElementById("dArea");

        function getEventTarget(e) {
            e = e || window.event;
            return e.target || e.srcElement;
        }

        $(document).ready(function () {

            $('#txtColorMesa').colorpicker();

            $.ajax({
                type: "POST",
                url: '/Admin/Mesas.aspx/GetAreas',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    ul.innerHTML = "";
                    //dArea.innerHTML = "";
                    var CodigoArea;
                    msg.d.Records.forEach(function (Area) {
                        var li = document.createElement('li');
                        var a = document.createElement('a');
                        a.href = "#";
                        a.dataset.codigoarea = Area.Codigo_Area;
                        a.dataset.colorarea = Area.Color_Area;
                        a.innerText = Area.Area;

                        if (!CodigoArea) CodigoArea = Area.Codigo_Area;
                        if (CodigoArea == Area.Codigo_Area) {
                            dArea.dataset.codigoarea = Area.Codigo_Area;
                            dArea.style.backgroundColor = Area.Color_Area;
                            li.classList.add("active");
                            CargarMesas(dArea.dataset.codigoarea);
                        }

                        li.appendChild(a);
                        ul.appendChild(li);
                    });
                }
            });

            ul.onclick = function (e) {
                $(".active", ul).removeClass("active");
                e.preventDefault();
                var target = getEventTarget(e);
                $(target).addClass("active");
                var CodigoArea = target.dataset.codigoarea;
                var CurrentCodigoArea = dArea.dataset.codigoarea;

                if (!!CodigoArea && CodigoArea != CurrentCodigoArea) {
                    //-- Guardar posibles cambios
                    GuardarMesas(CurrentCodigoArea, false);
                    CargarMesas(CodigoArea);
                    dArea.dataset.codigoarea = CodigoArea;
                    dArea.style.backgroundColor = target.dataset.colorarea;
                }
            };

            dArea.onclick = function (e) {
                e.preventDefault();
                $(".seleccionado", dArea).removeClass("seleccionado");

                var target = getEventTarget(e);
                if (target.id != "dArea" && mesa)
                    mesa.classList.add("seleccionado");
                else
                    desactivaBotones(true);
            };

            $('#dArea').on('click', '.mesa', function (e) {
                e.preventDefault();
                mesa = this;
                desactivaBotones(false);
            });

            $("#btnAgregarMesa").click(function (e) {
                e.preventDefault();
                mesa = document.createElement('div');
                var pNombreMesa = document.createElement('i');

                pNombreMesa.innerText = "Mesa";
                mesa.appendChild(pNombreMesa);

                mesa.className = 'mesa';
                //mesa.dataset.codigomesa = mesa.Codigo_Mesa;
                mesa.style.backgroundColor = "#370df7";

                mesa.style.width = "8.5%";//mesa.Base;
                mesa.style.height = "12.07%";//mesa.Altura;

                mesa.style.left = "50px";//mesa.PosicionX;
                mesa.style.top = "50px";//mesa.PosicionY;

                dArea.appendChild(mesa);
                desactivaBotones(false);

                MoveResize();
            });

            $("#btnEditarMesa").click(function (e) {
                e.preventDefault();
                //-- Cargar valores actuales
                $("#txtNombreMesa").val($("i", mesa)[0].innerText);
                $("#txtColorMesa").val(mesa.style.backgroundColor);
                $("#txtAncho").val(mesa.style.width);
                $("#txtAlto").val(mesa.style.height);
                //-- Mostrar diálogo
                $("#dEditarMesa").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        Cancelar: function () {
                            //-- Limpiar
                            $("#txtNombreMesa").val('');
                            $("#txtColorMesa").val('');
                            $("#txtAncho").val('');
                            $("#txtAlto").val('');
                            $(this).dialog("close");
                        },
                        Cambiar: function () {
                            var nombre = $("#txtNombreMesa").val();
                            var color = $("#txtColorMesa").val();
                            var ancho = $("#txtAncho").val();
                            var alto = $("#txtAlto").val();

                            if (nombre.length > 0)
                                $("i", mesa)[0].innerText = nombre;
                            if (color.length > 0)
                                mesa.style.backgroundColor = color;
                            if (ancho.length > 0) {
                                if (ancho.indexOf("%") != ancho.length - 1) ancho += "%";
                                mesa.style.width = ancho;
                            }
                            if (alto.length > 0) {
                                if (alto.indexOf("%") != alto.length - 1) alto += "%";
                                mesa.style.height = alto;
                            }
                            $(this).dialog("close");
                        }
                    }
                });
            });

            $("#btnEliminarMesa").click(function (e) {
                e.preventDefault();

                //-- Mostrar diálogo confirmación
                $("#dConfirmarEliminar").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        Cancelar: function () {
                            $(this).dialog("close");
                        },
                        Eliminar: function () {
                            mesa.parentNode.removeChild(mesa);
                            $(this).dialog("close");
                        }
                    }
                });
            });

            $("#btnGuardarCambios").click(function (e) {
                e.preventDefault();
                GuardarMesas(dArea.dataset.codigoarea, true);
            });

            function MoverMesa(DivMesa) {
                var CodigoMesa = DivMesa.dataset.codigomesa;
                var Base = DivMesa.clientWidth;
                var Altura = DivMesa.clientHeight;
                var PosicionX = DivMesa.offsetLeft;
                var PosicionY = DivMesa.offsetTop;
                var Color = DivMesa.currentStyle.backgroundColor;
            }

            function desactivaBotones(desactivar) {
                $("#btnRenombrarMesa").prop("disabled", desactivar);
                $("#btnEditarMesa").prop("disabled", desactivar);
                $("#btnEliminarMesa").prop("disabled", desactivar);

                if (desactivar) {
                    $("#btnEditarMesa").removeClass("pointer").addClass("disabled");
                    $("#btnEliminarMesa").removeClass("pointer").addClass("disabled");
                }
                else {
                    $("#btnEditarMesa").addClass("pointer").removeClass("disabled");
                    $("#btnEliminarMesa").addClass("pointer").removeClass("disabled");
                }
            }

            function GuardarMesas(codigoArea, mostrarMensaje) {
                var Mesas = [];
                $(".mesa", dArea).each(function (index, mesa) {
                    Mesas.push({
                        Codigo_Mesa: (!!mesa.dataset && !!mesa.dataset.codigomesa) ? mesa.dataset.codigomesa : 0,
                        Mesa: $("i", mesa)[0].innerText,
                        Codigo_Area: codigoArea,
                        Color_Mesa: mesa.style.backgroundColor,
                        PosicionX: CalcularPercent(mesa.style.left, $("#dArea").width()),
                        PosicionY: CalcularPercent(mesa.style.top, $("#dArea").height()),
                        Base: CalcularPercent(mesa.style.width, $("#dArea").width()),
                        Altura: CalcularPercent(mesa.style.height, $("#dArea").height()),
                        Activo: true
                    });
                });

                $.ajax({
                    type: "POST",
                    url: '/Admin/Mesas.aspx/GuardarMesas',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ mesas: Mesas }),
                    success: function (resultado) {
                        if (mostrarMensaje && resultado.d) {
                            //MostrarMensaje("Mantenimiento de mesas", "Cambios guardados...");

                            //-- Actualizar mesas
                            $(".mesa", dArea).remove();
                            resultado.d.forEach(function (mesa) {
                                var dMesa = document.createElement('div');
                                var pNombreMesa = document.createElement('i');
                                if (mesa.Ocupada)
                                    pNombreMesa.className = 'fa fa-user';

                                pNombreMesa.innerText = mesa.Mesa;
                                dMesa.appendChild(pNombreMesa);

                                dMesa.className = 'mesa';
                                dMesa.dataset.codigomesa = mesa.Codigo_Mesa;
                                dMesa.style.backgroundColor = mesa.Color_Mesa;

                                dMesa.style.width = mesa.Base;
                                dMesa.style.height = mesa.Altura;

                                dMesa.style.left = mesa.PosicionX;
                                dMesa.style.top = mesa.PosicionY;

                                dArea.appendChild(dMesa);
                            });
                        }
                    }
                });
            }

            function CargarMesas(CodigoArea) {
                $.ajax({
                    type: "POST",
                    url: '/Sales/Areas.aspx/GetMesas',
                    data: JSON.stringify(
                        {
                            Codigo_Area: CodigoArea
                        }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        $(".mesa", dArea).remove();
                        msg.d.forEach(function (mesa) {
                            var dMesa = document.createElement('div');
                            var pNombreMesa = document.createElement('i');
                            if (mesa.Ocupada)
                                pNombreMesa.className = 'fa fa-user';

                            pNombreMesa.innerText = mesa.Mesa;
                            dMesa.appendChild(pNombreMesa);

                            dMesa.className = 'mesa';
                            dMesa.dataset.codigomesa = mesa.Codigo_Mesa;
                            dMesa.style.backgroundColor = mesa.Color_Mesa;

                            dMesa.style.width = mesa.Base;
                            dMesa.style.height = mesa.Altura;

                            dMesa.style.left = mesa.PosicionX;
                            dMesa.style.top = mesa.PosicionY;

                            dArea.appendChild(dMesa);
                        });

                        MoveResize();
                    }
                });
            }

            function MoveResize() {

                $(".mesa").draggable({
                    snap: true,
                    cursor: "move",
                    containment: "parent"
                });

                $(".mesa").resizable({
                    containment: "parent",
                    autoHide: true,
                    grid: 50,
                    minHeight: 10,
                    minWidth: 10
                });
            }

            function CalcularPercent(px, parentPx) {
                var percent = "";
                var intPercent;

                if (px.indexOf("%") > -1)
                    percent = px;
                else {
                    if (px.indexOf("-") > -1)
                        percent = "-";

                    intPercent = px.replace("px", "").replace("-", "");

                    percent = percent + (100 * intPercent / parentPx).toFixed(2) + '%';
                }

                return percent;
            }
        });
    </script>
</asp:Content>
