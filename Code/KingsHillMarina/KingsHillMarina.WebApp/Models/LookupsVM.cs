using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KingsHillMarina.Domain;

namespace KingsHillMarina.WebApp.Models
{
    public class LookupsVM
    {
        public string Type { get; set; }
        public List<BoatMake> BoatMakes { get; set; }
        public BoatMake  BoatMake { get; set; }
        public List<BoatType> BoatTypes { get; set; }
        public BoatType BoatType { get; set; }
        public Charge Charge { get; set; }

    }
}