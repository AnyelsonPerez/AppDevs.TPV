namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Mesas
    {
        public Mesas()
        {
            Ordenes = new HashSet<Ordenes>();
        }

        [Key]
        public int Codigo_Mesa { get; set; }

        [Required]
        [StringLength(50)]
        public string Mesa { get; set; }

        public int Codigo_Area { get; set; }

        [Required]
        [StringLength(20)]
        public string Color_Mesa { get; set; }

        [Required]
        [StringLength(10)]
        public string PosicionX { get; set; }

        [Required]
        [StringLength(10)]
        public string PosicionY { get; set; }

        [Required]
        [StringLength(10)]
        public string Base { get; set; }

        [Required]
        [StringLength(10)]
        public string Altura { get; set; }

        public bool Activo { get; set; }

        public virtual Areas Areas { get; set; }

        public virtual ICollection<Ordenes> Ordenes { get; set; }
    }
}