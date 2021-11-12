using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace webapicore.Models
{
    public class UserInfo
    {
        public string UserName { get; internal set; }
        public string Username { get; internal set; }
        public string NickName { get; internal set; }
        public string Password { get; internal set; }
        public object Identity { get; internal set; }
    }
}
