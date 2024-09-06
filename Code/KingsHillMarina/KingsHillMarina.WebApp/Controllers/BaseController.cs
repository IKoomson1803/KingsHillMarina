using System;
using System.IO;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;


namespace KingsHillMarina.WebApp.Controllers
{
    public class BaseController : Controller
    {
       
        #region Overridden Methods


        protected string RenderPartialViewToString()
        {
            return RenderPartialViewToString(
                                null,
                                null);
        }

        protected string RenderPartialViewToString(string viewName)
        {
            return RenderPartialViewToString(
                viewName,
                null);
        }

        protected string RenderPartialViewToString(object model)
        {
            return RenderPartialViewToString(
                null,
                model);
        }

        /// <summary>
        /// Renders partial view as HTML string
        /// </summary>
        /// <param name="viewName"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        protected string RenderPartialViewToString(string viewName, object model)
        {
            if (string.IsNullOrEmpty(viewName))
                viewName = ControllerContext.RouteData.GetRequiredString("action");

            ViewData.Model = model;

            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(
                    ControllerContext,
                    viewName);

                ViewContext viewContext = new ViewContext(
                    ControllerContext,
                    viewResult.View,
                    ViewData,
                    TempData,
                    sw);

                viewResult.View.Render(
                    viewContext,
                    sw);

                return sw.GetStringBuilder().ToString();
            }
        }


        protected override void HandleUnknownAction(string actionName)
        {
            try
            {
                View(actionName).ExecuteResult(ControllerContext);
            }
            catch
            {
                View("Error").ExecuteResult(ControllerContext);
            }
        }

        protected override void OnException(ExceptionContext filterContext)
        {
            filterContext.ExceptionHandled = true;
          
        }


        #endregion

    }
}