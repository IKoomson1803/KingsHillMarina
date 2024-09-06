using System;
using System.Collections.Generic;
using KingsHillMarina.Utilities;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface ILookupsService
    {
        IDictionary<int, string> GetBoatMakeLookups();
        IDictionary<int, string> GetBoatTypeLookups();
        IList<BoatMake> GetBoatMakes();
        IList<BoatType> GetBoatTypes();
        IList<string> GetPiers();
        IBoatMake GetBoatMakeById(int id);
        IBoatType GetBoatTypeById(int id);
        ICharge GetCharge();
        bool SaveBoatMake(IBoatMake boatMake);
        bool SaveBoatType(IBoatType boatType);
        bool SaveCharge(ICharge charge);

    }
}
