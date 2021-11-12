using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NLog;
using NLog.Web;

namespace webapicore
{
    public class Program
    {
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
            .ConfigureAppConfiguration((hostintContext, config) =>
            {
            })
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>();
            }).ConfigureLogging((hostingContext, logging) =>
            {
                logging.ClearProviders();
                logging.AddConfiguration(hostingContext.Configuration.GetSection("Logging"));
                //logging.SetMinimumLevel(LogLevel.Trace);
            });

        public static void Main(string[] args)
        {
            ConfigureNLog(args);

            AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(OnUnhandledException);
            var logger = NLogBuilder.ConfigureNLog(LogManager.Configuration).GetCurrentClassLogger();
            try
            {
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                logger.Error(ex, "Could not run this service. Please check exception");
            }
        }

        private static void ConfigureNLog(string[] args)
        {
        }

        private static void OnUnhandledException(object sender, UnhandledExceptionEventArgs args)
        {
            Exception e = (Exception)args.ExceptionObject;

            var logger = LogManager.GetCurrentClassLogger();

            logger.Fatal("OnUnhandledException caught : " + e.Message);
            logger.Fatal("Runtime terminating: {0}", args.IsTerminating);
        }
    }
}