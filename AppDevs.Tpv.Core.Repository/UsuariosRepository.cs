using System.Collections.Generic;
using System.Linq;
using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Domain.Persistence;
using AppDevs.Tpv.Core.Domain.Persistence.Interfaces;

namespace AppDevs.Tpv.Core.Repository
{
    public class UsuariosRepository : IUsuariosRepository
    {
        private readonly IDataContext _dataContext;

        public UsuariosRepository(IDataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public IEnumerable<Usuarios> GetUsuarios(Usuarios usuario)
        {
            return _dataContext
                .CallGetProcedure<Usuarios, Usuarios>(
                    "[SPC_GET_USUARIO]",
                    usuario)
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

        public Usuarios GetUsuarioById(int id)
        {
            return _dataContext
                .CallGetProcedure<Usuarios, object>(
                    "[SPC_GET_USUARIO]",
                    new { Codigo_Usuario = id })
                .FirstOrDefault();
        }

        public Usuarios GetUsuarioByUserNameAndPassword(string nombre, string clave)
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

        public Usuarios SetUsuario(Usuarios usuario)
        {
            var id = _dataContext
                .CallSetProcedure<Usuarios>(
                    "[SPC_SET_USUARIO]",
                    usuario);

            if (id == 0)
            {
                return null;
            }

            return GetUsuarioById(id);
        }
    }
}