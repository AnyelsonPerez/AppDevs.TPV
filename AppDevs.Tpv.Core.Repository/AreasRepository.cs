using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class AreasRepository : IRepository<Areas>
    {
        private readonly IDataContext _dataContext;

        public AreasRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public Areas Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Areas, object>(
                     "[SPC_GET_AREA]",
                     new { Codigo_Area = id })
                 .FirstOrDefault();
        }

        public IEnumerable<Areas> Get(Areas area)
        {
            return _dataContext
                .CallGetProcedure<Areas, object>(
                    "[SPC_GET_AREA]",
                    area.ToDynamic())
                .ToList();
        }

        public Areas Set(Areas area)
        {
            var id = _dataContext
               .CallSetProcedure(
                   "[SPC_SET_AREA]",
                   area);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}