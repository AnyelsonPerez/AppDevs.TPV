using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class TiposProductosExtensions
    {
        public static TiposProductosDto ToDto(this TiposProductos domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new TiposProductosDto()
            {
                Codigo_Tipo_Producto = domain.Codigo_Tipo_Producto,
                Tipo_Producto = domain.Tipo_Producto,
                Activo = domain.Activo
            };
        }

        public static TiposProductos ToDomain(this TiposProductosDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new TiposProductos()
            {
                Codigo_Tipo_Producto = dto.Codigo_Tipo_Producto,
                Tipo_Producto = dto.Tipo_Producto,
                Activo = dto.Activo
            };
        }
    }
}