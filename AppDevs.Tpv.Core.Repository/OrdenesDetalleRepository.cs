using System;
using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class OrdenesDetalleRepository : IRepository<OrdenesDetalles>
    {
        private readonly IDataContext _dataContext;

        public OrdenesDetalleRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new ArgumentNullException(nameof(dataContext));
        }

        public OrdenesDetalles Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<OrdenesDetalles, object>(
                     "[SPC_GET_ORDENDETALLE]",
                     new { Codigo_Orden_Detalle = id })
                 .FirstOrDefault();
        }

        public IEnumerable<OrdenesDetalles> Get(OrdenesDetalles entity)
        {
            return _dataContext
                .CallGetProcedure<OrdenesDetalles, object>(
                    "[SPC_GET_ORDENDETALLE]",
                    entity.ToDynamic())
                .ToList();
        }

        public OrdenesDetalles Set(OrdenesDetalles entity)
        {
            var id = _dataContext
               .CallSetProcedure(
                   "[SPC_SET_ORDENDETALLE]",
                   entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}