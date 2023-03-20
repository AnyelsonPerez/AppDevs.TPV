using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.API.Controllers
{
    [Route("api/usuarios")]
    public class UsuariosController : ApiController
    {
        private readonly IService<UsuariosDto> _usuariosService;

        public UsuariosController(IService<UsuariosDto> usuariosService)
        {
            _usuariosService = usuariosService ?? throw new ArgumentNullException(nameof(usuariosService));
        }

        [HttpGet]
        public IEnumerable<UsuariosDto> GetUsuarios([FromUri] UsuariosDto entity)
        {
            return _usuariosService.Get(entity);
        }

        [HttpPost]
        public UsuariosDto CreateUsuarios([FromBody] UsuariosDto usuarioDto)
        {
            if (usuarioDto is null || usuarioDto.Codigo_Usuario > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _usuariosService.Set(usuarioDto);
        }

        [HttpPut]
        public UsuariosDto UpdateUsuarios([FromBody] UsuariosDto usuarioDto)
        {
            if (usuarioDto is null || usuarioDto.Codigo_Usuario == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _usuariosService.Set(usuarioDto);
        }

        [HttpDelete]
        public bool DeleteUsuario(int id)
        {
            return _usuariosService.Delete(id);
        }

        [HttpGet]
        public UsuariosDto GetUsuario(int id)
        {
            return _usuariosService.Get(id);
        }

        //[HttpGet]
        //[Route("")]
        //public UsuariosDto GetUsuario(string user, string password)
        //{
        //    return _usuariosService.GetUsuarioByCredenciales(user, password);
        //}
    }
}