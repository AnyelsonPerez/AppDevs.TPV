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
    public partial class Perfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Config)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        #region Perfiles
        [WebMethod(EnableSession = true)]
        public static object Listar_Perfiles(int jtStartIndex, int jtPageSize, String nombre)
        {
            try
            {
                int total = 0;

                List<SPC_GET_PERFIL_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_PERFIL(
                        null,
                        nombre,
                        true).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de perfiles." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Perfiles(SPC_GET_PERFIL_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PERFIL(
                        null,
                        record.Perfil,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el perfil." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Perfiles(SPC_GET_PERFIL_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_GET_PERFIL(
                       record.Codigo_Perfil,
                       record.Perfil,
                       true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el perfil." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object listado_Perfiles_Combo(int Codigo_Perfil)
        {
            try
            {
                var DefaultItem = new { DisplayText = "[-Sin Perfil-]", Value = 0 };
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_PERFIL(Codigo_Perfil, null, true).ToList()
                        .Select(c => new
                    {
                        DisplayText = c.Perfil,
                        Value = c.Codigo_Perfil
                    }).OrderBy(o => o.DisplayText).ToList();

                    //--
                    Resultado.Insert(0, DefaultItem);
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de perfiles. Contacte su administrador." };
            }
        }
        #endregion

        #region Permisos Perfiles
        [WebMethod(EnableSession = true)]
        public static object Listar_Permisos_Perfil(int Codigo_Perfil)
        {
            try
            {

                List<SPC_GET_PERMISOSPERFILES_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_PERMISOSPERFILES(
                        null,
                        Codigo_Perfil,
                        null).ToList();
                }

                return new { Result = "OK", Records = Resultado };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de permisos de perfiles." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Permisos_Perfil(SPC_GET_PERMISOSPERFILES_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PERMISOSPERFILES(
                        null,
                        record.Codigo_Perfil,
                        record.Codigo_Permiso,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el permiso de perfil." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Permisos_Perfil(SPC_GET_PERMISOSPERFILES_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PERMISOSPERFILES(
                        record.Codigo_Perfil_Permiso,
                        record.Codigo_Perfil,
                        record.Codigo_Permiso,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el permiso de perfil." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Eliminar_Permisos_Perfil(int Codigo_Perfil_Permiso)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PERMISOSPERFILES(
                        Codigo_Perfil_Permiso,
                        null, null, false);
                }
                return new { Result = "OK" };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de eliminar el permiso de perfil." };
            }
        }
        #endregion

        #region Permisos
        [WebMethod(EnableSession = true)]
        public static object listado_Permisos_Combo()
        {
            try
            {
                //var DefaultItem = new { DisplayText = "[-Sin Permiso-]", Value = 0 };
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_PERMISO(null, null, true).ToList()
                        .Select(c => new
                        {
                            DisplayText = c.Permiso,
                            Value = c.Codigo_Permiso
                        }).OrderBy(o => o.DisplayText).ToList();

                    //--
                    //Resultado.Insert(0, DefaultItem);
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de permisos. Contacte su administrador." };
            }
        }
        #endregion
    }
}