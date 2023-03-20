using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class MetodosPagoExtensions
    {
        public static MetodosPagoDto ToDto(this Metodos_Pago domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new MetodosPagoDto()
            {
                Codigo_Metodo_Pago = domain.Codigo_Metodo_Pago,
                Metodo_Pago = domain.Metodo_Pago,
                Activo = domain.Activo
            };
        }

        public static Metodos_Pago ToDomain(this MetodosPagoDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Metodos_Pago()
            {
                Codigo_Metodo_Pago = dto.Codigo_Metodo_Pago,
                Metodo_Pago = dto.Metodo_Pago,
                Activo = dto.Activo
            };
        }
    }
}