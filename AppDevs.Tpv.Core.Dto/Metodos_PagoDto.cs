namespace AppDevs.Tpv.Core.Dto
{
    using System.Collections.Generic;

    public class Metodos_PagoDto
    {
        public int Codigo_Metodo_Pago { get; set; }

        public string Metodo_Pago { get; set; }

        public bool Activo { get; set; }

        public IEnumerable<OrdenesDto> Ordenes { get; set; }
    }
}