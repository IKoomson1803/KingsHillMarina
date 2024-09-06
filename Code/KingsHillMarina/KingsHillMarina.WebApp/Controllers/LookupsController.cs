using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Domain;
using KingsHillMarina.Repositories;
using KingsHillMarina.WebApp.Models;

namespace KingsHillMarina.WebApp.Controllers
{
    public class LookupsController : BaseController
    {
        private readonly ILookupsService _lookupsService;

        public LookupsController(ILookupsService lookupsService)
        {
            this._lookupsService = lookupsService ?? throw new ArgumentNullException(
                       $"LookupsController expects ctor injection: {nameof(ILookupsService)}");
        }

        private enum LookupsType
        {
            BoatMake,
            BoatType,
            Charge
        }

        // GET: Lookups
        public ActionResult Index(string type)
        {
            var vm = new LookupsVM();

            if (string.IsNullOrWhiteSpace(type))
            {
                type = "BoatMake";
            }

            switch (type)
            {
                case "BoatMake":
                    vm.BoatMakes = _lookupsService.GetBoatMakes()?.ToList();
                    vm.BoatMake = new BoatMake();
                    type = LookupsType.BoatMake.ToString();
                    break;

                case "BoatType":
                    vm.BoatTypes = _lookupsService.GetBoatTypes()?.ToList();
                    vm.BoatType = new BoatType();
                    type = LookupsType.BoatType.ToString();
                    break;

                case "Charge":
                    vm.Charge = _lookupsService.GetCharge() as Charge;
                    type = LookupsType.Charge.ToString();
                    break;

                default:
                    vm.BoatMakes = _lookupsService.GetBoatMakes()?.ToList();
                    vm.BoatMake = new BoatMake();
                    type = LookupsType.BoatMake.ToString();
                    break;
            }

            vm.Type = type;
            return View(vm); ;
        }

        public ActionResult GetBoatMakeById(int id)
        {
            var boatDetail = _lookupsService.GetBoatMakeById(id);
            return Json(boatDetail, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetBoatTypeById(int id)
        {
            var boatDetail = _lookupsService.GetBoatTypeById(id);
            return Json(boatDetail, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveBoatMake(LookupsVM model)
        {

            var vm = new LookupsVM();
            var boatMake = model.BoatMake;
            string resultMsg = "Boat Make saved successfully";

            //Validate 
            if (string.IsNullOrWhiteSpace(boatMake.Name))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat make and continue.... "
                    });
            }


            bool result = _lookupsService.SaveBoatMake(boatMake);

            if (!result)
            {
                resultMsg = "Boat Make saving failed!";
            }

            vm.BoatMakes = _lookupsService.GetBoatMakes()?.ToList();

            var partialView = RenderPartialViewToString(
                                   "_BoatMake",
                                   vm);

            JsonResult jsonResult = Json(new
            {
                success = result,
                msg = resultMsg,
                partialView = partialView
            }, JsonRequestBehavior.AllowGet);

            //The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647

            return jsonResult;
        }

        [HttpPost]
        public ActionResult SaveBoatType(LookupsVM model)
        {
            var vm = new LookupsVM();
            var boatType = model.BoatType;
            string resultMsg = "Boat Type saved successfully";
           

            //Validate 
            if (string.IsNullOrWhiteSpace(boatType.Name))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat type and continue.... "
                    });
            }

            bool result = _lookupsService.SaveBoatType(boatType);

            if (!result)
            {
                resultMsg = "Boat Type saving failed!";
            }

            vm.BoatTypes = _lookupsService.GetBoatTypes()?.ToList();

            var partialView = RenderPartialViewToString(
                                   "_BoatType",
                                   vm);

            JsonResult jsonResult = Json(new
            {
                success = result,
                msg = resultMsg,
                partialView = partialView
            }, JsonRequestBehavior.AllowGet);

            //The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647

            return jsonResult;
        }

        [HttpPost]
        public ActionResult SaveCharge(LookupsVM model)
        {
            var vm = new LookupsVM();
            var charge = model.Charge;
            string resultMsg = "Charge saved successfully";


            //Validate 
            if (charge.Amount <= 0)
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply amount and continue.... "
                    });
            }

            if (charge.VAT <= 0)
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply VAT and continue.... "
                    });
            }

            bool result = _lookupsService.SaveCharge(charge); ;

            if (!result)
            {
                resultMsg = "Charge saving failed!";
            }

            vm.Charge = _lookupsService.GetCharge() as Charge;

            var partialView = RenderPartialViewToString(
                                   "_Charge",
                                   vm);

            JsonResult jsonResult = Json(new
            {
                success = result,
                msg = resultMsg,
                partialView = partialView
            }, JsonRequestBehavior.AllowGet);

            //The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647

            return jsonResult;
        }

    }

}