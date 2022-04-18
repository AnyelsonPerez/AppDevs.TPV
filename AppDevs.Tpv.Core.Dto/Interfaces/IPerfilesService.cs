using System.Collections.Generic;

namespace AppDevs.Tpv.Core.Dto.Interfaces
{
    public interface IPerfilesService
    {
        IEnumerable<PerfilesDto> GetPerfiles(PerfilesDto Perfil);

        PerfilesDto SetPerfil(PerfilesDto Perfil);

        bool DeletePerfil(int id);

        PerfilesDto GetPerfilById(int id);
    }
}