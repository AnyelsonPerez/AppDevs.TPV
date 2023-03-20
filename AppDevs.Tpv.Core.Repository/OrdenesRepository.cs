using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class OrdenesRepository : IRepository<Ordenes>
    {
        private readonly IDataContext _dataContext;

        public OrdenesRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public Ordenes Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Ordenes, object>(
                     "[SPC_GET_ORDEN]",
                     new { Codigo_Orden = id })
                 .FirstOrDefault();
        }

        public IEnumerable<Ordenes> Get(Ordenes entity)
        {
            return _dataContext
                .CallGetProcedure<Ordenes, object>(
                    "[SPC_GET_ORDEN]",
                    entity.ToDynamic())
                .ToList();
        }

        public Ordenes Set(Ordenes entity)
        {
            var id = _dataContext
               .CallSetProcedure(
                   "[SPC_SET_ORDEN]",
                   entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}