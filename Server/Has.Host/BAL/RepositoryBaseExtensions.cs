using BAL.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public static class RepositoryBaseExtensions
    {
        public static T GetEntity<T>(this RepositoryBase<T> repository, T entity, string sprocName)
        {
            try
            {
                Stopwatch sw = Stopwatch.StartNew();
                IDbCommand command = new SqlCommand().GetCommandWithParameters(entity, sprocName);
                SqlConnection conn = DBConnectionHelper.OpenNewSqlConnection(repository.ConnectionString);
                command.Connection = conn;
                entity = EntityMapper.MapSingle<T>(command.ExecuteReader());
                DBConnectionHelper.CloseSqlConnection(conn);
                sw.Stop();

            }
            catch (SqlException ex)
            {
                repository.ValidationErrors.Add("APPLICATION_WARNING_MESSAGE", ex.Message, false);
                entity = default(T);
            }
            return entity;
        }
        public static IDbCommand GetCommandWithParameters<T>(this IDbCommand command, T entity, string sprocName, bool isBatchOperation = false)
        {
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = sprocName;
            command.CommandTimeout = 240;
            command = SProcParamUtility.GenerateSQLParams(command, sprocName, entity, null, isBatchOperation);
            return command;
        }

        /// <summary>
        /// Gets Entity collection
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="repository"></param>
        /// <param name="entity"></param>
        /// <param name="sprocName"></param>
        /// <returns></returns>
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Security", "CA2100:Review SQL queries for security vulnerabilities")]
        // Supressing this as we pass sprocname from constant at all times
        public static List<T> GetEntityCollection<T>(this RepositoryBase<T> repository, T entity, string sprocName)
        {
            try
            {
                Stopwatch sw = Stopwatch.StartNew();
                IDbCommand command;
                if (entity != null)
                {
                    command = new SqlCommand().GetCommandWithParameters(entity, sprocName);
                }
                else
                {
                    command = new SqlCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = sprocName;
                }
                command.CommandTimeout = 240;
                SqlConnection conn = DBConnectionHelper.OpenNewSqlConnection(repository.ConnectionString);
                command.Connection = conn;
                List<T> entities = (List<T>)EntityMapper.MapCollection<T>(command.ExecuteReader());
                DBConnectionHelper.CloseSqlConnection(conn);
                sw.Stop();
                return entities;
            }
            catch (SqlException ex)
            {
                throw;
            }
        }

        /// <summary>
        ///
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="repository"></param>
        /// <param name="sprocParametersList"></param>
        /// <param name="sprocName"></param>
        /// <returns></returns>
        public static List<T> GetEntityCollection<T>(this RepositoryBase<T> repository, Dictionary<string, object> sprocParametersList, string sprocName)
        {
            try
            {
                Stopwatch sw = Stopwatch.StartNew();
                IDbCommand command = new SqlCommand().GetCommandWithParameters(sprocParametersList, sprocName);
                SqlConnection conn = DBConnectionHelper.OpenNewSqlConnection(repository.ConnectionString);
                command.Connection = conn;
                List<T> entities = (List<T>)EntityMapper.MapCollection<T>(command.ExecuteReader());
                DBConnectionHelper.CloseSqlConnection(conn);
                sw.Stop();
                return entities;
            }
            catch (SqlException ex)
            {
                throw;
            }
        }

        public static int InsertAndGetEntityID<T>(this RepositoryBase<T> repository, T entity, string sprocName)
        {
            int entityID;
            try
            {
                Stopwatch sw = Stopwatch.StartNew();
                IDbCommand command = new SqlCommand().GetCommandWithParameters(entity, sprocName);
                SqlConnection conn = DBConnectionHelper.OpenNewSqlConnection(repository.ConnectionString);
                command.Connection = conn;
                entityID = Convert.ToInt32(command.ExecuteScalar());
                DBConnectionHelper.CloseSqlConnection(conn);
                sw.Stop();
            }
            catch (SqlException)
            {
                throw;
            }
            return entityID;
        }

    }
}
