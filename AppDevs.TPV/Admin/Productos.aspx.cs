using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;

namespace AppDevs.TPV.Admin
{
    public partial class Productos : System.Web.UI.Page
    {
        static int _CodigoProducto = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!new Utilidades().Admin)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        #region Productos
        [WebMethod(EnableSession = true)]
        public static object Listar_Productos(int jtStartIndex, int jtPageSize, String nombre, int? categoria)
        {
            try
            {
                int total = 0;

                List<SPC_GET_PRODUCTO_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_PRODUCTO(
                        null,
                        categoria != -1 ? categoria : null,
                        nombre, null, null, true).OrderBy(o => o.NombreProducto).ToList();
                    total = Resultado.Count();
                }

                return new
                {
                    Result = "OK",
                    Records = Resultado.Select(s => new
                    {
                        s.Codigo_Producto,
                        s.Codigo_Categoria_Producto,
                        s.NombreProducto,
                        s.ImagenProducto,
                        s.PrecioVenta,
                        s.OrdenProducto,
                        s.Codigo_Tipo_Producto,
                        s.PrecioComoExtra,
                        s.AceptaExtra,
                        s.Impresora,
                        s.Activo,
                        NombreImpresora = s.Impresora
                    }).Skip(jtStartIndex).Take(jtPageSize),
                    TotalRecordCount = total
                };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de productos." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Productos(SPC_GET_PRODUCTO_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTO(
                        null,
                        record.Codigo_Categoria_Producto,
                        record.NombreProducto,
                        null,
                        record.PrecioVenta,
                        record.OrdenProducto,
                        record.Codigo_Tipo_Producto,
                        record.PrecioComoExtra,
                        record.AceptaExtra,
                        record.Impresora,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Productos(SPC_GET_PRODUCTO_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTO(
                        record.Codigo_Producto,
                        record.Codigo_Categoria_Producto,
                        record.NombreProducto,
                        null,
                        record.PrecioVenta,
                        record.OrdenProducto,
                        record.Codigo_Tipo_Producto,
                        record.PrecioComoExtra,
                        record.AceptaExtra,
                        record.Impresora,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Eliminar_Productos(int Codigo_Producto)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTO(
                        Codigo_Producto,
                        null, null, null, null, null, null, null, null, null,
                        false);
                }
                return new { Result = "OK" };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static void GuardarCodigoProducto(int CodigoProducto)
        {
            _CodigoProducto = CodigoProducto;
        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            try
            {
                if (_CodigoProducto > 0 && FileFoto.HasFile)
                {

                    int contentLength = FileFoto.PostedFile.ContentLength;
                    string contentType = FileFoto.PostedFile.ContentType;
                    string fileName = FileFoto.PostedFile.FileName;
                    byte[] pic = new byte[contentLength];

                    var image = System.Drawing.Image.FromStream(FileFoto.PostedFile.InputStream);
                    
                    var foto = new Bitmap(image.Width, image.Height);
                    var g = Graphics.FromImage(foto);
                    g.Clear(Color.White);
                    var destRect = new Rectangle(0, 0, foto.Width, foto.Height);
                    var srcRect = new Rectangle(0, 0, foto.Width, foto.Height);
                    g.DrawImage(image, destRect, srcRect, GraphicsUnit.Pixel);
                    
                    var MiniFoto = ResizeImage(foto, 86, 114);
                    var miniPic = imageToByteArray(MiniFoto);

                    using (var DB = new TPVDBEntities())
                    {
                        DB.SPC_SET_PRODUCTO(
                            _CodigoProducto, null, null,
                            miniPic, null, null, null, null, null, null, null);
                    }
                }
                //return new { Result = "OK", Record = record };
            }
            catch
            {
                //return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el producto." };
            }
        }

        public System.Drawing.Bitmap byteArrayToBitmap(byte[] byteArrayIn)
        {
            MemoryStream ms = new MemoryStream(byteArrayIn);
            Bitmap returnImage = new Bitmap(ms);
            returnImage = CropUnwantedBackground(returnImage);

            return returnImage;
        }

        public static Bitmap ResizeImage(System.Drawing.Bitmap image, int width, int height)
        {
            if (image.Width > image.Height)
                height /= (image.Width / image.Height);
            else
                width /= (image.Height / image.Width);

            var destRect = new Rectangle(0, 0, width, height);
            var destImage = new Bitmap(width, height);

            destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

            using (var graphics = Graphics.FromImage(destImage))
            {
                graphics.CompositingMode = CompositingMode.SourceCopy;
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                using (var wrapMode = new ImageAttributes())
                {
                    wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                    graphics.Clear(Color.White);
                    graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
                }
            }

            return destImage;
        }

        public static Bitmap CropUnwantedBackground(Bitmap bmp)
        {
            var backColor = GetMatchedBackColor(bmp);
            if (backColor.HasValue)
            {
                var bounds = GetImageBounds(bmp, backColor);
                var diffX = bounds[1].X - bounds[0].X + 1;
                var diffY = bounds[1].Y - bounds[0].Y + 1;
                var croppedBmp = new Bitmap(diffX, diffY);
                var g = Graphics.FromImage(croppedBmp);
                var destRect = new Rectangle(0, 0, croppedBmp.Width, croppedBmp.Height);
                var srcRect = new Rectangle(bounds[0].X, bounds[0].Y, diffX, diffY);
                g.DrawImage(bmp, destRect, srcRect, GraphicsUnit.Pixel);
                return croppedBmp;
            }
            else
            {
                return bmp;
            }
        }

        private static Color? GetMatchedBackColor(Bitmap bmp)
        {
            // Getting The Background Color by checking Corners of Original Image
            var corners = new Point[]{
            new Point(0, 0),
            new Point(0, bmp.Height - 1),
            new Point(bmp.Width - 1, 0),
            new Point(bmp.Width - 1, bmp.Height - 1)
        }; // four corners (Top, Left), (Top, Right), (Bottom, Left), (Bottom, Right)
            for (int i = 0; i < 4; i++)
            {
                var cornerMatched = 0;
                var backColor = bmp.GetPixel(corners[i].X, corners[i].Y);
                for (int j = 0; j < 4; j++)
                {
                    var cornerColor = bmp.GetPixel(corners[j].X, corners[j].Y);// Check RGB with some offset
                    if ((cornerColor.R <= backColor.R * 1.1 && cornerColor.R >= backColor.R * 0.9) &&
                        (cornerColor.G <= backColor.G * 1.1 && cornerColor.G >= backColor.G * 0.9) &&
                        (cornerColor.B <= backColor.B * 1.1 && cornerColor.B >= backColor.B * 0.9))
                    {
                        cornerMatched++;
                    }
                }
                if (cornerMatched > 2)
                {
                    return backColor;
                }
            }
            return null;
        }

        private static Point[] GetImageBounds(Bitmap bmp, Color? backColor)
        {
            //--------------------------------------------------------------------
            // Finding the Bounds of Crop Area bu using Unsafe Code and Image Proccesing
            Color c;
            int width = bmp.Width, height = bmp.Height;
            bool upperLeftPointFounded = false;
            var bounds = new Point[2];
            for (int y = 0; y < height; y++)
            {
                for (int x = 0; x < width; x++)
                {
                    c = bmp.GetPixel(x, y);
                    bool sameAsBackColor = ((c.R <= backColor.Value.R * 1.1 && c.R >= backColor.Value.R * 0.9) &&
                                            (c.G <= backColor.Value.G * 1.1 && c.G >= backColor.Value.G * 0.9) &&
                                            (c.B <= backColor.Value.B * 1.1 && c.B >= backColor.Value.B * 0.9));
                    if (!sameAsBackColor)
                    {
                        if (!upperLeftPointFounded)
                        {
                            bounds[0] = new Point(x, y);
                            bounds[1] = new Point(x, y);
                            upperLeftPointFounded = true;
                        }
                        else
                        {
                            if (x > bounds[1].X)
                                bounds[1].X = x;
                            else if (x < bounds[0].X)
                                bounds[0].X = x;
                            if (y >= bounds[1].Y)
                                bounds[1].Y = y;
                        }
                    }
                }
            }
            return bounds;
        }

        public byte[] imageToByteArray(System.Drawing.Image imageIn)
        {
            MemoryStream ms = new MemoryStream();
            imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Bmp);
            return ms.ToArray();
        }
        #endregion

