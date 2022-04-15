namespace AppDevs.Tpv.Core.Domain.Model
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Metodos_Pago
    {
        public Metodos_Pago()
        {
            Ordenes = new HashSet<Ordenes>();
        }

        [Key]
        public int Codigo_Metodo_Pago { get; set; }

        [Required]
        [StringLength(50)]
        public string Metodo_Pago { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<Ordenes> Ordenes { get; set; }
    }
}