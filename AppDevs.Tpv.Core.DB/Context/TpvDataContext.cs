using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Dapper;

namespace AppDevs.Tpv.Core.DB.Context
{
    public class TpvDataContext
    {
        public TpvDataContext()
        {
        }

        public int Set<T>(string query, T Parameters, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        {
            using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
            {
                var identity = connection.ExecuteScalar(query, Parameters, commandType: commandType);

                int.TryParse(identity.ToString(), out var id);

                return id;
            }
        }

        public IEnumerable<T> Get<T, U>(string query, U Parameters, string ConnectionId = "Default", CommandType commandType = CommandType.Text)
        {
            using (IDbConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionId]?.ConnectionString))
            {
                return connection.Query<T>(query, Parameters, commandType: commandType);
            }
        }
    }
}