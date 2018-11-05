<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Areas.aspx.cs" Inherits="AppDevs.TPV.Admin.Areas" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Areas</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Areas</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtAreas"></div>
    </div>
    <div id="dBuscarAreas" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Area</label>
            <input type="text" class="form-control" id="txtBuscarAreas" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#jtAreas').jtable({
                title: 'Listado de Areas',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Areas registradas',
                    editRecord: 'Editar Area'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'Areas.aspx/Listar_Areas',
                    createAction: 'Areas.aspx/Agregar_Areas',
                    updateAction: 'Areas.aspx/Modificar_Areas'
                },
                fields: {
                    Codigo_Area:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Area:
                    {
                        title: 'Area',
                    },
                    Color_Area:
                    {
                        title: 'Color',
                        input: function (data) {
                            if (data.record) {
                                return '<input id="Color_Area" name="Color_Area" type="text" value="' + data.record.Color_Area + '">';
                            } else {
                                return '<input id="Color_Area" name="Color_Area" type="text">';
                            }
                        }
                    },
                    Orden:
                    { title: "Orden" }
                },
                formCreated: function () {
                    $('#Edit-Area').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                    $('#Color_Area').colorpicker();
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
                                 $("#dBuscarAreas").dialog({
                                     resizable: false,
                                     modal: true,
                                     buttons: {
                                         Cancelar: function () {
                                             //-- Limpiar
                                             $("#txtBuscarAreas").val('');
                                             //-- Buscar todas
                                             $('#jtAreas').jtable('load', { nombre: '' });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtAreas').jtable('load', {
                                                 nombre: $("#txtBuscarAreas").val()
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

            $('#jtAreas').jtable('load', { nombre: null });
        });
    </script>
</asp:Content>
