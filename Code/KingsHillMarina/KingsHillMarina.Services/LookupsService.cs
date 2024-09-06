using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Utilities;

namespace KingsHillMarina.Services
{
    public class LookupsService : ILookupsService
    {
        private readonly ILookupsRepository _rep;

        public LookupsService(ILookupsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                         $"LookupsService expects ctor injection: {nameof(ILookupsRepository)}");
        }

        public IDictionary<int, string> GetBoatMakeLookups()
        {
            return _rep.GetLookups(StoredProcedures.Lookups.BoatMake);
        }

        public IDictionary<int, string> GetBoatTypeLookups()
        {
            return _rep.GetLookups(StoredProcedures.Lookups.BoatType);
        }

        public IList<BoatMake> GetBoatMakes()
        {
            var boatMakes = new List<BoatMake>();

            var makes = _rep.GetLookups(StoredProcedures.Lookups.BoatMake);

            if (makes != null)
            {

                foreach (KeyValuePair<int, string> make in makes)
                {
                    BoatMake boatMake = new BoatMake() { Id = make.Key, Name = make.Value };
                    boatMakes.Add(boatMake);
                }

            }

            return boatMakes;
        }

        public IList<BoatType> GetBoatTypes()
        {
            var boatTypes = new List<BoatType>();

            var types = _rep.GetLookups(StoredProcedures.Lookups.BoatType);

            if(types != null)
            {

                foreach (KeyValuePair<int, string> type in types)
                {
                    BoatType boatType = new BoatType() { Id = type.Key, Name = type.Value };
                    boatTypes.Add(boatType);
                }

            }

            return boatTypes;
        }


        public IBoatMake GetBoatMakeById(int id)
        {
            var makes = _rep.GetLookups(StoredProcedures.Lookups.BoatMake);
            var make = new BoatMake() { Id = id, Name = makes[id] };
            
            return make;
        }

        public IBoatType GetBoatTypeById(int id)
        {
            var types = _rep.GetLookups(StoredProcedures.Lookups.BoatType);
            var type = new BoatType() { Id = id, Name = types[id] }; ;
            return type;
        }

        public ICharge GetCharge()
        {
            return _rep.GetCharge();
        }



        public IList<string> GetPiers()
        {
            List<string> piers = new List<string>();

            for (int i = 65; i <= 90; i++)   // Generate A-Z pier names
            {
                piers.Add(Convert.ToChar(i).ToString());
            }


            return piers;
        }

        public bool SaveBoatMake(IBoatMake boatMake)
        {
            return _rep.SaveBoatMake(boatMake);
        }

        public bool SaveBoatType(IBoatType boatType)
        {
            return _rep.SaveBoatType(boatType);
        }

        public bool SaveCharge(ICharge charge)
        {
            return _rep.SaveCharge(charge);
        }
    }
}
