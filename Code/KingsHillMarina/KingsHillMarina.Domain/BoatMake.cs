using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain.Abstractions;

namespace KingsHillMarina.Domain  
{
    public class BoatMake : IBoatMake
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
