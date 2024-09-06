using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KingsHillMarina.Domain.Abstractions;

namespace KingsHillMarina.Domain
{
    public class Charge : ICharge
    {
        public int Id { get; set; }
        public double Amount { get; set; }
        public int VAT { get; set; }
    }
}
