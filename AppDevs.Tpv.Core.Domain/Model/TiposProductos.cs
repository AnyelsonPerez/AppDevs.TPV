namespace AppDevs.Tpv.Core.Domain.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class TiposProductos
    {
        public TiposProductos()
        {
            Productos = new HashSet<Productos>();
        }

        [Key]
        public int Codigo_Tipo_Producto { get; set; }

        [Required]
        [StringLength(50)]
        public string Tipo_Producto { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<Productos> Productos { get; set; }
    }
}