<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Areas.aspx.cs" Inherits="AppDevs.TPV.Sales.Areas" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Ing. Anyelson Pérez Pérez">
    <meta name="application-name" content="App-Devs.TPV" />
    <meta name="description" content="Sistema para Terminal de Punto de Venta, diseñado espacialmente para restaurantes, bares, etc.">
    <meta name="keywords" content="AppDevs, TPV" />
    <link rel="shortcut icon" type="image/png" href="/Content/TPV.png" />

    <title>AppDevs.TPV - Areas</title>

    <!-- Bootstrap Core CSS -->
    <%--<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--%>

    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <link href="/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <link href="/dist/css/timeline.css" rel="stylesheet">
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="/bower_components/morrisjs/morris.css" rel="stylesheet">
    <link href="/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/Content/themes/base/draggable.css" rel="stylesheet" />
    <link href="/Content/themes/base/resizable.css" rel="stylesheet" />
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
            /*cursor: pointer;*/
        }

        .mesaActiva:hover {
            border: 0.5px solid #808080;
        }

        .mesa > i.ocupada {
            /*border: 5px solid #337ab7;*/
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
                cursor: pointer;
            }

        #dArea {
            position: relative;
            /*height: calc(100vh - 50px);*/
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script runat="server">
        void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    </script>
</head>

<body>
    <form id="Form1" runat="server">
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a id="aDashboard" class="navbar-brand" href="/Admin/Dashboard.aspx">App-Devs.TPV</a>
                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-top-links navbar-right">
                    <li id="liAdmin">
                        <a href="/Admin/Dashboard.aspx"><i class="fa fa-dashboard fa-fw"></i>Administrar</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Logout_Click">
                                    <i class="glyphicon glyphicon-log-out"></i> Salir del sistema
                                </asp:LinkButton>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-full-wrapper">
                <ul id="uListaAreas" runat="server" class="nav nav-tabs nav-justified"></ul>
                <div id="dArea" runat="server">
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
            <!-- /#page_wrapper -->

        </div>
        <!-- /#wrapper -->
    </form>
    <!-- jQuery -->
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="/Scripts/jquery.signalR-2.2.1.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.js"></script>
    <script src="/js/AppDevs.js"></script>
    <script type="text/javascript">
        var Permisos = null;
        $(document).ready(function () {
            var permisos = GetPermisos();

            if (!permisos.Admin) $("#liAdmin").hide();
            $("#aDashboard").prop("disabled", permisos.SoloVentas);

            var con = $.hubConnection();
            var hub = con.createHubProxy("refreshHub");
            hub.on("onRefrescar", function (CodigoMesa, CodigoArea) {
                if (CodigoArea == dArea.dataset.codigoarea) {
                    //var area = $('a:focus', ul)[0];
                    //if (!area) area = $('a', ul)[0];
                    //var CodigoArea = area.dataset.codigoarea;
                    //var Color = area.dataset.colorarea;
                    //getMesas(CodigoArea, Color);
                    CargarMesas(dArea.dataset.codigoarea);
                }
            });
            con.start();
            //-- Cargar mesas
            CargarMesas(dArea.dataset.codigoarea);
        });

        function getEventTarget(e) {
            e = e || window.event;
            return e.target || e.srcElement;
        }

        var ul = document.getElementById('uListaAreas');
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

        var Area = document.getElementById('dArea');
        Area.onclick = function (e) {
            e.preventDefault();
            var target = getEventTarget(e);
            if (target.localName.toLowerCase() == 'i')
                target = target.parentNode
            if (target.id == "dArea")
                return;
            if (!target.classList.contains("mesaActiva"))
                return;

            //alert(target.dataset.codigomesa);
            window.location.href = '/sales/Ordenes.aspx?' +
                'codigoarea=' + dArea.dataset.codigoarea +
                '&codigomesa=' + target.dataset.codigomesa +
                '&nombremesa=' + target.innerText;
        };

        function CargarMesas(CodigoArea) {
            $.ajax({
                type: "POST",
                url: '/sales/Areas.aspx/GetMesas',
                data: JSON.stringify({ Codigo_Area: CodigoArea }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var dMesas = $(".mesaActiva", dArea);
                    
                    $(".ocupada", dArea).removeClass("ocupada");
                    if (dMesas.length > 0) {
                        for (var i = 0; i < dMesas.length; i++) {
                            var dMesa = dMesas[i];
                            $('i', dMesa)[0].innerText = "";
                            $('i', dMesa)[0].className = "";
                            dMesa.style.backgroundColor = "transparent";
                            dMesa.dataset.codigomesa = 0;
                        }

                        dMesas.removeClass("mesaActiva");
                    }
                    msg.d.forEach(function (mesa) {
                        var dMesa = $('*[data-posicionx="' + mesa.PosicionX + '"][data-posiciony="' + mesa.PosicionY + '"]');
                        if (!!dMesa) {
                            if (!!dMesa.length) dMesa = dMesa[0];
                            var pNombreMesa = $('i', dMesa);
                            if (!!pNombreMesa.length) pNombreMesa = pNombreMesa[0];

                            if (mesa.Codigo_Estado_Orden == 2) {
                                pNombreMesa.className = 'fa fa-file-text fa-fw ocupada';
                                dMesa.style.backgroundColor = invertColor(mesa.Color_Mesa);
                            }
                            else if (mesa.Ocupada) {
                                pNombreMesa.className = 'ocupada';
                                dMesa.style.backgroundColor = invertColor(mesa.Color_Mesa);
                            } else
                                dMesa.style.backgroundColor = mesa.Color_Mesa;

                            pNombreMesa.innerText = mesa.Mesa;

                            dMesa.classList.add('mesaActiva');
                            dMesa.dataset.codigomesa = mesa.Codigo_Mesa;

                        }
                    });
                }
            });
        }

        function invertColor(hex) {
            if (hex.indexOf("rgb") === 0) {
                hex = rgb2hex(hex);
            }
            if (hex.indexOf('#') === 0) {
                hex = hex.slice(1);
            }
            // convert 3-digit hex to 6-digits.
            if (hex.length === 3) {
                hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
            }
            if (hex.length !== 6) {
                throw new Error('Invalid HEX color.');
            }
            // invert color components
            var r = (255 - parseInt(hex.slice(0, 2), 16)).toString(16),
                g = (255 - parseInt(hex.slice(2, 4), 16)).toString(16),
                b = (255 - parseInt(hex.slice(4, 6), 16)).toString(16);
            // pad each with zeros and return
            return '#' + padZero(r) + padZero(g) + padZero(b);
        }

        function padZero(str, len) {
            len = len || 2;
            var zeros = new Array(len).join('0');
            return (zeros + str).slice(-len);
        }

        function rgb2hex(rgb) {
            rgb = rgb.match(/^rgb?[\s+]?\([\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?,[\s+]?(\d+)[\s+]?/i);
            return (rgb && rgb.length === 4) ? "#" +
             ("0" + parseInt(rgb[1], 10).toString(16)).slice(-2) +
             ("0" + parseInt(rgb[2], 10).toString(16)).slice(-2) +
             ("0" + parseInt(rgb[3], 10).toString(16)).slice(-2) : '';
        }
    </script>

</body>

</html>
