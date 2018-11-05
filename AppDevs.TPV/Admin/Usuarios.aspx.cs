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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Config)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object Listar_Usuarios(int jtStartIndex, int jtPageSize, String nombre)
        {
            try
            {
                int total = 0;

                List<SPC_GET_USUARIO_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_USUARIO(null, null, null, null, nombre, null, true).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de Usuarios." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Usuarios(SPC_GET_USUARIO_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_USUARIO(
                        null,
                        record.Codigo_Perfil,
                        record.Usuario,
                        record.Clave,
                        record.Nombre_Usuario,
                        record.Apellido_Usuario,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el Usuario." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Usuarios(SPC_GET_USUARIO_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_USUARIO(
                        record.Codigo_Usuario,
                        record.Codigo_Perfil,
                        record.Usuario,
                        record.Clave,
                        record.Nombre_Usuario,
                        record.Apellido_Usuario,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el Usuario." };
            }
        }
    }
}