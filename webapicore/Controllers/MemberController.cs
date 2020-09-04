using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using webapicore.DataAccessLayer;
using webapicore.Enums;
using webapicore.Extension;
using webapicore.Models;
using webapicore.Services.Interface;

namespace webapicore.Controllers
{
    public class MemberController : Controller
    {
        private readonly ILogger<MemberController> _logger;
        private readonly IMemberService _memberService;

        public MemberController(ILogger<MemberController> logger, IMemberService memberService)
        {
            _logger = logger;
            _memberService = memberService;
        }
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Register(string username, string nickName, string email, string password, string identity)
        {
            UserInfo userInfo = null;
            userInfo.UserName = username;
            userInfo.NickName = nickName;
            userInfo.Username = email;
               userInfo.Password=password;
            userInfo.Identity = Enum.Parse(typeof(IdentityType), identity);
            _logger.LogDebug(Stored_ProcedureEnum.Register.GetDescription());
            var result = _memberService.Register(userInfo);
            return null;
        }

    }
}