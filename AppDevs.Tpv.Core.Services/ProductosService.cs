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
    public class ProductosService : IService<ProductosDto>
    {
        private readonly IRepository<Productos> _ProductosRepository;

        public ProductosService(IRepository<Productos> ProductosRepository)
        {
            _ProductosRepository = ProductosRepository ?? throw new ArgumentNullException(nameof(ProductosRepository));
        }

        public IEnumerable<ProductosDto> Get(ProductosDto perfil)
        {
            return _ProductosRepository
                .Get(perfil.ToDomain())
                .Select(x => x.ToDto());
        }

        public ProductosDto Get(int id)
        {
            return _ProductosRepository
                .Get(id)
                .ToDto();
        }

        public ProductosDto Set(ProductosDto perfil)
        {
            return _ProductosRepository
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