using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class MesasRepository : IRepository<Mesas>
    {
        private readonly IDataContext _dataContext;

        public MesasRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public Mesas Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Mesas, object>(
                     "[SPC_GET_MESA]",
                     new { Codigo_Mesa = id })
                 .FirstOrDefault();
        }

        public IEnumerable<Mesas> Get(Mesas entity)
        {
            return _dataContext
                .CallGetProcedure<Mesas, object>(
                    "[SPC_GET_MESA]",
                    entity.ToDynamic())
                .ToList();
        }

        public Mesas Set(Mesas entity)
        {
            var id = _dataContext
               .CallSetProcedure(
                   "[SPC_SET_MESA]",
                   entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}