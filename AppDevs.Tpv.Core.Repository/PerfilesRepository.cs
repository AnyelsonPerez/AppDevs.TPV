using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;

namespace AppDevs.Tpv.Core.Repository
{
    public class PerfilesRepository : IPerfilesRepository
    {
        private readonly IDataContext _dataContext;

        public PerfilesRepository(IDataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public IEnumerable<Perfiles> GetPerfiles(Perfiles usuario)
        {
            return _dataContext
                .CallGetProcedure<Perfiles, Perfiles>(
                    "[SPC_GET_PERFIL]",
                    usuario)
                .ToList();
        }

        public Perfiles GetPerfilById(int id)
        {
            return _dataContext
                 .CallGetProcedure<Perfiles, object>(
                     "[SPC_GET_PERFIL]",
                     new { Codigo_Usuario = id })
                 .FirstOrDefault();
        }

        public Perfiles SetPerfil(Perfiles perfil)
        {
            var id = _dataContext
                .CallSetProcedure<Perfiles>(
                    "[SPC_SET_PERFIL]",
                    perfil);

            if (id == 0)
            {
                return null;
            }

            return GetPerfilById(id);
        }
    }
}