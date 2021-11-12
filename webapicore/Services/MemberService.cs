using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webapicore.Models;
using webapicore.Services.Interface;

namespace webapicore.Services
{
    public class MemberService : IMemberService
    {
        public Task<List<Member>> GetMember()
        {
            throw new NotImplementedException();
        }

        public Task<Member> GetUserByUserNamePassWord(string userName, string passWord)
        {
            throw new NotImplementedException();
        }

        public UserInfo Register(UserInfo userInfo)
        {

            throw new NotImplementedException();
        }
    }
}
