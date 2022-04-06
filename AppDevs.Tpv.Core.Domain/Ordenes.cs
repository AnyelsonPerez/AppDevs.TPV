using System;

namespace AppDevs.Tpv.Core.Domain
{
    public class Ordenes
    {
        public int Codigo_Orden { get; set; }

        public int Codigo_Mesa { get; set; }

        public int Comensales { get; set; }

        public DateTime Hora_Orden { get; set; }

        public int Codigo_Estado_Orden { get; set; }

        public int Codigo_Metodo_Pago { get; set; }

        public DateTime Hora_Pago { get; set; }

        public bool Activo { get; set; }
    }
}