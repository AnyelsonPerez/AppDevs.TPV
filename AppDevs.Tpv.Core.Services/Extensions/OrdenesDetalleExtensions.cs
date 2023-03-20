using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class OrdenesDetalleExtensions
    {
        public static OrdenesDetallesDto ToDto(this OrdenesDetalles domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new OrdenesDetallesDto()
            {
                Codigo_Orden_Detalle = domain.Codigo_Orden_Detalle,
                Codigo_Orden = domain.Codigo_Orden,
                Cantidad_Personas = domain.Cantidad_Personas,
                Cantidad_Producto = domain.Cantidad_Producto,
                Codigo_Estado_Orden_Detalle = domain.Codigo_Estado_Orden_Detalle,
                Codigo_Producto = domain.Codigo_Producto,
                Codigo_Producto_Extra = domain.Codigo_Producto_Extra,
                Codigo_Producto_Unidad_Medida = domain.Codigo_Producto_Unidad_Medida,
                Codigo_Usuario = domain.Codigo_Usuario,
                Hora_Orden_Detalle = domain.Hora_Orden_Detalle,
                Nota_Producto = domain.Nota_Producto,
                Primero = domain.Primero,
                Sub_Total_Precio_Producto = domain.Sub_Total_Precio_Producto,
                Activo = domain.Activo
            };
        }

        public static OrdenesDetalles ToDomain(this OrdenesDetallesDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new OrdenesDetalles()
            {
                Codigo_Orden_Detalle = dto.Codigo_Orden_Detalle,
                Codigo_Orden = dto.Codigo_Orden,
                Cantidad_Personas = dto.Cantidad_Personas,
                Cantidad_Producto = dto.Cantidad_Producto,
                Codigo_Estado_Orden_Detalle = dto.Codigo_Estado_Orden_Detalle,
                Codigo_Producto = dto.Codigo_Producto,
                Codigo_Producto_Extra = dto.Codigo_Producto_Extra,
                Codigo_Producto_Unidad_Medida = dto.Codigo_Producto_Unidad_Medida,
                Codigo_Usuario = dto.Codigo_Usuario,
                Hora_Orden_Detalle = dto.Hora_Orden_Detalle,
                Nota_Producto = dto.Nota_Producto,
                Primero = dto.Primero,
                Sub_Total_Precio_Producto = dto.Sub_Total_Precio_Producto,
                Activo = dto.Activo
            };
        }
    }
}