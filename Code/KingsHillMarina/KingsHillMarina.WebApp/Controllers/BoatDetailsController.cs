using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KingsHillMarina.Domain.Abstractions;
using KingsHillMarina.Domain;
using KingsHillMarina.Repositories;
using KingsHillMarina.WebApp.Models;
using KingsHillMarina.Utilities;

namespace KingsHillMarina.WebApp.Controllers
{
    public class BoatDetailsController : BaseController
    {
        private readonly IBoatDetailsService _boatDetailsService;
        private readonly ILookupsService _lookupsService;

        public BoatDetailsController(IBoatDetailsService boatDetailsService, ILookupsService lookupsService)
        {
            this._boatDetailsService = boatDetailsService ?? throw new ArgumentNullException(
                         $"BoatDetailsController expects ctor injection: {nameof(IBoatDetailsService)}");

            this._lookupsService = lookupsService ?? throw new ArgumentNullException(
                        $"BoatDetailsController expects ctor injection: {nameof(ILookupsService)}");
        }


        // GET: Index
        public ActionResult Index()
        {
            var vm = new BoatDetailsVM();

            vm.BoatDetailsList = _boatDetailsService.GetAll()?.ToList();
            vm.BoatMakeList = _lookupsService.GetBoatMakeLookups() as Dictionary<int, string>;
            vm.BoatTypeList = _lookupsService.GetBoatTypeLookups() as Dictionary<int, string>;
            vm.PierList = _lookupsService.GetPiers()?.ToList();

            return View(vm);
        }


        [HttpPost]
        public ActionResult Save(BoatDetailsVM model)
        {
            var vm = new BoatDetailsVM();
            string resultMsg = "Boat Details saved successfully";

            var boatDetails = model.BoatDetails;
            
            //Validate 
            if (string.IsNullOrWhiteSpace(boatDetails.Name))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat name and continue.... "
                    });
            }

            if (boatDetails.Length <= 0)
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat length and continue.... "
                    });
            }


            if (boatDetails.MakeId == 0)
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat make and continue.... "
                    });
            }



            if (boatDetails.TypeId == 0)
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply boat type and continue.... "
                    });
            }


            if (string.IsNullOrWhiteSpace(boatDetails.Pier))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the pier and continue.... "
                    });
            }

            if (string.IsNullOrWhiteSpace(boatDetails.Berth))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the berth and continue.... "
                    });
            }

            if (string.IsNullOrWhiteSpace(boatDetails.OwnerFirstName))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the owner's first name and continue.... "
                    });
            }

            if (string.IsNullOrWhiteSpace(boatDetails.OwnerLastName))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the owner's last name and continue.... "
                    });
            }

            if (string.IsNullOrWhiteSpace(boatDetails.OwnerTelephone))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the owner's telehopne number and continue.... "
                    });
            }

            if (string.IsNullOrWhiteSpace(boatDetails.OwnerEmail))
            {
                return Json(
                    new
                    {
                        success = false,
                        msg = "Please supply the owner's email address and continue.... "
                    });
            }

            bool result = _boatDetailsService.Save(boatDetails);

            if (!result)
            {
                resultMsg = "Boat Details saving failed!";
            }
 
            vm.BoatDetailsList = _boatDetailsService.GetAll()?.ToList();

            var partialView = RenderPartialViewToString(
                                   "_BoatDetailsGrid",
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

        public ActionResult GetById(int id)
        {
            var boatDetail = _boatDetailsService.GetById(id);
            return Json(boatDetail, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Deactivate(int id)
        {
            string resultMsg = "Boat Details deactivated successfully";
            var vm = new BoatDetailsVM();
            var result = _boatDetailsService.Deactivate(id);

            if (!result)
            {
                resultMsg = "Boat Details deactivation failed!";
            }
         
            vm.BoatDetailsList = _boatDetailsService.GetAll()?.ToList();

            var partialView = RenderPartialViewToString(
                                  "_BoatDetailsGrid",
                                  vm);

            JsonResult jsonResult = Json(new
            {
                success = result,
                msg = resultMsg,
                partial = partialView
            }, JsonRequestBehavior.AllowGet);

            //The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647

            return jsonResult;

        }


    }
}