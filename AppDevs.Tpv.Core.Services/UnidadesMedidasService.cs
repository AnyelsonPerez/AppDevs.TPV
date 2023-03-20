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
    public class UnidadesMedidasService : IService<UnidadesMedidasDto>
    {
        private readonly IRepository<UnidadesMedidas> _UnidadesMedidasRepository;

        public UnidadesMedidasService(IRepository<UnidadesMedidas> UnidadesMedidasRepository)
        {
            _UnidadesMedidasRepository = UnidadesMedidasRepository ?? throw new ArgumentNullException(nameof(UnidadesMedidasRepository));
        }

        public IEnumerable<UnidadesMedidasDto> Get(UnidadesMedidasDto perfil)
        {
            return _UnidadesMedidasRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public UnidadesMedidasDto Get(int id)
        {
            return _UnidadesMedidasRepository
                .Get(id)
                .ToDto();
        }

        public UnidadesMedidasDto Set(UnidadesMedidasDto perfil)
        {
            return _UnidadesMedidasRepository
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