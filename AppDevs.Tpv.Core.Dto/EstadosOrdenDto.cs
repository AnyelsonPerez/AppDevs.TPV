namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class EstadosOrdenDto
    {
        public int Codigo_Estado_Orden { get; set; }

        public string Estado_Orden { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<OrdenesDto> Ordenes { get; set; }
    }
}