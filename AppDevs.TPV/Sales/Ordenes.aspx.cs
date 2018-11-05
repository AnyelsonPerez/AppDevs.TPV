using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AppDevs.TPV.Utils;
using PrinterUtility;
using System.Text;
using System.Drawing.Text;

namespace AppDevs.TPV.Sales
{
    public partial class Ordenes : System.Web.UI.Page
    {
        private const string C_SV_USUARIO = "_Usuario";
        private const string C_SV_IMPRESION = "_Imprimir";
        private const int C_ESTADO_ORDEN_PAGADA = 3;

        protected void Page_Load(object sender, EventArgs e)
        {
            string CodigoArea = Request["CodigoArea"];
            string CodigoMesa = Request["CodigoMesa"];
            string NombreMesa = Request["NombreMesa"];

            if (CodigoArea != null) Session["CodigoAreaActual"] = CodigoArea;
            if (CodigoMesa != null)
            {
                using (var DB = new TPVDBEntities())
                {
                    ///-- Nombre de la mesa
                    lblMesa.InnerText = NombreMesa;
                    ///-- Agregar referencia al codigo de mesa
                    Comanda.Attributes.Add("Data-CodigoMesa", CodigoMesa);
                    Comanda.Attributes.Add("Data-CodigoArea", CodigoArea);

                    var Ordenes = DB.SPC_GET_ORDENDETALLE(null, int.Parse(CodigoMesa), null, null, null, null, null, null, true);
                    foreach (var Orden in Ordenes)
                    {
                        lblPAX.InnerText = Orden.Comensales.ToString();

                        var a = new HtmlGenericControl("a");
                        var h4Cantidad = new HtmlGenericControl("h4");
                        var h4Producto = new HtmlGenericControl("h4");
                        var h4Precio = new HtmlGenericControl("h4");
                        var h6Nota = new HtmlGenericControl("h6");

                        a.Attributes.Add("href", "#");
                        a.Attributes.Add("Data-CodigoOrdenDetalle", Orden.Codigo_Orden_Detalle.ToString());
                        a.Attributes.Add("Data-PrecioVenta", CambioDecimal(Orden.PrecioVenta.Value));

                        ///-- Si el estado es "pendiente"
                        if (Orden.Codigo_Estado_Orden_Detalle == 1)
                            a.Attributes.Add("class", "list-group-item list-group-item-danger");
                        else
                            a.Attributes.Add("class", "list-group-item");

                        h4Cantidad.Attributes.Add("class", "cantidad");
                        h4Cantidad.InnerText = Orden.Cantidad_Producto.ToString();

                        h4Producto.Attributes.Add("class", "producto");
                        h4Producto.InnerText = Orden.NombreProducto;

                        h4Precio.Attributes.Add("class", "precio");
                        h4Precio.InnerText = CambioDecimal(Orden.Sub_Total_Precio_Producto);

                        a.Controls.Add(h4Cantidad);
                        a.Controls.Add(h4Producto);
                        a.Controls.Add(h4Precio);

                        ///-- Agregar Nota si el pedido posee
                        if (Orden.Nota_Producto != null && Orden.Nota_Producto.Length > 0)
                        {
                            h6Nota.Attributes.Add("class", "nota");
                            h6Nota.InnerText = Orden.Nota_Producto;
                            a.Controls.Add(h6Nota);
                        }

                        ///-- Agregar pedido a la comanda
                        Comanda.Controls.Add(a);
                        Comanda.Attributes.Add("Data-CodigoOrden", Orden.Codigo_Orden.ToString());
                    }

                    var Categorias = DB.SPC_GET_CATEGORIA(null, 0, null, true);
                    foreach (var Categoria in Categorias)
                    {
                        var li = new HtmlGenericControl("li");
                        var a = new HtmlGenericControl("a");

                        a.Attributes.Add("href", "#");
                        a.Attributes.Add("Data-CodigoCategoria", Categoria.Codigo_Categoria_Producto.ToString());
                        if (Categoria.Codigo_Categoria_Padre_Producto != 0)
                            a.Attributes.Add("Data-CodigoCategoriaPadre", Categoria.Codigo_Categoria_Padre_Producto.ToString());
                        a.InnerText = Categoria.Categoria_Producto;

                        li.Controls.Add(a);
                        uListaCategorias.Controls.Add(li);
                    }

                    var Productos = DB.SPC_GET_PRODUCTO(null, null, null, null, null, true);
                    foreach (var Producto in Productos)
                    {
                        ///-- Si es extra
                        if (Producto.Codigo_Tipo_Producto == 2 || Producto.Codigo_Tipo_Producto == 3)
                        {
                            var Extra = new HtmlGenericControl("a");
                            var imgExtra = new HtmlGenericControl("img");
                            var pExtra = new HtmlGenericControl("p");
                            Extra.Attributes.Add("href", "#");
                            Extra.Attributes.Add("Data-CodigoProducto", Producto.Codigo_Producto.ToString());
                            Extra.Attributes.Add("Data-NombreProducto", Producto.NombreProducto);
                            Extra.Attributes.Add("Data-PrecioComoExtra", Producto.PrecioComoExtra.ToString());
                            Extra.Attributes.Add("class", "product");

                            imgExtra.Attributes.Add("class", "img-product");
                            imgExtra.Attributes.Add("src", string.Format("/utils/VisorImagenProducto.aspx?codigoproducto={0}", Producto.Codigo_Producto));
                            pExtra.InnerText = Producto.NombreProducto;

                            Extra.Controls.Add(imgExtra);
                            Extra.Controls.Add(pExtra);

                            dExtras.Controls.Add(Extra);
                        }
                    }

                    var Areas = DB.SPC_GET_AREA(null, null, null, true);
                    foreach (var Area in Areas)
                    {
                        var li = new HtmlGenericControl("li");
                        var a = new HtmlGenericControl("a");

                        if (int.Parse(CodigoArea) == Area.Codigo_Area)
                        {
                            dArea.Style.Add(HtmlTextWriterStyle.BackgroundColor, Area.Color_Area);
                            li.Attributes.Add("class", "active");
                        }

                        a.Attributes.Add("href", "#");
                        a.Attributes.Add("Data-CodigoArea", Area.Codigo_Area.ToString());
                        a.Attributes.Add("Data-ColorArea", Area.Color_Area);
                        a.InnerText = Area.Area;

                        li.Controls.Add(a);
                        uListaAreas.Controls.Add(li);
                    }
                }
            }
        }

