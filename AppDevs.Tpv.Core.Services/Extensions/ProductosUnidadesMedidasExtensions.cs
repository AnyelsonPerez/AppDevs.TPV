using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class ProductosUnidadesMedidasExtensions
    {
        public static ProductosUnidadesMedidasDto ToDto(this ProductosUnidadesMedidas domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new ProductosUnidadesMedidasDto()
            {
                Codigo_Producto_Unidad_Medida = domain.Codigo_Producto_Unidad_Medida,
                Codigo_Producto = domain.Codigo_Producto,
                Codigo_Unidad_Medida = domain.Codigo_Unidad_Medida,
                Precio_Venta = domain.Precio_Venta,
                Activo = domain.Activo
            };
        }

        public static ProductosUnidadesMedidas ToDomain(this ProductosUnidadesMedidasDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new ProductosUnidadesMedidas()
            {
                Codigo_Producto_Unidad_Medida = dto.Codigo_Producto_Unidad_Medida,
                Codigo_Producto = dto.Codigo_Producto,
                Codigo_Unidad_Medida = dto.Codigo_Unidad_Medida,
                Precio_Venta = dto.Precio_Venta,
                Activo = dto.Activo
            };
        }
    }
}