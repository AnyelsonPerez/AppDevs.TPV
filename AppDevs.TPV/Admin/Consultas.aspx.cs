using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;
using System.Drawing;

namespace AppDevs.TPV.Admin
{
    public partial class Consultas : System.Web.UI.Page
    {
        private static List<LineaPedido> LineasImpresion = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (new Utilidades().SoloVentas)
                Response.Redirect("/Sales/Areas.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object GetConsultaVentas(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden == 3
                            && w.Hora_Pago >= (Desde != null ? Desde : w.Hora_Pago)
                            && w.Hora_Pago <= (Hasta != null ? Hasta : w.Hora_Pago))
                            .Select(s => new
                            {
                                s.Codigo_Orden,
                                s.Mesas.Mesa,
                                s.Metodos_Pago.Metodo_Pago,
                                s.Hora_Pago,
                                Total = s.OrdenesDetalles
                                    .Where(w => w.Activo)
                                    .Sum(ss => ss.Sub_Total_Precio_Producto)
                            })
                            .OrderBy(o => o.Hora_Pago)
                            .ToList();

                    return new { Result = "OK", Records = detalle };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de cargar consultas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetConsultaCategorias(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.OrdenesDetalles.Where(w => w.Activo && w.Ordenes.Codigo_Estado_Orden == 3
                            && w.Ordenes.Hora_Pago >= (Desde != null ? Desde : w.Ordenes.Hora_Pago)
                            && w.Ordenes.Hora_Pago <= (Hasta != null ? Hasta : w.Ordenes.Hora_Pago))
                            .GroupBy(g => g.Productos.Codigo_Categoria_Producto)
                            .Select(s => new
                            {
                                s.FirstOrDefault().Productos.CategoriasProductos.Categoria_Producto,
                                total = s.Sum(t => t.Sub_Total_Precio_Producto)
                            })
                            .OrderBy(o => o.Categoria_Producto)
                            .ToList();

                    return new { Result = "OK", Records = detalle };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de cargar consultas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetConsultaProductos(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.OrdenesDetalles.Where(w => w.Activo && w.Ordenes.Codigo_Estado_Orden == 3
                            && w.Ordenes.Hora_Pago >= (Desde != null ? Desde : w.Ordenes.Hora_Pago)
                            && w.Ordenes.Hora_Pago <= (Hasta != null ? Hasta : w.Ordenes.Hora_Pago))
                            .GroupBy(g => new { g.Productos.Codigo_Producto, g.ProductosUnidadesMedidas.UnidadesMedidas.Unidad_Medida })
                            .Select(s => new
                            {
                                s.FirstOrDefault().Productos.CategoriasProductos.Categoria_Producto,
                                NombreProducto = s.FirstOrDefault().Productos.NombreProducto +
                                (string.IsNullOrEmpty(s.Key.Unidad_Medida) ? "" : " (" + s.Key.Unidad_Medida + ")"),
                                cantidad = s.Sum(c => c.Cantidad_Producto),
                                total = s.Sum(t => t.Sub_Total_Precio_Producto)
                            })
                            .OrderBy(o => o.Categoria_Producto)
                            .ThenBy(o => o.NombreProducto)
                            .ToList();

                    return new { Result = "OK", Records = detalle };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de cargar consultas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetConsultaMetodos(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.OrdenesDetalles.Where(w => w.Activo && w.Ordenes.Codigo_Estado_Orden == 3
                            && w.Ordenes.Hora_Pago >= (Desde != null ? Desde : w.Ordenes.Hora_Pago)
                            && w.Ordenes.Hora_Pago <= (Hasta != null ? Hasta : w.Ordenes.Hora_Pago))
                            .GroupBy(g => new { g.Ordenes.Metodos_Pago.Metodo_Pago })
                            .Select(s => new
                            {
                                s.Key.Metodo_Pago,
                                total = s.Sum(t => t.Sub_Total_Precio_Producto)
                            })
                            .OrderBy(o => o.Metodo_Pago)
                            .ToList();

                    return new { Result = "OK", Records = detalle };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de cargar consultas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetConsultausuarios(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.OrdenesDetalles.Where(w => w.Activo && w.Ordenes.Codigo_Estado_Orden == 3
                            && w.Ordenes.Hora_Pago >= (Desde != null ? Desde : w.Ordenes.Hora_Pago)
                            && w.Ordenes.Hora_Pago <= (Hasta != null ? Hasta : w.Ordenes.Hora_Pago))
                            .GroupBy(g => g.Usuarios.Nombre_Usuario + " " + g.Usuarios.Apellido_Usuario)
                            .Select(s => new
                            {
                                NombreCompleto = s.Key,
                                total = s.Sum(t => t.Sub_Total_Precio_Producto)
                            })
                            .OrderBy(o => o.NombreCompleto)
                            .ToList();

                    return new { Result = "OK", Records = detalle };
                }
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de cargar consultas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static void ImprimirCierre(Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var ordenes =
                        DB.OrdenesDetalles.Where(w => w.Activo && w.Ordenes.Codigo_Estado_Orden == 3
                            && w.Ordenes.Hora_Pago >= (Desde != null ? Desde : w.Ordenes.Hora_Pago)
                            && w.Ordenes.Hora_Pago <= (Hasta != null ? Hasta : w.Ordenes.Hora_Pago)).ToList();

                    var info = DB.InformacionEmpresa.FirstOrDefault();
                    String NombreImpresora = info.NombreImpresoraBarra;
                    int TamanoLetra = 10;
                    int AnchoPagina = 36;

                    System.Drawing.Font ConsolasNormal = new System.Drawing.Font("Consolas", TamanoLetra, System.Drawing.FontStyle.Regular);
                    System.Drawing.Font ConsolasBold = new System.Drawing.Font("Consolas", TamanoLetra, System.Drawing.FontStyle.Bold);
                    var center = new StringFormat() { Alignment = StringAlignment.Center };

                    int Index = 0;
                    LineasImpresion = new List<LineaPedido>
                    {
                        new LineaPedido(Index++, info.NombreEmpresa, ConsolasNormal, center),
                        new LineaPedido(Index++, info.Direccion, ConsolasNormal, center),
                        new LineaPedido(Index++, string.Format("{0} {1}, {2}",
                        info.CodigoPostal, info.Ciudad, info.Provincia), ConsolasNormal, center)
                    };

                    if (!string.IsNullOrEmpty(info.Telefono))
                        LineasImpresion.Add(new LineaPedido(Index++, "Tel. " + info.Telefono, ConsolasNormal, center));
                    if (!string.IsNullOrEmpty(info.Movil) && info.Telefono != info.Movil)
                        LineasImpresion.Add(new LineaPedido(Index++, "Móvil " + info.Movil, ConsolasNormal, center));
                    if (!string.IsNullOrEmpty(info.NIF))
                        LineasImpresion.Add(new LineaPedido(Index++, "N.I.F: " + info.NIF, ConsolasNormal, center));
                    if (!string.IsNullOrEmpty(info.CIF))
                        LineasImpresion.Add(new LineaPedido(Index++, "C.I.F: " + info.CIF, ConsolasNormal, center));

                    Index++;
                    LineasImpresion.Add(new LineaPedido(Index++, new string('*', AnchoPagina), ConsolasNormal));
                    LineasImpresion.Add(new LineaPedido(Index++, "CIERRE DIARIO DE VENTAS", ConsolasNormal, center));
                    LineasImpresion.Add(new LineaPedido(Index++, new string('*', AnchoPagina), ConsolasNormal));

                    string DescripcionTotal = string.Empty;
                    DescripcionTotal = string.Format("FECHA: {0}", Desde.Value.ToShortDateString().PadLeft(AnchoPagina - 7));
                    LineasImpresion.Add(new LineaPedido(Index++, DescripcionTotal, ConsolasNormal));

                    LineasImpresion.Add(new LineaPedido(++Index, new string('-', AnchoPagina), ConsolasNormal));
                    DescripcionTotal = string.Format("TOTAL {0}", ordenes.Sum(s => s.Sub_Total_Precio_Producto).Value.ToString("C").PadLeft(30));
                    LineasImpresion.Add(new LineaPedido(++Index, DescripcionTotal, ConsolasBold));
                    LineasImpresion.Add(new LineaPedido(++Index, new string('-', AnchoPagina), ConsolasNormal));

                    //foreach (var pedido in detalle)
                    //{
                    //    DescripcionTotal =
                    //        string.Format("{0} {1}", pedido.Metodo_Pago,
                    //        pedido.total.ToString("F").PadLeft(AnchoPagina - pedido.Metodo_Pago.Length - 1));
                    //    LineasImpresion.Add(new LineaPedido(++Index, DescripcionTotal, ConsolasNormal));
                    //}

                    var pd = new System.Drawing.Printing.PrintDocument();
                    pd.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(Pd_PrintPage);
                    pd.DefaultPageSettings.PaperSize = new System.Drawing.Printing.PaperSize("3 1/8 inc x 220 mm", 313, (Index + 2) * 15);
                    pd.DefaultPageSettings.Margins = new System.Drawing.Printing.Margins(0, 0, 0, 0);

                    if (!string.IsNullOrEmpty(NombreImpresora))
                        pd.PrinterSettings.PrinterName = NombreImpresora;

                    pd.Print();
                }
            }
            catch
            {
                throw new Exception("ha ocurrido un error al intentar generar el cierre diario");
            }
        }

        public string CambioDecimal(decimal Valor)
        {
            return string.Format(
                System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.00}", Valor);
        }

        private static void Pd_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs ev)
        {
            foreach (var Linea in LineasImpresion)
            {
                WriteLine(ev, Linea.LineIndex, Linea.LineText, Linea.Fuente, Linea.Center);
            }
        }

        private static void WriteLine(System.Drawing.Printing.PrintPageEventArgs ev, int LineIndex, string LineText, Font Fuente, StringFormat Center = null)
        {
            System.Drawing.SolidBrush br = new System.Drawing.SolidBrush(System.Drawing.Color.Black);
            int Y = (LineIndex) * 15;

            if (Center != null)
                ev.Graphics.DrawString(LineText, Fuente, br, new PointF(145, Y), Center);
            else
                ev.Graphics.DrawString(LineText, Fuente, br, new PointF(0, Y));
        }
    }
}