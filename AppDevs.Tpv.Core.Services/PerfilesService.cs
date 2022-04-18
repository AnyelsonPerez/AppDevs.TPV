using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;
using AppDevs.Tpv.Core.Services.Extensions;

namespace AppDevs.Tpv.Core.Services
{
    public class PerfilesService : IPerfilesService
    {
        private readonly IPerfilesRepository _perfilesRepository;

        public PerfilesService(IPerfilesRepository perfilesRepository)
        {
            _perfilesRepository = perfilesRepository ?? throw new ArgumentNullException(nameof(perfilesRepository));
        }

        public IEnumerable<PerfilesDto> GetPerfiles(PerfilesDto perfil)
        {
            return _perfilesRepository
                .GetPerfiles(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public PerfilesDto GetPerfilById(int id)
        {
            return _perfilesRepository
                .GetPerfilById(id)
                .ToDto();
        }

        public PerfilesDto SetPerfil(PerfilesDto perfil)
        {
            return _perfilesRepository
                .SetPerfil(perfil.ToDomain())
                .ToDto();
        }

        public bool DeletePerfil(int id)
        {
            if (id == 0)
            {
                return false;
            }

            var perfil = GetPerfilById(id);

            if (perfil == null)
            {
                return false;
            }

            if (!perfil.Activo)
            {
                return true;
            }

            perfil.Activo = false;

            SetPerfil(perfil);

            return true;
        }
    }
}