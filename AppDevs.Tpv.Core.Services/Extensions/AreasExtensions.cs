using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class AreasExtensions
    {
        public static AreasDto ToDto(this Areas domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new AreasDto()
            {
                Codigo_Area = domain.Codigo_Area,
                Color_Area = domain.Color_Area,
                Area = domain.Area,
                Orden = domain.Orden,
                Activo = domain.Activo
            };
        }

        public static Areas ToDomain(this AreasDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Areas()
            {
                Codigo_Area = dto.Codigo_Area.GetValueOrDefault(),
                Color_Area = dto.Color_Area,
                Area = dto.Area,
                Orden = dto.Orden.GetValueOrDefault(),
                Activo = dto.Activo.GetValueOrDefault()
            };
        }
    }
}