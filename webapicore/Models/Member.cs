using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webapicore.Enums;

namespace webapicore.Models
{
    public class Member
    {
        public int ID { get; set; }
        public string Account { get; set; }
        public IdentityType IdentityId;
    }
}
