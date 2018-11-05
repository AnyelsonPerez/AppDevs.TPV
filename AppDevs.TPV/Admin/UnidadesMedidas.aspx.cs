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
    public partial class UnidadesMedidas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Admin)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object Listar_Unidades_Medidas(int jtStartIndex, int jtPageSize, String nombre)
        {
            try
            {
                int total = 0;
                
                List<SPC_GET_UNIDADESMEDIDAS_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_UNIDADESMEDIDAS(
                        null, 
                        nombre, 
                        null, 
                        true).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de unidades de medidas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Unidades_Medidas(SPC_GET_UNIDADESMEDIDAS_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_UNIDADESMEDIDAS(
                        null,
                        record.Unidad_Medida,
                        record.Abreviatura,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar la unidad de medida." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Unidades_Medidas(SPC_GET_UNIDADESMEDIDAS_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_UNIDADESMEDIDAS(
                        record.Codigo_Unidad_Medida,
                        record.Unidad_Medida,
                        record.Abreviatura,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar la unidad de medida." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object listado_Unidades_Medidas_Combo()
        {
            try
            {
                //var DefaultItem = new { DisplayText = "[-Sin Categoría Padre-]", Value = 0 };
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_UNIDADESMEDIDAS(null, null, null, true).ToList()
                        .Select(c => new
                    {
                        DisplayText = c.Unidad_Medida,
                        Value = c.Codigo_Unidad_Medida
                    }).OrderBy(o=> o.DisplayText).ToList();

                    //--
                    //Resultado.Insert(0, DefaultItem);
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de unidades de medidas. Contacte su administrador." };
            }
        }
    }
}