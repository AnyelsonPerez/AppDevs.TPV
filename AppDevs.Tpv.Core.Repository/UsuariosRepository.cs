using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;
using AppDevs.Tpv.Core.Repository.Extensions;

namespace AppDevs.Tpv.Core.Repository
{
    public class UsuariosRepository : IRepository<Usuarios>
    {
        private readonly IDataContext _dataContext;

        public UsuariosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext ?? throw new System.ArgumentNullException(nameof(dataContext));
        }

        public IEnumerable<Usuarios> Get(Usuarios entity)
        {
            return _dataContext
                .CallGetProcedure<Usuarios, object>(
                    "[SPC_GET_USUARIO]",
                    entity.ToDynamic())
                .ToList();
        }

        //public Usuarios AddOrUpdateUser(Usuarios usuario)
        //{
        //    if (usuario == null)
        //    {
        //        return null;
        //    }

        //    return Upsert(usuario);
        //}

        public Usuarios Get(int id)
        {
            return _dataContext
                .CallGetProcedure<Usuarios, object>(
                    "[SPC_GET_USUARIO]",
                    new { Codigo_Usuario = id })
                .FirstOrDefault();
        }

        public Usuarios Get(string nombre, string clave)
        {
            return _dataContext
                .CallGetProcedure<Usuarios, object>(
                    "[SPC_GET_USUARIO]",
                    new { Usuario = nombre, Clave = clave })
                .FirstOrDefault();
        }

        //private Usuarios Upsert(Usuarios usuario)
        //{
        //    var id = _dataContext.CallSetProcedure($"[SPC_SET_USUARIO]", usuario);

        //    return GetUsuarioById(id);
        //}

        public Usuarios Set(Usuarios entity)
        {
            var id = _dataContext
                .CallSetProcedure(
                    "[SPC_SET_USUARIO]",
                    entity);

            if (id == 0)
            {
                return null;
            }

            return Get(id);
        }
    }
}