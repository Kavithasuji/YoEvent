using Event_management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace Event_management.Business.Modules
{
    public class CreateOrganizerBAL
    {
        public string F_Name { get; private set; }
        public string L_Name { get; private set; }
        public string organizer_type {  get; private set; }
        public string email { get; private set; }
        public long  P_hone { get; private set; }
        public string image {  get; private set; }

        internal void selectvalues(int eId)
        {
            CreateOrganizerDAL SSD= new CreateOrganizerDAL();
            SSD.selectvalues (eId,out string FirstName,  out string LastName, out  string OrganizerType, out string Email, out long phone, out string OrgImg);
            F_Name = FirstName;
            L_Name = LastName;
            organizer_type = OrganizerType;
            email = Email;
            P_hone = phone;
            image = OrgImg;
        }

        internal void updatevalues(int eId , string FirstName, string LastName, string OrganizerType,string email, long phone, byte[] OrgImg)
        {
            CreateOrganizerDAL spp = new CreateOrganizerDAL();
            spp.updatevalues(eId, FirstName, LastName, OrganizerType, email, phone, OrgImg);

        }
    }
}