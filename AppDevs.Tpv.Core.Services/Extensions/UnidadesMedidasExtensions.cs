using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class UnidadesMedidasExtensions
    {
        public static UnidadesMedidasDto ToDto(this UnidadesMedidas domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new UnidadesMedidasDto()
            {
                Codigo_Unidad_Medida = domain.Codigo_Unidad_Medida,
                Abreviatura = domain.Abreviatura,
                Unidad_Medida = domain.Unidad_Medida,
                Activo = domain.Activo
            };
        }

        public static UnidadesMedidas ToDomain(this UnidadesMedidasDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new UnidadesMedidas()
            {
                Codigo_Unidad_Medida = dto.Codigo_Unidad_Medida,
                Abreviatura = dto.Abreviatura,
                Unidad_Medida = dto.Unidad_Medida,
                Activo = dto.Activo
            };
        }
    }
}