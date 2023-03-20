using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class CategoriasProductosRepository : IRepository<CategoriasProductos>
    {
        private readonly IDataContext _dataContext;

        public CategoriasProductosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public CategoriasProductos Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<CategoriasProductos, object>(
                     "[SPC_GET_CATEGORIA]",
                     new { Codigo_Categoria_Producto = id })
                 .FirstOrDefault();
        }

        public IEnumerable<CategoriasProductos> Get(CategoriasProductos entity)
        {
            return _dataContext
                .CallGetProcedure<CategoriasProductos, object>(
                    "[SPC_GET_CATEGORIA]",
                    entity.ToDynamic())
                .ToList();
        }

        public CategoriasProductos Set(CategoriasProductos entity)
        {
            var id = _dataContext
               .CallSetProcedure(
                   "[SPC_SET_CATEGORIA]",
                   entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}