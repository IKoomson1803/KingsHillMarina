using KingsHillMarina.Repositories;
using KingsHillMarina.Services;
using KingsHillMarina.Utilities;
using KingsHillMarina.Domain.Abstractions;
using Autofac;


namespace KingsHillMarina.WebApp.Autofac
{
    public class StandardModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            var conn = ConfigManager.DatabaseConnection;

            //Register Repositories ******************************************/
            builder.RegisterType<LoggerRepository>() // concrete type
                .As<ILoggerRepository>() // abstraction
                .WithParameter(
                    "connString",
                    conn)
                 .SingleInstance();

          builder.RegisterType<LookupsRepository>() // concrete type
             .As<ILookupsRepository>() // abstraction
             .WithParameter(
                 "connString",
                 conn)
              .SingleInstance();

            builder.RegisterType<BoatDetailsRepository>() // concrete type
                .As<IBoatDetailsRepository>() // abstraction
                .WithParameter(
                    "connString",
                    conn)
                 .SingleInstance();

            //Register Seervices ************************************************/
            builder.RegisterType<LoggerService>() // concrete type
               .As<ILoggerService>() // abstraction
               .SingleInstance();

            builder.RegisterType<LookupsService>() // concrete type
               .As<ILookupsService>() // abstraction
               .SingleInstance();

            builder.RegisterType<BoatDetailsService>() // concrete type
              .As<IBoatDetailsService>() // abstraction
              .SingleInstance();


            base.Load(builder);

        }

    }
}