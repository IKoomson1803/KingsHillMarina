using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using KingsHillMarina.Domain;

namespace KingsHillMarina.WebApp.Models
{
    public class BoatDetailsVM 
    {
        public List<BoatDetails> BoatDetailsList { get; set; }
        public BoatDetails BoatDetails { get; set; }
        public Dictionary<int, string> BoatMakeList { get; set; }
        public Dictionary<int, string> BoatTypeList { get; set; }
        public List<string> PierList { get; set; }
    }
}