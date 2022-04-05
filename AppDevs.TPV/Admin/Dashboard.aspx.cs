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
    public partial class Dashboard : System.Web.UI.Page
    {
        static Random r = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (new Utilidades().SoloVentas)
                Response.Redirect("/Sales/Areas.aspx", true);
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatos(DateTime PrimerMes, DateTime SegundoMes,
            DateTime InicioPrimeraSemana, DateTime InicioSegundaSemana,
            DateTime FechaTop10Desde, DateTime FechaTop10Hasta)
        {
            var conteos = GetDatosConteos();
            var comparacionSemanal = GetDatosComparacionSemanal(InicioPrimeraSemana, InicioSegundaSemana);
            var comparacionMensual = GetDatosComparacionMensual(PrimerMes, SegundoMes);
            var top10MenosVendidos = GetDatos10MenosVendidos(10, true, FechaTop10Desde, FechaTop10Hasta);
            var ultimos5Cobros = GetDatosUltimos5Cobros();
            var ultimos10Pedidos = GetDatosUltimos10Pedidos();

            return new
            {
                Conteos = conteos,
                ComparacionSemanal = comparacionSemanal,
                ComparacionMensual = comparacionMensual,
                Top10MenosVendidos = top10MenosVendidos,
                Ultimos5Cobros = ultimos5Cobros,
                Ultimos10Pedidos = ultimos10Pedidos
            };
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatosConteos()
        {
            DateTime Hoy = DateTime.Now.AddHours(-6).Date;
            DateTime Desde = new DateTime(Hoy.Year, Hoy.Month, Hoy.Day, 6, 0, 0);
            DateTime Hasta = Desde.AddDays(1);

            using (var DB = new TPVDBEntities())
            {
                var ventasDeHoy = DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden == 3
                    && w.Hora_Pago.Value > Desde && w.Hora_Pago.Value < Hasta).ToList();

                int cantidadVentas = DB.OrdenesDetalles.Where(w =>
                    w.Activo &&
                    w.Productos.Codigo_Producto == 5 &&
                    w.Productos.Codigo_Tipo_Producto == 5 &&
                    w.Ordenes.Codigo_Estado_Orden == 3 &&
                    w.Ordenes.Hora_Pago > Hoy).Select(s => s.Codigo_Orden).Distinct().Count();
                decimal? totalVentas = ventasDeHoy.Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));
                decimal? tarjetaVentas = ventasDeHoy
                    .Where(w => w.Codigo_Metodo_Pago == 2)
                    .Sum(s => s.OrdenesDetalles.Where(w => w.Activo)
                        .Sum(od => od.Sub_Total_Precio_Producto));
                decimal efectivoVentas = totalVentas.Value - tarjetaVentas.Value;

                //-- Pendientes
                var pendientes = DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden != 3
                    && w.Mesas.Activo && w.Mesas.Areas.Activo
                    && w.OrdenesDetalles.Where(ww => ww.Activo).Sum(s => s.Sub_Total_Precio_Producto) > 0).ToList();
                int mesasPendienteCobrar = pendientes.Count();
                decimal? pendienteCobrar = pendientes.Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));

                return new
                {
                    Result = "OK",
                    TotalVentas = totalVentas.Value.ToString("N2"),
                    EfectivoVentas = efectivoVentas.ToString("N2"),
                    TarjetaVentas = tarjetaVentas.Value.ToString("N2"),
                    CantidadVentas = cantidadVentas,
                    PendienteCobrar = pendienteCobrar.Value.ToString("N2"),
                    MesasPendienteCobrar = mesasPendienteCobrar
                };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatosComparacionMensual(DateTime PrimerMes, DateTime SegundoMes)
        {
            var comparacion = new List<Comparacion>();
            PrimerMes = new DateTime(PrimerMes.Year, PrimerMes.Month, 1, 6, 0, 0);
            var finPrimerMes = PrimerMes.AddMonths(1);
            SegundoMes = new DateTime(SegundoMes.Year, SegundoMes.Month, 1, 6, 0, 0);
            var finSegundoMes = SegundoMes.AddMonths(1);
            using (var DB = new TPVDBEntities())
            {
                var ventas = DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden == 3 &&
                    ((w.Hora_Pago.Value >= PrimerMes && w.Hora_Pago.Value <= finPrimerMes)
                    || (w.Hora_Pago.Value >= SegundoMes && w.Hora_Pago.Value <= finSegundoMes))).ToList();

                foreach (var venta in ventas)
                    venta.Hora_Pago = venta.Hora_Pago.Value.AddHours(-6);

                var ci = new System.Globalization.CultureInfo("Es-Es");
                DayOfWeek dia = PrimerMes.DayOfWeek;
                for (int i = 1; i <= 37; i++)
                {
                    string label = ci.DateTimeFormat.GetDayName(dia).Substring(0, 3) + ".";
                    Nullable<decimal> PrimeraVenta = null;
                    Nullable<decimal> SegundaVenta = null;

                    if (PrimerMes.DayOfWeek == dia && PrimerMes < finPrimerMes)
                    {
                        PrimeraVenta = ventas.Where(w => w.Hora_Pago.Value.AddHours(-6).Date == PrimerMes.Date)
                            .Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));

                        label += " " + PrimerMes.ToString("dd/MM/yy");
                        PrimerMes = PrimerMes.AddDays(1);
                    }

                    if (SegundoMes.DayOfWeek == dia && SegundoMes < finSegundoMes)
                    {
                        SegundaVenta = ventas.Where(w => w.Hora_Pago.Value.AddHours(-6).Date == SegundoMes.Date)
                            .Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));

                        label += " " + SegundoMes.ToString("dd/MM/yy");
                        SegundoMes = SegundoMes.AddDays(1);
                    }

                    if (label.Length > 4)
                    {
                        comparacion.Add(new Comparacion(label, PrimeraVenta, SegundaVenta));
                    }

                    if (dia == DayOfWeek.Saturday)
                        dia = 0;
                    else
                        dia++;
                }

                return comparacion;
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatosComparacionSemanal(DateTime InicioPrimeraSemana, DateTime InicioSegundaSemana)
        {
            var comparacionSemanal = new List<Comparacion>();
            using (var DB = new TPVDBEntities())
            {
                InicioPrimeraSemana = new DateTime(InicioPrimeraSemana.Year, InicioPrimeraSemana.Month, InicioPrimeraSemana.Day, 6, 0, 0);
                InicioSegundaSemana = new DateTime(InicioSegundaSemana.Year, InicioSegundaSemana.Month, InicioSegundaSemana.Day, 6, 0, 0);
                var FinPrimeraSemana = InicioPrimeraSemana.AddDays(7);
                var FinSegundaSemana = InicioSegundaSemana.AddDays(7);

                var ventas = DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden == 3 &&
                    ((w.Hora_Pago >= InicioPrimeraSemana && w.Hora_Pago < FinPrimeraSemana)
                    || (w.Hora_Pago >= InicioSegundaSemana && w.Hora_Pago < FinSegundaSemana))).ToList();

                foreach (var venta in ventas)
                    venta.Hora_Pago = venta.Hora_Pago.Value.AddHours(-6);

                for (int i = 0; i < 7; i++)
                {
                    var VentaSemanaPasada =
                        ventas.Where(w => w.Hora_Pago.Value.Day == InicioPrimeraSemana.Day)
                        .Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));

                    var VentaSemanaActual =
                        ventas.Where(w => w.Hora_Pago.Value.Day == InicioSegundaSemana.Day)
                        .Sum(s => s.OrdenesDetalles.Where(w => w.Activo).Sum(od => od.Sub_Total_Precio_Producto));

                    comparacionSemanal.Add(new Comparacion(
                            InicioPrimeraSemana.ToString("ddd"), VentaSemanaPasada, VentaSemanaActual));

                    InicioPrimeraSemana = InicioPrimeraSemana.AddDays(1);
                    InicioSegundaSemana = InicioSegundaSemana.AddDays(1);
                }

                return comparacionSemanal;
            }
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatos10MenosVendidos(int Top, bool Menos, DateTime FechaTop10Desde, DateTime FechaTop10Hasta,
            bool Cocina = true, string ExcluirCategorias = "|1|7|")
        {
            var DB = new TPVDBEntities();

            var ventas = DB.SPC_GET_TOPVENTAS(ExcluirCategorias, Cocina, FechaTop10Desde, FechaTop10Hasta).ToList();
            object resultado = null;
            if (Menos)
            {
                var NoVendidos = ventas.Where(o => o.Cantidad == 0).Count();

                if (NoVendidos > Top) Top = NoVendidos + 1;
                resultado = ventas.OrderBy(o => o.Cantidad).Take(Top).Select(s => new { label = s.NombreProducto, value = s.Cantidad }).ToList();
            }
            else
                resultado = ventas.OrderByDescending(o => o.Cantidad).Take(Top).Select(s => new { label = s.NombreProducto, value = s.Cantidad }).ToList();

            return resultado;
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatosUltimos5Cobros()
        {
            var DB = new TPVDBEntities();

            return DB.Ordenes
                .Where(w => w.Activo && w.Codigo_Estado_Orden == 3)
                .OrderByDescending(o => o.Hora_Pago)
                .Take(5)
                    .Select(s => new
                    {
                        s.Codigo_Orden,
                        s.Mesas.Mesa,
                        s.Codigo_Metodo_Pago,
                        s.Hora_Pago,
                        Total = s.OrdenesDetalles
                            .Where(w => w.Activo)
                            .Sum(ss => ss.Sub_Total_Precio_Producto)
                    }).ToList();
        }

        [WebMethod(EnableSession = true)]
        public static object GetDatosUltimos10Pedidos()
        {
            using (var DB = new TPVDBEntities())
            {
                var info = DB.InformacionEmpresa.First();

                return
                    DB.OrdenesDetalles
                    .Where(w =>
                        w.Activo
                        && w.Codigo_Estado_Orden_Detalle == 2
                        //&& w.Hora_Orden_Detalle > Hoy
                        && w.Productos.Codigo_Tipo_Producto != 5)
                    .GroupBy(g => new { g.Hora_Orden_Detalle, g.Ordenes.Mesas.Mesa, g.Productos.Impresora })
                    .OrderByDescending(o => o.Key.Hora_Orden_Detalle)
                    .Take(10)
                        .Select(s => new
                        {
                            s.Key.Impresora,
                            s.Key.Mesa,
                            s.Key.Hora_Orden_Detalle,
                            detalle = s.Select(ss =>
                                new
                                {
                                    ss.Cantidad_Producto,
                                    Producto =
                                        ss.Productos.NombreProducto +
                                        (ss.Productos1.NombreProducto != null ?
                                        " CON " + ss.Productos1.NombreProducto : "") +
                                        (ss.ProductosUnidadesMedidas != null ?
                                        " (" + ss.ProductosUnidadesMedidas.UnidadesMedidas.Abreviatura + ") " : "") +
                                        (ss.Nota_Producto != null ?
                                        " " + ss.Nota_Producto : "")
                                }
                            )
                        }).ToList();
            }
        }
    }

    public class Comparacion
    {
        public String Dia { get; set; }
        public Nullable<Decimal> PrimeraVenta { get; set; }
        public Nullable<Decimal> SegundaVenta { get; set; }

        public Comparacion(String dia, Nullable<Decimal> primeraVenta, Nullable<Decimal> segundaVenta)
        {
            Dia = dia;
            PrimeraVenta = primeraVenta;
            SegundaVenta = segundaVenta;
        }
    }
}