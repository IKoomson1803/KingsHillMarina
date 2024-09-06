using System;
using KingsHillMarina.Domain.Abstractions;

namespace KingsHillMarina.Domain
{
    public class BoatDetails : IBoatDetails
    {

        public int Id {get;set; }
        public string Name { get; set; }
        public double Length { get; set; }
        public string Make { get; set; }
        public int MakeId { get; set; }
        public string Type { get; set; }
        public int TypeId { get; set; }
        public string Berth { get; set; }
        public string Pier { get; set; }
        public string OwnerFirstName { get; set; }
        public string OwnerLastName { get; set; }
        public string OwnerAddress { get; set; }
        public string OwnerTelephone { get; set; }
        public string OwnerEmail { get; set; }
        public double Charge { get; set; }
        public bool Active { get; set; }
        public DateTime DateBerthed { get; set; }

    }
}
