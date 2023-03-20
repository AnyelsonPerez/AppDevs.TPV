using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class TiposProductosRepository : IRepository<TiposProductos>
    {
        private readonly IDataContext _dataContext;

        public TiposProductosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<TiposProductos> Get(TiposProductos entity)
        {
            return _dataContext
                .CallGetProcedure<TiposProductos, object>(
                    "[SPC_GET_TIPOPRODUCTO]",
                    entity.ToDynamic())
                .ToList();
        }

        public TiposProductos Set(TiposProductos entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_TIPOPRODUCTO]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public TiposProductos Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<TiposProductos, object>(
                     "[SPC_GET_TIPOPRODUCTO]",
                     new { Codigo_Tipo_Producto = id })
                 .FirstOrDefault();
        }
    }
}