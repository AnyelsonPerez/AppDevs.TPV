namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class AreasDto
    {
        public int? Codigo_Area { get; set; }

        public string Area { get; set; }

        public string Color_Area { get; set; }

        public int? Orden { get; set; }

        public bool? Activo { get; set; }

        public IEnumerable<MesasDto> Mesas { get; set; }
    }
}