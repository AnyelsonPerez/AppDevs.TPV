namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class UnidadesMedidasDto
    {
        public int Codigo_Unidad_Medida { get; set; }

        public string Unidad_Medida { get; set; }

        public string Abreviatura { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<ProductosUnidadesMedidasDto> ProductosUnidadesMedidas { get; set; }
    }
}