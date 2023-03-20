namespace AppDevs.Tpv.Core.Dto
{
    public class InformacionEmpresaDto
    {
        public int IdInformacionEmpresa { get; set; }

        public string NombreEmpresa { get; set; }

        public string Direccion { get; set; }

        public string CodigoPostal { get; set; }

        public string Provincia { get; set; }

        public string Ciudad { get; set; }

        public string Pais { get; set; }

        public string CIF { get; set; }

        public string NIF { get; set; }

        public string Telefono { get; set; }

        public string Movil { get; set; }

        public string Facebook { get; set; }

        public string NombreImpresoraBarra { get; set; }

        public string NombreImpresoraCocina { get; set; }

        public decimal? PorcientoIVA { get; set; }

        public string TipoLetraBarra { get; set; }

        public string TipoLetraCocina { get; set; }

        public decimal? TamanoLetraBarra { get; set; }

        public decimal? TamanoLetraCocina { get; set; }

        public string PlantillaPedidoBarra { get; set; }

        public string PlantillaPedidoCocina { get; set; }

        public string PlantillaAnulacionBarra { get; set; }

        public string PlantillaCuenta { get; set; }
    }
}