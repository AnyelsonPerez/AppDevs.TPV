using System;

namespace AppDevs.Tpv.Core.Domain.Model
{
    public class OrdenesDetalles
    {
        public int Codigo_Orden_Detalle { get; set; }

        public int Codigo_Orden { get; set; }

        public int Codigo_Producto { get; set; }

        public int? Codigo_Producto_Unidad_Medida { get; set; }

        public int Cantidad_Producto { get; set; }

        public int? Codigo_Producto_Extra { get; set; }

        public decimal Sub_Total_Precio_Producto { get; set; }

        public int? Cantidad_Personas { get; set; }

        public string Nota_Producto { get; set; }

        public bool Primero { get; set; }

        public DateTime Hora_Orden_Detalle { get; set; }

        public int Codigo_Estado_Orden_Detalle { get; set; }

        public int Codigo_Usuario { get; set; }

        public bool Activo { get; set; }
    }
}