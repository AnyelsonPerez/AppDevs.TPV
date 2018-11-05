<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInfoEmpresa.aspx.cs" Inherits="AppDevs.TPV.Admin.AdminInfoEmpresa" MasterPageFile="~/Admin/TPV.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>AppDevs.TPV - Panel de Administración</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Información de la empresa</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->

    <div class="row">
        <div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
            <label for="NombreEmpresa" class="control-label">Nombre de Empresa</label>
            <input id="NombreEmpresa" name="NombreEmpresa" type="text" required="required" autofocus="autofocus"
                class="form-control input-lg" placeholder="Nombre de empresa" />
        </div>
        <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-2">
            <label for="PorcientoIVA" class="control-label">IVA</label>
            <input id="PorcientoIVA" name="PorcientoIVA" type="text" required="required"
                class="form-control input-lg" placeholder="Porciento IVA" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="NIF" class="control-label">N.I.F.</label>
            <input id="NIF" name="NIF" type="text" class="form-control input-lg" placeholder="N.I.F." />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="CIF" class="control-label">C.I.F.</label>
            <input id="CIF" name="CIF" type="text" class="form-control input-lg" placeholder="C.I.F." />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <label for="Direccion" class="control-label">Dirección</label>
            <input id="Direccion" name="Direccion" type="text" required="required" autofocus="autofocus"
                class="form-control input-lg" placeholder="Dirección" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="CodigoPostal" class="control-label">Código Postal</label>
            <input id="CodigoPostal" name="CodigoPostal" type="text" class="form-control input-lg" placeholder="Código Postal" />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="Provincia" class="control-label">Provincia</label>
            <input id="Provincia" name="Provincia" type="text" class="form-control input-lg" placeholder="Provincia" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="Ciudad" class="control-label">Ciudad</label>
            <input id="Ciudad" name="Ciudad" type="text" class="form-control input-lg" placeholder="Ciudad" />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="Pais" class="control-label">País</label>
            <input id="Pais" name="Pais" type="text" class="form-control input-lg" placeholder="País" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <label for="Telefono" class="control-label">Teléfono</label>
            <input id="Telefono" name="Telefono" type="text" class="form-control input-lg" placeholder="Teléfono" />
        </div>
        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <label for="Movil" class="control-label">Móvil</label>
            <input id="Movil" name="Movil" type="text" class="form-control input-lg" placeholder="Móvil" />
        </div>
        <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <label for="Facebook" class="control-label">Facebook</label>
            <input id="Facebook" name="Facebook" type="text" class="form-control input-lg" placeholder="Facebook" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="ImpresoraBarra" class="control-label">Impresora de Barra</label>
            <select class="form-control input-lg" id="ImpresoraBarra"></select>
        </div>
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="ImpresoraCocina" class="control-label">Impresora de Cocina</label>
            <select class="form-control input-lg" id="ImpresoraCocina"></select>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="TipoLetraBarra" class="control-label">Letra Impresora Barra</label>
            <input id="TipoLetraBarra" name="TipoLetraBarra" type="text" class="form-control input-lg" placeholder="Tipo de letras impresora de barra" />
        </div>
        <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
            <label for="TipoLetraCocina" class="control-label">Letra Impresora Cocina</label>
            <input id="TipoLetraCocina" name="TipoLetraCocina" type="text" class="form-control input-lg" placeholder="Tipo de letras impresora de cocina" />
        </div>
    </div>
    <div class="row text-right">
        <input type="button" id="btnGuardarInfoEmpresa" class="btn btn-primary btn-lg" value="Guardar Cambios" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            CargarDropDown("/Utils/Utilidades.asmx/GetPrinters", "ImpresoraBarra");
            CargarDropDown("/Utils/Utilidades.asmx/GetPrinters", "ImpresoraCocina");

            $.ajax({
                type: "POST",
                url: 'AdminInfoEmpresa.aspx/GetInfoEmpresa',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (!!data && !!data.d) {
                        var info = data.d;
                        $('#NombreEmpresa').val(info.NombreEmpresa);
                        $('#Direccion').val(info.Direccion);
                        $('#CodigoPostal').val(info.CodigoPostal);
                        $('#Provincia').val(info.Provincia);
                        $('#Ciudad').val(info.Ciudad);
                        $('#Pais').val(info.Pais);
                        $('#CIF').val(info.CIF);
                        $('#NIF').val(info.NIF);
                        $('#Telefono').val(info.Telefono);
                        $('#Movil').val(info.Movil);
                        $('#Facebook').val(info.Facebook);
                        $('#ImpresoraBarra').val(info.NombreImpresoraBarra);
                        $('#ImpresoraCocina').val(info.NombreImpresoraCocina);
                        $('#PorcientoIVA').val(info.PorcientoIVA);
                        $('#TipoLetraBarra').val(info.TipoLetraBarra);
                        $('#TipoLetraCocina').val(info.TipoLetraCocina);
                    }
                }
            });

            $("#btnGuardarInfoEmpresa").click(function (e) {
                e.preventDefault();
                
                var InfoEmpresa = {
                    NombreEmpresa: $('#NombreEmpresa').val(),
                    Direccion: $('#Direccion').val(),
                    CodigoPostal: $('#CodigoPostal').val(),
                    Provincia: $('#Provincia').val(),
                    Ciudad: $('#Ciudad').val(),
                    Pais: $('#Pais').val(),
                    CIF: $('#CIF').val(),
                    NIF: $('#NIF').val(),
                    Telefono: $('#Telefono').val(),
                    Movil: $('#Movil').val(),
                    Facebook: $('#Facebook').val(),
                    NombreImpresoraBarra: $('#ImpresoraBarra').val(),
                    NombreImpresoraCocina: $('#ImpresoraCocina').val(),
                    PorcientoIVA: $('#PorcientoIVA').val(),
                    TipoLetraBarra: $('#TipoLetraBarra').val(),
                    TipoLetraCocina: $('#TipoLetraCocina').val()
                };

                $.ajax({
                    type: "POST",
                    url: 'AdminInfoEmpresa.aspx/GuardarInfoEmpresa',
                    data: JSON.stringify({ info: InfoEmpresa }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        MostrarMensaje("Proceso completado", "Información de empresa guardada correctamente");
                    }
                });
            });
        });
    </script>
</asp:Content>
