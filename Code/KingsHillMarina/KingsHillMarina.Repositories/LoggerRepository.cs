using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Utilities;
using Dapper;



namespace KingsHillMarina.Repositories
{
    public class LoggerRepository : BaseRepository, ILoggerRepository
    {

        private readonly ConnectionStringSettings _conn;

        public LoggerRepository(ConnectionStringSettings connString)
        {

            this._conn = connString ?? throw new ArgumentNullException(
                    $"LoggerRepository expects ctor injection: {nameof(ConnectionStringSettings)}");
        }

        public void Save(ILoggerItem loggerItem)
        {
            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    var parameters = new
                    {
                                Details = loggerItem.Details,
                      
                    };

                    connection.Execute(
                                   StoredProcedures.Logger.ins_InsertLog.ToString(),
                                   parameters,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);
                }


            }
            catch (Exception ex)
            {
                string errorMessage = ex.Message;
            }
        }
    }
}
