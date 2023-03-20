using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class EstadosOrdenDetalleExtensions
    {
        public static EstadosOrdenDetalleDto ToDto(this EstadosOrdenDetalle domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new EstadosOrdenDetalleDto()
            {
                Codigo_Estado_Orden_Detalle = domain.Codigo_Estado_Orden_Detalle,
                Estado_Orden_Detalle = domain.Estado_Orden_Detalle,
                Activo = domain.Activo
            };
        }

        public static EstadosOrdenDetalle ToDomain(this EstadosOrdenDetalleDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new EstadosOrdenDetalle()
            {
                Codigo_Estado_Orden_Detalle = dto.Codigo_Estado_Orden_Detalle,
                Estado_Orden_Detalle = dto.Estado_Orden_Detalle,
                Activo = dto.Activo
            };
        }
    }
}