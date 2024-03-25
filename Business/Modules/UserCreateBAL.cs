using Event_management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Event_management.Business.Modules
{
    public class UserCreateBAL
    {
        public string User_id { get; set; }
        public string User_Type { get; set; }
        public string User_Name { get; set;}
        public long Mobile_Number { get; set;}
        public string Email { get; set;}
        public string Password { get; set;}
        public string Confirm_Password { get; set;}
        public string Person_type { get; set;}
        public string Createdby {  get; set;}
        public string Createdon { get; set;}
        public string Updatby { get; set;}
        public string Updatedon { get; set;}
        public string Per_status { get; set;}

        internal void SelectValues(int eId )
        {
            CreateUserDAL UP = new CreateUserDAL();
            UP.SelectValues(eId, out string UserName, out long Mobile, out string E_mail, out string psd, out string perType, out string perSts);
            User_Name = UserName;
            Mobile_Number = Mobile;
            Email = E_mail;
            Password= psd;
            Person_type= perType;
            Per_status = perSts;
        }

        internal void UpdateValues(int eId, string UserName,long Mobile, string E_mail, string psd, string Cpwd  ,string perType,  string perSts)
        {
            CreateUserDAL UPP = new CreateUserDAL();
            UPP.updatevalues(eId, UserName, Mobile, E_mail, psd, perType, Cpwd, perSts);
        }
    }
}                   