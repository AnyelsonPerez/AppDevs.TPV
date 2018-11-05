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
    public partial class Areas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Config)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object Listar_Areas(int jtStartIndex, int jtPageSize, String nombre)
        {
            try
            {
                int total = 0;

                List<SPC_GET_AREA_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_AREA(null, nombre, null, true).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de areas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Areas(SPC_GET_AREA_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_AREA(
                        null,
                        record.Area,
                        record.Color_Area,
                        record.Orden,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el area." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Areas(SPC_GET_AREA_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_AREA(
                        record.Codigo_Area,
                        record.Area,
                        record.Color_Area,
                        record.Orden,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el area." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object listado_Areas_Combo()
        {
            try
            {
                //var DefaultItem = new { DisplayText = "[-Sin Categoría Padre-]", Value = 0 };
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_AREA(null, null, null, true).ToList()
                        .Select(c => new
                    {
                        DisplayText = c.Area,
                        Value = c.Codigo_Area
                    }).OrderBy(o => o.DisplayText).ToList();

                    //--
                    //Resultado.Insert(0, DefaultItem);
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de areas. Contacte su administrador." };
            }
        }
    }
}