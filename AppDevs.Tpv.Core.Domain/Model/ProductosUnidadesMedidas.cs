namespace AppDevs.Tpv.Core.Domain.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class ProductosUnidadesMedidas
    {
        public ProductosUnidadesMedidas()
        {
            OrdenesDetalles = new HashSet<OrdenesDetalles>();
        }

        [Key]
        public int Codigo_Producto_Unidad_Medida { get; set; }

        public int Codigo_Producto { get; set; }

        public int Codigo_Unidad_Medida { get; set; }

        [Column(TypeName = "money")]
        public decimal Precio_Venta { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }

        public virtual Productos Productos { get; set; }

        public virtual UnidadesMedidas UnidadesMedidas { get; set; }
    }
}