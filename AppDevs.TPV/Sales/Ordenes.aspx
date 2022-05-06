<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ordenes.aspx.cs" Inherits="AppDevs.TPV.Sales.Ordenes" %>

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

    <title>AppDevs.TPV - Ordenes</title>

    <!-- Bootstrap Core CSS -->
    <link href="/Content/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <!-- Timeline CSS -->
    <link href="/dist/css/timeline.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Morris Charts CSS -->
    <link href="/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">--%>
    <link href="/Content/themes/base/all.css" rel="stylesheet" />
    <link href="/Content/AppDevs.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/Scripts/jquery.numeric.js"></script>
    <script src="/dist/js/sb-admin-2.js"></script>
    <script src="/js/AppDevs.js"></script>
    <%--<script src="/js/jquery.easyPaginate.js"></script>--%>
    <script src="/Scripts/jquery.signalR-2.2.1.js"></script>
    <script runat="server">
        void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    </script>
    <style>
        .product {
            float: left;
            border: 1px solid #337ab7;
            border-radius: 6px;
            height: 155px;
            width: 100px;
            margin: 5px 5px 5px 5px;
            position: relative;
            text-align: center;
            overflow: hidden;
        }

            .product > p {
                width: 100%;
                position: absolute;
                top: 114px;
            }

        .img-product {
            max-height: 114px;
            max-width: 86px;
        }

        .cantidad {
            padding-right: 10px;
            display: table-cell;
            vertical-align: middle;
        }

        .producto {
            overflow: hidden;
            zoom: 1;
            width: 10000px;
            display: table-cell;
            vertical-align: middle;
        }

        .precio {
            padding-left: 10px;
            display: table-cell;
            vertical-align: middle;
        }

        .nota {
            font-style: italic;
        }

        #dPanelIzquierda {
            height: calc(100vh - 100px);
        }

        #Comanda {
            height: calc(100vh - 265px);
            min-height: 100px;
            overflow: auto;
            z-index: 1;
        }

        @media (max-width: 767px) {
            #dPanelIzquierda {
                height: calc(100vh - 150px);
            }

            .navbar-collapse {
                height: calc(100vh - 100px);
            }

            #Comanda {
                height: calc(100vh - 315px);
            }

            #ListaProductos {
                height: calc(100vh - 150px);
            }
        }

        #PanelCalculadora {
            bottom: 3px;
            height: 175px;
        }

        #ListaProductos {
            overflow-y: auto;
            /*overflow: auto;*/
        }

        #Modificador {
            color: #337ab7;
            font-weight: bold;
        }

        .list-group-item {
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
        }

        .seleccionado {
            border: 5px solid #337ab7;
            border-radius: 5px;
        }

        .num {
            text-align: center;
            cursor: pointer;
            border: 1px solid transparent;
        }

            .num:hover,
            .btn:hover {
                background-color: lightgray;
                border: 1px solid #337ab7;
                border-radius: 5px;
            }

        .ui-dialog {
            z-index: 1050 !important;
        }

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

        .navbar-right > li > button {
            padding: 10px 15px 10px 15px;
        }
    </style>
</head>

