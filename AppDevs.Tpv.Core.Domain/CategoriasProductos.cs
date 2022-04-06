namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class CategoriasProductos
    {
        public CategoriasProductos()
        {
            CategoriasProductosHijas = new HashSet<CategoriasProductos>();
            Productos = new HashSet<Productos>();
        }

        [Key]
        public int Codigo_Categoria_Producto { get; set; }

        public int? Codigo_Categoria_Padre_Producto { get; set; }

        [Required]
        [StringLength(50)]
        public string Categoria_Producto { get; set; }

        public int Orden { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<CategoriasProductos> CategoriasProductosHijas { get; set; }

        public virtual CategoriasProductos CategoriasProductosPadre { get; set; }

        public virtual ICollection<Productos> Productos { get; set; }
    }
}