using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class ProductosUnidadesMedidasRepository : IRepository<ProductosUnidadesMedidas>
    {
        private readonly IDataContext _dataContext;

        public ProductosUnidadesMedidasRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<ProductosUnidadesMedidas> Get(ProductosUnidadesMedidas entity)
        {
            return _dataContext
                .CallGetProcedure<ProductosUnidadesMedidas, object>(
                    "[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]",
                    entity.ToDynamic())
                .ToList();
        }

        public ProductosUnidadesMedidas Set(ProductosUnidadesMedidas entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_PRODUCTOSUNIDADESMEDIDAS]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public ProductosUnidadesMedidas Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<ProductosUnidadesMedidas, object>(
                     "[SPC_GET_PRODUCTOSUNIDADESMEDIDAS]",
                     new { Codigo_Producto_Unidad_Medida = id })
                 .FirstOrDefault();
        }
    }
}