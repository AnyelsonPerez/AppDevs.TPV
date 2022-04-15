namespace AppDevs.Tpv.Core.Dto.Interfaces
{
    public interface IUsuariosService
    {
        UsuariosDto GetUsuarioById(int id);

        UsuariosDto GetUsuarioByCredenciales(string usuario, string clave);
    }
}