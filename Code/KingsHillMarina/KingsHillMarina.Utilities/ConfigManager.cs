using System.Configuration;

namespace KingsHillMarina.Utilities
{
    public sealed class ConfigManager
    {
        public static ConnectionStringSettings DatabaseConnection
        {
            get
            {
                var connStringAttrName = ConfigurationManager.AppSettings["DatabaseConnection"].ToString();
                return ConfigurationManager.ConnectionStrings[connStringAttrName];
            }
        }
    }
}
