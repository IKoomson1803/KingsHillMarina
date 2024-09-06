using System;
using System.Collections.Generic;
using KingsHillMarina.Utilities;



namespace KingsHillMarina.Domain.Abstractions
{
    public interface ILookupsRepository
    {
        IDictionary<int, string> GetLookups(StoredProcedures.Lookups lookupsTable);
        ICharge GetCharge();
        bool SaveBoatMake(IBoatMake boatMake);
        bool SaveBoatType(IBoatType boatType);
        bool SaveCharge(ICharge charge);
    }
}
