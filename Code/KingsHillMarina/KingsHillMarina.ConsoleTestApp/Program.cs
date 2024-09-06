using System.Configuration;
using System.Diagnostics;
using KingsHillMarina.Utilities;
using KingsHillMarina.Domain;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Repositories;
using KingsHillMarina.Services;

namespace KingsHillMarina.ConsoleTestApp
{
    class Program
    {
        static ILoggerService _logger = null;
        static IBoatDetailsService  _boatDetailsService = null;

        static void Main(string[] args)
        {
            Initialize();
            // Insert_New_Boat_Details();
            // Update_Existing_Boat_Details();
            Get_All_Boat_Details();
        }

        static void Insert_New_Boat_Details()
        {
            //Arrange
            var boatDetails = new BoatDetails()
            {
                Name = "Morning Glory",
                Length = 66.85,
                MakeId = 5,
                TypeId = 2,
                Berth = "Berth 7",
                Pier = "B",
                OwnerFirstName = "Daddy",
                OwnerLastName = "Moffey",
                OwnerAddress = "Address 2",
                OwnerEmail = "daddymof@gmail.com",
                OwnerTelephone = "07900011251"
            };


            //Act
            var saved = _boatDetailsService.Save(boatDetails);


            // Assert
            Debug.Assert(saved,"Could not save boat details");
        }


        static void Update_Existing_Boat_Details()
        {
            //Arrange
            var boatDetails = new BoatDetails()
            {
                Id = 3,
                Name = "Dreamweaver",
                Length = 55.35,
                MakeId = 2,
                TypeId = 3,
                Berth = "Berth 4",
                Pier = "E",
                OwnerFirstName = "Isaac",
                OwnerLastName = "Koomson",
                OwnerAddress = "Address 1",
                OwnerEmail = "isaackoomson@hotmail.com",
                OwnerTelephone = "07738093441"
            };


            //Act
            var saved = _boatDetailsService.Save(boatDetails);


            // Assert
            Debug.Assert(saved, "Could not save boat details");
        }

        static void Get_All_Boat_Details()
        {
            //Arrange



            //Act
            var list = _boatDetailsService.GetAll();


            // Assert
            Debug.Assert(list != null, "Could not get boats details");
        }

        static void Get_Boat_Details_By_Id()
        {
            //Arrange



            //Act
            var item = _boatDetailsService.GetById(3);


            // Assert
            Debug.Assert(item != null, "Could not get boat details");
        }

        static void Deactivate_Boat_Details()
        {
            //Arrange



            //Act
            var deactivated = _boatDetailsService.Deactivate(2);


            // Assert
            Debug.Assert(deactivated, "Could not deactivate boat details");
        }

        static void Initialize()
        {
            var conn = ConfigManager.DatabaseConnection;

            _logger = new LoggerService(
                new LoggerRepository(conn));

            _boatDetailsService = new BoatDetailsService(
                new BoatDetailsRepository(
                    conn,
                    _logger));

        }
    }
}
