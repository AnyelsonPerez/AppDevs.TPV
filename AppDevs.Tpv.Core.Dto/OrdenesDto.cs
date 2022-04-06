namespace AppDevs.Tpv.Core.Dto
{
    using System;
    using System.Collections.Generic;

    public class OrdenesDto
    {
        public int Codigo_Orden { get; set; }

        public int Codigo_Mesa { get; set; }

        public int Comensales { get; set; }

        public DateTime Hora_Orden { get; set; }

        public int Codigo_Estado_Orden { get; set; }

        public int? Codigo_Metodo_Pago { get; set; }

        public DateTime? Hora_Pago { get; set; }

        public bool Activo { get; set; }

        public EstadosOrdenDto EstadosOrden { get; set; }

        public MesasDto Mesas { get; set; }

        public Metodos_PagoDto Metodos_Pago { get; set; }

        public IEnumerable<OrdenesDetallesDto> OrdenesDetalles { get; set; }
    }
}