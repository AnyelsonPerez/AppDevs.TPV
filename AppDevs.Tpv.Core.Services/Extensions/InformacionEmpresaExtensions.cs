using AppDevs.Tpv.Core.Domain.Model;
using AppDevs.Tpv.Core.Dto;

namespace AppDevs.Tpv.Core.Services.Extensions
{
    public static class InformacionEmpresaExtensions
    {
        public static InformacionEmpresaDto ToDto(this InformacionEmpresa domain)
        {
            if (domain == null)
            {
                return null;
            }

            return new InformacionEmpresaDto()
            {
                IdInformacionEmpresa = domain.IdInformacionEmpresa,
                NombreEmpresa = domain.NombreEmpresa,
                Direccion = domain.Direccion,
                CodigoPostal = domain.CodigoPostal,
                Provincia = domain.Provincia,
                Ciudad = domain.Ciudad,
                Pais = domain.Pais,
                CIF = domain.CIF,
                NIF = domain.NIF,
                Telefono = domain.Telefono,
                Movil = domain.Movil,
                Facebook = domain.Facebook,
                NombreImpresoraBarra = domain.NombreImpresoraBarra,
                NombreImpresoraCocina = domain.NombreImpresoraCocina,
                PorcientoIVA = domain.PorcientoIVA,
                TipoLetraBarra = domain.TipoLetraBarra,
                TipoLetraCocina = domain.TipoLetraCocina,
                TamanoLetraBarra = domain.TamanoLetraBarra,
                TamanoLetraCocina = domain.TamanoLetraCocina,
                PlantillaPedidoBarra = domain.PlantillaPedidoBarra,
                PlantillaPedidoCocina = domain.PlantillaPedidoCocina,
                PlantillaAnulacionBarra = domain.PlantillaAnulacionBarra,
                PlantillaCuenta = domain.PlantillaCuenta
            };
        }

        public static InformacionEmpresa ToDomain(this InformacionEmpresaDto dto)
        {
            if (dto == null)
            {
                return null;
            }

            return new InformacionEmpresa()
            {
                IdInformacionEmpresa = dto.IdInformacionEmpresa,
                NombreEmpresa = dto.NombreEmpresa,
                Direccion = dto.Direccion,
                CodigoPostal = dto.CodigoPostal,
                Provincia = dto.Provincia,
                Ciudad = dto.Ciudad,
                Pais = dto.Pais,
                CIF = dto.CIF,
                NIF = dto.NIF,
                Telefono = dto.Telefono,
                Movil = dto.Movil,
                Facebook = dto.Facebook,
                NombreImpresoraBarra = dto.NombreImpresoraBarra,
                NombreImpresoraCocina = dto.NombreImpresoraCocina,
                PorcientoIVA = dto.PorcientoIVA,
                TipoLetraBarra = dto.TipoLetraBarra,
                TipoLetraCocina = dto.TipoLetraCocina,
                TamanoLetraBarra = dto.TamanoLetraBarra,
                TamanoLetraCocina = dto.TamanoLetraCocina,
                PlantillaPedidoBarra = dto.PlantillaPedidoBarra,
                PlantillaPedidoCocina = dto.PlantillaPedidoCocina,
                PlantillaAnulacionBarra = dto.PlantillaAnulacionBarra,
                PlantillaCuenta = dto.PlantillaCuenta
            };
        }
    }
}