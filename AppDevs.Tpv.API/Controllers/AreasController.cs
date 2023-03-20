using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.API.Controllers
{
    [Route("api/areas")]
    public class AreasController : ApiController
    {
        private readonly IService<AreasDto> _areasService;

        public AreasController(IService<AreasDto> areaSerive)
        {
            _areasService = areaSerive ?? throw new ArgumentNullException(nameof(areaSerive));
        }

        [HttpGet]
        public IEnumerable<AreasDto> Get([FromUri] AreasDto entity)
        {
            return _areasService.Get(entity);
        }

        [HttpPost]
        public AreasDto Create([FromBody] AreasDto entity)
        {
            if (entity is null || entity.Codigo_Area > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _areasService.Set(entity);
        }

        [HttpPut]
        public AreasDto Update([FromBody] AreasDto entity)
        {
            if (entity is null || entity.Codigo_Area == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _areasService.Set(entity);
        }

        [HttpDelete]
        public bool Delete(int id)
        {
            return _areasService.Delete(id);
        }

        [HttpGet]
        public AreasDto Get(int id)
        {
            return _areasService.Get(id);
        }
    }
}