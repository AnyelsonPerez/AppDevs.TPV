using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class EstadosOrdenExtensions
    {
        public static EstadosOrdenDto ToDto(this EstadosOrden domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new EstadosOrdenDto()
            {
                Codigo_Estado_Orden = domain.Codigo_Estado_Orden,
                Estado_Orden = domain.Estado_Orden,
                Activo = domain.Activo
            };
        }

        public static EstadosOrden ToDomain(this EstadosOrdenDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new EstadosOrden()
            {
                Codigo_Estado_Orden = dto.Codigo_Estado_Orden,
                Estado_Orden = dto.Estado_Orden,
                Activo = dto.Activo
            };
        }
    }
}