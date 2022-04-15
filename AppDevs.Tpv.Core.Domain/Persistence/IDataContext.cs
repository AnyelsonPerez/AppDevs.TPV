using System.Collections.Generic;

namespace AppDevs.Tpv.Core.Domain.Persistence
{
    public interface IDataContext
    {
        int CallSetProcedure<T>(string query, T param) where T : class;

        IEnumerable<T> CallGetProcedure<T, U>(string query, U param) where T : class where U : class;
    }
}