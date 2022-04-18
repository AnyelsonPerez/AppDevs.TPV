using System.Collections.Generic;
using AppDevs.Tpv.Core.Domain.Model;

namespace AppDevs.Tpv.Core.Domain.Persistence.Interfaces
{
    public interface IPerfilesRepository
    {
        IEnumerable<Perfiles> GetPerfiles(Perfiles usuario);

        Perfiles GetPerfilById(int id);

        Perfiles SetPerfil(Perfiles perfil);
    }
}