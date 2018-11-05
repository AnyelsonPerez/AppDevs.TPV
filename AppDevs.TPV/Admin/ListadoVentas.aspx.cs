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
    public partial class ListadoVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (new Utilidades().SoloVentas)
                Response.Redirect("/Admin/Dashboard.aspx", true);
        }

        #region Ventas
        [WebMethod(EnableSession = true)]
        public static object Listar_Ventas(int jtStartIndex, int jtPageSize, Nullable<DateTime> Desde, Nullable<DateTime> Hasta)
        {
            try
            {
                int total = 0;
                if (Desde.HasValue)
                    Desde = new DateTime(Desde.Value.Year, Desde.Value.Month, Desde.Value.Day, 6, 0, 0);

                if (!Hasta.HasValue)
                    Hasta = Desde;

                if (Hasta.HasValue)
                {
                    Hasta = Hasta.Value.AddDays(1);
                    Hasta = new DateTime(Hasta.Value.Year, Hasta.Value.Month, Hasta.Value.Day, 6, 0, 0);
                }

                using (var DB = new TPVDBEntities())
                {
                    var Resultado =
                        DB.Ordenes.Where(w => w.Activo && w.Codigo_Estado_Orden == 3
                            && w.Hora_Pago >= (Desde.HasValue ? Desde.Value : w.Hora_Pago)
                            && w.Hora_Pago <= (Hasta.HasValue ? Hasta.Value : w.Hora_Pago))
                            .OrderByDescending(o => o.Hora_Pago)
                            .AsEnumerable()
                            .Select(s => new
                            {
                                s.Codigo_Orden,
                                s.Mesas.Mesa,
                                s.Codigo_Metodo_Pago,
                                Hora_Pago = s.Hora_Pago.Value.ToString("dd/MM/yyyy HH:mm:ss"),
                                Total = s.OrdenesDetalles
                                    .Where(w => w.Activo)
                                    .Sum(ss => ss.Sub_Total_Precio_Producto != null ? ss.Sub_Total_Precio_Producto : 0)
                            })
                            .ToList();
                    total = Resultado.Count();

                    return new { Result = "OK", Records = Resultado.Skip(jtStartIndex).Take(jtPageSize), TotalRecordCount = total };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de ventas." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Modificar_Ventas(Ordenes record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var orden = DB.Ordenes.Where(w => w.Codigo_Orden == record.Codigo_Orden).First();
                    if (orden != null)
                    {
                        orden.Codigo_Metodo_Pago = record.Codigo_Metodo_Pago;
                        DB.SaveChanges();
                    }
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el perfil." };
            }
        }
        #endregion

        #region Productos Orden
        [WebMethod(EnableSession = true)]
        public static object Listar_Productos_Orden(int Codigo_Orden)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var detalle =
                        DB.SPC_GET_ORDENDETALLE(Codigo_Orden, null, 3, null, null, null, null, null, null).ToList();
                    /*var Resultado =
                        detalle.GroupBy(g => new { g.NombreProducto, g.OrdenFactura })
                        .Select(s => new
                        {
                            s.Key.NombreProducto,
                            Cantidad_Producto = s.Sum(ss => ss.Cantidad_Producto),
                            Sub_Total_Precio_Producto = s.Sum(ss => ss.Sub_Total_Precio_Producto),
                            s.Key.OrdenFactura
                        })
                        .OrderBy(o => o.OrdenFactura).ThenBy(t=> t.NombreProducto).ToList();*/

                    return new { Result = "OK", Records = detalle };
                }

            }
            catch
            {
                return new { Result = "ERROR", Message = "Ha ocurrido un error al cargar el listado de productos de venta." };
            }
        }

        //[WebMethod(EnableSession = true)]
        //public static object Agregar_Productos_Orden(OrdenesDetalles record)
        //{
        //    try
        //    {
        //        using (var DB = new TPVDBEntities())
        //        {
        //            record.Codigo_Estado_Orden_Detalle = 1;
        //            record.
        //            record.Activo = true;
        //            DB.OrdenesDetalles.Add(record);
        //        }
        //        return new { Result = "OK", Record = record };
        //    }
        //    catch
        //    {
        //        return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de agregar el producto." };
        //    }
        //}

        [WebMethod(EnableSession = true)]
        public static object Modificar_Productos_Orden(SPC_GET_ORDENDETALLE_Result record)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var ordenDetalle = DB.OrdenesDetalles.Where(w => w.Codigo_Orden_Detalle == record.Codigo_Orden_Detalle).First();
                    ordenDetalle.Cantidad_Producto = record.Cantidad_Producto;
                    ordenDetalle.Nota_Producto = record.Nota_Producto;
                    ordenDetalle.Sub_Total_Precio_Producto = record.Sub_Total_Precio_Producto;

                    if (ordenDetalle.Sub_Total_Precio_Producto == 0)
                        ordenDetalle.Nota_Producto += " INVITADO";
                    DB.SaveChanges();
                }
                return new { Result = "OK", Record = record };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el producto." };
            }
        }

        [WebMethod(EnableSession = true)]
        public static object Eliminar_Productos_Orden(int Codigo_Orden_Detalle)
        {
            try
            {
                using (var DB = new TPVDBEntities())
                {
                    var ordenDetalle = DB.OrdenesDetalles.Where(w => w.Codigo_Orden_Detalle == Codigo_Orden_Detalle).First();
                    ordenDetalle.Activo = false;
                    DB.SaveChanges();
                }
                return new { Result = "OK" };
            }
            catch
            {
                return new { Result = "ERROR", Message = "Ocurrió un inconveniente al momento de actualizar el producto." };
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