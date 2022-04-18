using System;
using System.Collections.Generic;
using System.Net;
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
        public IEnumerable<UsuariosDto> GetUsuarios([FromUri] UsuariosDto usuarioDto)
        {
            return _usuariosService.GetUsuarios(usuarioDto);
        }

        [HttpPost]
        [Route("")]
        public UsuariosDto CreateUsuarios([FromBody] UsuariosDto usuarioDto)
        {
            if (usuarioDto is null || usuarioDto.Codigo_Usuario > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _usuariosService.SetUsuario(usuarioDto);
        }

        [HttpPut]
        [Route("")]
        public UsuariosDto UpdateUsuarios([FromBody] UsuariosDto usuarioDto)
        {
            if (usuarioDto is null || usuarioDto.Codigo_Usuario == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _usuariosService.SetUsuario(usuarioDto);
        }

        [HttpDelete]
        [Route("")]
        public bool DeleteUsuario(int id)
        {
            return _usuariosService.DeleteUsuario(id);
        }

        [HttpGet]
        [Route("")]
        public UsuariosDto GetUsuario(int id)
        {
            return _usuariosService.GetUsuarioById(id);
        }

        //[HttpGet]
        //[Route("")]
        //public UsuariosDto GetUsuario(string user, string password)
        //{
        //    return _usuariosService.GetUsuarioByCredenciales(user, password);
        //}
    }
}