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
    public class LoggerService : ILoggerService
    {
        private readonly ILoggerRepository _rep;

        public LoggerService(ILoggerRepository rep )
        {
            this._rep = rep ?? throw new ArgumentNullException(
                         $"LoggerService expects ctor injection: {nameof(ILoggerRepository)}");
        }

        public void Save(ILoggerItem loggerItem)
        {
             _rep.Save(loggerItem);
        }
    }
}