        [WebMethod]
        public static List<SPC_GET_CATEGORIA_Result> GetCategoria(int CategoriaPadre)
        {
            using (var DB = new TPVDBEntities())
            {
                return DB.SPC_GET_CATEGORIA(null, CategoriaPadre, null, true).ToList();
            }
        }

        [WebMethod]
        public static List<SPC_GET_PRODUCTO_Result> GetProducto(int? Categoria)
        {
            //if (Categoria == 0) Categoria = null;
            using (var DB = new TPVDBEntities())
            {
                return DB.SPC_GET_PRODUCTO(null, Categoria, null, -3, null, true).ToList();
            }
        }

        [WebMethod]
        public static List<SPC_GET_PRODUCTOSUNIDADESMEDIDAS_Result> GetProductosUnidadesMedidas(int CodigoProducto)
        {
            using (var DB = new TPVDBEntities())
            {
                return DB.SPC_GET_PRODUCTOSUNIDADESMEDIDAS(null, CodigoProducto, null, null, null, true).ToList();
            }
        }

        [WebMethod]
        public static List<SPC_SET_ORDENDETALLE_Result> SetOrdenDetalle(Nullable<int> _CodigoOrdenDetalle, Nullable<int> _CodigoOrden,
            Nullable<int> _CodigoMesa, Nullable<int> _CodigoProducto, Nullable<int> _CodigoProductoUnidadMedida, Nullable<int> _CantidadProducto,
            Nullable<int> _CodigoProductoExtra, Nullable<decimal> _SubTotal, Nullable<int> _CantidadPersonas, string _NotaProducto, Nullable<int> _CodigoEstadoOrdenDetalle)
        {
            List<SPC_SET_ORDENDETALLE_Result> resultado = null;
            using (var DB = new TPVDBEntities())
            {
                ///-- Si es el primer articulo, crear la cabecera de la orden
                if (_CodigoOrden.HasValue == false || _CodigoOrden.Value == 0)
                {
                    var codigo_Orden = new System.Data.Entity.Core.Objects.ObjectParameter("Codigo_Orden", typeof(Nullable<int>));

                    DB.SPC_SET_ORDEN(codigo_Orden, _CodigoMesa, 1, DateTime.Now, 1, true);
                    _CodigoOrden = int.Parse(codigo_Orden.Value.ToString());
                }
                ///-- Registrar nuevo elemento y traer detalle completo
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
                resultado = DB.SPC_SET_ORDENDETALLE(_CodigoOrdenDetalle, _CodigoOrden, _CodigoProducto, _CodigoProductoUnidadMedida, _CantidadProducto,
                    _CodigoProductoExtra, _SubTotal, _CantidadPersonas, _NotaProducto, DateTime.Now, _CodigoEstadoOrdenDetalle, Usuario.Codigo_Usuario, true).ToList();


            }
            return resultado;
        }

