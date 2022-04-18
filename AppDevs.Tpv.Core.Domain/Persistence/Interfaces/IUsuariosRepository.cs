using System.Collections.Generic;
using AppDevs.Tpv.Core.Domain.Model;

namespace AppDevs.Tpv.Core.Domain.Persistence.Interfaces
{
    public interface IUsuariosRepository
    {
        IEnumerable<Usuarios> GetUsuarios(Usuarios usuario);

        Usuarios GetUsuarioById(int id);

        Usuarios SetUsuario(Usuarios usuario);

        Usuarios GetUsuarioByUserNameAndPassword(string userName, string password);
    }
}