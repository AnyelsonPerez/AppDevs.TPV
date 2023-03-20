using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;
using AppDevs.Tpv.Core.Services.Extensions;

namespace AppDevs.Tpv.Core.Services
{
    public class UsuariosService : IService<UsuariosDto>
    {
        private readonly IRepository<Usuarios> _usuariosRepository;

        public UsuariosService(IRepository<Usuarios> usuariosRepository)
        {
            _usuariosRepository = usuariosRepository ?? throw new ArgumentNullException(nameof(usuariosRepository));
        }

        public IEnumerable<UsuariosDto> Get(UsuariosDto usuario)
        {
            return _usuariosRepository
                .Get(usuario.ToDomain())
                .Select(x => x.ToDto());
        }

        public UsuariosDto Get(int id)
        {
            return _usuariosRepository
                .Get(id)
                .ToDto();
        }

        public UsuariosDto Get(string usuario, string clave)
        {
            return _usuariosRepository
                .Get(new Usuarios { Usuario = usuario, Clave = clave })
                .FirstOrDefault()
                .ToDto();
        }

        public UsuariosDto Set(UsuariosDto usuario)
        {
            return _usuariosRepository
                .Set(usuario.ToDomain())
                .ToDto();
        }

        public bool Delete(int id)
        {
            if (id == 0)
            {
                return false;
            }

            var usuario = Get(id);

            if (usuario == null)
            {
                return false;
            }

            if (!usuario.Activo)
            {
                return true;
            }

            usuario.Activo = false;

            Set(usuario);

            return true;
        }
    }
}