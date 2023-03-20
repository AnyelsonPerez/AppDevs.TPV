using System.Collections.Generic;

namespace AppDevs.Tpv.Core.Domain.Persistence.Interfaces
{
    public interface IRepository<T> where T : class
    {
        IEnumerable<T> Get(T area);

        T Get(int id);

        T Set(T area);
    }
}