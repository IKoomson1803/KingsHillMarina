using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Domain.Abstractions
{
    public interface ILoggerRepository
    {
        void Save(ILoggerItem loggerItem);
    }
}
