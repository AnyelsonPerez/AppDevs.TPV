using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class PermisosRepository : IRepository<Permisos>
    {
        private readonly IDataContext _dataContext;

        public PermisosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<Permisos> Get(Permisos entity)
        {
            return _dataContext
                .CallGetProcedure<Permisos, object>(
                    "[SPC_GET_PERMISO]",
                    entity.ToDynamic())
                .ToList();
        }

        public Permisos Set(Permisos entity)
        {
            var id = _dataContext
                .CallSetProcedure<Permisos>(
                    "[SPC_SET_PERMISO]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public Permisos Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Permisos, object>(
                     "[SPC_GET_PERMISO]",
                     new { Codigo_Permiso = id })
                 .FirstOrDefault();
        }
    }
}