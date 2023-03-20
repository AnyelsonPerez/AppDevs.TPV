using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class CategoriasProductoExtensions
    {
        public static CategoriasProductosDto ToDto(this CategoriasProductos domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new CategoriasProductosDto()
            {
                Codigo_Categoria_Padre_Producto = domain.Codigo_Categoria_Padre_Producto,
                Codigo_Categoria_Producto = domain.Codigo_Categoria_Producto,
                Categoria_Producto = domain.Categoria_Producto,
                Orden = domain.Orden,
                Activo = domain.Activo
            };
        }

        public static CategoriasProductos ToDomain(this CategoriasProductosDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new CategoriasProductos()
            {
                Codigo_Categoria_Padre_Producto = dto.Codigo_Categoria_Padre_Producto,
                Codigo_Categoria_Producto = dto.Codigo_Categoria_Producto,
                Categoria_Producto = dto.Categoria_Producto,
                Orden = dto.Orden,
                Activo = dto.Activo
            };
        }
    }
}