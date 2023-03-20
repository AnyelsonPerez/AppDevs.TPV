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
    public class AreasService : IService<AreasDto>
    {
        private readonly IRepository<Areas> _areasRepository;

        public AreasService(IRepository<Areas> areasRepository)
        {
            _areasRepository = areasRepository ?? throw new ArgumentNullException(nameof(areasRepository));
        }

        public IEnumerable<AreasDto> Get(AreasDto entidad)
        {
            return _areasRepository
                .Get(entidad.ToDomain())
                .Select(x => x.ToDto());
        }

        public AreasDto Set(AreasDto entidad)
        {
            return _areasRepository
                .Set(entidad.ToDomain())
                .ToDto();
        }

        public bool Delete(int id)
        {
            if (id == 0)
            {
                return false;
            }

            var entidad = Get(id);

            if (entidad == null)
            {
                return false;
            }

            if (!entidad.Activo.GetValueOrDefault())
            {
                return true;
            }

            entidad.Activo = false;

            Set(entidad);

            return true;
        }

        public AreasDto Get(int id)
        {
            return _areasRepository
                .Get(id)
                .ToDto();
        }
    }
}