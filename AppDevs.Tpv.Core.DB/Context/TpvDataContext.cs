using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Dapper;

namespace AppDevs.Tpv.Core.DB.Context
{
    public class TpvDataContext
    {
        //private readonly IConfiguration _config;

        public TpvDataContext(/*IConfiguration config*/)
        {
            /*if (config is null)
            {
                throw new ArgumentNullException(nameof(config));
            }

            _config = config;*/
        }

        //public IEnumerable<T> GetAll<T>(string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        //{
        //    string query = $"SELECT * FROM {nameof(T)}";
        //    return Query<T, object>(query, null, ConnectionId, commandType);
        //}

        //public IEnumerable<T> Query<T>(string query, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        //{
        //    return Query<T, object>(query, null, ConnectionId, commandType);
        //}

        //public IEnumerable<T> Query<T, U>(string query, U Parameters, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        //{
        //    using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
        //    {
        //        return connection.Query<T>(query, Parameters, commandType: commandType);
        //    }
        //}

        //public T QueryFirstOrDefault<T>(string query, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        //{
        //    using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
        //    {
        //        return connection.QueryFirstOrDefault<T>(query, commandType: commandType);
        //    }
        //}

        public int Set<T>(string query, T Parameters, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        {
            using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
            {
                var identity = connection.ExecuteScalar(query, Parameters, commandType: commandType);

                int.TryParse(identity.ToString(), out var id);

                return id;
            }
        }
        public IEnumerable<T> Get<T,U>(string query, U Parameters, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        {
            using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
            {
                return connection.Query<T>(query, Parameters, commandType: commandType);            }
        }

        //public void Execute(string query, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        //{
        //    using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
        //    {
        //        connection.Execute(query, commandType: commandType);
        //    }
        //}
    }
}