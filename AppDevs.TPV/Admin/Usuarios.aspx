<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="AppDevs.TPV.Admin.Usuarios" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Usuarios</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Usuarios</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtUsuarios"></div>
    </div>
    <div id="dBuscarUsuarios" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Nombre</label>
            <input type="text" class="form-control" id="txtBuscarUsuarios" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#jtUsuarios').jtable({
                title: 'Listado de Usuarios',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Usuarios registradas',
                    editRecord: 'Editar Usuario'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'Usuarios.aspx/Listar_Usuarios',
                    createAction: 'Usuarios.aspx/Agregar_Usuarios',
                    updateAction: 'Usuarios.aspx/Modificar_Usuarios'
                },
                fields: {
                    Codigo_Usuario:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Codigo_Perfil:
                    {
                        title: 'Perfil',
                        list: true,
                        create: true,
                        edit: true,
                        options: '/Admin/Perfiles.aspx/listado_Perfiles_Combo?Codigo_Perfil=0'
                    },
                    Usuario:
                    {
                        title: 'Usuario',
                        list: true,
                        create: true,
                        edit: true
                    },
                    Clave:
                    {
                        title: 'Contraseña',
                        list: false,
                        create: true,
                        edit: true,
                        type: 'password'
                    },
                    Nombre_Usuario:
                    {
                        title: 'Nombre',
                        list: true,
                        create: true,
                        edit: true
                    },
                    Apellido_Usuario:
                    {
                        title: 'Apellido',
                        list: true,
                        create: true,
                        edit: true
                    }
                },
                formCreated: function () {
                    $('#Edit-Usuario').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
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
                                 $("#dBuscarUsuarios").dialog({
                                     resizable: false,
                                     modal: true,
                                     buttons: {
                                         Cancelar: function () {
                                             //-- Limpiar
                                             $("#txtBuscarUsuarios").val('');
                                             //-- Buscar todas
                                             $('#jtUsuarios').jtable('load', { nombre: '' });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtUsuarios').jtable('load', {
                                                 nombre: $("#txtBuscarUsuarios").val()
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

            $('#jtUsuarios').jtable('load', { nombre: null });
        });
    </script>
</asp:Content>
