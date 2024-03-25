using Event_management.DAL;

namespace Event_management.Business.Modules
{
    public class EventlogBAL
    {
        public bool ValidateUser(string email, string password, out string personType)
        {
            UserDAL userDal = new UserDAL();
            bool isValidUser = userDal.ValidateUser(email, password, out personType);

            // Check if user is valid but personType is null (indicating incorrect password)
            if (isValidUser && personType == null)
            {
                personType = ""; // Set personType to empty string to indicate incorrect password
                return false;
            }

            return isValidUser;
        }
    }
}
