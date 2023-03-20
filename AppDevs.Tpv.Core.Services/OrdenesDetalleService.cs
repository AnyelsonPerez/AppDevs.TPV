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
    public class OrdenesDetalleService : IService<OrdenesDetallesDto>
    {
        private readonly IRepository<OrdenesDetalles> _repository;

        public OrdenesDetalleService(IRepository<OrdenesDetalles> repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public IEnumerable<OrdenesDetallesDto> Get(OrdenesDetallesDto entidad)
        {
            return _repository
                .Get(entidad.ToDomain())
                .Select(x => x.ToDto());
        }

        public OrdenesDetallesDto Set(OrdenesDetallesDto entidad)
        {
            return _repository
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

            if (!entidad.Activo)
            {
                return true;
            }

            entidad.Activo = false;

            Set(entidad);

            return true;
        }

        public OrdenesDetallesDto Get(int id)
        {
            return _repository
                .Get(id)
                .ToDto();
        }
    }
}