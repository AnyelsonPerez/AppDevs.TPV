using System.Collections.Generic;

namespace AppDevs.Tpv.Core.Dto.Interfaces
{
    public interface IService<T> where T : class
    {
        IEnumerable<T> Get(T Entidad);

        T Set(T Entidad);

        bool Delete(int id);

        T Get(int id);
    }
}