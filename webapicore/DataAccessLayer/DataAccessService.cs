using System;
using System.Collections.Generic;
using System.Data;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using Dapper;
using MySql.Data.MySqlClient;
using StackExchange.Profiling;
using StackExchange.Profiling.Data;
using webapicore.Enums;
using webapicore.Extension;

namespace webapicore.DataAccessLayer
{
    public class DataAccessLayer
    {
        private static string _connectionStr = "server=10.0.4.29;Database=paintercol;user id=maple;password=aicdfida";

        public static string connectionStr { get { return _connectionStr; } }

        private int _connectionTimeout = 20;
        private bool _enableMiniprofiler = true;

        public async Task<IEnumerable<TReturn>> QueryAsync<TReturn>(string querSql, object param = null, CommandType commandType = CommandType.Text)
        {
            using (IDbConnection con = GetDbConnection())
            {
                return await con.QueryAsync<TReturn>(querSql, param, null, _connectionTimeout, commandType).ConfigureAwait(false);
            }
        }

        public async Task<TResult> QueryFirstOrdefaultAsync<TResult>(string querySql, object param = null, CommandType commandType = CommandType.Text)
        {
            using (IDbConnection con = GetDbConnection())
            {
                return await con.QueryFirstOrDefaultAsync<TResult>(querySql, param, null, _connectionTimeout, commandType).ConfigureAwait(false);
            }
        }

        public async Task<IEnumerable<TReturn>> CallSP<TReturn>(Stored_ProcedureEnum stored_ProcedureEnum, object param = null)
        {
            return await QueryAsync<TReturn>(stored_ProcedureEnum.GetDescription(), param, CommandType.StoredProcedure);
        }
        private IDbConnection GetDbConnection()
        {
            IDbConnection dbConnection;
            if (!_enableMiniprofiler)
            {
                dbConnection = new MySqlConnection(connectionStr);
            }
            else
            {
                dbConnection = new ProfiledDbConnection(new MySqlConnection(_connectionStr), MiniProfiler.Current);
            }

            if (dbConnection.State != ConnectionState.Open)
            {
                dbConnection.Open();
            }
            return dbConnection;
        }
    }
}