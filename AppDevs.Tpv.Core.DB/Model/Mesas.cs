namespace AppDevs.Tpv.Core.Domain.Model
{
    public class Mesas
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
    }
}