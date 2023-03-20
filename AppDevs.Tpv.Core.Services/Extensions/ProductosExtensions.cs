using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class ProductosExtensions
    {
        public static ProductosDto ToDto(this Productos domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new ProductosDto()
            {
                Codigo_Producto = domain.Codigo_Producto,
                AceptaExtra = domain.AceptaExtra,
                Codigo_Categoria_Producto = domain.Codigo_Categoria_Producto,
                Codigo_Tipo_Producto = domain.Codigo_Tipo_Producto,
                ImagenProducto = domain.ImagenProducto,
                Impresora = domain.Impresora,
                NombreProducto = domain.NombreProducto,
                OrdenProducto = domain.OrdenProducto,
                PrecioComoExtra = domain.PrecioComoExtra,
                PrecioVenta = domain.PrecioVenta,
                Activo = domain.Activo
            };
        }

        public static Productos ToDomain(this ProductosDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new Productos()
            {
                Codigo_Producto = dto.Codigo_Producto,
                AceptaExtra = dto.AceptaExtra,
                Codigo_Categoria_Producto = dto.Codigo_Categoria_Producto,
                Codigo_Tipo_Producto = dto.Codigo_Tipo_Producto,
                ImagenProducto = dto.ImagenProducto,
                Impresora = dto.Impresora,
                NombreProducto = dto.NombreProducto,
                OrdenProducto = dto.OrdenProducto,
                PrecioComoExtra = dto.PrecioComoExtra,
                PrecioVenta = dto.PrecioVenta,
                Activo = dto.Activo
            };
        }
    }
}