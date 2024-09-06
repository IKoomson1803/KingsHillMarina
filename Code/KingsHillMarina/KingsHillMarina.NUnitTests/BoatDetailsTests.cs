using System.Configuration;
using KingsHillMarina.Utilities;
using KingsHillMarina.Domain;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Repositories;
using KingsHillMarina.Services;
using NUnit.Framework;

namespace KingsHillMarina.NUnitTests
{
    [TestFixture]
    public class BoatDetailsTests
    {
        private ILoggerService _logger = null;
        private IBoatDetailsService _boatDetailsService = null;

        [SetUp]
        public void Setup()
        {
            var conn = ConfigManager.DatabaseConnection;

            _logger = new LoggerService(
                new LoggerRepository(conn));

            _boatDetailsService = new BoatDetailsService(
                new BoatDetailsRepository(
                    conn,
                    _logger));

        }

        [Test]
        [Ignore("Ignore test")]
        public void Should_Insert_New_Boat_Details()
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
            Assert.That(saved, "Could not save boat details");
        }

        [Test]
        public void Should_Update_Existing_Boat_Details()
        {
            //Arrange
            var boatDetails = new BoatDetails()
            {
                Id = 3,
                Name = "Dreamweaver",
                Length = 51.45,
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
            Assert.That(saved, "Could not save boat details");
        }

        [Test]
        public void Should_Get_All_Boat_Details()
        {
            //Arrange



            //Act
            var list = _boatDetailsService.GetAll();


            // Assert
            Assert.That(list != null, "Could not get all boats details");
        }

        [Test]
        public void Get_Boat_Details_By_Id()
        {
            //Arrange



            //Act
            var item = _boatDetailsService.GetById(3);


            // Assert
            Assert.That(item != null, "Could not get boat details");
        }

        [Test]
        public void Deactivate_Boat_Details()
        {
            //Arrange



            //Act
            var deactivated = _boatDetailsService.Deactivate(2);


            // Assert
            Assert.That(deactivated, "Could not deactivate boat details");
        }


    }
}
