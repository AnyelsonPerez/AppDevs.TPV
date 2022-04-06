namespace AppDevs.Tpv.Core.Domain
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class UnidadesMedidas
    {
        public UnidadesMedidas()
        {
            ProductosUnidadesMedidas = new HashSet<ProductosUnidadesMedidas>();
        }

        [Key]
        public int Codigo_Unidad_Medida { get; set; }

        [Required]
        [StringLength(15)]
        public string Unidad_Medida { get; set; }

        [StringLength(10)]
        public string Abreviatura { get; set; }

        public bool Activo { get; set; }

        public virtual ICollection<ProductosUnidadesMedidas> ProductosUnidadesMedidas { get; set; }
    }
}