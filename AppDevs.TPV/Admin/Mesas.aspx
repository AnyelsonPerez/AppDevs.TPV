<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mesas.aspx.cs" Inherits="AppDevs.TPV.Admin.Mesas" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Mesas</title>
    <style>
        .mesa {
            /*border: 0.5px solid #f8f8f8;*/
            /*border-radius: 5px 5px;*/
            display: table;
            /*position: relative;*/
            /*float: left;*/
            height: 50px;
            /*min-width: 50px;*/
            /*cursor: pointer;*/
            /*box-shadow: 2px 2px 2px 2px #464646;
            -webkit-box-shadow: 2px 2px 2px 2px #464646;
            -moz-box-shadow: 2px 2px 2px 2px #464646;*/
            padding-left: 0px !important;
            padding-right: 0px !important;
            cursor: pointer;
        }

            .mesa:hover {
                border: 0.5px solid #808080;
            }

        .mesaActiva {
            border: 0px solid #000000;
            border-radius: 0.5em 0.5em;
        }

            .mesaActiva > i {
                text-align: center;
                vertical-align: middle;
                display: table-cell;
                font-weight: bold;
                color: white;
                text-shadow: 2px 2px 2px #464646;
                -webkit-text-shadow: 2px 2px 2px #464646;
                -moz-text-shadow: 2px 2px 2px #464646;
            }

        #dArea {
            position: relative;
            /*height: calc(100vh - 50px);*/
            padding-left: 15px;
            padding-right: 15px;
        }

        /*@media (min-width:768px) {
            #dArea {
                height: calc(100vh - 225px);
            }
        }*/

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
            <div class="row">
                        <div data-posiciony="1" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="1" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="2" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="2" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="3" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="3" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="4" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="4" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="5" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="5" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="6" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="6" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="7" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="7" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="8" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="8" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="9" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="9" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="10" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="10" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="11" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="11" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
                    </div>
                    <div class="row">
                        <div data-posiciony="12" data-posicionx="1" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="2" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="3" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="4" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="5" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="6" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="7" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="8" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="9" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="10" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="11" class="mesa col-xs-1"><i></i></div>
                        <div data-posiciony="12" data-posicionx="12" class="mesa col-xs-1"><i></i></div>
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
                <label>Activo</label>
                <input type="checkbox" class="form-control" id="chkActivo" />
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
                    CargarMesas(CodigoArea);
                    dArea.dataset.codigoarea = CodigoArea;
                    dArea.style.backgroundColor = target.dataset.colorarea;
                }
            };

            //dArea.onclick = function (e) {
            //    e.preventDefault();
            //    $(".seleccionado", dArea).removeClass("seleccionado");

            //    var target = getEventTarget(e);
            //    if (target.id != "dArea" && mesa)
            //        mesa.classList.add("seleccionado");
            //    else
            //        desactivaBotones(true);
            //};

            $('#dArea').on('click', '.mesa', function (e) {
                e.preventDefault();
                mesa = this;

                e.preventDefault();
                //-- Cargar valores actuales
                $("#txtNombreMesa").val($("i", mesa)[0].innerText);
                $("#txtColorMesa").val(mesa.style.backgroundColor);
                $("#chkActivo")[0].checked = mesa.classList.contains("mesaActiva");

                //-- Mostrar diálogo
                $("#dEditarMesa").dialog({
                    resizable: false,
                    modal: true,
                    buttons: {
                        Cancelar: function () {
                            //-- Limpiar
                            $("#txtNombreMesa").val('');
                            $("#txtColorMesa").val('');
                            $("#chkActivo")[0].checked = false;
                            $(this).dialog("close");
                        },
                        Cambiar: function () {
                            var nombre = $("#txtNombreMesa").val();
                            var color = $("#txtColorMesa").val();
                            var activo = $("#chkActivo")[0].checked;
                            if (activo)
                                mesa.classList.add("mesaActiva");
                            else {
                                nombre = "";
                                color = "";
                                $("i", mesa)[0].innerText = "";
                                mesa.style.backgroundColor = "transparent";
                                mesa.classList.remove("mesaActiva");
                            }

                            if (nombre)
                                $("i", mesa)[0].innerText = nombre;
                            if (color)
                                mesa.style.backgroundColor = color;

                            $.ajax({
                                type: "POST",
                                url: '/Admin/Mesas.aspx/GuardarMesa',
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                data: JSON.stringify({
                                    mesa: {
                                        Codigo_Mesa: mesa.dataset.codigomesa,
                                        Codigo_Area: dArea.dataset.codigoarea,
                                        PosicionX:mesa.dataset.posicionx,
                                        Posiciony: mesa.dataset.posiciony,
                                        Mesa: nombre,
                                        Color_Mesa: color,
                                        Activo: activo
                                    }
                                })
                            });

                            $(this).dialog("close");
                        }
                    }
                });
            });

            function CargarMesas(CodigoArea) {
                $.ajax({
                    type: "POST",
                    url: '/Sales/Areas.aspx/GetMesas',
                    data: JSON.stringify({ Codigo_Area: CodigoArea }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        var dMesas = $(".mesaActiva", dArea);
                        if (dMesas.length > 0) {
                            for (var i = 0; i < dMesas.length; i++) {
                                var dMesa = dMesas[i];
                                $('i', dMesa)[0].innerText = "";
                                dMesa.style.backgroundColor = "transparent";
                                dMesa.dataset.codigomesa = 0;
                            }

                            dMesas.removeClass("mesaActiva");
                        }
                        msg.d.forEach(function (mesa) {                            
                            var dMesa = $('*[data-posicionx="'+ mesa.PosicionX +'"][data-posiciony="'+mesa.PosicionY+'"]');
                            if (!!dMesa) {
                                if (!!dMesa.length) dMesa = dMesa[0];
                                var pNombreMesa = $('i', dMesa);
                                if (!!pNombreMesa.length) pNombreMesa = pNombreMesa[0];

                                pNombreMesa.innerText = mesa.Mesa;

                                dMesa.classList.add('mesaActiva');
                                dMesa.dataset.codigomesa = mesa.Codigo_Mesa;
                                dMesa.style.backgroundColor = mesa.Color_Mesa;

                            }
                        });
                    }
                });
            }
        });
    </script>
</asp:Content>
