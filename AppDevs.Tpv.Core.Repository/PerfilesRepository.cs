using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class PerfilesRepository : IRepository<Perfiles>
    {
        private readonly IDataContext _dataContext;

        public PerfilesRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<Perfiles> Get(Perfiles perfil)
        {
            return _dataContext
                .CallGetProcedure<Perfiles, object>(
                    "[SPC_GET_PERFIL]",
                    perfil.ToDynamic())
                .ToList();
        }

        public Perfiles Get(int id)
        {
            return _dataContext
                 .CallGetProcedure<Perfiles, object>(
                     "[SPC_GET_PERFIL]",
                     new { Codigo_Perfil = id })
                 .FirstOrDefault();
        }

        public Perfiles Set(Perfiles perfil)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_PERFIL]",
                    perfil);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}