using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Domain;
using KingsHillMarina.Utilities;
using Dapper;

namespace KingsHillMarina.Repositories
{
    public class BoatDetailsRepository : BaseRepository, IBoatDetailsRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BoatDetailsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                   $"BoatDetailsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                  $"BoatDetailsRepository expects ctor injection: {nameof(ILoggerService)}");

        }


        public bool Deactivate(int id)
        {
            bool saved = false;

            try
            {

              
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedures.BoatDetails.del_DeactivateBoatDetails.ToString(),
                                   new { Id = id },
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

        public IList<BoatDetails> GetAll()
        {
            List<BoatDetails> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    list = connection.Query<BoatDetails>(
                                     StoredProcedures.BoatDetails.sel_GetBoatDetails.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                // Log exception

                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.Save(loggerItem);
            }


            return list;
        }

        public IBoatDetails GetById(int id)
        {
            IBoatDetails boatDetails = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    boatDetails = new BoatDetails();


                    boatDetails = connection.Query<BoatDetails>(
                                     StoredProcedures.BoatDetails.sel_GetBoatDetails.ToString(),
                                     new { Id = id },
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

            return boatDetails;
        }

        public bool Save(IBoatDetails boatDetails)
        {
            bool saved = false;

            try
            {

                var parameters = new
                {
                    Id  = boatDetails.Id,
                    OwnerFirstName  = boatDetails.OwnerFirstName,
                    OwnerLastName  = boatDetails.OwnerLastName,
                    OwnerAddress = boatDetails.OwnerAddress,
                    OwnerTelephone = boatDetails.OwnerTelephone,
                    OwnerEmail  = boatDetails.OwnerEmail,
                    Name = boatDetails.Name,
                    Length = boatDetails.Length,
                    MakeId = boatDetails.MakeId,
                    TypeId  = boatDetails.TypeId,
                    Berth  = boatDetails.Berth,
                    Pier  = boatDetails.Pier
                };



                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedures.BoatDetails.ins_up_InsertOrUpdateBoatDetails.ToString(),
                                   parameters,
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
