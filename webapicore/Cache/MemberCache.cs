using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using webapicore.Enums;
using webapicore.Extension;
using webapicore.Models;

namespace webapicore.Cache
{
    public interface IMemberCache
    {
        public List<Member> GetAllMember();

        public Task<bool> InitMerbers();

        public void ModifyMemberEnabled(Member member);

        public bool TryGetMember(string userName, out Member member);
    }

    public class MemberCache : IMemberCache
    {
        private readonly IConfiguration _configuration;
        private readonly IMemberCache _memberCache;

        public MemberCache(IConfiguration configuration, IMemberCache memberCache)
        {
            _configuration = configuration;
            _memberCache = memberCache;

            InitMerbers().Wait();
        }

        //private readonly ILogger=LogManager.GetCurrentClassLogger();

        public List<Member> GetAllMember()
        {
            return null;
        }

        public async Task<bool> InitMerbers()
        {
            List<Member> members = new List<Member>();


            var DataAccessLayer = new DataAccessLayer.DataAccessLayer();
            var a=DataAccessLayer.CallSP<string>(Stored_ProcedureEnum.GetGenreList);

            //using (var conn = new MySqlConnection(_configuration.GetConnectionString("Mysql")))
            //{
            //    await conn.OpenAsync();

            //    using (var cmd = new MySqlCommand())
            //    {
            //        cmd.Connection = conn;
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        cmd.CommandText = Stored_ProcedureEnum.GetUserInfo.GetDescription();

            //        var read = await cmd.ExecuteReaderAsync();
            //        await read.ReadAsync();
                  
            //    }
            //}
            return false;
        }

        public void ModifyMemberEnabled(Member member)
        {
        
        }

        public bool TryGetMember(string userName, out Member member)
        {
            member = null;
            return false;
        }
    }
}