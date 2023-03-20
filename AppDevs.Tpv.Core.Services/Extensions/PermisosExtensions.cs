using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class PermisosExtensions
    {
        public static PermisosDto ToDto(this Permisos domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new PermisosDto()
            {
                Codigo_Permiso = domain.Codigo_Permiso,
                Permiso = domain.Permiso,
                Activo = domain.Activo
            };
        }

        public static Permisos ToDomain(this PermisosDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Permisos()
            {
                Codigo_Permiso = dto.Codigo_Permiso,
                Permiso = dto.Permiso,
                Activo = dto.Activo
            };
        }
    }
}