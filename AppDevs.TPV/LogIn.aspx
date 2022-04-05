<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="AppDevs.TPV.LogIn" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
    <title>App-Devs.TPV</title>
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="shortcut icon" type="image/png" href="../Content/TPV.png" />
    <script src="Scripts/jquery.bootstrap.wizard.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.js"></script>
    <script runat="server">
        public void Logon_Click(object sender, EventArgs e)
        {

            if (((System.Web.UI.WebControls.Button)sender).CommandArgument == "0")
            {
                if (txtUsuario.Value.Length > 2 && txtClave.Value.Length > 2 &&
                    Entrar(txtUsuario.Value, txtClave.Value))
                    FormsAuthentication.RedirectFromLoginPage(txtUsuario.Value, false);
                else
                    lblMensaje.InnerText = "Datos incorrectos, verifique.";
            }
            else
            {
                if (Usuario.Value.Length > 2 && Clave.Value.Length > 2 &&
                UsuarioInicial(NombreEmpresa.Value, Direccion.Value, CodigoPostal.Value, Provincia.Value,
                    Ciudad.Value, Pais.Value, CIF.Value, NIF.Value, Telefono.Value, Movil.Value, Facebook.Value,
                    ImpresoraBarra.Value, ImpresoraCocina.Value, PorcientoIVA.Value, "Consolas", "Consolas", "10", "10", null, null, null, null,
                    Usuario.Value, Clave.Value))
                    FormsAuthentication.RedirectFromLoginPage(txtUsuario.Value, false);
                else
                    lblMensajeRegistro.InnerText = "Datos incorrectos, verifique.";
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dInfoEmpresa').bootstrapWizard({
                onTabClick: function (tab, navigation, index) {
                    return validateTab(index);
                },
                onNext: function (tab, navigation, index) {
                    var numTabs = navigation.find('li').length;
                    var isValid = validateTab(index - 1);

                    return isValid;
                },
                onTabShow: function (tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index + 1;

                    // If it's the last tab then hide the last button and show the finish instead
                    if ($current >= $total) {
                        $('#dInfoEmpresa').find('.pager .next').hide();
                        $('#dInfoEmpresa').find('.pager .finish').show();
                        $('#dInfoEmpresa').find('.pager .finish').removeClass('disabled');
                    } else {
                        $('#dInfoEmpresa').find('.pager .next').show();
                        $('#dInfoEmpresa').find('.pager .finish').hide();
                    }
                }
            });
        });

        function validateTab(index) {
            var tab = $('#dInfoEmpresa').find('.tab-pane').eq(index);

            //-- Limpiar errores anteriores
            $(".has-error").removeClass("has-herror");
            var isValid = true;
            $("input", tab).each(function (index, input) {
                if (!!input.required && input.value == "") {
                    $("#" + input.id).closest(".form-group").addClass("has-error");
                    isValid = false;
                }
            });

            return isValid;
        }
    </script>
