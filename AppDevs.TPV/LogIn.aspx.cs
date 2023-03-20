using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;

namespace AppDevs.TPV
{
    public partial class LogIn : System.Web.UI.Page
    {
        private const string C_SV_USUARIO = "_Usuario";

        [WebMethod]
        public static bool Entrar(string _Usuario, string _Clave)
        {
            bool resultado = false;
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    //var Usuarios = DB.SPC_GET_USUARIO(null, null, _Usuario, _Clave, null, null, null).ToList();
                    var Usuario = DB.Usuarios.Where(w => w.Usuario == _Usuario && w.Clave == _Clave).FirstOrDefault();

                    if (Usuario != null)
                    {
                        resultado = true;

                        HttpContext.Current.Session.Add(C_SV_USUARIO, Usuario);
                        //FormsAuthentication.SetAuthCookie(usuario.Usuario,true);
                        //new Utilidades().CargarPermisos();
                        FormsAuthentication.RedirectFromLoginPage(_Usuario, false);
                    }
                }
            }
            catch (Exception ex)
            { throw new Exception(ex.Message); }

            return resultado;
        }

        [WebMethod]
        public static bool UsuarioInicial(string NombreEmpresa, string Direccion, string CodigoPostal, string Provincia,
            string Ciudad, string Pais, string CIF, string NIF, string Telefono, string Movil, string Facebook, string NombreImpresoraBarra,
            string NombreImpresoraCocina, string PorcientoIVA, string TipoLetraBarra, string TipoLetraCocina, string TamanoLetraBarra,
            string TamanoLetraCocina, string PlantillaPedidoBarra, string PlantillaPedidoCocina, string PlantillaAnulacionBarra,
            string PlantillaCuenta, string _Usuario, string _Clave)
        {
            bool resultado = false;
            try
            {
                decimal.TryParse(PorcientoIVA, out decimal _IVA);
                decimal.TryParse(TamanoLetraBarra, out decimal _TamanoLetraBarra);
                decimal.TryParse(TamanoLetraCocina, out decimal _TamanoLetraCocina);

                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_INFORMACIONEMPRESA(NombreEmpresa, Direccion, CodigoPostal, Provincia, Ciudad, Pais,
                        CIF, NIF, Telefono, Movil, Facebook, NombreImpresoraBarra, NombreImpresoraCocina, 0,
                        TipoLetraBarra, TipoLetraCocina, _TamanoLetraBarra, _TamanoLetraCocina, PlantillaPedidoBarra,
                        PlantillaPedidoCocina, PlantillaAnulacionBarra, PlantillaCuenta);

                    DB.SPC_SET_USUARIO(null, 1, _Usuario, _Clave, null, null, null);

                    var Usuarios = DB.SPC_GET_USUARIO(null, null, _Usuario, _Clave, null, null, null).ToList();
                    HttpContext.Current.Session.Add(C_SV_USUARIO, Usuarios.FirstOrDefault());
                    //Utilidades.CargarPermisos();
                    FormsAuthentication.RedirectFromLoginPage(_Usuario, false);

                    resultado = true;
                }
            }
            catch (Exception ex)
            { throw new Exception(ex.Message); }

            return resultado;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            using (var DB = new TPVDBEntities())
            {
                var InfoEmpresa = DB.SPC_GET_INFORMACIONEMPRESA().FirstOrDefault();
                if (InfoEmpresa == null)
                {
                    loginModal.Attributes.Add("class", "hide");
                    dInfoEmpresa.Attributes.Add("class", "show");

                    txtUsuario.Attributes.Remove("required");
                    txtClave.Attributes.Remove("required");
                }
                else
                {
                    loginModal.Attributes.Add("class", "show");
                    dInfoEmpresa.Attributes.Add("class", "hide");

                    NombreEmpresa.Attributes.Remove("required");
                    Direccion.Attributes.Remove("required");
                    PorcientoIVA.Attributes.Remove("required");
                    Usuario.Attributes.Remove("required");
                    Clave.Attributes.Remove("required");
                }
            }
        }

        //protected void btnLogIn_Click(object sender, EventArgs e)
        //{
        //    if (((System.Web.UI.WebControls.Button)sender).CommandArgument == "0")
        //    {
        //        if (txtUsuario.Value.Length > 2 && txtClave.Value.Length > 2 &&
        //            Entrar(txtUsuario.Value, txtClave.Value))
        //            FormsAuthentication.RedirectFromLoginPage(txtUsuario.Value, false);
        //        else
        //            lblMensaje.InnerText = "Datos incorrectos, verifique.";
        //    }
        //    else
        //    {
        //        if (Usuario.Value.Length > 2 && Clave.Value.Length > 2 &&
        //        UsuarioInicial(NombreEmpresa.Value, Direccion.Value, CodigoPostal.Value, Provincia.Value,
        //        Ciudad.Value, Pais.Value, CIF.Value, NIF.Value, Telefono.Value, Movil.Value, Facebook.Value,
        //        ImpresoraBarra.Value, ImpresoraCocina.Value, PorcientoIVA.Value, Usuario.Value, Clave.Value))
        //            FormsAuthentication.RedirectFromLoginPage(txtUsuario.Value, false);
        //        else
        //            lblMensajeRegistro.InnerText = "Datos incorrectos, verifique.";
        //    }
        //}
    }
}