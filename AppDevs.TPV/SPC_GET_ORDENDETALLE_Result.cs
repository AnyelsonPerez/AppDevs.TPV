//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppDevs.TPV
{
    using System;
    
    public partial class SPC_GET_ORDENDETALLE_Result
    {
        public int Codigo_Orden { get; set; }
        public int Codigo_Mesa { get; set; }
        public int Comensales { get; set; }
        public System.DateTime Hora_Orden { get; set; }
        public int Codigo_Estado_Orden { get; set; }
        public int Codigo_Orden_Detalle { get; set; }
        public int Codigo_Producto { get; set; }
        public Nullable<int> Codigo_Producto_Unidad_Medida { get; set; }
        public Nullable<int> Codigo_Producto_Extra { get; set; }
        public string NombreProducto { get; set; }
        public int Cantidad_Producto { get; set; }
        public Nullable<decimal> PrecioVenta { get; set; }
        public decimal Sub_Total_Precio_Producto { get; set; }
        public string Nota_Producto { get; set; }
        public System.DateTime Hora_Orden_Detalle { get; set; }
        public int Codigo_Estado_Orden_Detalle { get; set; }
        public bool Impresora { get; set; }
        public Nullable<bool> Primero { get; set; }
        public int Codigo_Usuario { get; set; }
        public bool Activo { get; set; }
        public string Mesa { get; set; }
        public int OrdenFactura { get; set; }
        public Nullable<System.DateTime> Hora_Pago { get; set; }
        public Nullable<long> NumeroFactura { get; set; }
    }
}