</head>
<body>
    <form id="Form1" class="form col-lg-12 col-md-12 col-sm-12 col-xs-12" runat="server">
        <div id="loginModal" runat="server" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="text-center">Inicio de sesión</h1>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input id="txtUsuario" runat="server" type="text" required="required" autofocus="autofocus" class="form-control input-lg" placeholder="Usuario" />
                        </div>
                        <div class="form-group">
                            <input id="txtClave" runat="server" type="password" required="required" class="form-control input-lg" placeholder="Clave" />
                            <h5 id="lblMensaje" runat="server" class="text-center text-danger"></h5>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogIn" runat="server" CssClass="btn btn-primary btn-lg btn-block" OnClick="Logon_Click" CommandArgument="0" Text="Entrar" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <h5 class="text-center">Sistema TPV desarrollado por Anyelson Pérez Pérez. App-Devs 2016</h5>
                    </div>
                </div>
            </div>
        </div>
        <div id="dInfoEmpresa" runat="server" class="modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="navbar">
                            <div class="navbar-inner">
                                <div class="container">
                                    <ul>
                                        <li><a href="#tab1" data-toggle="tab">Identificación</a></li>
                                        <li><a href="#tab2" data-toggle="tab">Dirección</a></li>
                                        <li><a href="#tab3" data-toggle="tab">Contacto</a></li>
                                        <li><a href="#tab4" data-toggle="tab">Impresoras</a></li>
                                        <li><a href="#tab5" data-toggle="tab">Usuario Administrador</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="tab-content">
                            <div class="tab-pane col-lg-12 col-md-12 col-sm-12 col-xs-12" id="tab1">
                                <div class="row">
                                    <div class="form-group col-lg-10 col-md-10 col-sm-10 col-xs-10">
                                        <label for="NombreEmpresa" class="control-label">Nombre de Empresa</label>
                                        <input id="NombreEmpresa" runat="server" name="NombreEmpresa" type="text" required="required" autofocus="autofocus"
                                            class="form-control input-lg" placeholder="Nombre de empresa" />
                                    </div>
                                    <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                        <label for="PorcientoIVA" class="control-label">% IVA</label>
                                        <input id="PorcientoIVA" runat="server" name="PorcientoIVA" type="text" required="required"
                                            class="form-control input-lg" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="NIF" class="control-label">N.I.F.</label>
                                        <input id="NIF" runat="server" name="NIF" type="text" class="form-control input-lg" placeholder="N.I.F." />
                                    </div>
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="CIF" class="control-label">C.I.F.</label>
                                        <input id="CIF" runat="server" name="CIF" type="text" class="form-control input-lg" placeholder="C.I.F." />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane col-lg-12 col-md-12 col-sm-12 col-xs-12" id="tab2">
                                <div class="row">
                                    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <label for="Direccion" class="control-label">Dirección</label>
                                        <input id="Direccion" runat="server" name="Direccion" type="text" required="required" autofocus="autofocus"
                                            class="form-control input-lg" placeholder="Dirección" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="CodigoPostal" class="control-label">Código Postal</label>
                                        <input id="CodigoPostal" runat="server" name="CodigoPostal" type="text" class="form-control input-lg" placeholder="Código Postal" />
                                    </div>
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="Provincia" class="control-label">Provincia</label>
                                        <input id="Provincia" runat="server" name="Provincia" type="text" class="form-control input-lg" placeholder="Provincia" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="Ciudad" class="control-label">Ciudad</label>
                                        <input id="Ciudad" runat="server" name="Ciudad" type="text" class="form-control input-lg" placeholder="Ciudad" />
                                    </div>
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="Pais" class="control-label">País</label>
                                        <input id="Pais" runat="server" name="Pais" type="text" class="form-control input-lg" placeholder="País" />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane col-lg-12 col-md-12 col-sm-12 col-xs-12" id="tab3">
                                <div class="row">
                                    <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <label for="Telefono" class="control-label">Teléfono</label>
                                        <input id="Telefono" runat="server" name="Telefono" type="text" class="form-control input-lg" placeholder="Teléfono" />
                                    </div>
                                    <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <label for="Movil" class="control-label">Móvil</label>
                                        <input id="Movil" runat="server" name="Movil" type="text" class="form-control input-lg" placeholder="Móvil" />
                                    </div>
                                    <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <label for="Facebook" class="control-label">Facebook</label>
                                        <input id="Facebook" runat="server" name="Facebook" type="text" class="form-control input-lg" placeholder="Facebook" />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane col-lg-12 col-md-12 col-sm-12 col-xs-12" id="tab4">
                                <div class="row">
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="ImpresoraBarra" class="control-label">Impresora de Barra</label>
                                        <input id="ImpresoraBarra" runat="server" name="ImpresoraBarra" type="text" class="form-control input-lg" placeholder="Impresora de Barra" value="Barra" />
                                    </div>
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="ImpresoraCocina" class="control-label">Impresora de Cocina</label>
                                        <input id="ImpresoraCocina" runat="server" name="ImpresoraCocina" type="text" class="form-control input-lg" placeholder="Impresora de Cocina" value="Cocina" />
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane col-lg-12 col-md-12 col-sm-12 col-xs-12" id="tab5">
                                <div class="row">
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="Usuario" class="control-label">Usuario</label>
                                        <input id="Usuario" runat="server" name="Usuario" type="text" required="required" class="form-control input-lg" placeholder="Usuario" />
                                    </div>
                                    <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <label for="Clave" class="control-label">Contraseña</label>
                                        <input id="Clave" runat="server" name="Clave" type="password" required="required" class="form-control input-lg" placeholder="Contraseña" />
                                    </div>
                                </div>
                                <div class="row">
                                    <h5 id="lblMensajeRegistro" runat="server" class="text-center text-danger"></h5>
                                </div>
                            </div>
                            <ul class="pager wizard">
                                <li class="previous"><a href="javascript:;">Anterior</a></li>
                                <li class="next"><a href="javascript:;">Siguiente</a></li>
                                <li class="next finish" style="display: none; text-align: right;" runat="server">
                                    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary btn-sm right" OnClick="Logon_Click" CommandArgument="1" Text="Finalizar" />
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <h5 class="text-center">Sistema TPV desarrollado por App-Devs 2016.</h5>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
