using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webapicore.Models;

namespace webapicore.Services.Interface
{
    public interface IMemberService
    {
        Task<List<Member>> GetMember();
        Task<Member> GetUserByUserNamePassWord(string userName, string passWord);
        void Register(UserInfo userInfo);
    }
}
