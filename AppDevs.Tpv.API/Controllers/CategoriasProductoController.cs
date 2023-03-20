using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Http;
using AppDevs.Tpv.Core.Dto;
using AppDevs.Tpv.Core.Dto.Interfaces;

namespace AppDevs.Tpv.API.Controllers
{
    [Route("api/productos/categorias")]
    public class CategoriasProductoController : ApiController
    {
        private readonly IService<CategoriasProductosDto> _categoriasProductoService;

        public CategoriasProductoController(IService<CategoriasProductosDto> categoriasProductoService)
        {
            _categoriasProductoService = categoriasProductoService ?? throw new ArgumentNullException(nameof(categoriasProductoService));
        }

        [HttpGet]
        public IEnumerable<CategoriasProductosDto> Get([FromUri] CategoriasProductosDto categoria)
        {
            return _categoriasProductoService.Get(categoria);
        }

        [HttpPost]
        public CategoriasProductosDto Create([FromBody] CategoriasProductosDto categoria)
        {
            if (categoria is null || categoria.Codigo_Categoria_Producto > 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _categoriasProductoService.Set(categoria);
        }

        [HttpPut]
        public CategoriasProductosDto Update([FromBody] CategoriasProductosDto categoria)
        {
            if (categoria is null || categoria.Codigo_Categoria_Producto == 0)
            {
                throw new HttpResponseException(HttpStatusCode.BadRequest);
            }

            return _categoriasProductoService.Set(categoria);
        }

        [HttpDelete]
        public bool Delete(int id)
        {
            return _categoriasProductoService.Delete(id);
        }

        [HttpGet]
        public CategoriasProductosDto Get(int id)
        {
            return _categoriasProductoService.Get(id);
        }
    }
}