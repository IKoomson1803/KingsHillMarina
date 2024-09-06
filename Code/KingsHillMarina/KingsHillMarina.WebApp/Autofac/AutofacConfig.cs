using System.Web.Mvc;
using Autofac;
using Autofac.Integration.Mvc;

namespace KingsHillMarina.WebApp.Autofac
{
    /// <summary>
    ///  Autofac module for regsitering dependencies
    /// </summary>
    public class AutofacConfig
    {
        public static void RegisterComponents()
        {
            var builder = new ContainerBuilder();

            // Register our dependencies
            builder.RegisterModule(
                new StandardModule());

            // Register dependencies in controllers
            builder.RegisterControllers(
                typeof(MvcApplication).Assembly);


            var container = builder.Build();

            // Set MVC DI resolver to use our Autofac container
            DependencyResolver.SetResolver(
                new AutofacDependencyResolver(container));

           
        }
    }
}