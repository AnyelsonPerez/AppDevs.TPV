namespace AppDevs.Tpv.Core.Domain.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Areas
    {
        public Areas()
        {
            Mesas = new HashSet<Mesas>();
        }

        [Key]
        public int Codigo_Area { get; set; }

        [Required]
        [StringLength(50)]
        public string Area { get; set; }

        [StringLength(50)]
        public string Color_Area { get; set; }

        public int Orden { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<Mesas> Mesas { get; set; }
    }
}