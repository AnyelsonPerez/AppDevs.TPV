using System.Collections.Generic;
using AppDevs.Tpv.Core.DB.Context;
using AppDevs.Tpv.Core.Domain.Persistence;

namespace AppDevs.Tpv.Core.Repository
{
    public class DataContext : IDataContext
    {
        private readonly TpvDataContext _tpvDataContext;

        public DataContext(TpvDataContext tpvDataContext)
        {
            _tpvDataContext = tpvDataContext;
        }

        //public void Delete<T>(string Where) where T : class
        //{
        //    var query = $"UPDATE {nameof(T)} SET Activo = 0 WHERE {Where}";

        //    _tpvDataContext.Execute(query);
        //}

        //public IEnumerable<T> Select<T>(string query = null) where T : class
        //{
        //    if (query == null)
        //    {
        //        query = $"SELECT * FROM {nameof(T)} WITH(NOLOCK);";
        //    }

        //    return _tpvDataContext.Query<T>(query);
        //}

        //public void Execute(string query)
        //{
        //    _tpvDataContext.Execute(query);
        //}

        public int CallSetProcedure<T>(string query, T param) where T : class
        {
            return _tpvDataContext.Set(query, param, commandType: System.Data.CommandType.StoredProcedure);
        }
        public IEnumerable<T> CallGetProcedure<T, U>(string query, U param) where T : class where U : class
        {
            return _tpvDataContext.Get<T, U>(query, param, commandType: System.Data.CommandType.StoredProcedure);
        }

        //public T FirstOrDefault<T>(string query = null) where T : class
        //{
        //    if (query == null)
        //    {
        //        query = $"SELECT TOP 1 * FROM {nameof(T)} WITH(NOLOCK)";
        //    }

        //    return _tpvDataContext.QueryFirstOrDefault<T>(query);
        //}
    }
}