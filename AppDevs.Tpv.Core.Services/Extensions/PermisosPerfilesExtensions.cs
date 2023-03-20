using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class PermisosPerfilesExtensions
    {
        public static PermisosPerfilesDto ToDto(this PermisosPerfiles domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new PermisosPerfilesDto()
            {
                Codigo_Perfil_Permiso = domain.Codigo_Perfil_Permiso,
                Codigo_Perfil = domain.Codigo_Perfil,
                Codigo_Permiso = domain.Codigo_Permiso
            };
        }

        public static PermisosPerfiles ToDomain(this PermisosPerfilesDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new PermisosPerfiles()
            {
                Codigo_Perfil_Permiso = dto.Codigo_Perfil_Permiso,
                Codigo_Perfil = dto.Codigo_Perfil,
                Codigo_Permiso = dto.Codigo_Permiso
            };
        }
    }
}