<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetodosPago.aspx.cs" Inherits="AppDevs.TPV.Admin.MetodosPago" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Métodos de Pago</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Métodos de Pago</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtMetodosPago"></div>
    </div>
    <div id="dBuscarMetodosPago" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Método de pago</label>
            <input type="text" class="form-control" id="txtBuscarMetodosPago" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#jtMetodosPago').jtable({
                title: 'Listado de Métodos de Pago',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Métodos de pago registradas',
                    editRecord: 'Editar Método de pago'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'MetodosPago.aspx/Listar_MetodosPago',
                    createAction: 'MetodosPago.aspx/Agregar_MetodoPago',
                    updateAction: 'MetodosPago.aspx/Modificar_MetodoPago'
                },
                fields: {
                    Codigo_Metodo_Pago:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Metodo_Pago:
                    {
                        title: 'Método de pago',
                    }
                },
                formCreated: function () {
                    $('#Edit-Metodo_Pago').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                    $('#Color_Metodo_Pago').colorpicker();
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
                                 $("#dBuscarMetodosPago").dialog({
                                     resizable: false,
                                     modal: true,
                                     buttons: {
                                         Cancelar: function () {
                                             //-- Limpiar
                                             $("#txtBuscarMetodosPago").val('');
                                             //-- Buscar todas
                                             $('#jtMetodosPago').jtable('load', { nombre: '' });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtMetodosPago').jtable('load', {
                                                 nombre: $("#txtBuscarMetodosPago").val()
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

            $('#jtMetodosPago').jtable('load', { nombre: null });
        });
    </script>
</asp:Content>
