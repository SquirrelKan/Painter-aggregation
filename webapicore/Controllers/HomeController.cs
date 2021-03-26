using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace webapicore.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }
       

        // GET: HomeController1
        [HttpGet]
        public ActionResult Index()
        {
            var message = "Alochol is important.";

            _logger.LogInformation(message);

            ViewBag.MessageValue = message;

            return View();
        }
    }
}
