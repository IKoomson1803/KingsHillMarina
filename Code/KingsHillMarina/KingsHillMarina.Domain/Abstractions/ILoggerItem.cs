using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface ILoggerItem
    {
        int Id { get; set; }
        string Details { get; set; }
    }
}
