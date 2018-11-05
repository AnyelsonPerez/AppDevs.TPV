<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="AppDevs.TPV.Admin.Productos" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>Productos</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Mantenimiento de Productos</h1>
        </div>
    </div>
    <div class="row">
        <div id="jtProductos"></div>
    </div>
    <div id="dBuscarProducto" class="ui-dialog" title="Buscar">
        <div class="form-group">
            <label>Producto</label>
            <input type="text" class="form-control" id="txtBuscarProducto" />
        </div>
        <div class="form-group">
            <label>Categoría</label>
            <select id="cbBuscarCategoriaProducto" class="form-control">
                <option value="-1">Todas</option>
            </select>
        </div>
    </div>

    <div id="dFotografia" title="Imagen de producto">
        <div class="text-center">
            <img id="imgFotoNuevo" style="height: 166px;" data-codigoproducto="0" onerror="this.src='/content/SinImagen.png';" src="#" />
        </div>
        <asp:FileUpload runat="server" ID="FileFoto" CssClass="FileFoto" onchange="UploadFile(this);" />
        <asp:HiddenField runat="server" ID="codigoProducto" Value="0" />
        <asp:Button runat="server" ID="btnGuardarImagen" CssClass="btnGuardarImagen" OnClick="btnGuardarImagen_Click" Text="Q" CommandArgument="2" />
    </div>

    <style>
        #dFotografia,
        .btnGuardarImagen
        {
            display: none;
        }

        .FileFoto
        {
            width: 250px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            CargarCategoriaPadre();

            $('#jtProductos').jtable({
                title: 'Listado de Productos',
                paging: true,
                useBootstrap: true,
                pageSize: 10,
                addDialogWidth: '750',
                messages: {
                    noDataAvailable: 'No hay Productos Agregados',
                    editRecord: 'Editar Producto'
                },
                columnSelectable: false,
                editDialogWidth: '750',
                actions: {
                    listAction: 'Productos.aspx/Listar_Productos',
                    createAction: 'Productos.aspx/Agregar_Productos',
                    updateAction: 'Productos.aspx/Modificar_Productos',
                    deleteAction: 'Productos.aspx/Eliminar_Productos'
                },
                fields: {
                    Codigo_Producto:
                    {
                        title: 'Id',
                        key: true,
                        list: false,
                        create: false,
                        edit: false,
                        width: '1%'
                    },
                    Variantes: {
                        title: '',
                        width: '1%',
                        sorting: false,
                        edit: false,
                        create: false,
                        display: function (datos) {
                            var $img = $('<i class="fa fa-align-center fa-2x" aria-hidden="true" style="cursor:pointer" title="Unidades de Medidas"></i>');

                            $img.click(function () {
                                if ($img.Abierto == 1) {
                                    $('#jtProductos').jtable('closeChildTable', $img.closest('tr'));
                                    $img.Abierto = 0;
                                }
                                else {
                                    $('#jtProductos').jtable('openChildTable',
                                        $img.closest('tr'),
                                        {
                                            title: 'Unidades de medida para: ' + datos.record.NombreProducto,
                                            openChildAsAccordion: true,
                                            actions: {
                                                listAction: '/Admin/Productos.aspx/Listar_Productos_Unidades_Medidas?CodigoProducto=' + datos.record.Codigo_Producto,
                                                createAction: '/Admin/Productos.aspx/Agregar_Productos_Unidades_Medidas',
                                                updateAction: '/Admin/Productos.aspx/Modificar_Productos_Unidades_Medidas',
                                                deleteAction: '/Admin/Productos.aspx/Eliminar_Productos_Unidades_Medidas'
                                            },
                                            fields: {
                                                Codigo_Producto_Unidad_Medida: {
                                                    title: 'Codigo_Producto_Unidad_Medida',
                                                    key: true,
                                                    list: false,
                                                    create: false,
                                                    edit: false
                                                },
                                                Codigo_Producto: {
                                                    type: 'hidden',
                                                    defaultValue: datos.record.Codigo_Producto
                                                },
                                                Codigo_Unidad_Medida:
                                                {
                                                    title: 'Unidad de Medida',
                                                    edit: true,
                                                    list: true,
                                                    create: true,
                                                    options: '/Admin/UnidadesMedidas.aspx/listado_Unidades_Medidas_Combo'
                                                },
                                                Precio_Venta:
                                                {
                                                    title: 'Precio',
                                                    edit: true,
                                                    list: true,
                                                    create: true
                                                }
                                            },
                                            formCreated: function (event, data) {
                                                $('#Edit-Precio_Venta').addClass('validate[required]');
                                                $('#Edit-Precio_Venta').numeric({ negative: false, decimalPlaces: 2 });
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
                    NombreProducto:
                    {
                        title: 'Producto',
                        list: true,
                        create: true,
                        edit: true
                    },
                    Codigo_Categoria_Producto:
                    {
                        title: 'Categoría',
                        edit: true,
                        list: true,
                        create: true,
                        options: 'CategoriasProductos.aspx/listado_Categorias_Productos_Combo?Codigo_Categoria_Producto=0'
                    },
                    PrecioVenta:
                    {
                        title: 'Precio',
                        edit: true,
                        list: true,
                        create: true
                    },
                    AceptaExtra:
                    {
                        title: 'Acepta Extras',
                        edit: true,
                        list: true,
                        create: true,
                        type: 'checkbox',
                        values: { false: 'No acepta extra.', true: 'Acepta extra.' }
                    },
                    Codigo_Tipo_Producto:
                    {
                        title: 'Tipo',
                        edit: true,
                        list: true,
                        create: true,
                        options: 'Productos.aspx/Listar_Tipos_Productos?CodigoTipoProducto=0',
                        defaultValue: 1
                    },
                    PrecioComoExtra:
                    {
                        title: 'Precio Como Extra',
                        edit: true,
                        list: true,
                        create: true,
                        defaultValue: 0,
                        input: function (data) {
                            if (data.record) {
                                return '<input type="number" name="PrecioComoExtra" value="' + data.record.PrecioComoExtra + '"/><p>El precio se sumará al producto principal</>';
                            } else {
                                return '<input type="number" name="PrecioComoExtra" value="0"/><p>El precio se sumará al producto principal</>';
                            }
                        }
                    },
                    Impresora: {
                        title: 'Impresora',
                        edit: true,
                        list: true,
                        create: true,
                        defaultValue: false,
                        options: 'Productos.aspx/Listar_Impresoras',
                    },
                    OrdenProducto:
                    {
                        title: 'Orden',
                        edit: true,
                        list: true,
                        create: true,
                        defaultValue: 99,
                        input: function (data) {
                            if (data.record) {
                                return '<input type="text" name="OrdenProducto" value="' + data.record.OrdenProducto + '" />';
                            } else {
                                return '<input type="text" name="OrdenProducto" value="0"/><p>Orden en aparecerá en los pedidos</p>';
                            }
                        }
                    },
                    ImagenProducto: {
                        title: '',
                        width: '1%',
                        sorting: false,
                        edit: false,
                        create: false,
                        display: function (datos) {
                            var $img = $('<i class="fa fa-camera fa-2x" aria-hidden="true" style="color: #337ab7; cursor:pointer" title="Ver imágen"></i>');
                            $img.click(function () {
                                $("#dFotografia").dialog({
                                    resizable: false,
                                    modal: true,
                                    buttons: {
                                        Cancelar: function () {
                                            $(this).dialog("close");
                                        },
                                        Guardar: function () {
                                            $('#<%=FileFoto.ClientID %>').appendTo("#form1");
                                        $('#<%=btnGuardarImagen.ClientID %>').appendTo("#form1");
                                        document.getElementById('<%=btnGuardarImagen.ClientID %>').click();

                                        $(this).dialog("close");
                                    }
                                }
                            });
                            //-- Mostrar imagen actual
                            $("#imgFotoNuevo")[0].src = "/Utils/VisorImagenProducto.aspx?codigoproducto=" + datos.record.Codigo_Producto;

                            //-- Guardar del lado del Servidor el Codigo del producto
                            $.ajax({
                                type: "POST",
                                url: 'Productos.aspx/GuardarCodigoProducto',
                                data: JSON.stringify({ CodigoProducto: datos.record.Codigo_Producto }),
                                contentType: "application/json; charset=utf-8",
                                dataType: "json"
                            });
                        });
                        return $img;
                    }
                }
            },
            formCreated: function () {
                $('#Edit-NombreProducto').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                $('#Edit-Codigo_Categoria_Producto').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                $('#Edit-PrecioVenta').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');

                function VerificarSiProductoEsExtra(tipo) {
                    var esExtra = (tipo.value == 2 || tipo.value == 3);
                    if (esExtra) {
                        $('#Edit-PrecioComoExtra').addClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                    }
                    else {
                        $('#Edit-PrecioComoExtra').removeClass('validate[required]').attr('data-prompt-position', 'bottomLeft').data('promptPosition', 'bottomLeft');
                    }
                    $('#Edit-PrecioComoExtra').prop('disabled', !esExtra);
                }

                //-- Agregar al change de tipo producto
                $('#Edit-Codigo_Tipo_Producto').change(function () {
                    VerificarSiProductoEsExtra(this);
                });

                //-- Verificar
                VerificarSiProductoEsExtra($('#Edit-Codigo_Tipo_Producto')[0]);

                //-- Solo permitir datos decimales
                $('#Edit-PrecioVenta').numeric({ /*decimal : ",",*/ negative: false, decimalPlaces: 2 });
                $('#Edit-PrecioComoExtra').numeric({ negative: false, decimalPlaces: 2 });
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
                             $("#dBuscarProducto").dialog({
                                 resizable: false,
                                 modal: true,
                                 buttons: {
                                     Cancelar: function () {
                                         //-- Limpiar
                                         $("#txtBuscarProducto").val('');
                                         $("#cbBuscarCategoriaProducto").val();
                                         //-- Buscar todas
                                         $('#jtProductos').jtable('load', { nombre: '', categoria: '' });
                                         $(this).dialog("close");
                                     },
                                     Buscar: function () {
                                         $('#jtProductos').jtable('load', {
                                             nombre: $("#txtBuscarProducto").val(),
                                             categoria: $("#cbBuscarCategoriaProducto").val()
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

            $('#jtProductos').jtable('load', { nombre: null, categoria: -1 });

            $('#btnBuscar').click(function () {
                $('#jtProductos').jtable('load', {
                    nombre: $("#txtBuscarCategoriaProducto").val(),
                    categoria: $("#cbBuscarCategoriaPadreProducto").val()
                });
            });
        });

        function CargarCategoriaPadre() {
            CargarDropDown('/Admin/CategoriasProductos.aspx/listado_Categorias_Productos_Combo?',
                'cbBuscarCategoriaProducto', { Codigo_Categoria_Producto: 0 });
        }

        function UploadFile(fileUpload) {
            var preview = document.querySelector('#imgFotoNuevo');
            var file = document.querySelector('#<%=FileFoto.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
            //previewFile();
        }
    </script>
</asp:Content>
