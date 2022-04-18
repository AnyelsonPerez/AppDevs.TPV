using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class UsuariosExtensions
    {
        public static UsuariosDto ToDto(this Usuarios domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new UsuariosDto()
            {
                Codigo_Usuario = domain.Codigo_Usuario,
                Codigo_Perfil = domain.Codigo_Perfil,
                Usuario = domain.Usuario,
                Clave = domain.Clave,
                Nombre_Usuario = domain.Nombre_Usuario,
                Apellido_Usuario = domain.Apellido_Usuario,
                Activo = domain.Activo
            };
        }

        public static Usuarios ToDomain(this UsuariosDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Usuarios()
            {
                Codigo_Usuario = dto.Codigo_Usuario,
                Codigo_Perfil = dto.Codigo_Perfil,
                Usuario = dto.Usuario,
                Clave = dto.Clave,
                Nombre_Usuario = dto.Nombre_Usuario,
                Apellido_Usuario = dto.Apellido_Usuario,
                Activo = dto.Activo
            };
        }
    }
}