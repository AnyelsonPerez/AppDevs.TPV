using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.Core.Controllers
{
    [RoutePrefix("api/perfiles")]
    public class PerfilesController : ApiController
    {
        private readonly IService<PerfilesDto> _perfilesService;

        public PerfilesController(IService<PerfilesDto> perfilesService)
        {
            _perfilesService = perfilesService ?? throw new ArgumentNullException(nameof(perfilesService));
        }

        [HttpGet]
        [Route("")]
        public IEnumerable<PerfilesDto> GetPerfiles([FromUri] PerfilesDto perfilDto)
        {
            return _perfilesService.Get(perfilDto);
        }

        [HttpPost]
        [Route("")]
        public PerfilesDto CreatePerfiles([FromBody] PerfilesDto perfilesDto)
        {
            if (perfilesDto is null || perfilesDto.Codigo_Perfil > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _perfilesService.Set(perfilesDto);
        }

        [HttpPut]
        [Route("")]
        public PerfilesDto UpdatePerfiles([FromBody] PerfilesDto perfilesDto)
        {
            if (perfilesDto is null || perfilesDto.Codigo_Perfil == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _perfilesService.Set(perfilesDto);
        }

        [HttpDelete]
        [Route("")]
        public bool DeletePerfil(int id)
        {
            return _perfilesService.Delete(id);
        }

        [HttpGet]
        [Route("")]
        public PerfilesDto GetPerfil(int id)
        {
            return _perfilesService.Get(id);
        }
    }
}