        [WebMethod]
        public static List<SPC_SET_ORDENDETALLE_Result> MasUno(int _CodigoOrdenDetalle, string _CodigoMesa)
        {
            List<SPC_SET_ORDENDETALLE_Result> resultado = null;
            using (var DB = new TPVDBEntities())
            {
                ///-- Registrar nuevo elemento y traer detalle completo
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
                var Detalle = DB.SPC_GET_ORDENDETALLE(null, int.Parse(_CodigoMesa), null, null, null, null, null, null, null).Where(w => w.Codigo_Orden_Detalle == _CodigoOrdenDetalle).First();
                int cantidad_Producto = 0;
                decimal sub_Total_Precio_Producto = 0;
                if (Detalle.Codigo_Estado_Orden_Detalle == 1)
                {
                    cantidad_Producto = Detalle.Cantidad_Producto + 1;
                    sub_Total_Precio_Producto = Detalle.Sub_Total_Precio_Producto + (Detalle.Sub_Total_Precio_Producto / Detalle.Cantidad_Producto);

                    resultado = SetOrdenDetalle(Detalle.Codigo_Orden_Detalle, Detalle.Codigo_Orden, Detalle.Codigo_Mesa, Detalle.Codigo_Producto,
                        Detalle.Codigo_Producto_Unidad_Medida, cantidad_Producto, Detalle.Codigo_Producto_Extra, sub_Total_Precio_Producto, null, Detalle.Nota_Producto,
                        null);
                }
                else
                {
                    cantidad_Producto = 1;
                    sub_Total_Precio_Producto = (Detalle.Sub_Total_Precio_Producto / Detalle.Cantidad_Producto);

                    resultado = SetOrdenDetalle(null, Detalle.Codigo_Orden, Detalle.Codigo_Mesa, Detalle.Codigo_Producto,
                        Detalle.Codigo_Producto_Unidad_Medida, cantidad_Producto, Detalle.Codigo_Producto_Extra, sub_Total_Precio_Producto, null, Detalle.Nota_Producto,
                        null);
                }

            }
            return resultado;
        }

        [WebMethod]
        public static List<SPC_GET_ORDENDETALLE_Result> GetOrdenDetalle(Nullable<int> _CodigoOrden, Nullable<int> _CodigoMesa)
        {
            List<SPC_GET_ORDENDETALLE_Result> resultado = null;
            using (var DB = new TPVDBEntities())
            {
                resultado = DB.SPC_GET_ORDENDETALLE(_CodigoOrden, _CodigoMesa, null, null, null, null, null, null, true)
                    .Where(w => w.Codigo_Estado_Orden < 3).ToList();
            }
            return resultado;
        }

        [WebMethod]
        public static List<SPC_GET_MESA_Result> GetMesasDisponibles(int Codigo_Area, int Codigo_Mesa)
        {
            using (var DB = new TPVDBEntities())
            {
                return DB.SPC_GET_MESA(null, null, Codigo_Area, null, null, null, null, null, true).Where(w => w.Codigo_Mesa != Codigo_Mesa && w.Ocupada == false).ToList();
            }
        }

        [WebMethod]
        public static bool CambiarNombreMesa(int Codigo_Mesa, string Nombre_Mesa, bool Forzar = false)
        {
            using (var DB = new TPVDBEntities())
            {
                bool resultado = true;
                var mesas = DB.SPC_GET_MESA(null, Nombre_Mesa, null, null, null, null, null, null, true).Where(w => w.Codigo_Mesa != Codigo_Mesa).ToList();

                if (Forzar || mesas == null || mesas.Count() == 0)
                    DB.SPC_SET_MESA(Codigo_Mesa, Nombre_Mesa, null, null, null, null, null, null, null);
                else
                    resultado = false;

                return resultado;
            }
        }

        [WebMethod]
        public static bool CambiarPAX(int Codigo_Orden, int Comensales)
        {
            using (var DB = new TPVDBEntities())
            {
                bool resultado = true;
                var codigo_Orden = new System.Data.Entity.Core.Objects.ObjectParameter("Codigo_Orden", typeof(Nullable<int>));
                codigo_Orden.Value = Codigo_Orden;

                if (Comensales >= 0)
                    DB.SPC_SET_ORDEN(codigo_Orden, null, Comensales, null, null, null);
                else
                    resultado = false;

                return resultado;
            }
        }

