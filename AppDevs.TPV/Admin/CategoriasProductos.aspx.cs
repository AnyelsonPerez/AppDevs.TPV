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
    public partial class CategoriasProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Admin)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object Listar_Categorias_Productos(int jtStartIndex, int jtPageSize, String nombre, int? categoria)
        {
            try
            {
                int total = 0;

                List<SPC_GET_CATEGORIA_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_CATEGORIA(
                        null,
                        categoria != -1 ? categoria : null,
                        nombre,
                        true).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de categorias de producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Categorias_Productos(SPC_GET_CATEGORIA_Result record)
        {
            try
            {
                int? codigo_categoria_padre = null;
                if (record.Codigo_Categoria_Padre_Producto != 0)
                    codigo_categoria_padre = record.Codigo_Categoria_Padre_Producto;

                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_CATEGORIA(
                        null,
                        codigo_categoria_padre,
                        record.Categoria_Producto,
                        record.Orden,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar la categoría." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Categorias_Productos(SPC_GET_CATEGORIA_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    int? codigo_categoria_padre = null;
                    if (record.Codigo_Categoria_Padre_Producto != 0)
                        codigo_categoria_padre = record.Codigo_Categoria_Padre_Producto;

                    DB.SPC_SET_CATEGORIA(
                        record.Codigo_Categoria_Producto,
                        codigo_categoria_padre,
                        record.Categoria_Producto,
                        record.Orden,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar la categoría." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object listado_Categorias_Productos_Combo(int Codigo_Categoria_Producto)
        {
            try
            {
                var DefaultItem = new { DisplayText = "[-Sin Categoría Padre-]", Value = 0 };
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_CATEGORIA(null, null, null, true).ToList()
                        .Where(w => w.Codigo_Categoria_Producto != Codigo_Categoria_Producto)
                        .Select(c => new
                    {
                        DisplayText = c.Categoria_Producto,
                        Value = c.Codigo_Categoria_Producto
                    }).OrderBy(o => o.DisplayText).ToList();

                    //--
                    Resultado.Insert(0, DefaultItem);
                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de categorias. Contacte su administrador." };
            }
        }
    }
}