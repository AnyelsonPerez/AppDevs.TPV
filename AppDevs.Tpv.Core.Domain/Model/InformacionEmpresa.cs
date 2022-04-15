namespace AppDevs.Tpv.Core.Domain.Model
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("InformacionEmpresa")]
    public partial class InformacionEmpresa
    {
        [Key]
        public int IdInformacionEmpresa { get; set; }

        [Required]
        [StringLength(100)]
        public string NombreEmpresa { get; set; }

        [StringLength(250)]
        public string Direccion { get; set; }

        [StringLength(10)]
        public string CodigoPostal { get; set; }

        [StringLength(50)]
        public string Provincia { get; set; }

        [StringLength(50)]
        public string Ciudad { get; set; }

        [StringLength(50)]
        public string Pais { get; set; }

        [StringLength(20)]
        public string CIF { get; set; }

        [StringLength(20)]
        public string NIF { get; set; }

        [StringLength(20)]
        public string Telefono { get; set; }

        [StringLength(20)]
        public string Movil { get; set; }

        [StringLength(100)]
        public string Facebook { get; set; }

        [StringLength(100)]
        public string NombreImpresoraBarra { get; set; }

        [StringLength(100)]
        public string NombreImpresoraCocina { get; set; }

        public decimal? PorcientoIVA { get; set; }

        [StringLength(50)]
        public string TipoLetraBarra { get; set; }

        [StringLength(50)]
        public string TipoLetraCocina { get; set; }

        public decimal? TamanoLetraBarra { get; set; }

        public decimal? TamanoLetraCocina { get; set; }

        [StringLength(1000)]
        public string PlantillaPedidoBarra { get; set; }

        [StringLength(1000)]
        public string PlantillaPedidoCocina { get; set; }

        [StringLength(1000)]
        public string PlantillaAnulacionBarra { get; set; }

        [StringLength(2000)]
        public string PlantillaCuenta { get; set; }
    }
}