        [WebMethod]
        public static void SetMesaNueva(int Codigo_Area, int Codigo_Orden, int Codigo_Mesa)
        {
            using (var DB = new TPVDBEntities())
            {
                /*var codigo_Orden = new System.Data.Entity.Core.Objects.ObjectParameter("Codigo_Orden", typeof(Int32));
                codigo_Orden.Value = Codigo_Orden;
                DB.SPC_SET_ORDEN(codigo_Orden, Codigo_Mesa, null, null, null, null);*/
                var orden = DB.Ordenes.Where(w => w.Codigo_Orden == Codigo_Orden).First();
                orden.Codigo_Mesa = Codigo_Mesa;
                DB.SaveChanges();
            }
        }

        [WebMethod]
        public static object HacerPedido(int _CodigoOrden)
        {
            List<SPC_SET_ORDENDETALLE_Result> resultado = null;
            using (var DB = new TPVDBEntities())
            {
                ///-- Imprimir en sus respectivas impresoras
                Pedidos(_CodigoOrden);
                var HoraPedido = DateTime.Now;
                ///-- Cambiar estado
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
                resultado = DB.SPC_SET_ORDENDETALLE(null, _CodigoOrden, null, null, null,
                    null, null, null, null, HoraPedido, 2, Usuario.Codigo_Usuario, true).ToList();
            }
            return resultado;
        }

        [WebMethod]
        public static object AnularPedido(int _CodigoOrdenDetalle)
        {
            List<SPC_SET_ORDENDETALLE_Result> resultado = null;
            using (var DB = new TPVDBEntities())
            {
                ///-- Obtener datos del pedido
                var PedidoAnulado = DB.SPC_GET_ORDENDETALLE(null, null, null, _CodigoOrdenDetalle, null, null, null, null, null).FirstOrDefault();
                var info = DB.InformacionEmpresa.FirstOrDefault();

                ///-- Imprimir ticket de Anulación
                ImprimirAnulacion(PedidoAnulado, PedidoAnulado.Impresora, info.NombreImpresoraCocina, info.NombreImpresoraBarra);

                ///-- Cambiar estado
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];

                ///-- Anular y retornar listado
                resultado = DB.SPC_SET_ORDENDETALLE(_CodigoOrdenDetalle, PedidoAnulado.Codigo_Orden, null, null,
                    0, null, null, null, null, null, null, Usuario.Codigo_Usuario, false).ToList();
            }
            return resultado;
        }

        static void Pedidos(int CodigoOrden)
        {
            using (var DB = new TPVDBEntities())
            {
                var info = DB.SPC_GET_INFORMACIONEMPRESA().First();
                var Pedidos = DB.SPC_GET_ORDENDETALLE(CodigoOrden, null, null, null, null,
                    null, 1, null, true)
                    .OrderBy(o => o.OrdenFactura)
                    .ThenBy(t => t.Codigo_Producto)
                    .ThenBy(t => t.Codigo_Producto_Extra)
                    .GroupBy(g => g.Impresora).ToList();
                foreach (var GrupoPedido in Pedidos)
                {
                    ImprimirPedidos(GrupoPedido, GrupoPedido.Key, info.NombreImpresoraCocina, info.NombreImpresoraBarra);
                }
            }
        }

