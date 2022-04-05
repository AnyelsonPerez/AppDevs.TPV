<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="AppDevs.TPV.Admin.Consultas" MasterPageFile="/Admin/TPV.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>AppDevs.TPV - Consultas</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Consultas</h1>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5">
            <label for="Desde" class="control-label">Desde</label>
            <div class='input-group date'>
                <input id='Desde' name="Desde" type="text" class="form-control input-md" placeholder="Desde" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-5">
            <label for="Hasta" class="control-label">Hasta</label>
            <div class='input-group date'>
                <input id="Hasta" name="Hasta" type="text" class="form-control input-md" placeholder="Hasta" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>

        </div>
        <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-2">
            <label for="Buscar" class="control-label">Buscar</label>
            <input id="Buscar" name="Buscar" type="button" class="form-control btn btn-primary input-md" value="Buscar" />
        </div>
    </div>
    <div class="row">
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#Metodos">Ventas por Método de Pago</a></li>
            <li><a data-toggle="tab" href="#Ventas">Ventas</a></li>
            <li><a data-toggle="tab" href="#Categoria">Ventas por Categoria</a></li>
            <li><a data-toggle="tab" href="#Producto">Ventas por Producto</a></li>
            <li><a data-toggle="tab" href="#Usuarios">Ventas por Usuario</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="tab-content">
            <div id="Metodos" class="tab-pane fade in active">
                <div id="gvMetodos"></div>
            </div>
            <div id="Ventas" class="tab-pane fade">
                <div id="gvVentas"></div>
            </div>
            <div id="Categoria" class="tab-pane fade">
                <div id="gvCategorias"></div>
            </div>
            <div id="Producto" class="tab-pane fade">
                <div id="gvProductos"></div>
            </div>
            <div id="Usuarios" class="tab-pane fade">
                <div id="gvUsuarios"></div>
            </div>
        </div>
    </div>
    <link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light/all.min.css" />
    <link href="/Content/ShieldUI/all.min.css" rel="stylesheet" />
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />

    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/ShieldUI/shieldui-all.min.js"></script>
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>

    <script type="text/javascript">
        var Datos = [];
        var opciones = { format: "YYYY/MM/DD hh:mm A", locale: "es" };
        var Desde = $("#Desde").datetimepicker(opciones);
        var Hasta = $("#Hasta").datetimepicker(opciones);

        $(document).ready(function () {
            var hoy = new Date();
            $("#Desde").val(hoy.to("yyyy/mm/dd") + " 06:00");
            //-- Dia de mañana
            hoy.setDate(hoy.getDate() + 1);
            $("#Hasta").val(hoy.to("yyyy/mm/dd 06:00"));

            Buscar(Desde.val(), Hasta.val());
        });

        $("#Buscar").click(function (e) {
            e.preventDefault();
            Buscar(Desde.val(), Hasta.val());
        });

        function Buscar(desde, hasta) {
            var pill = $("div.tab-pane.active");
            switch (pill[0].id) {
                case "Ventas":
                    BuscarVentas(desde, hasta);
                    break;
                case "Categoria":
                    BuscarCategorias(desde, hasta);
                    break;
                case "Producto":
                    BuscarProductos(desde, hasta);
                    break;
                case "Metodos":
                    BuscarMetodos(desde, hasta);
                    break;
                case "Usuarios":
                    BuscarUsuarios(desde, hasta);
                default:
                    BuscarMetodos(desde, hasta);
            }
        }

        function BuscarVentas(desde, hasta) {
            $.ajax({
                type: "POST",
                url: '/Admin/Consultas.aspx/GetConsultaVentas',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                success: function (msg) {
                    msg.d.Records.forEach(function (Dato) {
                        Dato.Fecha = parseJsonDate(Dato.Fecha);
                        Dato.Hora_Pago = parseJsonDate(Dato.Hora_Pago, true);
                    });

                    $("#gvVentas")[0].innerHTML = "";
                    $("#gvVentas").shieldGrid({
                        dataSource: {
                            data: msg.d.Records,
                            aggregate: [
                                { field: "Codigo_Orden", aggregate: "count", type: Number },
                                { field: "Total", aggregate: "sum", type: Number }]
                        },
                        columns: [
                            { field: "Hora_Pago", title: "Fecha y Hora" },
                            { field: "Mesa", title: "Mesa" },
                            { field: "Metodo_Pago", title: "Método de Pago" },
                            { field: "Total", title: "Total", format: "{0:n2}", footerTemplate: "Total: {sum:n2}" }
                        ],
                        toolbar: [
                            {
                                buttons: [
                                    {
                                        commandName: "excel",
                                        caption: '<span class="btn btn-success"><i class="fa fa-file-excel-o fa-fw" aria-hidden="true"></i>Exportar</span>'
                                    }
                                ]
                            }
                        ],
                        exportOptions: {
                            proxy: "/filesaver/save",
                            excel: {
                                fileName: "Ventas",
                                fileFormat: "xlsx",
                                author: undefined,
                                dataSource: {
                                    data: msg.d.Records
                                },
                                readDataSource: true
                            }
                        }
                    });
                }
            });
        }

        function BuscarCategorias(desde, hasta) {
            $.ajax({
                type: "POST",
                url: '/Admin/Consultas.aspx/GetConsultaCategorias',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                success: function (msg) {

                    $("#gvCategorias")[0].innerHTML = "";
                    $("#gvCategorias").shieldGrid({
                        dataSource: {
                            data: msg.d.Records,
                            aggregate: [
                                { field: "total", aggregate: "sum", type: Number }]
                        },
                        columns: [
                            { field: "Categoria_Producto", title: "Categoría" },
                            { field: "total", title: "Total", format: "{0:n2}", footerTemplate: "Total: {sum:n2}" }
                        ],
                        toolbar: [
                            {
                                buttons: [
                                    {
                                        commandName: "excel",
                                        caption: '<span class="btn btn-success"><i class="fa fa-file-excel-o fa-fw" aria-hidden="true"></i>Exportar</span>'
                                    }
                                ]
                            }
                        ],
                        exportOptions: {
                            proxy: "/filesaver/save",
                            excel: {
                                fileName: "Ventas por categoria",
                                fileFormat: "xlsx",
                                author: undefined,
                                dataSource: {
                                    data: msg.d.Records
                                },
                                readDataSource: true
                            }
                        }
                    });
                }
            });
        }

        function BuscarProductos(desde, hasta) {
            $.ajax({
                type: "POST",
                url: '/Admin/Consultas.aspx/GetConsultaProductos',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                success: function (msg) {

                    $("#gvProductos")[0].innerHTML = "";
                    $("#gvProductos").shieldGrid({
                        dataSource: {
                            data: msg.d.Records,
                            aggregate: [
                                { field: "cantidad", aggregate: "count", type: Number },
                                { field: "total", aggregate: "sum", type: Number }]
                        },
                        columns: [
                            { field: "Categoria_Producto", title: "Categoría" },
                            { field: "NombreProducto", title: "Producto" },
                            { field: "cantidad", width: "170px", title: "Cantidad", footerTemplate: "Cantidad: {count}" },
                            { field: "total", title: "Total", format: "{0:n2}", footerTemplate: "Total: {sum:n2}" }
                        ],
                        toolbar: [
                            {
                                buttons: [
                                    {
                                        commandName: "excel",
                                        caption: '<span class="btn btn-success"><i class="fa fa-file-excel-o fa-fw" aria-hidden="true"></i>Exportar</span>'
                                    }
                                ]
                            }
                        ],
                        exportOptions: {
                            proxy: "/filesaver/save",
                            excel: {
                                fileName: "Ventas por producto",
                                fileFormat: "xlsx",
                                author: undefined,
                                dataSource: {
                                    data: msg.d.Records
                                },
                                readDataSource: true
                            }
                        }
                    });
                }
            });
        }

        function BuscarMetodos(desde, hasta) {
            $.ajax({
                type: "POST",
                url: '/Admin/Consultas.aspx/GetConsultaMetodos',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                success: function (msg) {

                    $("#gvMetodos")[0].innerHTML = "";
                    $("#gvMetodos").shieldGrid({
                        dataSource: {
                            data: msg.d.Records,
                            aggregate: [{ field: "total", aggregate: "sum", type: Number }]
                        },
                        columns: [
                            { field: "Metodo_Pago", title: "Método" },
                            { field: "total", title: "Total", format: "{0:n2}", footerTemplate: "Total: {sum:n2}" }
                        ],
                        toolbar: [
                            {
                                buttons: [
                                    {
                                        commandName: "excel",
                                        caption: '<span class="btn btn-success"><i class="fa fa-file-excel-o fa-fw" aria-hidden="true"></i>Exportar</span>'
                                    },
                                    {
                                        caption: '<span class="btn btn-primary"><i class="fa fa-print fa-fw" aria-hidden="true"></i>Imprimir Cierre Diario</span>',
                                        click: function () {
                                            ImprimirCierre(Desde.val(), Hasta.val());
                                        }
                                    }
                                ]
                            }
                        ],
                        exportOptions: {
                            proxy: "/filesaver/save",
                            excel: {
                                fileName: "Ventas por producto",
                                fileFormat: "xlsx",
                                author: undefined,
                                dataSource: {
                                    data: msg.d.Records
                                },
                                readDataSource: true
                            }
                        }
                    });
                }
            });
        }

        function BuscarUsuarios(desde, hasta) {
            $.ajax({
                type: "POST",
                url: '/Admin/Consultas.aspx/GetConsultaUsuarios',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                success: function (msg) {

                    $("#gvUsuarios")[0].innerHTML = "";
                    $("#gvUsuarios").shieldGrid({
                        dataSource: {
                            data: msg.d.Records,
                            aggregate: [
                                { field: "total", aggregate: "sum", type: Number }]
                        },
                        columns: [
                            { field: "NombreCompleto", title: "Usuario" },
                            { field: "total", title: "Total", format: "{0:n2}", footerTemplate: "Total: {sum:n2}" }
                        ],
                        toolbar: [
                            {
                                buttons: [
                                    {
                                        commandName: "excel",
                                        caption: '<span class="btn btn-success"><i class="fa fa-file-excel-o fa-fw" aria-hidden="true"></i>Exportar</span>'
                                    }
                                ]
                            }
                        ],
                        exportOptions: {
                            proxy: "/filesaver/save",
                            excel: {
                                fileName: "Ventas por Usuario",
                                fileFormat: "xlsx",
                                author: undefined,
                                dataSource: {
                                    data: msg.d.Records
                                },
                                readDataSource: true
                            }
                        }
                    });
                }
            });
        }

        function ImprimirCierre(desde, hasta) {
            $.ajax({
                type: "POST",
                url: 'Consultas.aspx/ImprimirCierre',
                data: JSON.stringify({ Desde: desde, Hasta: hasta }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    MostrarMensaje("Imprimiendo Cierre Diario", "Cierre Diario de ventas generado.");
                }
            });
        }
    </script>

</asp:Content>
