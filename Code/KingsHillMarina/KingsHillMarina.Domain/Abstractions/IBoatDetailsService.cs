using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface IBoatDetailsService
    {

        IList<BoatDetails> GetAll();
        IBoatDetails GetById(int id);
        bool Save(IBoatDetails boatDetails);
        bool Deactivate(int id);


    }
}
