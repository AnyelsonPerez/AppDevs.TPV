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
    public class PerfilesService : IService<PerfilesDto>
    {
        private readonly IRepository<Perfiles> _perfilesRepository;

        public PerfilesService(IRepository<Perfiles> perfilesRepository)
        {
            _perfilesRepository = perfilesRepository ?? throw new ArgumentNullException(nameof(perfilesRepository));
        }

        public IEnumerable<PerfilesDto> Get(PerfilesDto perfil)
        {
            return _perfilesRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public PerfilesDto Get(int id)
        {
            return _perfilesRepository
                .Get(id)
                .ToDto();
        }

        public PerfilesDto Set(PerfilesDto perfil)
        {
            return _perfilesRepository
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