using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Domain;
using KingsHillMarina.Utilities;
using Dapper;

namespace KingsHillMarina.Repositories
{
    public abstract class BaseRepository
    {
       
        protected IDbConnection OpenConnection(string connectionString)
        {
            IDbConnection connection = new SqlConnection(connectionString);
            connection.Open();
            return connection;
        }

        protected ILoggerItem PopulateLoggerItem(Exception ex)
        {

            return new LoggerItem()
            {
                Details = string.Format("Error Message: {0}", ex.GetDescription()),
               
            };
        }

    }
}
