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
    public class InformacionEmpresaService : IService<InformacionEmpresaDto>
    {
        private readonly IRepository<InformacionEmpresa> _repository;

        public InformacionEmpresaService(IRepository<InformacionEmpresa> repository)
        {
            _repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        public IEnumerable<InformacionEmpresaDto> Get(InformacionEmpresaDto entidad)
        {
            return _repository
                .Get(entidad.ToDomain())
                .Select(x => x.ToDto());
        }

        public InformacionEmpresaDto Set(InformacionEmpresaDto entidad)
        {
            return _repository
                .Set(entidad.ToDomain())
                .ToDto();
        }

        public bool Delete(int id)
        {
            return false;
        }

        public InformacionEmpresaDto Get(int id)
        {
            return _repository
                .Get(id)
                .ToDto();
        }
    }
}