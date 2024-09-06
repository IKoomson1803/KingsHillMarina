using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KingsHillMarina.Utilities
{
    public class StoredProcedures
    {
        public enum BoatDetails
        {
            ins_up_InsertOrUpdateBoatDetails,
            sel_GetBoatDetails,
            del_DeactivateBoatDetails
        }


        public enum Lookups
        {
            sel_GetLookup,
            sel_GetCharge,
            ins_up_InsertOrUpdateBoatMake,
            ins_up_InsertOrUpdateBoatType,
            up_UpdateCharge,
            BoatMake,  
            BoatType
        }

      
        public enum Logger
        {
            ins_InsertLog
        }

        

    }
}
