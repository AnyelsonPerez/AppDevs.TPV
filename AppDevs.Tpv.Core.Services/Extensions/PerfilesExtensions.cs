using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class PerfilesExtensions
    {
        public static PerfilesDto ToDto(this Perfiles domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new PerfilesDto()
            {
                Codigo_Perfil = domain.Codigo_Perfil,
                Perfil = domain.Perfil,
                Activo = domain.Activo
            };
        }

        public static Perfiles ToDomain(this PerfilesDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Perfiles()
            {
                Codigo_Perfil = dto.Codigo_Perfil,
                Perfil = dto.Perfil,
                Activo = dto.Activo
            };
        }
    }
}