using Event_management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace Event_management.Business.Modules
{
    public class SponsorUpdateBAL
    {
        public string F_Name {  get; private set; }
        public string L_Name { get; private set; }
        public string description { get; private set; }
        public string website {  get; private set; }
        public long phone { get; private set; }
        public string mail {  get; private set; }
        public string Logo {  get; private set; }

        internal void Selectvalues(int eId)
        {
            SponsorUpdateDAL SPD = new SponsorUpdateDAL();
            SPD.Select(eId, out string FirstName, out string LastName, out string Description, out string Website, out long Phone, out string Email, out string logo);
            F_Name = FirstName;
            L_Name = LastName;
            description = Description;
            website = Website;
            phone = Phone;
            mail = Email;
            Logo = logo;

        }

        internal void updatevalues(int eId, string FirstName, string LastName, string Description, string Website, string Email, long Phone, byte[] logoFile) 
        {
            SponsorUpdateDAL SPP = new SponsorUpdateDAL();
            SPP.updatesponsor(eId, FirstName, LastName, Description, Website, Email, Phone, logoFile);
        }
    }
}