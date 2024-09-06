using KingsHillMarina.Domain.Abstractions;

namespace KingsHillMarina.Domain
{
    public class LoggerItem : ILoggerItem
    {
        public int Id { get; set; }
        public string Details { get; set; }
    }
}
