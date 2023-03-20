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
    public class CategoriasProductoService : IService<CategoriasProductosDto>
    {
        private readonly IRepository<CategoriasProductos> _areasRepository;

        public CategoriasProductoService(IRepository<CategoriasProductos> areasRepository)
        {
            _areasRepository = areasRepository ?? throw new ArgumentNullException(nameof(areasRepository));
        }

        public IEnumerable<CategoriasProductosDto> Get(CategoriasProductosDto entidad)
        {
            return _areasRepository
                .Get(entidad.ToDomain())
                .Select(x => x.ToDto());
        }

        public CategoriasProductosDto Set(CategoriasProductosDto entidad)
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

            if (!entidad.Activo)
            {
                return true;
            }

            entidad.Activo = false;

            Set(entidad);

            return true;
        }

        public CategoriasProductosDto Get(int id)
        {
            return _areasRepository
                .Get(id)
                .ToDto();
        }
    }
}