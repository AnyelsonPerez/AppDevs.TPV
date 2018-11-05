<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Perfiles.aspx.cs" Inherits="AppDevs.TPV.Admin.Perfiles" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Perfiles de Usuario</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Perfiles de Usuario</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtPerfiles"></div>
    </div>
    <div id="dBuscarPerfiles" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Perfil</label>
            <input type="text" class="form-control" id="txtBuscarPerfil" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#jtPerfiles').jtable({
                title: 'Listado de Perfiles',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Perfiles Agregadas',
                    editRecord: 'Editar Perfil'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'Perfiles.aspx/Listar_Perfiles',
                    createAction: 'Perfiles.aspx/Agregar_Perfiles',
                    updateAction: 'Perfiles.aspx/Modificar_Perfiles'
                },
                fields: {
                    Codigo_Perfil:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Permisos: {
                        title: '',
                        width: '1%',
                        sorting: false,
                        edit: false,
                        create: false,
                        display: function (datos) {
                            var $img = $('<i class="fa fa-unlock-alt fa-2x" aria-hidden="true" style="cursor:pointer; color:#5cb85c" title="Permisos de Acceso"></i>');

                            $img.click(function () {
                                if ($img.Abierto == 1) {
                                    $('#jtPerfiles').jtable('closeChildTable', $img.closest('tr'));
                                    $img.Abierto = 0;
                                }
                                else {
                                    $('#jtPerfiles').jtable('openChildTable',
                                        $img.closest('tr'),
                                        {
                                            title: 'Permisos de acceso para perfil: ' + datos.record.Perfil,
                                            openChildAsAccordion: true,
                                            actions: {
                                                listAction: '/Admin/Perfiles.aspx/Listar_Permisos_Perfil?Codigo_Perfil=' + datos.record.Codigo_Perfil,
                                                createAction: '/Admin/Perfiles.aspx/Agregar_Permisos_Perfil',
                                                updateAction: '/Admin/Perfiles.aspx/Modificar_Permisos_Perfil',
                                                deleteAction: '/Admin/Perfiles.aspx/Eliminar_Permisos_Perfil'
                                            },
                                            fields: {
                                                Codigo_Perfil_Permiso: {
                                                    title: 'Codigo_Perfil_Permiso',
                                                    key: true,
                                                    list: false,
                                                    create: false,
                                                    edit: false
                                                },
                                                Codigo_Perfil: {
                                                    type: 'hidden',
                                                    defaultValue: datos.record.Codigo_Perfil
                                                },
                                                Codigo_Permiso:
                                                {
                                                    title: 'Permiso de acceso',
                                                    edit: true,
                                                    list: true,
                                                    create: true,
                                                    options: '/Admin/Perfiles.aspx/listado_Permisos_Combo'
                                                }
                                            },
                                            formCreated: function (event, data) {
                                                $('#Edit-Codigo_Permiso').addClass('validate[required]');
                                            },
                                            formSubmitting: function (event, data) {
                                                return data.form.validationEngine('validate');
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
                    Perfil:
                    {
                        title: 'Perfil',
                        list: true,
                        create: true,
                        edit: true
                    }
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
                                             $("#txtBuscarPerfil").val('');
                                             //-- Buscar todas
                                             $('#jtPerfiles').jtable('load', { nombre: '' });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtPerfiles').jtable('load', {
                                                 nombre: $("#txtBuscarPerfil").val()
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

            $('#jtPerfiles').jtable('load', { nombre: null });
        });
    </script>
</asp:Content>
