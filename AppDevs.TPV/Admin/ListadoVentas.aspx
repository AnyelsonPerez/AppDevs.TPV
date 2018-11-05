<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoVentas.aspx.cs" Inherits="AppDevs.TPV.Admin.ListadoVentas" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Perfiles de Usuario</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Listado de Ventas</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtVentas"></div>
    </div>
    <div id="dBuscarPerfiles" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Desde</label>
            <input type="text" class="form-control" id="txtBuscarDesde" />
        </div>
        <div class="form-group">
            <label>Hasta</label>
            <input type="text" class="form-control" id="txtBuscarHasta" />
        </div>
    </div>
    <script src="/Scripts/bootstrap-datepicker.min.js"></script>
    <link href="/Content/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="/Scripts/locales/bootstrap-datepicker.es.min.js"></script>
    <script type="text/javascript">
        var DateOption = {
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "es"
        };

        //-- Fechas [Comparador Mensual]
        var BuscarDesde = $("#txtBuscarDesde").datepicker(DateOption);
        var BuscarHasta = $('#txtBuscarHasta').datepicker(DateOption);

        //-- Fecha y Hora actual
        var fechaActual = new Date();
        //-- Las 6 am
        fechaActual.setHours(6, 0, 0, 0)

        BuscarDesde.val(fechaActual.to("yyyy/mm/dd"));

        $(document).ready(function () {
            $('#jtVentas').jtable({
                title: 'Listado de Ventas',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Ventas',
                    editRecord: 'Editar Método de Pago de Venta'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'ListadoVentas.aspx/Listar_Ventas',
                    updateAction: 'ListadoVentas.aspx/Modificar_Ventas'
                },
                fields: {
                    Codigo_Orden:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Productos: {
                        title: '',
                        width: '1%',
                        sorting: false,
                        edit: false,
                        create: false,
                        display: function (datos) {
                            var $img = $('<i class="fa fa-align-center fa-2x" aria-hidden="true" style="cursor:pointer; color:#5cb85c" title="Productos vendidos"></i>');
                            $img.click(function () {
                                if ($img.Abierto == 1) {
                                    $('#jtVentas').jtable('closeChildTable', $img.closest('tr'));
                                    $img.Abierto = 0;
                                }
                                else {
                                    $('#jtVentas').jtable('openChildTable',
                                        $img.closest('tr'),
                                        {
                                            title: 'Productos de esta venta:',
                                            openChildAsAccordion: true,
                                            actions: {
                                                listAction: 'ListadoVentas.aspx/Listar_Productos_Orden?Codigo_Orden=' + datos.record.Codigo_Orden,
                                                deleteAction: 'ListadoVentas.aspx/Eliminar_Productos_Orden',
                                                updateAction: 'ListadoVentas.aspx/Modificar_Productos_Orden'/*,
                                                createAction: 'ListadoVentas.aspx/Listar_Productos_Orden?Codigo_Orden=' + datos.record.Codigo_Orden,*/
                                            },
                                            fields: {
                                                Codigo_Orden_Detalle: {
                                                    key: true,
                                                    list: false,
                                                    create: false,
                                                    edit: false
                                                },
                                                Cantidad_Producto: {
                                                    title: 'Cantidad',
                                                    list: true
                                                },
                                                NombreProducto: {
                                                    title: 'Producto',
                                                    list: true
                                                },
                                                Sub_Total_Precio_Producto:
                                                {
                                                    title: 'Sub Total',
                                                    list: true
                                                }
                                            },
                                            formClosed: function (event, data) {
                                                data.form.validationEngine('hide');
                                                data.form.validationEngine('detach');
                                            }
                                        },
                                            function (data) {
                                                //ctrlMaestro = data;
                                                data.childTable.jtable('load');
                                            });
                                    $img.Abierto = 1;
                                }
                            });
                            return $img;
                        }
                    },
                    Mesa:
                    {
                        title: 'Mesa',
                        list: true,
                        create: false,
                        edit: false
                    },
                    Hora_Pago: {
                        title: 'Fecha',
                        //type: 'date',
                        //displayFormat: 'dd/mm/yy',
                        list: true,
                        create: false,
                        edit: false
                    },
                    Codigo_Metodo_Pago:
                    {
                        title: 'Método de Pago',
                        list: true,
                        create: false,
                        edit: true,
                        options: 'MetodosPago.aspx/listado_MetodoPago_Combo'
                    },
                    Total: {
                        title: 'Total',
                        list: true,
                        create: false,
                        edit: false
                    },
                    Imprimir: {
                        title: '',
                        width: '1%',
                        sorting: false,
                        edit: false,
                        create: false,
                        display: function (datos) {
                            var $img = $('<i class="fa fa-print fa-2x" aria-hidden="true" style="cursor:pointer; color:#5cb85c" title="Reimiprimir cuenta"></i>');
                            $img.click(function () {
                                $.ajax({
                                    type: "POST",
                                    url: '/Sales/Ordenes.aspx/ImprimirCuenta',
                                    data: JSON.stringify({
                                        CodigoOrden: datos.record.Codigo_Orden
                                    }),
                                    contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function (msg) {
                                        MostrarMensaje("Imprimiendo Cuenta", "Cuenta para verificación generada.");
                                    }
                                });
                                            
                            });
                            return $img;
                        }
                    },
                },
                formCreated: function () {
                    $('#Edit-Perfil').addClass('validate[required]');
                },
                formSubmitting: function (event, data) {
                    return data.form.validationEngine('validate');
                },
                toolbar: {
                    items: [
                         {
                             icon: '/content/search.png',
                             text: 'Buscar',
                             click: function () {
                                 $("#dBuscarPerfiles").dialog({
                                     resizable: false,
                                     modal: true,
                                     buttons: {
                                         Cancelar: function () {
                                             //-- Limpiar
                                             BuscarDesde.val('');
                                             BuscarHasta.val('');
                                             //-- Buscar todas
                                             $('#jtVentas').jtable('load', { Desde: null, Hasta: null });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtVentas').jtable('load', {
                                                 Desde: BuscarDesde.val(),
                                                 Hasta: BuscarHasta.val()
                                             });

                                             $(this).dialog("close");
                                         }
                                     }
                                 });
                             }
                         }
                    ]
                },
                formClosed: function (event, data) {
                    data.form.validationEngine('hide');
                    data.form.validationEngine('detach');
                }
            });

            $('#jtVentas').jtable('load', { Desde: BuscarDesde.val(), Hasta: null });
        });
    </script>
</asp:Content>
