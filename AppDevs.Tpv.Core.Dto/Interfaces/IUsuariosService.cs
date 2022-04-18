using System.Collections.Generic;

namespace AppDevs.Tpv.Core.Dto.Interfaces
{
    public interface IUsuariosService
    {
        IEnumerable<UsuariosDto> GetUsuarios(UsuariosDto usuario);

        UsuariosDto SetUsuario(UsuariosDto usuario);

        bool DeleteUsuario(int id);

        UsuariosDto GetUsuarioById(int id);

        UsuariosDto GetUsuarioByCredenciales(string usuario, string clave);
    }
}