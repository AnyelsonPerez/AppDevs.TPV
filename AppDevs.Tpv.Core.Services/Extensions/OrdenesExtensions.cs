using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class OrdenesExtensions
    {
        public static OrdenesDto ToDto(this Ordenes domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new OrdenesDto()
            {
                Codigo_Estado_Orden = domain.Codigo_Estado_Orden,
                Codigo_Mesa = domain.Codigo_Mesa,
                Codigo_Metodo_Pago = domain.Codigo_Metodo_Pago,
                Codigo_Orden = domain.Codigo_Orden,
                Comensales = domain.Comensales,
                Hora_Orden = domain.Hora_Orden,
                Hora_Pago = domain.Hora_Pago,
                Activo = domain.Activo
            };
        }

        public static Ordenes ToDomain(this OrdenesDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Ordenes()
            {
                Codigo_Estado_Orden = dto.Codigo_Estado_Orden,
                Codigo_Mesa = dto.Codigo_Mesa,
                Codigo_Metodo_Pago = dto.Codigo_Metodo_Pago,
                Codigo_Orden = dto.Codigo_Orden,
                Comensales = dto.Comensales,
                Hora_Orden = dto.Hora_Orden,
                Hora_Pago = dto.Hora_Pago,
                Activo = dto.Activo
            };
        }
    }
}