        static void ImprimirPedidos(IGrouping<bool, SPC_GET_ORDENDETALLE_Result> Pedidos, bool ImprimirEnCocina,
            string NombreImpresoraCocina, string NombreImpresoraBarra)
        {
            try
            {
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
                var Camarero = (String.IsNullOrEmpty(Usuario.Nombre_Usuario) ? Usuario.Usuario : Usuario.Nombre_Usuario + " " + Usuario.Apellido_Usuario);
                var Mesa = Pedidos.First().Mesa;

                String NombreImpresora = ImprimirEnCocina ? NombreImpresoraCocina : NombreImpresoraBarra;
                if (ImprimirEnCocina) Mesa = string.Format(" ", Mesa, Pedidos.First().Comensales);
                int TamanoLetra = ImprimirEnCocina ? 16 : 11;
                int AnchoPagina = ImprimirEnCocina ? Properties.Settings.Default.MaximoCaracteresCocina : Properties.Settings.Default.MaximoCaracteresBarra;
                string letra = "Consolas";
                using (var DB = new TPVDBEntities())
                {
                    var info = DB.InformacionEmpresa.First();
                    if (!string.IsNullOrEmpty(info.TipoLetraBarra))
                        letra = ImprimirEnCocina ? info.TipoLetraCocina : info.TipoLetraBarra;

                    if (info.TamanoLetraBarra > 0)
                        TamanoLetra = ImprimirEnCocina ? (int)info.TamanoLetraCocina : (int)info.TamanoLetraBarra;
                }
                System.Drawing.Font ConsolasNormal = new System.Drawing.Font(letra, TamanoLetra, System.Drawing.FontStyle.Regular);
                System.Drawing.Font ConsolasBold = new System.Drawing.Font(letra, TamanoLetra, System.Drawing.FontStyle.Bold);
                var center = new StringFormat() { Alignment = StringAlignment.Center };

                int Index = 0;
                var LineasImpresion = new List<LineaPedido>();
                LineasImpresion.Add(new LineaPedido(Index++, new string('*', AnchoPagina), ConsolasNormal));
                LineasImpresion.Add(new LineaPedido(Index++, Mesa, ConsolasBold, center));
                LineasImpresion.Add(new LineaPedido(Index, new string('*', AnchoPagina), ConsolasNormal));

                foreach (var pedido in Pedidos)
                {
                    string DescripcionTotal = string.Empty;
                    string filler = string.Empty;
                    ///-- Agregar nota, si tiene una
                    if (!string.IsNullOrEmpty(pedido.Nota_Producto))
                    {
                        ///-- Cantidad - Producto - Nota
                        DescripcionTotal = string.Format("{0} {1} {2}",
                            pedido.Cantidad_Producto.ToString().PadLeft(2, ' '),
                            pedido.NombreProducto, pedido.Nota_Producto).PadRight(AnchoPagina * 2);
                    }
                    else
                    {
                        ///-- Cantidad - Producto
                        DescripcionTotal =
                            string.Format("{0} {1}", pedido.Cantidad_Producto, pedido.NombreProducto).PadRight(AnchoPagina * 2);
                    }

                    foreach (var Descripcion in DescripcionTotal.Trim().Split(AnchoPagina))
                    {
                        LineasImpresion.Add(new LineaPedido(++Index, filler + Descripcion.Trim(), ConsolasNormal));
                        filler = "   ";
                    }
                }

                ///-- línea en blanco
                Index++;
                LineasImpresion.Add(new LineaPedido(++Index, string.Format("Por: {0}", Camarero), ConsolasNormal));
                LineasImpresion.Add(new LineaPedido(++Index, DateTime.Now.ToShortTimeString(), ConsolasNormal));

                HttpContext.Current.Session.Add(C_SV_IMPRESION, LineasImpresion);

                var pd = new System.Drawing.Printing.PrintDocument();
                pd.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(pd_PrintPage);
                pd.DefaultPageSettings.PaperSize = new System.Drawing.Printing.PaperSize("3 1/8 inc x 220 mm", 313, (Index + 2) * (ConsolasNormal.Height));
                pd.DefaultPageSettings.Margins = new System.Drawing.Printing.Margins(0, 0, 0, 0);

                if (!string.IsNullOrEmpty(NombreImpresora))
                    pd.PrinterSettings.PrinterName = NombreImpresora;

                pd.Print();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        static void ImprimirAnulacion(SPC_GET_ORDENDETALLE_Result PedidoAnulado, bool ImprimirEnCocina,
            string NombreImpresoraCocina, string NombreImpresoraBarra)
        {
            try
            {
                var Usuario = (Usuarios)HttpContext.Current.Session[C_SV_USUARIO];
                var Camarero = (String.IsNullOrEmpty(Usuario.Nombre_Usuario) ? Usuario.Usuario : Usuario.Nombre_Usuario + " " + Usuario.Apellido_Usuario);

                String NombreImpresora = ImprimirEnCocina ? NombreImpresoraCocina : NombreImpresoraBarra;
                int TamanoLetra = ImprimirEnCocina ? 16 : 11;
                int AnchoPagina = ImprimirEnCocina ? Properties.Settings.Default.MaximoCaracteresCocina : Properties.Settings.Default.MaximoCaracteresBarra;
                string letra = "Consolas";
                using (var DB = new TPVDBEntities())
                {
                    var info = DB.InformacionEmpresa.First();
                    if (!string.IsNullOrEmpty(info.TipoLetraBarra))
                        letra = ImprimirEnCocina ? info.TipoLetraCocina : info.TipoLetraBarra;

                    if (info.TamanoLetraBarra > 0)
                        TamanoLetra = ImprimirEnCocina ? (int)info.TamanoLetraCocina : (int)info.TamanoLetraBarra;
                }
                System.Drawing.Font ConsolasNormal = new System.Drawing.Font(letra, TamanoLetra, System.Drawing.FontStyle.Regular);
                System.Drawing.Font ConsolasBold = new System.Drawing.Font(letra, TamanoLetra, System.Drawing.FontStyle.Bold);
                var center = new StringFormat() { Alignment = StringAlignment.Center };

                int Index = 0;
                var LineasImpresion = new List<LineaPedido>();
                LineasImpresion.Add(new LineaPedido(Index++, "ANULACIÓN", ConsolasBold, center));
                LineasImpresion.Add(new LineaPedido(Index, PedidoAnulado.Mesa, ConsolasBold, center));

                string DescripcionTotal = string.Empty;
                string filler = string.Empty;
                ///-- Agregar nota, si tiene una
                if (!string.IsNullOrEmpty(PedidoAnulado.Nota_Producto))
                {
                    ///-- Cantidad - Producto - Nota
                    DescripcionTotal = string.Format("{0} {1} {2}",
                        PedidoAnulado.Cantidad_Producto.ToString().PadLeft(2, ' '),
                        PedidoAnulado.NombreProducto, PedidoAnulado.Nota_Producto).PadRight(AnchoPagina * 2);
                }
                else
                {
                    ///-- Cantidad - Producto
                    DescripcionTotal =
                        string.Format("{0} {1}", PedidoAnulado.Cantidad_Producto, PedidoAnulado.NombreProducto).PadRight(AnchoPagina * 2);
                }

                foreach (var Descripcion in DescripcionTotal.Trim().Split(AnchoPagina))
                {
                    if (Descripcion.Trim().Length > 3)
                    {
                        LineasImpresion.Add(new LineaPedido(++Index, filler + Descripcion.Trim(), ConsolasNormal));
                        filler = "   ";
                    }
                }

                ///-- línea en blanco
                Index++;
                LineasImpresion.Add(new LineaPedido(++Index, string.Format("Anulado por: {0}", Camarero), ConsolasNormal));
                LineasImpresion.Add(new LineaPedido(++Index, DateTime.Now.ToShortTimeString(), ConsolasNormal));

                HttpContext.Current.Session.Add(C_SV_IMPRESION, LineasImpresion);

                var pd = new System.Drawing.Printing.PrintDocument();
                pd.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(pd_PrintPage);
                pd.DefaultPageSettings.PaperSize = new System.Drawing.Printing.PaperSize("3 1/8 inc x 220 mm", 313, (Index + 2) * (ConsolasNormal.Height));
                pd.DefaultPageSettings.Margins = new System.Drawing.Printing.Margins(0, 0, 0, 0);

                if (!string.IsNullOrEmpty(NombreImpresora))
                    pd.PrinterSettings.PrinterName = NombreImpresora;

                pd.Print();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        [WebMethod]
        public static void CobrarCuenta(int Codigo_Orden, int Codigo_Metodo_Pago)
        {
            using (var DB = new TPVDBEntities())
            {
                var orden = DB.Ordenes.Where(w => w.Codigo_Orden == Codigo_Orden).FirstOrDefault();
                if (orden != null)
                {
                    orden.Codigo_Estado_Orden = C_ESTADO_ORDEN_PAGADA;
                    orden.Codigo_Metodo_Pago = Codigo_Metodo_Pago;
                    orden.Hora_Pago = DateTime.Now;
                    DB.SaveChanges();
                }
            }
        }

        [WebMethod]
        public static void ImprimirCuenta(int CodigoOrden)
        {

            const int LINE_MAX_LENGHT = 41;
            var center = new StringFormat() { Alignment = StringAlignment.Center };

            Usuarios usuario = null;
            string AtendidoPor = string.Empty;
            InformacionEmpresa info = null;
            System.Drawing.Font ConsolasNormal = null;
            System.Drawing.Font ConsolasBold = null;
            List<SPC_GET_ORDENDETALLE_Result> OrdenDetalle = null;
            var Mesa = string.Empty;
            decimal TotalFactura = 0;

            using (var DB = new TPVDBEntities())
            {
                info = DB.InformacionEmpresa.First();
                ConsolasNormal = new System.Drawing.Font(info.TipoLetraBarra, (int)info.TamanoLetraBarra, System.Drawing.FontStyle.Regular);
                ConsolasBold = new System.Drawing.Font(info.TipoLetraBarra, (int)info.TamanoLetraBarra, System.Drawing.FontStyle.Bold);

                if (!string.IsNullOrEmpty(info.TipoLetraBarra))
                {
                    ConsolasNormal = new System.Drawing.Font(new System.Drawing.FontFamily(info.TipoLetraBarra), (float)info.TamanoLetraBarra.Value, System.Drawing.FontStyle.Regular);
                    ConsolasBold = new System.Drawing.Font(new System.Drawing.FontFamily(info.TipoLetraBarra), (float)info.TamanoLetraBarra, System.Drawing.FontStyle.Bold);
                }

                var orden = DB.Ordenes.Where(w => w.Codigo_Orden == CodigoOrden).First();
                usuario = orden.OrdenesDetalles.First().Usuarios;
                AtendidoPor = usuario.Nombre_Usuario + " " + usuario.Apellido_Usuario;

                if (orden.Codigo_Estado_Orden == 1)
                {
                    orden.Codigo_Estado_Orden = 2;
                    orden.Hora_Pago = DateTime.Now;

                    DB.SaveChanges();
                }
                OrdenDetalle = DB.SPC_GET_ORDENDETALLE(CodigoOrden, null, null, null, null, null, null, null, true)
                    .OrderBy(o => o.OrdenFactura).ToList();
            }

            ///-- Mesa y Nº factura
            var ordenDetalle = OrdenDetalle.First();
            Mesa = ordenDetalle.Mesa;
            var NumeroFactura = string.Format("{0}-{1}", ordenDetalle.Hora_Pago.Value.Year, ordenDetalle.NumeroFactura.Value.ToString().PadLeft(6, '0'));

            int Index = 0;
            var LineasImpresion = new List<LineaPedido>();
            LineasImpresion.Add(new LineaPedido(Index++, info.NombreEmpresa.ToUpper(), ConsolasBold, center));
            LineasImpresion.Add(new LineaPedido(Index++, info.Direccion, ConsolasNormal, center));
            LineasImpresion.Add(new LineaPedido(Index++, string.Format("{0} {1}, {2}",
                info.CodigoPostal, info.Ciudad, info.Provincia), ConsolasNormal, center));

            if (!string.IsNullOrEmpty(info.Telefono))
                LineasImpresion.Add(new LineaPedido(Index++, "Tel. " + info.Telefono, ConsolasNormal, center));
            if (!string.IsNullOrEmpty(info.Movil) && info.Telefono != info.Movil)
                LineasImpresion.Add(new LineaPedido(Index++, "Móvil " + info.Movil, ConsolasNormal, center));
            if (!string.IsNullOrEmpty(info.NIF))
                LineasImpresion.Add(new LineaPedido(Index++, "N.I.F: " + info.NIF, ConsolasNormal, center));
            if (!string.IsNullOrEmpty(info.CIF))
                LineasImpresion.Add(new LineaPedido(Index++, "C.I.F: " + info.CIF, ConsolasNormal, center));

            Index++;
            LineasImpresion.Add(new LineaPedido(Index++, string.Format("Factura Simplificada: {0}",
                NumeroFactura.PadLeft(LINE_MAX_LENGHT - 22, ' ')), ConsolasNormal));
            LineasImpresion.Add(new LineaPedido(Index++, new string('-', LINE_MAX_LENGHT), ConsolasNormal));
            var grpProductos = OrdenDetalle.GroupBy(g => new { g.NombreProducto }).ToList();
            foreach (var Producto in grpProductos)
            {
                var grpUnidadMedida = Producto.GroupBy(g => g.Codigo_Producto_Unidad_Medida);
                foreach (var UnidadMedida in grpUnidadMedida)
                {
                    var grpNota = UnidadMedida.GroupBy(g => g.Nota_Producto).ToList();
                    foreach (var Pedidos in grpNota)
                    {
                        var Linea = new SPC_GET_ORDENDETALLE_Result();
                        foreach (var Pedido in Pedidos)
                        {
                            Linea.Cantidad_Producto += Pedido.Cantidad_Producto;
                            Linea.NombreProducto = Pedido.NombreProducto;
                            Linea.Nota_Producto = Pedido.Nota_Producto;
                            Linea.Sub_Total_Precio_Producto += Pedido.Sub_Total_Precio_Producto;
                        }

                        string cantidad = string.Format("{0}x{1:F}", Linea.Cantidad_Producto.ToString().PadLeft(2, ' '), Linea.Sub_Total_Precio_Producto / Linea.Cantidad_Producto);
                        string Descripcion = string.Empty;
                        string total = Linea.Sub_Total_Precio_Producto.ToString("F");
                        int EspacioTotal = 0;
                        int intFiller = 0;

                        EspacioTotal = (LINE_MAX_LENGHT - 3) - cantidad.Length - total.Length;
                        if (!string.IsNullOrEmpty(Linea.Nota_Producto))
                        {
                            EspacioTotal -= Linea.Nota_Producto.Length + 2;
                            if (EspacioTotal < 0) EspacioTotal = 0;
                            Descripcion = Linea.NombreProducto.Truncate(EspacioTotal);
                            Descripcion += " " + Linea.Nota_Producto;
                        }
                        else
                        {
                            Descripcion = Linea.NombreProducto.Truncate(EspacioTotal);
                        }

                        intFiller = (LINE_MAX_LENGHT - 2) - (cantidad.Length + Descripcion.Length + total.Length);
                        if (intFiller == 0)
                        {
                            LineasImpresion.Add(new LineaPedido(Index++,
                                string.Format("{0} {1} {2}", cantidad, Descripcion, total), ConsolasNormal));
                        }
                        else if (intFiller > 0)
                        {
                            LineasImpresion.Add(new LineaPedido(Index++,
                                string.Format("{0} {1}{2} {3}", cantidad, Descripcion, new string('.', intFiller), total), ConsolasNormal));
                        }

                        TotalFactura += Linea.Sub_Total_Precio_Producto;
                    }
                }
            }
            LineasImpresion.Add(new LineaPedido(Index++, new string('-', LINE_MAX_LENGHT), ConsolasNormal));
            LineasImpresion.Add(new LineaPedido(Index++, string.Format("TOTAL: {0}",
                TotalFactura.ToString("F").PadLeft(LINE_MAX_LENGHT - 7, '.')), ConsolasBold));

            Index++;
            LineasImpresion.Add(new LineaPedido(Index++, "TIPO    BASE    IVA     TOTAL", ConsolasNormal));

            var Impuestos = TotalFactura / (1 + info.PorcientoIVA.Value);

            LineasImpresion.Add(new LineaPedido(Index++,
                string.Format("{0} {1} {2} {3}",
                    info.PorcientoIVA.Value.ToString("F").PadRight(7, ' '),
                    (TotalFactura - Impuestos).ToString("F").PadRight(7, ' '),
                    Impuestos.ToString("F").PadRight(7, ' '),
                    TotalFactura.ToString("F")),
                ConsolasNormal));

            Index++;
            LineasImpresion.Add(new LineaPedido(Index++, "PRECIOS CON IVA INCLUIDO", ConsolasNormal));
            LineasImpresion.Add(new LineaPedido(Index++, "ATENDIDO POR: " + AtendidoPor, ConsolasNormal));
            LineasImpresion.Add(new LineaPedido(Index++, "MESA: " + Mesa.ToUpper(), ConsolasBold));
            LineasImpresion.Add(new LineaPedido(Index++, "FECHA: " + DateTime.Now.ToString("dd MMM HH:mm:ss"), ConsolasNormal));

            Index++;
            if (!string.IsNullOrEmpty(info.Facebook))
            {
                LineasImpresion.Add(new LineaPedido(Index++, "Síguenos en FB", ConsolasBold, center));
                LineasImpresion.Add(new LineaPedido(Index++, info.Facebook, ConsolasNormal, center));
            }
            LineasImpresion.Add(new LineaPedido(Index++, "Gracias por su visita", ConsolasNormal, center));

            HttpContext.Current.Session.Add(C_SV_IMPRESION, LineasImpresion);

            var pd = new System.Drawing.Printing.PrintDocument();
            pd.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(pd_PrintPage);
            pd.DefaultPageSettings.PaperSize = new System.Drawing.Printing.PaperSize("3 1/8 inc x 220 mm", 313, (Index + 2) * ConsolasNormal.Height);
            pd.DefaultPageSettings.Margins = new System.Drawing.Printing.Margins(0, 0, 0, 0);

            if (!string.IsNullOrEmpty(info.NombreImpresoraBarra))
                pd.PrinterSettings.PrinterName = info.NombreImpresoraBarra;

            pd.Print();
        }

        public string CambioDecimal(decimal Valor)
        {
            return string.Format(
                System.Globalization.CultureInfo.GetCultureInfo("en-US"), "{0:0.00}", Valor);
        }

        static void pd_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs ev)
        {
            var LineasImpresion = (List<LineaPedido>)HttpContext.Current.Session[C_SV_IMPRESION];
            foreach (var Linea in LineasImpresion)
            {
                WriteLine(ev, Linea.LineIndex, Linea.LineText, Linea.Fuente, Linea.Center);
            }
        }

        static void WriteLine(System.Drawing.Printing.PrintPageEventArgs ev, int LineIndex, string LineText, Font Fuente, StringFormat Center = null)
        {
            System.Drawing.SolidBrush br = new System.Drawing.SolidBrush(System.Drawing.Color.Black);

            int Y = (LineIndex) * Fuente.Height;

            if (Center != null)
                ev.Graphics.DrawString(LineText, Fuente, br, new PointF(145, Y), Center);
            else
                ev.Graphics.DrawString(LineText, Fuente, br, new PointF(0, Y));
        }
    }
}
public static class StringExt
{
    public static string Truncate(this string value, int maxLength)
    {
        if (string.IsNullOrEmpty(value)) return value;
        return value.Length <= maxLength ? value : value.Substring(0, maxLength);
    }

    public static IEnumerable<string> Split(this string str, int chunkSize)
    {
        for (int index = 0; index < str.Length; index += chunkSize)
        {
            yield return str.Substring(index, Math.Min(chunkSize, str.Length - index));
        }
    }
}
