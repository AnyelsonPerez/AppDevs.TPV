using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;

namespace AppDevs.TPV.Admin
{
    public partial class Mesas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Config)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object GetAreas()
        {
            try
            {
                List<SPC_GET_AREA_Result> Areas = null;
                using (var DB = new TPVDBEntities())
                {
                    Areas = DB.SPC_GET_AREA(null, null, null, true).ToList();
                }
                return new { Result = "OK", Records = Areas };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de areas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GuardarMesas(List<SPC_GET_MESA_Result> mesas)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var codigoArea = mesas[0].Codigo_Area;
                    //-- Traer todas las mesas del area
                    var mesasDB = DB.SPC_GET_MESA(null, null, codigoArea, null, null, null, null, null, true).ToList();
                    
                    //-- Eliminar mesas
                    foreach (var mesaBD in mesasDB) {
                        if (mesas.Where(w => w.Codigo_Mesa == mesaBD.Codigo_Mesa).Count() == 0) {
                            DB.SPC_SET_MESA(mesaBD.Codigo_Mesa, null, null, null, null, null, null, null, false);
                        }
                    }

                    foreach (var mesa in mesas)
                    {
                        DB.SPC_SET_MESA(
                            mesa.Codigo_Mesa, 
                            mesa.Mesa, 
                            mesa.Codigo_Area, 
                            mesa.Color_Mesa, 
                            mesa.PosicionX, 
                            mesa.PosicionY, 
                            mesa.Base, 
                            mesa.Altura, 
                            true);
                    }

                    mesas = DB.SPC_GET_MESA(null, null, codigoArea, null, null, null, null, null, true).ToList();
                }
                return mesas;
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de guardar los cambios." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GuardarMesa(SPC_GET_MESA_Result mesa)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    int? Codigo_Mesa = null;

                    if (mesa.Codigo_Mesa > 0)
                    {
                        Codigo_Mesa = mesa.Codigo_Mesa;
                    }
                    DB.SPC_SET_MESA(Codigo_Mesa, mesa.Mesa, mesa.Codigo_Area, mesa.Color_Mesa, mesa.PosicionX, mesa.PosicionY, "1", "1", mesa.Activo);
                }
                return mesa;
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de guardar los cambios." };
            }
        }
    }
}