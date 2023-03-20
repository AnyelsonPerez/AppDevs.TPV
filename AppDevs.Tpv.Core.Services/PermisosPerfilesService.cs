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
    public class PermisosPerfilesService : IService<PermisosPerfilesDto>
    {
        private readonly IRepository<PermisosPerfiles> _PermisosPerfilesRepository;

        public PermisosPerfilesService(IRepository<PermisosPerfiles> PermisosPerfilesRepository)
        {
            _PermisosPerfilesRepository = PermisosPerfilesRepository ?? throw new ArgumentNullException(nameof(PermisosPerfilesRepository));
        }

        public IEnumerable<PermisosPerfilesDto> Get(PermisosPerfilesDto perfil)
        {
            return _PermisosPerfilesRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public PermisosPerfilesDto Get(int id)
        {
            return _PermisosPerfilesRepository
                .Get(id)
                .ToDto();
        }

        public PermisosPerfilesDto Set(PermisosPerfilesDto perfil)
        {
            return _PermisosPerfilesRepository
                .Set(perfil.ToDomain())
                .ToDto();
        }

        public bool Delete(int id)
        {
            return false;
        }
    }
}