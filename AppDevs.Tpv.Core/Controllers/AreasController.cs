using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.Core.Controllers
{
    [RoutePrefix("api/areas")]
    public class AreasController : ApiController
    {
        private readonly IService<AreasDto> _areasService;

        public AreasController(IService<AreasDto> areaSerive)
        {
            _areasService = areaSerive ?? throw new ArgumentNullException(nameof(areaSerive));
        }

        [HttpGet]
        [Route("")]
        public IEnumerable<AreasDto> Get([FromUri] AreasDto area)
        {
            return _areasService.Get(area);
        }

        [HttpPost]
        [Route("")]
        public AreasDto Create([FromBody] AreasDto area)
        {
            if (area is null || area.Codigo_Area > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _areasService.Set(area);
        }

        [HttpPut]
        [Route("")]
        public AreasDto Update([FromBody] AreasDto area)
        {
            if (area is null || area.Codigo_Area == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _areasService.Set(area);
        }

        [HttpDelete]
        [Route("")]
        public bool Delete(int id)
        {
            return _areasService.Delete(id);
        }

        [HttpGet]
        [Route("")]
        public AreasDto Get(int id)
        {
            return _areasService.Get(id);
        }
    }
}