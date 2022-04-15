using AppDevs.Tpv.Core.Domain.Model;

namespace AppDevs.Tpv.Core.Domain.Persistence.Interfaces
{
    public interface IUsuariosRepository
    {
        Usuarios GetUsuarioById(int id);

        Usuarios GetUsuarioByUserNameAndPassword(string userName, string password);
    }
}