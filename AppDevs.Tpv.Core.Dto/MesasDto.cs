namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class MesasDto
    {
        public int Codigo_Mesa { get; set; }

        public string Mesa { get; set; }

        public int Codigo_Area { get; set; }

        public string Color_Mesa { get; set; }

        public string PosicionX { get; set; }

        public string PosicionY { get; set; }

        public string Base { get; set; }

        public string Altura { get; set; }

        public bool Activo { get; set; }

        public AreasDto Areas { get; set; }

        public IEnumerable<OrdenesDto> Ordenes { get; set; }
    }
}