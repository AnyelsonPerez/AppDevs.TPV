using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class MesasExtensions
    {
        public static MesasDto ToDto(this Mesas domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new MesasDto()
            {
                Codigo_Mesa = domain.Codigo_Mesa,
                Altura = domain.Altura,
                Base = domain.Base,
                Codigo_Area = domain.Codigo_Area,
                Color_Mesa = domain.Color_Mesa,
                PosicionX = domain.PosicionX,
                PosicionY = domain.PosicionY,
                Mesa = domain.Mesa,
                Activo = domain.Activo
            };
        }

        public static Mesas ToDomain(this MesasDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Mesas()
            {
                Codigo_Mesa = dto.Codigo_Mesa,
                Altura = dto.Altura,
                Base = dto.Base,
                Codigo_Area = dto.Codigo_Area,
                Color_Mesa = dto.Color_Mesa,
                PosicionX = dto.PosicionX,
                PosicionY = dto.PosicionY,
                Mesa = dto.Mesa,
                Activo = dto.Activo
            };
        }
    }
}