namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class EstadosOrdenDetalleDto
    {
        public int Codigo_Estado_Orden_Detalle { get; set; }

        public string Estado_Orden_Detalle { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetalles { get; set; }
    }
}