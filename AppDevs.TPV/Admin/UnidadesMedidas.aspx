<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnidadesMedidas.aspx.cs" Inherits="AppDevs.TPV.Admin.UnidadesMedidas" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Unidades de Medidas</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Unidades de Medidas</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtUnidadesMedidas"></div>
    </div>
    <div id="dBuscarUnidadesMedidas" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Unidad de Medida</label>
            <input type="text" class="form-control" id="txtBuscarUnidadesMedidas" />
        </div>
    </div>
    <script type="text/javascript">
        //CargarCategoriaPadre();

        $('#jtUnidadesMedidas').jtable({
            title: 'Listado de Unidades de Medidas',
            paging: true,
            useBootstrap: true,
            pageSize: 10,
            addDialogWidth: '750',
            messages: {
                noDataAvailable: 'No hay Unidades de Medidas',
                editRecord: 'Editar Unidad de Medida'
            },
            columnSelectable: false,
            editDialogWidth: '750',
            actions: {
                listAction: '/Admin/UnidadesMedidas.aspx/Listar_Unidades_Medidas',
                createAction: '/Admin/UnidadesMedidas.aspx/Agregar_Unidades_Medidas',
                updateAction: '/Admin/UnidadesMedidas.aspx/Modificar_Unidades_Medidas'
            },
            fields: {
                Codigo_Unidad_Medida:
                {
                    title: 'Id',
                    key: true,
                    list: false,
                    create: false,
                    edit: false,
                    width: '1%'
                },
                Unidad_Medida:
                {
                    title: 'Unidad de Medida',
                    list: true,
                    create: true,
                    edit: true
                },
                Abreviatura:
                {
                    title: 'Abreviatura',
                    list: true,
                    create: true,
                    edit: true
                }
            },
            formCreated: function () {
                $('#Edit-Unidad_Medida').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');;
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
                             $("#dBuscarUnidadesMedidas").dialog({
                                 resizable: false,
                                 modal: true,
                                 buttons: {
                                     Cancelar: function () {
                                         //-- Limpiar
                                         $("#txtBuscarUnidadesMedidas").val('');
                                         //-- Buscar todas
                                         $('#jtUnidadesMedidas').jtable('load', { nombre: '' });
                                         $(this).dialog("close");
                                     },
                                     Buscar: function () {
                                         $('#jtUnidadesMedidas').jtable('load', {
                                             nombre: $("#txtBuscarUnidadesMedidas").val()
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

        $('#jtUnidadesMedidas').jtable('load', { nombre: null });
    </script>
</asp:Content>
