<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoriasProductos.aspx.cs" Inherits="AppDevs.TPV.Admin.CategoriasProductos" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>Categorías de Productos</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Categorías de Productos</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtCategoriasProductos"></div>
    </div>
    <div id="dBuscarCategoriaProducto" title="Buscar" class="ui-dialog">
        <div class="form-group">
            <label>Categoria</label>
            <input type="text" class="form-control" id="txtBuscarCategoriaProducto" />
        </div>
        <div class="form-group">
            <label>Categoría Padre</label>
            <select id="cbBuscarCategoriaPadreProducto" class="form-control">
                <option value="-1">Todas</option>
            </select>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            CargarCategoriaPadre();

            $('#jtCategoriasProductos').jtable({
                title: 'Listado de Categorías de Productos',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Categorías Agregadas',
                    editRecord: 'Editar Categoría'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'CategoriasProductos.aspx/Listar_Categorias_Productos',
                    createAction: 'CategoriasProductos.aspx/Agregar_Categorias_Productos',
                    updateAction: 'CategoriasProductos.aspx/Modificar_Categorias_Productos'
                },
                fields: {
                    Codigo_Categoria_Producto:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Categoria_Producto:
                    {
                        title: 'Categoría'
                    },
                    Codigo_Categoria_Padre_Producto:
                    {
                        title: 'Categoría Padre',
                        options: function (data) {
                            if (data.source == 'edit')
                                return 'CategoriasProductos.aspx/listado_Categorias_Productos_Combo?Codigo_Categoria_Producto=' + data.record.Codigo_Categoria_Producto;
                            else
                                return 'CategoriasProductos.aspx/listado_Categorias_Productos_Combo?Codigo_Categoria_Producto=0';
                        }
                    },
                    Orden:
                    {
                        title: "Orden",
                        defaultValue: 99
                    }
                },
                formCreated: function () {
                    $('#Edit-Categoria_Producto').addClass('validate[required]');
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
                                 $("#dBuscarCategoriaProducto").dialog({
                                     resizable: false,
                                     modal: true,
                                     buttons: {
                                         Cancelar: function () {
                                             //-- Limpiar
                                             $("#txtBuscarCategoriaProducto").val('');
                                             $("#cbBuscarCategoriaPadreProducto").val();
                                             //-- Buscar todas
                                             $('#jtCategoriasProductos').jtable('load', { nombre: '', categoria: '' });
                                             $(this).dialog("close");
                                         },
                                         Buscar: function () {
                                             $('#jtCategoriasProductos').jtable('load', {
                                                 nombre: $("#txtBuscarCategoriaProducto").val(),
                                                 categoria: $("#cbBuscarCategoriaPadreProducto").val()
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

            $('#jtCategoriasProductos').jtable('load', { nombre: null, categoria: -1 });
        });

        function CargarCategoriaPadre() {
            CargarDropDown('/Admin/CategoriasProductos.aspx/listado_Categorias_Productos_Combo?',
                'cbBuscarCategoriaPadreProducto', { Codigo_Categoria_Producto: 0 });
        }
    </script>
</asp:Content>
