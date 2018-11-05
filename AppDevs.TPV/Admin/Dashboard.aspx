<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="AppDevs.TPV.Admin.Dashboard" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>AppDevs.TPV - Panel de Administración</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Escritorio</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-eur fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="totalVentas" class="large">0</div>
                            <div>€ Ventas de hoy</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-money fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="efectivoVentas" class="large">0</div>
                            <div>€ Efectivo</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-credit-card fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="tarjetaVentas" class="large">0</div>
                            <div>€ Tarjeta</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-support fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="cantidadVentas" class="large">0</div>
                            <div># Mesas de hoy</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-eur fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="pendienteCobrar" class="large">0</div>
                            <div>€ Pendiente Cobrar</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-muted">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-list-alt fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div id="mesasPendienteCobrar" class="large">0</div>
                            <div># Cuentas Pendientes</div>
                        </div>
                    </div>
                </div>
                <a href="/Admin/Consultas.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Consultar Detalle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-group">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Comparar venta mensual
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class='input-group date'>
                                <input id="PrimerMes" type="text" class="form-control input-sm compararMes" placeholder="Primer Mes" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class='input-group date'>
                                <input id="SegundoMes" type="text" class="form-control input-sm compararMes" placeholder="Segundo Mes" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="morris-area-chart"></div>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-group">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Comparar venta semanal
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class='input-group date week'>
                                <input id="CompararSemanaDesde" type="text" class="form-control input-sm compararSemana" placeholder="Primera Semana" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class='input-group date week'>
                                <input id="CompararSemanaHasta" type="text" class="form-control input-sm compararSemana" placeholder="Segunda Semana" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="morris-bar-chart"></div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-bell fa-fw"></i>Últimos 10 Pedidos
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <ul id="Ultimos10Pedidos" class="timeline"></ul>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <i class="fa fa-euro fa-fw"></i>Últimos 5 cobros
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div id="Ultimos5Cobros" class="list-group"></div>
                    <!-- /.list-group -->
                    <a href="#" class="btn btn-default btn-block">Consultar todos</a>
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="form-group">
                        <i class="fa fa-bar-chart-o fa-fw"></i>Top 10 productos menos vendidos
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class='input-group date'>
                                <input id="FechaTop10Desde" type="text" class="form-control input-sm fechaTop" placeholder="Desde" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class='input-group date'>
                                <input id="FechaTop10Hasta" type="text" class="form-control input-sm fechaTop" placeholder="Hasta" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div id="morris-donut-chart"></div>
                    <a href="/Admin/Consultas.aspx" class="btn btn-default btn-block">Consultar Detalle</a>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
        <!-- /.col-lg-4 -->
    </div>
    <!-- Morris Charts JavaScript -->
    <link href="/Content/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="/bower_components/raphael/raphael-min.js"></script>
    <script src="/bower_components/morrisjs/morris.min.js"></script>
    <script src="/Scripts/jquery.signalR-2.2.1.js"></script>
    <%--<script src="/js/morris-data.js"></script>--%>
    <%--<script src="https://cdn.jsdelivr.net/momentjs/2.10.6/moment.min.js"></script>--%>
    <%--<script src="/Scripts/moment.min.js"></script>--%>
    <script src="/Scripts/moment-with-locales.min.js"></script>
    <script src="/Scripts/bootstrap-datepicker.min.js"></script>
    <link href="/Content/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="/Scripts/bootstrap-datetimepicker.min.js"></script>
    <script src="/Scripts/locales/bootstrap-datepicker.es.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //var permisos = GetPermisos();

            var con = $.hubConnection();
            var hub = con.createHubProxy("refreshHub");
            hub.on("onRefrescar", function (CodigoMesa, CodigoArea) {
                CargarDatos(PrimerMes.val(), SegundoMes.val(),
                    CompararSemanaDesde.val(), CompararSemanaHasta.val(),
                    FechaTop10Desde.val(), FechaTop10Hasta.val());
            });
            con.start();

            var MonthOption = {
                autoclose: true,
                format: "yyyy-mm",
                viewMode: "months",
                minViewMode: "months",
                language: "es"
            };

            //-- Fecha y Hora actual
            var fechaActual = new Date();
            //-- Dia de mañana
            fechaActual.setDate(fechaActual.getDate() + 1);
            //-- Las 6 am, del día de mañana
            fechaActual.setHours(6, 0, 0, 0)

            var mesActual = new Date();
            var mesPasado = new Date();
            mesPasado.setMonth(mesActual.getMonth() - 1);

            //-- Fechas [Comparador Mensual]
            var PrimerMes = $("#PrimerMes").datepicker(MonthOption);
            var SegundoMes = $('#SegundoMes').datepicker(MonthOption);

            PrimerMes.val(mesActual.to("yyyy-mm"));
            SegundoMes.val(mesPasado.to("yyyy-mm"));

            //-- Fechas [Comparador Semanal]
            var CompararSemanaDesde = WeekPicker("#CompararSemanaDesde", -7);
            var CompararSemanaHasta = WeekPicker("#CompararSemanaHasta", 0);

            //-- Fechas [Top 10 mas vendidos]
            var FechaTop10Desde = $("#FechaTop10Desde").datetimepicker({ format: "YYYY/MM/DD HH:mm", locale: "es"/*, language: "es"*/ });
            var FechaTop10Hasta = $("#FechaTop10Hasta").datetimepicker({ format: "YYYY/MM/DD HH:mm", locale: "es"/*, language: "es" */ });

            var haceUnaSemana = new Date();
            haceUnaSemana.setDate(fechaActual.getDate() - 7);
            haceUnaSemana.setHours(6, 0, 0, 0)
            mesPasado.setTime(0);

            FechaTop10Desde.val(haceUnaSemana.to("yyyy/mm/dd HH:MM"));
            FechaTop10Hasta.val(fechaActual.to("yyyy/mm/dd HH:MM"));

            CargarDatos(PrimerMes.val(), SegundoMes.val(),
                CompararSemanaDesde.val(), CompararSemanaHasta.val(),
                FechaTop10Desde.val(), FechaTop10Hasta.val());

            $(".compararMes").change(function () {
                var primerMes = PrimerMes.val();
                var segundoMes = SegundoMes.val();

                if (!!primerMes && !!segundoMes) {
                    $.ajax({
                        type: "POST",
                        url: '/Admin/Dashboard.aspx/GetDatosComparacionMensual',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            PrimerMes: primerMes,
                            SegundoMes: segundoMes
                        }),
                        success: function (msg) {
                            CompararMeses.options.labels = [PrimerMes.val(), SegundoMes.val()];
                            CompararMeses.setData(msg.d);
                        }
                    });
                }
            });

            var inicioPrimeraSemana;
            var inicioSegundaSemana;
            $(".compararSemana").on('dp.change', function (e) {
                var _inicioPrimeraSemana = CompararSemanaDesde.val().substring(0, 10);
                var _inicioSegundaSemana = CompararSemanaHasta.val().substring(0, 10);

                if (!!_inicioPrimeraSemana && !!_inicioSegundaSemana &&
                    (_inicioPrimeraSemana != inicioPrimeraSemana || _inicioSegundaSemana != inicioSegundaSemana)) {

                    inicioPrimeraSemana = _inicioPrimeraSemana;
                    inicioSegundaSemana = _inicioSegundaSemana;

                    $.ajax({
                        type: "POST",
                        url: '/Admin/Dashboard.aspx/GetDatosComparacionSemanal',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            InicioPrimeraSemana: inicioPrimeraSemana,
                            InicioSegundaSemana: inicioSegundaSemana
                        }),
                        success: function (msg) {
                            CompararSemanas.options.labels = [CompararSemanaDesde.val(), CompararSemanaHasta.val()];
                            CompararSemanas.setData(msg.d);
                        }
                    });
                }
            });

            var fechaTop10Desde;
            var fechaTop10Hasta;
            $(".fechaTop").on('dp.change', function (e) {
                var _fechaTop10Desde = FechaTop10Desde.val();
                var _fechaTop10Hasta = FechaTop10Hasta.val();
                if (!!_fechaTop10Desde && !!_fechaTop10Hasta &&
                    (_fechaTop10Desde != fechaTop10Desde || _fechaTop10Hasta != fechaTop10Hasta)) {

                    fechaTop10Desde = _fechaTop10Desde;
                    fechaTop10Hasta = _fechaTop10Hasta;

                    $.ajax({
                        type: "POST",
                        url: '/Admin/Dashboard.aspx/GetDatos10MenosVendidos',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({
                            Top: 10,
                            Menos: true,
                            FechaTop10Desde: fechaTop10Desde,
                            FechaTop10Hasta: fechaTop10Hasta,
                            Cocina: true,
                            ExcluirCategorias: "|1|7|"
                        }),
                        success: function (msg) {
                            Top10MenosVendidos.setData(msg.d);
                        }
                    });
                }
            });
        });

        var CompararSemanas = Morris.Bar({
            element: 'morris-bar-chart',
            xkey: 'Dia',
            ykeys: ['PrimeraVenta', 'SegundaVenta'],
            labels: ['Primera Semana', 'Segunda Semana'],
            hideHover: 'auto',
            resize: true
        });

        var CompararMeses = Morris.Line({
            element: 'morris-area-chart',
            xkey: 'Dia',
            ykeys: ['PrimeraVenta', 'SegundaVenta'],
            parseTime: false,
            labels: ['Primer Mes', 'Segundo Mes'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
        });

        var Top10MenosVendidos = Morris.Donut({
            element: 'morris-donut-chart',
            data: [{ label: "", value: 0 }],
            resize: true
        });

        function CargarDatos(primerMes, segundoMes, PrimeraSemana, SegundaSemana, fechaTop10Desde, fechaTop10Hasta) {
            var inicioPrimeraSemana;
            var inicioSegundaSemana;
            if (!primerMes) primerMes = (new Date()).to("yyyy/mm/dd");
            if (!segundoMes) segundoMes = (new Date()).to("yyyy/mm/dd");
            if (!PrimeraSemana) inicioPrimeraSemana = (new Date()).to("yyyy/mm/dd"); else inicioPrimeraSemana = PrimeraSemana.substring(0, 10);
            if (!SegundaSemana) inicioSegundaSemana = (new Date()).to("yyyy/mm/dd"); else inicioSegundaSemana = SegundaSemana.substring(0, 10);
            if (!fechaTop10Desde) fechaTop10Desde = (new Date()).to("yyyy/mm/dd");
            if (!fechaTop10Hasta) fechaTop10Hasta = (new Date()).to("yyyy/mm/dd");

            var consultaAjax = $.ajax({
                type: "POST",
                url: '/Admin/Dashboard.aspx/GetDatos',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    PrimerMes: primerMes,
                    SegundoMes: segundoMes,
                    InicioPrimeraSemana: inicioPrimeraSemana,
                    InicioSegundaSemana: inicioSegundaSemana,
                    FechaTop10Desde: fechaTop10Desde,
                    FechaTop10Hasta: fechaTop10Hasta
                }),
                success: function (msg) {
                    $("#totalVentas")[0].innerText = msg.d.Conteos.TotalVentas;
                    $("#efectivoVentas")[0].innerText = msg.d.Conteos.EfectivoVentas;
                    $("#tarjetaVentas")[0].innerText = msg.d.Conteos.TarjetaVentas;
                    $("#cantidadVentas")[0].innerText = msg.d.Conteos.CantidadVentas;
                    $("#pendienteCobrar")[0].innerText = msg.d.Conteos.PendienteCobrar;
                    $("#mesasPendienteCobrar")[0].innerText = msg.d.Conteos.MesasPendienteCobrar;

                    //-- Gráficos
                    CompararSemanas.options.labels = [PrimeraSemana, SegundaSemana];
                    CompararSemanas.setData(msg.d.ComparacionSemanal);
                    CompararMeses.options.labels = [primerMes, segundoMes];
                    CompararMeses.setData(msg.d.ComparacionMensual);
                    Top10MenosVendidos.setData(msg.d.Top10MenosVendidos);

                    //-- Listados de "Ultimos ..."
                    setUltimos5Cobros(msg.d.Ultimos5Cobros);
                    setUltimos10Pedidos(msg.d.Ultimos10Pedidos);
                }
            });
            SetRequestsPendientes(consultaAjax);
        }

        function setUltimos5Cobros(cobros) {
            var Ultimos5Cobros = $("#Ultimos5Cobros")[0];
            Ultimos5Cobros.innerHTML = "";

            cobros.forEach(function (Cobro) {
                var a = document.createElement('a');
                var i = document.createElement('i');
                var span = document.createElement('span');
                var spanMesa = document.createElement('span');
                var em = document.createElement('em');

                a.href = "#";
                a.className = "list-group-item";

                i.className = Cobro.Codigo_Metodo_Pago == 1 ? "PagoEfectivo fa fa-money fa-fw" : "PagoTarjeta fa fa-credit-card fa-fw";
                a.appendChild(i);
                spanMesa.innerText = Cobro.Mesa + ": €" + Cobro.Total.toFixed(2);
                a.appendChild(spanMesa);

                span.className = "pull-right text-muted small";
                em.innerText = Cobro.Hora_Pago.to("HH:MM");
                span.appendChild(em);
                a.appendChild(span);
                Ultimos5Cobros.appendChild(a);
            });
        }

        function setUltimos10Pedidos(pedidos) {
            var Ultimos10Pedidos = $("#Ultimos10Pedidos")[0];
            Ultimos10Pedidos.innerHTML = "";

            pedidos.forEach(function (Pedido) {
                var li = document.createElement('li');
                var divIcono = document.createElement('div');
                var i = document.createElement('i');

                li.className = Pedido.Impresora ? "timeline-inverted" : "timeline-panel";
                divIcono.className = "timeline-badge " + (Pedido.Impresora ? "warning" : "success");
                i.className = Pedido.Impresora ? "fa fa-spoon" : "fa fa-glass";
                divIcono.appendChild(i);
                li.appendChild(divIcono);

                var divPanel = document.createElement('div');
                divPanel.className = "timeline-panel";
                var divHeader = document.createElement('div');
                divHeader.className = "timeline-heading";

                var h4 = document.createElement('h4');
                h4.className = "timeline-title";
                h4.innerText = Pedido.Mesa + " - " + Pedido.Hora_Orden_Detalle.to("HH:MM");
                divHeader.appendChild(h4);
                divPanel.appendChild(divHeader);

                var divBody = document.createElement('div');
                divBody.className = "timeline-body";
                Pedido.detalle.forEach(function (detalle) {
                    var p = document.createElement('p');
                    p.innerText = detalle.Cantidad_Producto + " - " + detalle.Producto;
                    divBody.appendChild(p);
                });
                divPanel.appendChild(divBody);

                li.appendChild(divPanel);
                Ultimos10Pedidos.appendChild(li);
            });
        }

        function WeekPicker(selector, Dias) {
            var opciones = {
                format: "YYYY/MM/DD",
                maxDate: moment(),
                locale: 'es'/*,
                language: "es"*/
            };
            var weekPicker = $(selector).datetimepicker(opciones);

            var value = new Date();
            value.setDate(value.getDate() + Dias);
            value = value.to("yyyy/mm/dd");

            var firstDate = moment(value, "YYYY/MM/DD").day(0).format("YYYY/MM/DD");
            var lastDate = moment(value, "YYYY/MM/DD").day(6).format("YYYY/MM/DD");
            $(selector).val(firstDate + " - " + lastDate);

            $(selector).on('dp.change', function (e) {
                var value = $(selector).val();
                var firstDate = moment(value, "YYYY/MM/DD").day(0).format("YYYY/MM/DD");
                var lastDate = moment(value, "YYYY/MM/DD").day(6).format("YYYY/MM/DD");

                $(selector).val(firstDate + " - " + lastDate);
                //CargarDatos(firstDate, lastDate);
            });
            return weekPicker;
        }
    </script>
    <style>
        .week > .bootstrap-datetimepicker-widget tr:hover {
            background-color: #337ab7;
        }

        .PagoTarjeta {
            color: #f0ad4e;
        }

        .PagoEfectivo {
            color: #5cb85c;
        }
    </style>
</asp:Content>
