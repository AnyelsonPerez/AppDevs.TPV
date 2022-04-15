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

        public Usuarios AddOrUpdateUser(Usuarios usuario)
        {
            if (usuario == null)
            {
                return null;
            }

            return Upsert(usuario);
        }

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

        private Usuarios Upsert(Usuarios usuario)
        {
            var id = _dataContext.CallSetProcedure($"[SPC_SET_USUARIO]", usuario);

            return GetUsuarioById(id);
        }
    }
}