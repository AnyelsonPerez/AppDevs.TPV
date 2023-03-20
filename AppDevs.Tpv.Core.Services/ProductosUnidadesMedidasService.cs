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
    public class ProductosUnidadesMedidasService : IService<ProductosUnidadesMedidasDto>
    {
        private readonly IRepository<ProductosUnidadesMedidas> _ProductosUnidadesMedidasRepository;

        public ProductosUnidadesMedidasService(IRepository<ProductosUnidadesMedidas> ProductosUnidadesMedidasRepository)
        {
            _ProductosUnidadesMedidasRepository = ProductosUnidadesMedidasRepository ?? throw new ArgumentNullException(nameof(ProductosUnidadesMedidasRepository));
        }

        public IEnumerable<ProductosUnidadesMedidasDto> Get(ProductosUnidadesMedidasDto perfil)
        {
            return _ProductosUnidadesMedidasRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public ProductosUnidadesMedidasDto Get(int id)
        {
            return _ProductosUnidadesMedidasRepository
                .Get(id)
                .ToDto();
        }

        public ProductosUnidadesMedidasDto Set(ProductosUnidadesMedidasDto perfil)
        {
            return _ProductosUnidadesMedidasRepository
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