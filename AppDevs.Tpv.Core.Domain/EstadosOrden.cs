namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("EstadosOrden")]
    public partial class EstadosOrden
    {
        public EstadosOrden()
        {
            Ordenes = new HashSet<Ordenes>();
        }

        [Key]
        public int Codigo_Estado_Orden { get; set; }

        [Required]
        [StringLength(50)]
        public string Estado_Orden { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<Ordenes> Ordenes { get; set; }
    }
}