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
    public partial class MetodosPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Config)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object Listar_MetodosPago(int jtStartIndex, int jtPageSize, String nombre)
        {
            TPVDBEntities DB = null;
            try
            {
                int total = 0;
                DB = new TPVDBEntities();

                var Resultado = DB.Metodos_Pago.Where(w => w.Metodo_Pago.Contains(nombre) || string.IsNullOrEmpty(nombre))
                    .Select(s => new
                    {
                        s.Codigo_Metodo_Pago,
                        s.Metodo_Pago,
                        s.Activo
                    }).ToList();
                total = Resultado.Count();

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de areas." };
            }
            finally
            {
                DB = null;
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_MetodoPago(Metodos_Pago record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    record.Activo = true;
                    DB.Metodos_Pago.Add(record);
                    DB.SaveChanges();
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el area." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_MetodoPago(Metodos_Pago record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.Metodos_Pago.Attach(record);
                    var entry = DB.Entry(record);
                    entry.Property(p => p.Metodo_Pago).IsModified = true;
                    DB.SaveChanges();
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el area." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object listado_MetodoPago_Combo()
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.Metodos_Pago.Where(w => w.Activo)
                        .Select(c => new
                        {
                            DisplayText = c.Metodo_Pago,
                            Value = c.Codigo_Metodo_Pago
                        }).OrderBy(o => o.DisplayText).ToList();

                    //--
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de Métodos de pago. Contacte su administrador." };
            }
        }
    }
}