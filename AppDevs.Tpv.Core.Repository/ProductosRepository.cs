using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class ProductosRepository : IRepository<Productos>
    {
        private readonly IDataContext _dataContext;

        public ProductosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<Productos> Get(Productos entity)
        {
            return _dataContext
                .CallGetProcedure<Productos, object>(
                    "[SPC_GET_PRODUCTO]",
                    entity.ToDynamic())
                .ToList();
        }

        public Productos Set(Productos entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_PRODUCTO]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public Productos Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Productos, object>(
                     "[SPC_GET_PRODUCTO]",
                     new { Codigo_Producto = id })
                 .FirstOrDefault();
        }
    }
}