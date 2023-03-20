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
    public class TiposProductosService : IService<TiposProductosDto>
    {
        private readonly IRepository<TiposProductos> _TiposProductosRepository;

        public TiposProductosService(IRepository<TiposProductos> TiposProductosRepository)
        {
            _TiposProductosRepository = TiposProductosRepository ?? throw new ArgumentNullException(nameof(TiposProductosRepository));
        }

        public IEnumerable<TiposProductosDto> Get(TiposProductosDto perfil)
        {
            return _TiposProductosRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public TiposProductosDto Get(int id)
        {
            return _TiposProductosRepository
                .Get(id)
                .ToDto();
        }

        public TiposProductosDto Set(TiposProductosDto perfil)
        {
            return _TiposProductosRepository
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