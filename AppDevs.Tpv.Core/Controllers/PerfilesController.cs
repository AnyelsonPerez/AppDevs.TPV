using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.Core.Controllers
{
    [RoutePrefix("api/Perfiles")]
    public class PerfilesController : ApiController
    {
        private readonly IPerfilesService _perfilesService;

        public PerfilesController(IPerfilesService perfilesService)
        {
            _perfilesService = perfilesService ?? throw new ArgumentNullException(nameof(perfilesService));
        }

        [HttpGet]
        [Route("")]
        public IEnumerable<PerfilesDto> GetPerfiles([FromUri] PerfilesDto perfilDto)
        {
            return _perfilesService.GetPerfiles(perfilDto);
        }

        [HttpPost]
        [Route("")]
        public PerfilesDto CreatePerfiles([FromBody] PerfilesDto perfilesDto)
        {
            if (perfilesDto is null || perfilesDto.Codigo_Perfil > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _perfilesService.SetPerfil(perfilesDto);
        }

        [HttpPut]
        [Route("")]
        public PerfilesDto UpdatePerfiles([FromBody] PerfilesDto perfilesDto)
        {
            if (perfilesDto is null || perfilesDto.Codigo_Perfil == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _perfilesService.SetPerfil(perfilesDto);
        }

        [HttpDelete]
        [Route("")]
        public bool DeletePerfil(int id)
        {
            return _perfilesService.DeletePerfil(id);
        }

        [HttpGet]
        [Route("")]
        public PerfilesDto GetPerfil(int id)
        {
            return _perfilesService.GetPerfilById(id);
        }

        //[HttpGet]
        //[Route("")]
        //public UsuariosDto GetUsuario(string user, string password)
        //{
        //    return _usuariosService.GetUsuarioByCredenciales(user, password);
        //}
    }
}