namespace AppDevs.Tpv.Core.Domain
{
    using System.ComponentModel.DataAnnotations;

    public partial class VW_NUMEROFACTURAANUAL
    {
        [Key]
        public int Codigo_Orden { get; set; }

        public long? NumeroFactura { get; set; }
    }
}