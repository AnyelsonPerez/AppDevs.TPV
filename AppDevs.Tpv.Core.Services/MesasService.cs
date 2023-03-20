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
    public class MesasService : IService<MesasDto>
    {
        private readonly IRepository<Mesas> _mesasRepository;

        public MesasService(IRepository<Mesas> mesasRepository)
        {
            _mesasRepository = mesasRepository ?? throw new ArgumentNullException(nameof(mesasRepository));
        }

        public IEnumerable<MesasDto> Get(MesasDto entidad)
        {
            return _mesasRepository
                .Get(entidad.ToDomain())
                .Select(x => x.ToDto());
        }

        public MesasDto Set(MesasDto entidad)
        {
            return _mesasRepository
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

        public MesasDto Get(int id)
        {
            return _mesasRepository
                .Get(id)
                .ToDto();
        }
    }
}