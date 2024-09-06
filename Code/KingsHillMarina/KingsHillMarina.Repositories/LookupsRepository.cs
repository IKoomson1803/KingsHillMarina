using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Data.SqlClient;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Domain;
using KingsHillMarina.Utilities;
using Dapper;


namespace KingsHillMarina.Repositories
{
    public class LookupsRepository : BaseRepository,  ILookupsRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;


        public LookupsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                  $"LookupsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                  $"LookupsRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public IDictionary<int, string> GetLookups(StoredProcedures.Lookups lookupsTable)
        {
            Dictionary<int, string> result = new Dictionary<int, string>();

            try
            {
                using (SqlCommand _cmd = new SqlCommand())
                {

                    _cmd.Connection = new SqlConnection(_conn.ConnectionString);
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = StoredProcedures.Lookups.sel_GetLookup.ToString();
                    _cmd.Parameters.AddWithValue("@TableName", lookupsTable.ToString());
                    _cmd.Connection.Open();

                    using (SqlDataReader reader = _cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result.Add(Convert.ToInt32(reader["Id"]), reader["Name"].ToString().Trim());
                        }

                    }

                    _cmd.Connection.Close();

                }

            }
            catch(Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }

            return result;
        }

        public ICharge GetCharge()
        {
            Charge charge = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    charge = connection.Query<Charge>(
                                     StoredProcedures.Lookups.sel_GetCharge.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }


            return charge;
        }

        public bool SaveBoatMake(IBoatMake boatMake)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedures.Lookups.ins_up_InsertOrUpdateBoatMake.ToString(),
                                   boatMake,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;
                }
            }
            catch (Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }

            return saved;
        }

        public bool SaveBoatType(IBoatType boatType)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedures.Lookups.ins_up_InsertOrUpdateBoatType.ToString(),
                                   boatType,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;
                }
            }
            catch (Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }

            return saved;
        }

        public bool SaveCharge(ICharge charge)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedures.Lookups.up_UpdateCharge.ToString(),
                                   charge,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;
                }
            }
            catch (Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }

            return saved;
        }
    }
}
