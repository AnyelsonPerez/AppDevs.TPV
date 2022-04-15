using System;
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
    }
}