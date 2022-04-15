using System;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.Core.Controllers
{
    [RoutePrefix("api/Usuarios")]
    public class UsuariosController : ApiController
    {
        private readonly IUsuariosService _usuariosService;

        public UsuariosController(IUsuariosService usuariosService)
        {
            _usuariosService = usuariosService ?? throw new ArgumentNullException(nameof(usuariosService));
        }

        [HttpGet]
        [Route("")]
        public UsuariosDto GetUsuario(int id)
        {
            return _usuariosService.GetUsuarioById(id);
        }

        [HttpGet]
        [Route("")]
        public UsuariosDto GetUsuario(string user, string password)
        {
            return _usuariosService.GetUsuarioByCredenciales(user, password);
        }
    }
}
