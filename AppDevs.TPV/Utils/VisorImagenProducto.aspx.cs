using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDevs.TPV.Utils
{
    public partial class VisorImagenProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Parametro = Request["CodigoProducto"];
            if (Parametro == null) return;
            int CodigoProducto = 0;
            if (!int.TryParse(Parametro, out CodigoProducto)) return;
            
            using (var DB = new TPVDBEntities())
            {
                var Producto = DB.SPC_GET_PRODUCTO(CodigoProducto, null, null , null, null, null).FirstOrDefault();
                if (Producto == null || Producto.ImagenProducto == null) return;

                Response.ContentType = "image/png";
                Response.AddHeader("Cache-Control", "private,must-revalidate,post-check=1,pre-check=2,no-cache");
                Response.AppendHeader("content-disposition", "in-line; filename=\"" + Producto.NombreProducto + ".gif\"");
                Response.BinaryWrite(Producto.ImagenProducto);
            }
            
        }
    }
}