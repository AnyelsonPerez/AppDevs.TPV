namespace AppDevs.Tpv.Core.Domain.Model
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class OrdenesDetalles
    {
        [Key]
        public int Codigo_Orden_Detalle { get; set; }

        public int Codigo_Orden { get; set; }

        public int Codigo_Producto { get; set; }

        public int? Codigo_Producto_Unidad_Medida { get; set; }

        public int Cantidad_Producto { get; set; }

        public int? Codigo_Producto_Extra { get; set; }

        [Column(TypeName = "money")]
        public decimal Sub_Total_Precio_Producto { get; set; }

        public int? Cantidad_Personas { get; set; }

        [StringLength(50)]
        public string Nota_Producto { get; set; }

        public bool Primero { get; set; }

        public DateTime Hora_Orden_Detalle { get; set; }

        public int Codigo_Estado_Orden_Detalle { get; set; }

        public int Codigo_Usuario { get; set; }

        public bool Activo { get; set; }

        public virtual EstadosOrdenDetalle EstadosOrdenDetalle { get; set; }

        public virtual Ordenes Ordenes { get; set; }

        public virtual Productos Productos { get; set; }

        public virtual Productos ProductosExtra { get; set; }

        public virtual ProductosUnidadesMedidas ProductosUnidadesMedidas { get; set; }

        public virtual Usuarios Usuarios { get; set; }
    }
}