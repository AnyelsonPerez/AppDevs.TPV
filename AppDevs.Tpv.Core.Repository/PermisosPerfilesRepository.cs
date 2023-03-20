using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class PermisosPerfilesRepository : IRepository<PermisosPerfiles>
    {
        private readonly IDataContext _dataContext;

        public PermisosPerfilesRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<PermisosPerfiles> Get(PermisosPerfiles entity)
        {
            return _dataContext
                .CallGetProcedure<PermisosPerfiles, object>(
                    "[SPC_GET_PERMISOSPERFILES]",
                    entity.ToDynamic())
                .ToList();
        }

        public PermisosPerfiles Set(PermisosPerfiles entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_PERMISOSPERFILES]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }

        public PermisosPerfiles Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<PermisosPerfiles, object>(
                     "[SPC_GET_PERMISOSPERFILES]",
                     new { Codigo_Perfil_Permiso = id })
                 .FirstOrDefault();
        }
    }
}