<body>
    <form id="Form1" runat="server">
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <ul class="nav navbar-top-links navbar-left">
                        <li class="dropdown">
                            <button id="btnCambiarNombreMesa" type="button" class="btn btn-flat">
                                <span class="fa fa-edit fa-2x fa-fw media-middle" aria-hidden="true"></span>
                                <b><span id="lblMesa" runat="server"></span></b>
                            </button>
                        </li>
                        <%--<li class="dropdown">
                            <button id="btnCambiarPAX" type="button" class="btn btn-flat" disabled="disabled">
                                <span class="fa fa-male fa-2x fa-fw media-middle" aria-hidden="true"></span>
                                <span id="lblPAX" runat="server">0</span> PAX
                            </button>
                        </li>--%>
                    </ul>
                    <ul class="nav navbar-top-links navbar-left">
                        <%--<li class="dropdown">
                            <button id="btnCambiarNombreMesa" type="button" class="btn btn-flat">
                                <span class="fa fa-edit fa-2x fa-fw media-middle" aria-hidden="true"></span>
                                <b><span id="lblMesa" runat="server"></span></b>
                            </button>
                        </li>--%>
                        <li class="dropdown">
                            <button id="btnCambiarPAX" type="button" class="btn btn-flat" disabled="disabled">
                                <span class="fa fa-male fa-2x fa-fw media-middle" aria-hidden="true"></span>
                                <span id="lblPAX" runat="server">0</span> PAX
                            </button>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <button id="btnPedido" type="button" class="btn btn-primary" disabled="disabled">
                            <span class="glyphicon glyphicon-bell" aria-hidden="true"></span>&nbsp Pedir</button>
                    </li>
                    <li class="dropdown">
                        <button id="btnMover" type="button" class="btn btn-warning" disabled="disabled">
                            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>&nbsp Mover</button>
                    </li>
                    <li class="dropdown">
                        <button id="btnCuenta" type="button" class="btn btn-info" disabled="disabled">
                            <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>&nbsp Cuenta</button>
                    </li>
                    <li class="dropdown">
                        <button id="btnCobrar" type="button" class="btn btn-success" disabled="disabled">
                            <span class="glyphicon glyphicon-eur" aria-hidden="true"></span>&nbsp Cobrar</button>
                    </li>
                    <li class="dropdown">
                        <a href="/Sales/Areas.aspx" class="btn btn-danger">
                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>&nbsp Salir
                        </a>
                    </li>
                    <!-- /.dropdown -->
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
                <div class="navbar-default sidebar navbar-collapse" role="navigation">
                    <div id="dPanelIzquierda" class="list-group " style="position: relative;">
                        <div id="Comanda" runat="server"></div>
                        <div id="PanelCalculadora" class="col-md-12 col-sm-12 col-xs-12" style="position: absolute;">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h3 id="Modificador" class="pull-left"></h3>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <h3 id="TotalComanda" class="pull-right"></h3>
                                </div>
                            </div>
                            <div class="row">
                                <input id="btnNota" type="button" class="col-md-6 col-sm-6 col-xs-6 btn btn-primary" value="Nota" disabled="disabled" />
                                <input id="btnMasUno" type="button" class="col-md-6 col-sm-6 col-xs-6 btn btn-primary" value="+ 1" disabled="disabled" />
                            </div>
                            <div class="row">
                                <input id="btnEliminar" type="button" class="col-md-6 col-sm-6 col-xs-6 btn btn-danger" value="Eliminar" disabled="disabled" />
                                <input id="btnSubtotal" type="button" class="col-md-6 col-sm-6 col-xs-6 btn btn-primary" value="Subtotal" disabled="disabled" />
                            </div>
                            <div class="row">
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="1" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="2" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="3" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="<" />
                            </div>
                            <div class="row">
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="4" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="5" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="6" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="0" />
                            </div>
                            <div class="row">
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="7" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="8" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="9" />
                                <input type="button" class="btn btn-group-lg col-md-3 col-sm-3 col-xs-3 num" value="." />
                            </div>
                        </div>
                    </div>

                    <div class="navbar-collapse" style="position: absolute; height: auto"></div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page_wrapper">
                <div class="row">
                    <ul id="uListaCategorias" runat="server" class="nav nav-tabs nav-justified"></ul>
                </div>
                <div id="ListaProductos" runat="server" class="row"></div>
            </div>
            <!-- /#page_wrapper -->
        </div>
        <div id="EligeVariantes" title="Variantes de tamaño">
            <p>Elija una variante de producto</p>
        </div>
        <div id="EligeVariantesConExtras" title="Variantes con Extras">
            <p>Elija una variante de producto y/o un extra.</p>
            <div id="dExtras" runat="server"></div>
        </div>
        <div id="MesasDisponibles" title="Mover a otra mesa">
            <ul id="uListaAreas" runat="server" class="nav nav-tabs nav-justified"></ul>
            <div id="dArea" runat="server" style="height: 90%">
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
        <div id="NotaPedido" title="Nota de pedido">
            <div class="row col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <label for="txtNota">Nota</label>
                        <input id="txtNota" type="text" autofocus="autofocus" class="form-control input-md" placeholder="Nota..." />
                    </div>
                </div>
            </div>
        </div>
        <div id="NombreMesa" title="Cambiar Nombre a Mesa">
            <div class="row col-md-12 col-sm-12 col-xs-12">
                <div class="row text-center">
                    <p id="MensajeNombreMesa">
                        Ya existe una mesa con este nombre.<br>
                        Si aun así desea continuar pulse [Guardar].
                    </p>
                </div>
                <div class="row">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <label for="txtNombreMesa">Nombre de Mesa</label>
                        <input id="txtNombreMesa" type="text" autofocus="autofocus" class="form-control input-md" />
                    </div>
                </div>
            </div>
        </div>
        <div id="PersonasPorMesa" title="Persona en la mesa">
            <div class="row col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <label for="txtPersonasPorMesa">¿Cuántas personas son en la mesa?</label>
                        <input id="txtPersonasPorMesa" type="number" autofocus="autofocus" class="form-control input-md" />
                    </div>
                </div>
            </div>
        </div>
        <div id="PrecioPorPersona" title="Precio por persona">
            <div class="row col-md-12 col-sm-12 col-xs-12">
                <div class="row text-center">
                    <p>Este producto se sirve por cantidad de personas</p>
                </div>
                <div class="row">
                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <label for="txtPrecioPorPersona">¿Para cuántas personas es?</label>
                        <input id="txtPrecioPorPersona" type="number" autofocus="autofocus" class="form-control input-md" />
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="modal fade" id="dCobrar" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header info">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Cobrar</h4>
                    </div>
                    <div class="modal-body text-right">
                        <h1 id="dCobrarTotal"></h1>
                        <div id="dMetodosPago" class="btn-group btn-group-justified" data-toggle="buttons">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnCobrarImprimirCuenta" type="button" class="btn btn-success" data-dismiss="modal">Imprimir Cuenta</button>
                        <button id="btnCobrarCerrarCuenta" type="button" class="btn btn-danger" data-dismiss="modal">Cerrar Cuenta</button>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="modal fade" id="dCobrar" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header info">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Cobrar</h4>
                    </div>
                    <div class="modal-body text-right">
                        <h1><span id="dCobrarTotal"></span>€</h1>
                        <div id="dMetodosPago" class="btn-group btn-group-justified" data-toggle="buttons"></div>
                        <br />

                        <h4 class="text-center">Cambio de:</h4>
                        
                        <input id="txtCobrarDe" type="number" autofocus="autofocus" class="form-control input-lg" style="width:200px; margin:auto" />

                        <br />

                        <div id="dBilletes" class="btn-group btn-group-lg btn-group-justified" data-toggle="buttons">
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="5">5 €</label>
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="10">10 €</label>
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="20">20 €</label>
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="50">50 €</label>
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="100">100 €</label>
                            <label class="btn btn-default billete">
                                <input type="radio" name="billete" value="200">200 €</label>
                        </div>

                        <h1><span id="dCobrarCambio">0,0</span> €</h1>
                    </div>
                    <div class="modal-footer">
                        <button id="btnCobrarImprimirCuenta" type="button" class="btn btn-success" data-dismiss="modal">Imprimir Cuenta</button>
                        <button id="btnCobrarCerrarCuenta" type="button" class="btn btn-danger" data-dismiss="modal">Cerrar Cuenta</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#wrapper -->
    </form>

    <script type="text/javascript">
        var PedidoSeleccionado;
        var ModoEdicion = false;
        var LimpiarPrecio = false;
        var Permisos = null;
        var dArea = document.getElementById('dArea');

        var con = $.hubConnection();
        var hub = con.createHubProxy("refreshHub");
        con.start();

        $(document).ready(function () {
            Permisos = GetPermisos();

            if (!Permisos.Admin) $("#liAdmin").hide();
            $("#aDashboard").prop("disabled", Permisos.SoloVentas);

            if (!Permisos.MoverClientesMesa) $("#btnMover").hide();
            if (!Permisos.CambiarSubTotal) $("#btnSubtotal").hide();
            if (!Permisos.EliminarPedido) $("#btnEliminar").hide();
            if (!Permisos.PedirCuenta) $("#btnCuenta").hide();
            if (!Permisos.CobrarCuenta) $("#btnCobrar").hide();

            if (!Permisos.CambiarNombreMesa) $("#iCambiarNombreMesa").hide();
            $("#btnCambiarNombreMesa").prop("disabled", !Permisos.CambiarNombreMesa);

            CalcularTotalComanda();

            var con = $.hubConnection();
            var hub = con.createHubProxy("refreshHub");
            hub.on("onRefrescar", function (Mesa, Area) {
                if (Mesa == comanda.dataset.codigomesa) {
                    $.ajax({
                        type: "POST",
                        url: 'Ordenes.aspx/GetOrdenDetalle',
                        data: JSON.stringify({
                            _CodigoOrden: (!comanda.dataset.codigoorden ? 0 : comanda.dataset.codigoorden),
                            _CodigoMesa: comanda.dataset.codigomesa
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            MostrarPedidosEnComanda(msg.d);

                            if (Comanda.hasChildNodes())
                                Comanda.firstChild.classList.add('seleccionado');
                            HabilitarBotones();
                        }
                    });
                }
            });
            con.start();
        });

        function getEventTarget(e) {
            e = e || window.event;
            return e.target || e.srcElement;
        }

        var EligeVariantes = $("#EligeVariantes").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '300px'
        });

        var EligeVariantesConExtras = $("#EligeVariantesConExtras").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '590px'
        });

        var MesasDisponibles = $("#MesasDisponibles").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '90%',
            height: $(window).height() * 0.9
        });

        var NotaPedido = $("#NotaPedido").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '50%'
        });

        var NombreMesa = $("#NombreMesa").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '50%'
        });

        var PersonasPorMesa = $("#PersonasPorMesa").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '50%'
        });

        $("#txtPrecioPorPersona").numeric({ negative: false });

        var PrecioPorPersona = $("#PrecioPorPersona").dialog({
            autoOpen: false,
            modal: true,
            resize: false,
            width: '50%'
        });

        var ul = document.getElementById('uListaCategorias');
        ul.onclick = function (e) {
            e.preventDefault();
            var target = getEventTarget(e);
            if (target.localName == 'i') {
                target = target.parentElement;
            }
            var CodigoCategoria = target.dataset.codigocategoria;
            var CodigoCategoriaPadre = target.dataset.codigocategoriapadre;
            var dListaProductos = document.getElementById('ListaProductos');
            var uListaCategorias = document.getElementById('uListaCategorias');

            if (!!CodigoCategoria) {
                dListaProductos.innerHTML = "";
                $.ajax({
                    type: "POST",
                    url: 'Ordenes.aspx/GetCategoria',
                    data: JSON.stringify({ CategoriaPadre: CodigoCategoria }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        uListaCategorias.innerHTML = "";
                        if (CodigoCategoria > 0) AgregarTab(uListaCategorias, "[INICIO]", 0);
                        if (!!CodigoCategoriaPadre) AgregarTab(uListaCategorias, "[Atrás]", CodigoCategoriaPadre, null);

                        if (msg.d.length >= 5)
                            uListaCategorias.classList.remove("nav-justified");
                        else
                            uListaCategorias.classList.add("nav-justified");

                        msg.d.forEach(function (Categoria) {
                            AgregarTab(uListaCategorias, Categoria.Categoria_Producto,
                                Categoria.Codigo_Categoria_Producto,
                                Categoria.Codigo_Categoria_Padre_Producto);
                        });
                    }
                });

                $.ajax({
                    type: "POST",
                    url: 'Ordenes.aspx/GetProducto',
                    data: JSON.stringify(
                        {
                            Categoria: CodigoCategoria
                        }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        msg.d.forEach(function (Producto) {
                            AgregarProducto(dListaProductos, Producto);
                        });

                        //-- Colocar evento
                        ClickOnProduct();
                        /*var listaProducto = document.getElementById('ListaProductos');

                        var col = parseInt((listaProducto.clientWidth - 85) / 100);
                        var fil = parseInt((listaProducto.clientHeight - 60) / 155);
                        var total = col * fil;
                        $('#ListaProductos').easyPaginate({
                            paginateElement: 'a',
                            elementsPerPage: total,
                            effect: 'slide'
                        });*/
                    }
                });
            }
        };

        var comanda = document.getElementById('Comanda');
        comanda.onclick = function (e) {
            e.preventDefault();
            var target = getEventTarget(e);

            if (target.localName.toLowerCase() != 'a')
                target = target.parentNode;

            if (!target.classList.contains("list-group-item"))
                return;

            /*if (!target.classList.contains("list-group-item-danger"))
                return;*/

            var VeniaSeleccionado = target.classList.contains("seleccionado");
            //-- Deselecionar el que pueda estar seleccionado
            $('.seleccionado', comanda).removeClass('seleccionado');

            if (!VeniaSeleccionado) target.classList.add("seleccionado");

            //-- habilitar el boton eliminar
            HabilitarBotones();
        };

        var btnEliminar = document.getElementById('btnEliminar');
        btnEliminar.onclick = function (e) {
            e.preventDefault();
            PedidoSeleccionado = $('.seleccionado', comanda);

            if (PedidoSeleccionado.length == 1)
                if (PedidoSeleccionado.hasClass("list-group-item-danger")) {
                    RestarProductoAComanda(PedidoSeleccionado);
                } else {
                    AnularPedido(PedidoSeleccionado[0].dataset.codigoordendetalle);
                }

            HabilitarBotones();
        }

        var btnMasUno = document.getElementById('btnMasUno');
        btnMasUno.onclick = function (e) {
            e.preventDefault();
            PedidoSeleccionado = $('.seleccionado', comanda);

            if (PedidoSeleccionado.length == 1) {
                PedidoSeleccionado = PedidoSeleccionado[0];
                //-- Sumar 1 producto y un precio producto
                MasUno(PedidoSeleccionado.dataset.codigoordendetalle, comanda.dataset.codigomesa);
            }
        }

        var btnNota = document.getElementById('btnNota');
        btnNota.onclick = function (e) {
            e.preventDefault();
            PedidoSeleccionado = $('.seleccionado', comanda);

            if (PedidoSeleccionado.length == 1) {
                var Nota = $('.nota', PedidoSeleccionado)[0];
                $('#txtNota')[0].value = (!!Nota ? Nota.innerText : "");

                NotaPedido.dialog("open");
                botones = [{
                    text: "Guardar",
                    click: function (e) {
                        e.preventDefault();
                        var Nota = $('#txtNota')[0].value;

                        AgregarOrdenDetalle(PedidoSeleccionado[0].dataset.codigoordendetalle, null, null, null, null, null, Nota, null);
                        NotaPedido.dialog("close");
                    }
                }];

                NotaPedido.dialog("option", "buttons", botones);
                NotaPedido.dialog("open");
            }
        }

        var btnSubtotal = document.getElementById('btnSubtotal');
        btnSubtotal.onclick = function (e) {
            e.preventDefault();
            ModoEdicion = !ModoEdicion;

            if (ModoEdicion) {
                //-- Flag para que se limpie el precio
                LimpiarPrecio = true;
                //-- Cambiar texto
                btnSubtotal.value = "Aceptar";

                //-- Tomar pedido seleccionado
                PedidoSeleccionado = $('.seleccionado', comanda);

                //-- Deshabilitar controles
                comanda.disabled = true;
                ul.disabled = true;
                $('#ListaProductos')[0].disabled = true;
                btnEliminar.disabled = true;
                btnMasUno.disabled = true;
                btnNota.disabled = true;
                btnPedido.disabled = true;
                btnCuenta.disabled = true;
                btnCobrar.disabled = true;
                btnMover.disabled = true;

                //--Limpiar el campo Modificador
                $("#Modificador")[0].innerText = "";

            } else {
                //-- Flag para que se limpie el precio
                LimpiarPrecio = false;
                //-- Cambiar texto
                btnSubtotal.value = "Subtotal";

                //-- Eliminar cualquier extra que pueda estar seleccionado
                //$('.seleccionado', comanda).removeClass('seleccionado');

                //-- Habilitar controles
                comanda.disabled = false;
                ul.disabled = false;
                $('#ListaProductos')[0].disabled = false;
                HabilitarBotones();

                var subtotal = toFloat($(".precio", PedidoSeleccionado)[0].innerText).toFixed(2);

                //-- Formatear a 2 decimales
                $(".precio", PedidoSeleccionado)[0].innerText = subtotal;

                var Nota = $('.nota', PedidoSeleccionado)[0];

                if (subtotal == 0)
                    Nota = (!!Nota ? Nota : "") + " INVITADO";
                else
                    Nota = null;

                //-- Guardar cambio
                PedidoSeleccionado = PedidoSeleccionado[0];
                AgregarOrdenDetalle(PedidoSeleccionado.dataset.codigoordendetalle,
                    null, null, null, null, subtotal, Nota, 0);
            }
        }

        var btnPedido = document.getElementById('btnPedido');
        btnPedido.onclick = function (e) {
            e.preventDefault();
            HacerPedido();
            //-- Salir a el area de mesas
            window.location.href = "/Sales/Areas.aspx";
        }

        var btnCuenta = document.getElementById('btnCuenta');
        btnCuenta.onclick = function (e) {
            e.preventDefault();
            btnCuenta.disabled = true;
            setTimeout(function () { btnCuenta.disabled = false; }, 1000);

            ImprimirCuenta();
        }

        var btnCobrar = document.getElementById('btnCobrar');
        btnCobrar.onclick = function (e) {
            e.preventDefault();
            //-- Recalcular
            CalcularTotalComanda();
            //-- Mostrar métodos de pago
            $.ajax({
                type: "POST",
                url: '/Admin/MetodosPago.aspx/Listar_MetodosPago',
                data: JSON.stringify({ jtStartIndex: 0, jtPageSize: 10, nombre: '' }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (datos) {
                    var Primero = true;
                    dMetodosPago.innerHTML = "";
                    datos.d.Records.forEach(function (metodo) {
                        var label = document.createElement('label');
                        var input = document.createElement('input');

                        label.className = 'btn btn-default';
                        input.type = "radio";
                        input.name = "metodoPago";
                        input.value = metodo.Codigo_Metodo_Pago;
                        if (Primero) {
                            label.classList.add("active");
                            input.setAttribute("checked", "checked");
                            Primero = false;
                        }
                        label.appendChild(input);
                        label.innerHTML += metodo.Metodo_Pago;
                        //<label class="btn btn-default">
                        //    <input type="radio" name="metodoPago" value="Tarjeta">Tarjeta
                        //</label>
                        var dMetodosPago = $('#dMetodosPago')[0];
                        dMetodosPago.insertBefore(label, dMetodosPago.firstChild);
                    });

                    //-- Mostrar total a cobrar
                    document.getElementById("dCobrarTotal").innerText = document.getElementById("TotalComanda").innerText;
                    //-- Mostrar panel
                    $("#dCobrar").modal("show");
                }
            });
        }

        var btnCobrarImprimirCuenta = document.getElementById('btnCobrarImprimirCuenta');
        btnCobrarImprimirCuenta.onclick = function (e) {
            e.preventDefault();
            //-- Generar cuenta
            ImprimirCuenta()
            //-- Deshabilitar
            btnCobrarImprimirCuenta.disabled = true;
        }

        var btnCobrarCerrarCuenta = document.getElementById('btnCobrarCerrarCuenta');
        btnCobrarCerrarCuenta.onclick = function (e) {
            e.preventDefault();
            var metodoPago = $("input[name='metodoPago']:checked").val();
            //-- Cerrar cuenta y salir de comanda
            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/CobrarCuenta',
                data: JSON.stringify({
                    Codigo_Orden: comanda.dataset.codigoorden,
                    Codigo_Metodo_Pago: metodoPago
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (e) {
                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);
                    window.location.href = "/Sales/Areas.aspx";
                }
            });
        }

        var btnMover = document.getElementById('btnMover');
        btnMover.onclick = function (e) {
            e.preventDefault();
            CargarMesasDisponibles(comanda.dataset.codigoarea);

            MesasDisponibles.dialog("open");
        }

        var ul = document.getElementById('uListaAreas');
        ul.onclick = function (e) {
            $(".active", ul).removeClass("active");
            e.preventDefault();
            var target = getEventTarget(e);
            $(target).addClass("active");
            var CodigoArea = target.dataset.codigoarea;
            var CurrentCodigoArea = dArea.dataset.codigoarea;

            var CodigoArea = target.dataset.codigoarea;
            var CurrentCodigoArea = dArea.dataset.codigoarea;

            if (!!CodigoArea && CodigoArea != CurrentCodigoArea) {
                CargarMesasDisponibles(CodigoArea);
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

            //-- Cambiar mesa
            MoverMesa(target.dataset.codigomesa, target.innerText);
            //-- Refrescar
            hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);
            if (comanda.dataset.codigoarea != dArea.dataset.codigoarea)
                hub.invoke("refrescar", target.dataset.codigomesa, dArea.dataset.codigoarea);
            //-- Cerrar Popup
            MesasDisponibles.dialog("close");
        };

        var extras = document.getElementById('dExtras');
        extras.onclick = function (e) {
            e.preventDefault();
            var seleccionado = $('.seleccionado', extras);
            seleccionado.removeClass('seleccionado');

            var target = getEventTarget(e);

            if (target.localName.toLowerCase() != 'a')
                target = target.parentNode;

            target.classList.add("seleccionado");
        };

        HabilitarBotones();
        ClickOnProduct();

        $('.num').on('click', function (e) {
            e.preventDefault();
            var caracter = this.value;
            var Modificador = (ModoEdicion ? $(".precio", PedidoSeleccionado)[0] : $("#Modificador")[0]);

            if (LimpiarPrecio) {
                LimpiarPrecio = false;
                Modificador.innerText = "";
            }

            if (caracter == '<')
                Modificador.innerText = Modificador.innerText.slice(0, -1);
            else if (Modificador.innerText.length <= 4)
                Modificador.innerText += caracter;
        });

        var btnCambiarNombreMesa = document.getElementById('btnCambiarNombreMesa');
        btnCambiarNombreMesa.onclick = function (e) {
            e.preventDefault();
            if (!Permisos.CambiarNombreMesa) return;

            var forzar = false;
            $('#txtNombreMesa')[0].value = $('#<%= lblMesa.ClientID %>')[0].innerText;
            $('#MensajeNombreMesa').hide();

            NombreMesa.dialog("option", "buttons", [{
                text: "GUARDAR",
                click: function (e) {
                    e.preventDefault();
                    var Nombre = $('#txtNombreMesa')[0].value;
                    $.ajax({
                        type: "POST",
                        url: 'Ordenes.aspx/CambiarNombreMesa',
                        data: JSON.stringify({
                            Codigo_Mesa: comanda.dataset.codigomesa,
                            Nombre_Mesa: Nombre,
                            Forzar: forzar
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d === true) {
                                $('#<%= lblMesa.ClientID %>')[0].innerText = Nombre;
                                NombreMesa.dialog("close");

                            } else {
                                forzar = true;
                                $('#MensajeNombreMesa').show();
                            }
                        }
                    });
                }
            }]);
            NombreMesa.dialog("open");
        };

        var btnCambiarPAX = document.getElementById('btnCambiarPAX');
        btnCambiarPAX.onclick = function (e) {
            e.preventDefault();

            $('#txtPersonasPorMesa')[0].value = $('#<%= lblPAX.ClientID %>')[0].innerText;

            PersonasPorMesa.dialog("option", "buttons", [{
                text: "GUARDAR",
                click: function (e) {
                    e.preventDefault();
                    var comensales = $('#txtPersonasPorMesa')[0].value;
                    $.ajax({
                        type: "POST",
                        url: 'Ordenes.aspx/CambiarPAX',
                        data: JSON.stringify({
                            Codigo_Orden: (!comanda.dataset.codigoorden ? 0 : comanda.dataset.codigoorden),
                            Comensales: comensales
                        }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (msg) {
                            if (msg.d === true) {
                                $('#<%= lblPAX.ClientID %>')[0].innerText = comensales;

                                PersonasPorMesa.dialog("close");
                            }
                        }
                    });
                }
            }]);
            PersonasPorMesa.dialog("open");
        };

        $('.billete').on('click', function (e) {
            $("#txtCobrarDe").val("");

            var billete = toFloat($("input", this).val()).toFixed(2);

            var total = toFloat($("#dCobrarTotal")[0].innerText).toFixed(2);
            var cambio = billete - total;
            if (cambio >= 0)
                $("#dCobrarCambio")[0].innerText = toFloat(cambio).toFixed(2);
            else
                $("#dCobrarCambio")[0].innerText = "Falta";
        });

        $('#txtCobrarDe').on('keyup', function (e) {
            $(".billete.active").removeClass("active");

            var billete = $("#txtCobrarDe").val();
            
            var total = toFloat($("#dCobrarTotal")[0].innerText).toFixed(2);
            var cambio = billete - total;
            if (cambio >= 0)
                $("#dCobrarCambio")[0].innerText = toFloat(cambio).toFixed(2);
            else
                $("#dCobrarCambio")[0].innerText = "Falta";
        });

        function AgregarTab(Lista, Titulo, Codigo, CodigoPadre) {
            var li = document.createElement('li');
            var a = document.createElement('a');

            a.href = "#";
            a.dataset.codigocategoria = Codigo;
            if (!!CodigoPadre) a.dataset.codigocategoriapadre = CodigoPadre;
            if (Titulo == "[INICIO]") {
                var i = document.createElement('i');
                i.classList.add("fa");
                i.classList.add("fa-home");
                a.appendChild(i);
            }
            else if (Titulo == "[Atrás]") {
                var i = document.createElement('i');
                i.classList.add("fa");
                i.classList.add("fa-arrow-left");
                a.appendChild(i);
            }
            else {
                a.innerText = Titulo;
            }

            li.appendChild(a);
            Lista.appendChild(li);
        }

        function AgregarProducto(Lista, Producto, Codigo) {
            var a = document.createElement('a');
            var img = document.createElement('img');
            var p = document.createElement('p');

            a.href = "#";
            a.classList.add("product");
            a.dataset.aceptaextra = Producto.AceptaExtra;
            a.dataset.codigoproducto = Producto.Codigo_Producto;
            a.dataset.nombreproducto = Producto.NombreProducto;
            a.dataset.precioventa = Producto.PrecioVenta;
            a.dataset.codigotipoproducto = Producto.Codigo_Tipo_Producto;

            img.classList.add("img-product");
            img.src = "/utils/VisorImagenProducto.aspx?codigoproducto=" + Producto.Codigo_Producto;
            img.onerror = function () { ImagenNoEncontrada(img); };
            //img.onerror = TextoImagen(Producto);

            p.style.width = "100%";
            p.style.position = "absolute";
            p.style.bottom = "0px";
            p.innerText = Producto.NombreProducto;

            a.appendChild(img);
            a.appendChild(p);
            Lista.appendChild(a);
        }

        function AgregarOrdenDetalle(CodigoOrdenDetalle, CodigoProducto, CodigoProductoUnidadMedida, CantidadProducto, CodigoProductoExtra, SubTotal, NotaProducto, CantidadPersonas) {
            //-- Deselecionar el que pueda estar seleccionado
            $('.seleccionado', comanda).removeClass('seleccionado');
            //--
            if (!!CantidadProducto && !!SubTotal)
                SubTotal = toFloat(CantidadProducto) * toFloat(SubTotal);

            if (!NotaProducto) NotaProducto = null;

            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/SetOrdenDetalle',
                data: JSON.stringify({
                    _CodigoOrdenDetalle: CodigoOrdenDetalle,
                    _CodigoOrden: (!comanda.dataset.codigoorden ? 0 : comanda.dataset.codigoorden),
                    _CodigoMesa: comanda.dataset.codigomesa,
                    _CodigoProducto: CodigoProducto,
                    _CodigoProductoUnidadMedida: CodigoProductoUnidadMedida,
                    _CantidadProducto: CantidadProducto,
                    _CodigoProductoExtra: CodigoProductoExtra,
                    _SubTotal: SubTotal,
                    _CantidadPersonas: CantidadPersonas,
                    _NotaProducto: NotaProducto,
                    _CodigoEstadoOrdenDetalle: null
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    MostrarPedidosEnComanda(msg.d);
                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);

                    if (Comanda.hasChildNodes())
                        Comanda.firstChild.classList.add('seleccionado');
                    HabilitarBotones();
                }
            });
        }

        function MasUno(CodigoOrdenDetalle, CodigoMesa) {
            //-- Deselecionar el que pueda estar seleccionado
            $('.seleccionado', comanda).removeClass('seleccionado');
            //--

            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/MasUno',
                data: JSON.stringify({
                    _CodigoOrdenDetalle: CodigoOrdenDetalle,
                    _CodigoMesa: CodigoMesa
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    MostrarPedidosEnComanda(msg.d);
                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);

                    if (Comanda.hasChildNodes())
                        Comanda.firstChild.classList.add('seleccionado');
                    HabilitarBotones();
                }
            });
        }

        function HacerPedido() {
            //-- Deselecionar el que pueda estar seleccionado
            $('.seleccionado', comanda).removeClass('seleccionado');

            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/HacerPedido',
                data: JSON.stringify({ _CodigoOrden: comanda.dataset.codigoorden }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (!!msg.d && msg.d.length > 0)
                        MostrarPedidosEnComanda(msg.d);

                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);
                }
            });
        }

        function AnularPedido(CodigoOrdenDetalle) {
            //-- Deselecionar el que pueda estar seleccionado
            $('.seleccionado', comanda).removeClass('seleccionado');

            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/AnularPedido',
                data: JSON.stringify({ _CodigoOrdenDetalle: CodigoOrdenDetalle }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    if (!!msg.d)
                        MostrarPedidosEnComanda(msg.d);
                    HabilitarBotones();

                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);
                }
            });
        }

        function RestarProductoAComanda(Pedido) {
            Pedido = Pedido[0];
            //-- Restar 1 producto y un precio producto
            AgregarOrdenDetalle(Pedido.dataset.codigoordendetalle, null, null, -1, null, Pedido.dataset.precioventa, null, null);
        }

        function CalcularTotalComanda() {
            var TotalComanda = document.getElementById("TotalComanda");
            var precios = $(".precio", comanda);
            var Total = 0;

            for (var i = 0; i < precios.length; i++) {
                Total += toFloat(precios[i].innerText);
            }

            TotalComanda.innerText = Total.toFixed(2);
            //--Limpiar modificador
            Modificador.innerText = "";
        }

        function HabilitarBotones() {
            //-- Habilitar botones.
            btnPedido.disabled = ($('.list-group-item.list-group-item-danger', comanda).length == 0);
            btnCuenta.disabled = !comanda.hasChildNodes();
            btnCobrar.disabled = btnCuenta.disabled;
            $("#btnCambiarPAX").prop("disabled", btnCuenta.disabled);

            var disabled = ($('.seleccionado.list-group-item-danger', comanda).length != 1);
            btnEliminar.disabled = $('.seleccionado', comanda).length == 0;
            if ($('.seleccionado', comanda).length == 1 && $('.seleccionado.list-group-item-danger', comanda).length == 0) {
                btnEliminar.value = "Anular";
            } else {
                btnEliminar.value = "Eliminar";
            }

            btnNota.disabled = disabled;
            btnSubtotal.disabled = $('.seleccionado', comanda).length == 0;
            btnMasUno.disabled = btnSubtotal.disabled;
            btnMover.disabled = btnCuenta.disabled;
        }

        function ClickOnProduct() {
            $('#ListaProductos a.product').on('click', function (e) {
                e.preventDefault();

                //-- Deselecionar el que pueda estar seleccionado
                $('#ListaProductos > .seleccionado').removeClass('seleccionado');

                this.classList.add("seleccionado");
                setTimeout(function () {
                    $('#ListaProductos > .seleccionado').removeClass('seleccionado');
                }, 500);

                var Producto = {};
                Producto.Codigo_Producto = this.dataset.codigoproducto;
                Producto.NombreProductoUnidadMedida = this.dataset.nombreproducto;
                Producto.Precio_Venta = this.dataset.precioventa;
                Producto.AceptaExtra = this.dataset.aceptaextra;
                Producto.Codigo_Tipo_Producto = this.dataset.codigotipoproducto;

                //-- Si es "Precio por personas" preguntar para cuantas personas
                if (this.dataset.codigotipoproducto == 4) {
                    $('#txtPrecioPorPersona')[0].value = $('#<%= lblPAX.ClientID %>')[0].innerText;
                    PrecioPorPersona.dialog("option", "buttons", [{
                        text: "Guardar",
                        click: function (e) {
                            e.preventDefault();
                            var cantidad = toFloat($('#txtPrecioPorPersona')[0].value);
                            if (cantidad > 0) {
                                Producto.Nota_Producto = "Para " + cantidad;
                                CompletarPedido(Producto, cantidad);
                                //-- Cerrar
                                PrecioPorPersona.dialog("close");
                            }
                        }
                    }]);

                    PrecioPorPersona.dialog("open");
                } else {
                    CompletarPedido(Producto, null);
                }

                //-- Si es "Servicios por personas" preguntar cuantas personas hay en la mesa
                var NoComensales = $('#<%= lblPAX.ClientID %>')[0].innerText;
                if (Producto.Codigo_Tipo_Producto == 5 && (NoComensales == "0" || NoComensales == "1")) {
                    $('#txtPersonasPorMesa')[0].value = 1;

                    PersonasPorMesa.dialog("option", "buttons", [{
                        text: "GUARDAR",
                        click: function (e) {
                            e.preventDefault();
                            var comensales = $('#txtPersonasPorMesa')[0].value;
                            $.ajax({
                                type: "POST",
                                url: 'Ordenes.aspx/CambiarPAX',
                                data: JSON.stringify({
                                    Codigo_Orden: (!comanda.dataset.codigoorden ? 0 : comanda.dataset.codigoorden),
                                    Comensales: comensales
                                }),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function (msg) {
                                    if (msg.d === true) {
                                        $('#<%= lblPAX.ClientID %>')[0].innerText = comensales;

                                        PersonasPorMesa.dialog("close");
                                    }
                                }
                            });
                        }
                    }]);
                    PersonasPorMesa.dialog("open");
                }
            });
        }

        function MoverMesa(CodigoMesa, NombreMesa) {
            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/SetMesaNueva',
                data: JSON.stringify({
                    Codigo_Area: comanda.dataset.codigoarea,
                    Codigo_Orden: comanda.dataset.codigoorden,
                    Codigo_Mesa: CodigoMesa
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
            CodigoMesa = comanda.dataset.codigomesa;
            lblMesa.innerText = NombreMesa;
        }

        function MostrarPedidosEnComanda(Productos) {
            //-- Limpiar contenido de [Comanda]
            comanda.innerHTML = "";
            Productos.forEach(function (Producto) {
                comanda.dataset.codigoorden = Producto.Codigo_Orden;
                var a = document.createElement('a');
                var h4Cantidad = document.createElement('h4');
                var h4Producto = document.createElement('h4');
                var h4Precio = document.createElement('h4');

                a.href = "#";
                a.dataset.codigoordendetalle = Producto.Codigo_Orden_Detalle;
                a.dataset.precioventa = Producto.PrecioVenta;

                a.classList.add("list-group-item");
                if (Producto.Codigo_Estado_Orden_Detalle == 1)
                    a.classList.add("list-group-item-danger");

                h4Cantidad.classList.add("cantidad");
                h4Cantidad.innerText = Producto.Cantidad_Producto;

                h4Producto.classList.add("producto");
                h4Producto.innerText = Producto.NombreProducto;

                h4Precio.classList.add("precio");
                h4Precio.innerText = toFloat(Producto.Sub_Total_Precio_Producto).toFixed(2);

                a.appendChild(h4Cantidad);
                a.appendChild(h4Producto);
                a.appendChild(h4Precio);

                //-- Agregar Nota si el pedido posee
                if (!!Producto.Nota_Producto && Producto.Nota_Producto.length > 0) {
                    var h6Nota = document.createElement('h6');
                    h6Nota.classList.add("nota");
                    h6Nota.innerText = Producto.Nota_Producto;
                    a.appendChild(h6Nota);
                }

                Comanda.appendChild(a);

                HabilitarBotones();
            });
            //-- Recalcular Total
            CalcularTotalComanda();
        }

        function CompletarPedido(Producto, CantidadDePersonas) {
            //-- Precio por persona
            if (!!CantidadDePersonas)
                Producto.Precio_Venta = toFloat(Producto.Precio_Venta) * toFloat(CantidadDePersonas);

            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/GetProductosUnidadesMedidas',
                data: JSON.stringify(
                    {
                        CodigoProducto: Producto.Codigo_Producto
                    }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var Variantes = [];
                    var Cantidad = (Modificador.innerText.length > 0 ? Modificador.innerText : "1");

                    if (msg.d.length == 1) {
                        if (!!Producto.AceptaExtra && Producto.AceptaExtra.toLowerCase() == 'true') {
                            Variantes.push({
                                text: "CON EXTRA",
                                enabled: false,
                                click: function (e) {
                                    e.preventDefault();
                                    Producto.CodigoProductoExtra = null;
                                    var dExtras = $("#dExtras", this);
                                    if (!!dExtras && dExtras.length == 1) {
                                        var Extra = $("a.seleccionado", dExtras);
                                        Extra.removeClass('seleccionado');
                                        if (Extra.length != 1) return false;
                                        else {
                                            Extra = Extra[0];
                                            Producto.CodigoProductoExtra = Extra.dataset.codigoproducto;
                                            Producto.NombreProductoUnidadMedida += ' con ' + Extra.dataset.nombreproducto;
                                            Producto.Precio_Venta = toFloat(Producto.Precio_Venta) + toFloat(Extra.dataset.preciocomoextra);
                                        }
                                    }

                                    AgregarOrdenDetalle(null, Producto.Codigo_Producto, null, Cantidad,
                                        Producto.CodigoProductoExtra, Producto.Precio_Venta, Producto.Nota_Producto, CantidadDePersonas);

                                    $(this).dialog("close");
                                }
                            });
                            if (Producto.Codigo_Tipo_Producto != 6)
                                Variantes.push({
                                    text: "SÓLO",
                                    click: function (e) {
                                        e.preventDefault();
                                        AgregarOrdenDetalle(null, Producto.Codigo_Producto, null, Cantidad,
                                            null, Producto.Precio_Venta, Producto.Nota_Producto, CantidadDePersonas);
                                        $(this).dialog("close");
                                    }
                                }
                                );
                            EligeVariantesConExtras.dialog("option", "buttons", Variantes);
                            EligeVariantesConExtras.dialog("open");
                        }
                        else {
                            AgregarOrdenDetalle(null, Producto.Codigo_Producto, null, Cantidad, null, Producto.Precio_Venta, Producto.Nota_Producto, CantidadDePersonas);
                        }
                    } else if (msg.d.length > 1) {
                        msg.d.forEach(function (Producto) {
                            Variantes.push(
                                {
                                    text: Producto.Unidad_Medida,
                                    click: function (e) {
                                        e.preventDefault();
                                        Producto.CodigoProductoExtra = null;
                                        var dExtras = $("#dExtras", this);
                                        if (!!dExtras && dExtras.length == 1) {
                                            var Extra = $("a.seleccionado", dExtras);
                                            Extra.removeClass('seleccionado');
                                            if (Extra.length != 1) return false;
                                            else {
                                                Extra = Extra[0];
                                                Producto.CodigoProductoExtra = Extra.dataset.codigoproducto;
                                                Producto.NombreProductoUnidadMedida += ' con ' + Extra.dataset.nombreproducto;
                                                Producto.Precio_Venta = toFloat(Producto.Precio_Venta) + toFloat(Extra.dataset.preciocomoextra);
                                            }
                                        }
                                        AgregarOrdenDetalle(null, Producto.Codigo_Producto, Producto.Codigo_Producto_Unidad_Medida,
                                            Cantidad, Producto.CodigoProductoExtra, Producto.Precio_Venta, Producto.Nota_Producto, CantidadDePersonas);

                                        $(this).dialog("close");
                                    }
                                }
                            );
                        });
                        if (!!Producto.AceptaExtra && Producto.AceptaExtra.toLowerCase() == 'true') {
                            EligeVariantesConExtras.dialog("option", "buttons", Variantes);
                            EligeVariantesConExtras.dialog("open");
                        }
                        else {
                            EligeVariantes.dialog("option", "buttons", Variantes);
                            EligeVariantes.dialog("open");
                        }
                    }
                }
            });
        }

        function ImprimirCuenta() {
            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/ImprimirCuenta',
                data: JSON.stringify({
                    CodigoOrden: comanda.dataset.codigoorden
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    MostrarMensaje("Imprimiendo Cuenta", "Cuenta para verificación generada.");
                    hub.invoke("refrescar", comanda.dataset.codigomesa, comanda.dataset.codigoarea);
                }
            });
        }

        function CargarMesasDisponibles(CodigoArea) {
            $.ajax({
                type: "POST",
                url: 'Ordenes.aspx/GetMesasDisponibles',
                data: JSON.stringify({ Codigo_Area: CodigoArea, Codigo_Mesa: comanda.dataset.codigomesa }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    var dMesas = $(".mesaActiva", dArea);
                    $(".ocupada", dArea).removeClass("ocupada");
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
    </script>
</body>
</html>