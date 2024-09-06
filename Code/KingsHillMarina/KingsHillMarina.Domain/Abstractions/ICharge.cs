using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface ICharge
    {
        int Id { get; set; }
        double Amount { get; set; } 
        int VAT { get; set; }
    }
}
