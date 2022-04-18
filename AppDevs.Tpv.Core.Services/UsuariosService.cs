using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;
using AppDevs.Tpv.Core.Services.Extensions;

namespace AppDevs.Tpv.Core.Services
{
    public class UsuariosService : IUsuariosService
    {
        private readonly IUsuariosRepository _usuariosRepository;

        public UsuariosService(IUsuariosRepository usuariosRepository)
        {
            _usuariosRepository = usuariosRepository ?? throw new ArgumentNullException(nameof(usuariosRepository));
        }

        public IEnumerable<UsuariosDto> GetUsuarios(UsuariosDto usuario)
        {
            return _usuariosRepository
                .GetUsuarios(usuario.ToDomain())
                .Select(x => x.ToDto());
        }

        public UsuariosDto GetUsuarioById(int id)
        {
            return _usuariosRepository
                .GetUsuarioById(id)
                .ToDto();
        }

        public UsuariosDto GetUsuarioByCredenciales(string usuario, string clave)
        {
            return _usuariosRepository
                .GetUsuarioByUserNameAndPassword(usuario, clave)
                .ToDto();
        }

        public UsuariosDto SetUsuario(UsuariosDto usuario)
        {
            return _usuariosRepository
                .SetUsuario(usuario.ToDomain())
                .ToDto();
        }

        public bool DeleteUsuario(int id)
        {
            if (id == 0)
            {
                return false;
            }

            var usuario = GetUsuarioById(id);

            if (usuario == null)
            {
                return false;
            }

            if (!usuario.Activo)
            {
                return true;
            }

            usuario.Activo = false;

            SetUsuario(usuario);

            return true;
        }
    }
}