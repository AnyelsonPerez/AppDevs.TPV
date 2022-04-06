namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class Productos
    {
        public Productos()
        {
            OrdenesDetalles = new HashSet<OrdenesDetalles>();
            OrdenesDetallesComoExtra = new HashSet<OrdenesDetalles>();
            ProductosUnidadesMedidas = new HashSet<ProductosUnidadesMedidas>();
        }

        [Key]
        public int Codigo_Producto { get; set; }

        public int Codigo_Categoria_Producto { get; set; }

        [Required]
        [StringLength(50)]
        public string NombreProducto { get; set; }

        [Column(TypeName = "image")]
        public byte[] ImagenProducto { get; set; }

        [Column(TypeName = "money")]
        public decimal PrecioVenta { get; set; }

        public int OrdenProducto { get; set; }

        public int Codigo_Tipo_Producto { get; set; }

        [Column(TypeName = "money")]
        public decimal? PrecioComoExtra { get; set; }

        public bool AceptaExtra { get; set; }

        public bool Impresora { get; set; }

        public bool Activo { get; set; }

        public virtual CategoriasProductos CategoriasProductos { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetallesComoExtra { get; set; }

        public virtual ICollection<ProductosUnidadesMedidas> ProductosUnidadesMedidas { get; set; }

        public virtual TiposProductos TiposProductos { get; set; }
    }
}