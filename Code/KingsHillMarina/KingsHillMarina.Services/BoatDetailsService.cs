using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain;
using KingsHillMarina.Domain.Abstractions;

namespace KingsHillMarina.Services
{
    public class BoatDetailsService : IBoatDetailsService
    {
        private readonly IBoatDetailsRepository _rep;

        public BoatDetailsService(IBoatDetailsRepository rep) 
        {

            this._rep = rep ?? throw new ArgumentNullException(
                         $"BoatDetailsService expects ctor injection: {nameof(IBoatDetailsRepository)}");

        }

        public bool Deactivate(int id)
        {
           return  _rep.Deactivate(id);
        }

        public IList<BoatDetails> GetAll()
        {
            return _rep.GetAll();
        }

        public IBoatDetails GetById(int id)
        {
            return _rep.GetById(id);
        }

        public bool Save(IBoatDetails boatDetails)
        {
            return _rep.Save(boatDetails);
        }
    }
}
