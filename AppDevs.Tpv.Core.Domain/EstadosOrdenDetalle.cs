namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("EstadosOrdenDetalle")]
    public partial class EstadosOrdenDetalle
    {
        public EstadosOrdenDetalle()
        {
            OrdenesDetalles = new HashSet<OrdenesDetalles>();
        }

        [Key]
        public int Codigo_Estado_Orden_Detalle { get; set; }

        [Required]
        [StringLength(50)]
        public string Estado_Orden_Detalle { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<OrdenesDetalles> OrdenesDetalles { get; set; }
    }
}