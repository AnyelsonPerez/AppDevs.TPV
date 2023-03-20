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
    public class PermisosService : IService<PermisosDto>
    {
        private readonly IRepository<Permisos> _PermisosRepository;

        public PermisosService(IRepository<Permisos> PermisosRepository)
        {
            _PermisosRepository = PermisosRepository ?? throw new ArgumentNullException(nameof(PermisosRepository));
        }

        public IEnumerable<PermisosDto> Get(PermisosDto perfil)
        {
            return _PermisosRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public PermisosDto Get(int id)
        {
            return _PermisosRepository
                .Get(id)
                .ToDto();
        }

        public PermisosDto Set(PermisosDto perfil)
        {
            return _PermisosRepository
                .Set(perfil.ToDomain())
                .ToDto();
        }

        public bool Delete(int id)
        {
            if (id == 0)
            {
                return false;
            }

            var perfil = Get(id);

            if (perfil == null)
            {
                return false;
            }

            if (!perfil.Activo)
            {
                return true;
            }

            perfil.Activo = false;

            Set(perfil);

            return true;
        }
    }
}