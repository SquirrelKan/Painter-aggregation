using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace webapicore.Enums
{
    public enum Stored_ProcedureEnum
    {
        [Description("rsCreateGenre")]
        CreateGenre,
        [Description("rsCrateStyle")]
        CrateStyle,
        [Description("rsCreateUserInfo")]
        CreateUserInfo,
        [Description("rsGenreSave")]
        GenreSave,
        [Description("rsGetAccount")]
        GetAccount,
        [Description("rsGetGenre")]
        GetGenre,
        [Description("rsGetGenreList")]
        GetGenreList,
        [Description("GetloginData")]
        rsGetloginData,
        [Description("rsGetPaint")]
        GetPaint,
        [Description("GetProposalList")]
        GetProposalList,
        [Description("rsGetStyle")]
        GetStyle,
        [Description("Gettest")]
        rsGettest,
        [Description("rsGetUserInfo")]
        GetUserInfo,
        [Description("rsRegister")]
        Register,
        [Description("rsUpdateAccountInfo")]
        UpdateAccountInfo
    }
}
