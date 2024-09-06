using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface IBoatDetails
    {
        int Id { get; set; }
        string Name { get; set; }
        double Length { get; set; }
        string Make { get; set; }
        int MakeId { get; set; }
        string Type { get; set; }
        int TypeId { get; set; }
        string Berth { get; set; }
        string Pier { get; set; }
        string OwnerFirstName { get; set; }
        string OwnerLastName { get; set; }
        string OwnerAddress { get; set; }
        string OwnerTelephone { get; set; }
        string OwnerEmail { get; set; }
        double Charge { get; set; }
        bool Active { get; set; }
        DateTime DateBerthed { get; set; }
    }
}
