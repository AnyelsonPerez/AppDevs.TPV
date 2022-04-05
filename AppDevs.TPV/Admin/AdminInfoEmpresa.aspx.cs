using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;

namespace AppDevs.TPV.Admin
{
    public partial class AdminInfoEmpresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().InfEmpresa)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod]
        public static bool GuardarInfoEmpresa(SPC_GET_INFORMACIONEMPRESA_Result info)
        {
            bool resultado = false;

            using (var DB = new TPVDBEntities())
            {
                DB.SPC_SET_INFORMACIONEMPRESA(
                    info.NombreEmpresa, info.Direccion, info.CodigoPostal, info.Provincia, info.Ciudad, info.Pais,
                    info.CIF, info.NIF, info.Telefono, info.Movil, info.Facebook, info.NombreImpresoraBarra,
                    info.NombreImpresoraCocina, info.PorcientoIVA, info.TipoLetraBarra, info.TipoLetraCocina,
                    null, null, info.PlantillaPedidoBarra, info.PlantillaPedidoCocina,
                    info.PlantillaAnulacionBarra, info.PlantillaCuenta);

                resultado = true;
            }

            return resultado;
        }

        [WebMethod]
        public static SPC_GET_INFORMACIONEMPRESA_Result GetInfoEmpresa()
        {
            SPC_GET_INFORMACIONEMPRESA_Result info = null;
            using (var DB = new TPVDBEntities())
            {
                info = DB.SPC_GET_INFORMACIONEMPRESA().FirstOrDefault();
            }

            return info;
        }
    }
}