        #region Productos Unidades de Medida
        [WebMethod(EnableSession = true)]
        public static object Listar_Productos_Unidades_Medidas(/*int jtStartIndex, int jtPageSize, */int? CodigoProducto)
        {
            try
            {
                int total = 0;

                List<SPC_GET_PRODUCTOSUNIDADESMEDIDAS_Result> Resultado = null;
                using (var DB = new TPVDBEntities())
                {
                    Resultado = DB.SPC_GET_PRODUCTOSUNIDADESMEDIDAS(
                        null, CodigoProducto, null, null, null, true)
                        .Where(w => w.Codigo_Unidad_Medida > 0).ToList();
                    total = Resultado.Count();
                }

                return new { Result = "OK", Records = Resultado/*.Skip(jtStartIndex).Take(jtPageSize)*/, TotalRecordCount = total };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de unidades de medidas de productos." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Agregar_Productos_Unidades_Medidas(SPC_GET_PRODUCTOSUNIDADESMEDIDAS_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTOSUNIDADESMEDIDAS(
                        null,
                        record.Codigo_Producto,
                        record.Codigo_Unidad_Medida,
                        record.Precio_Venta,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar la unidades de medidas de producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Productos_Unidades_Medidas(SPC_GET_PRODUCTOSUNIDADESMEDIDAS_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTOSUNIDADESMEDIDAS(
                        record.Codigo_Producto_Unidad_Medida,
                        record.Codigo_Producto,
                        record.Codigo_Unidad_Medida,
                        record.Precio_Venta,
                        true);
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar la unidad de medida de producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Eliminar_Productos_Unidades_Medidas(int Codigo_Producto_Unidad_Medida)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    DB.SPC_SET_PRODUCTOSUNIDADESMEDIDAS(
                        Codigo_Producto_Unidad_Medida,
                        null, null, null, false);
                }
                return new { Result = "OK" };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar la unidad de medida de producto." };
            }
        }
        #endregion

        #region Tipos Productos
        [WebMethod(EnableSession = true)]
        public static object Listar_Tipos_Productos(int? CodigoTipoProducto)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var Resultado = DB.SPC_GET_TIPOPRODUCTO(CodigoTipoProducto, null, true).ToList().Select(c => new
                    {
                        DisplayText = c.Tipo_Producto,
                        Value = c.Codigo_Tipo_Producto
                    }).OrderBy(o => o.DisplayText).ToList();

                    return new { Result = "OK", Options = Resultado };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de unidades de medidas de productos." };
            }
        }
        #endregion

        #region Impresoras
        [WebMethod(EnableSession = true)]
        public static object Listar_Impresoras()
        {
            try
            {
                List<object> Resultado = new List<object>();
                Resultado.Add(new
                {
                    DisplayText = "Barra",
                    Value = false
                });
                Resultado.Add(new
                {
                    DisplayText = "Cocina",
                    Value = true
                });

                return new { Result = "OK", Options = Resultado };

            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de unidades de medidas de productos." };
            }
        }
        #endregion
    }
}