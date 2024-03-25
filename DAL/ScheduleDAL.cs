using Event_management.UI.Module.dash_board;
using Event_management.UI.Module.dashboard;
using Eventedmxentites;
using System;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Lifetime;
using System.Web.UI.WebControls;

namespace Event_management.DAL
{
    public class ScheduleDAL
    {
        public void GetEventDetails(int eId, out string S_ename, out string S_description, out DateTime S_sdate, out DateTime S_edate, out DateTime S_stime, out DateTime S_etime, out string S_venue)
        {
            S_ename = S_description = S_venue = string.Empty;
            S_sdate = S_edate = S_stime = S_etime = DateTime.MinValue;

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                string str = "SELECT E_Id, E_Name, E_Description, E_Sdate, E_Edate, E_Stime, E_Etime, E_Venue FROM Event_Reg where E_Id=@E_Id;";


                con.Open();

                using (SqlCommand cmd = new SqlCommand(str, con))
                {
                    cmd.CommandType = CommandType.Text;

                    cmd.Parameters.AddWithValue("@E_Id", eId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            eId = Convert.ToInt32(GetValueFromReader(reader, "E_Id"));
                            S_ename = GetValueFromReader(reader, "E_Name");
                            S_description = GetValueFromReader(reader, "E_Description");
                            S_sdate = DateTime.Parse(GetValueFromReader(reader, "E_Sdate"));
                            S_edate = DateTime.Parse(GetValueFromReader(reader, "E_Edate"));


                            TimeSpan startTime = reader.GetTimeSpan(reader.GetOrdinal("E_Stime"));
                            TimeSpan endTime = reader.GetTimeSpan(reader.GetOrdinal("E_Etime"));

                            S_stime = S_sdate.Date + startTime;
                            S_etime = S_edate.Date + endTime;

                            S_venue = GetValueFromReader(reader, "E_Venue");
                        }
                    }
                }
            }
        }

        internal DataSet Select()
        {
            DataSet ds = new DataSet();
            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                con.Open();

                using (SqlCommand cmd2 = new SqlCommand("ScheduleRoom", con))
                using (SqlCommand cmd3 = new SqlCommand("ScheduleSponcer", con))
                using (SqlCommand cmd4 = new SqlCommand("ScheduleOrganizer", con))
                {
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter roomAdapter = new SqlDataAdapter(cmd2);
                    roomAdapter.Fill(ds, "Room");
                    DropDownList ddlroom = new DropDownList();

                    foreach (DataRow dataRow in ds.Tables["Room"].Rows)
                    {
                        string SR = dataRow["Name"].ToString();
                        ddlroom.Items.Add(SR);
                    }

                    cmd3.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter sponsorAdapter = new SqlDataAdapter(cmd3);
                    sponsorAdapter.Fill(ds, "Sponsor");

                    DropDownList ddlSponsors = new DropDownList();

                    foreach (DataRow sponsorRow in ds.Tables["Sponsor"].Rows)
                    {
                        string fullName = sponsorRow["FullName"].ToString();
                        ddlSponsors.Items.Add(new ListItem(fullName));
                    }

                    cmd4.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter organizerAdapter = new SqlDataAdapter(cmd4);
                    organizerAdapter.Fill(ds, "Organizer");

                    if (ds.Tables["Organizer"].Rows.Count > 0)
                    {
                        foreach (DataRow organizerRow in ds.Tables["Organizer"].Rows)
                        {
                            string SO = organizerRow["FullName"].ToString();

                        }
                    }

                    return ds;
                }
            }
        }

    

        internal void GetScheduledEventDetails(int eId, out string S_ename, out string S_description, out DateTime S_sdate, out DateTime S_edate, out DateTime S_stime, out DateTime S_etime, out string S_venue, out string s_room, out string s_sponcer, out string s_organizer)
        {
            S_ename = S_description = S_venue = s_room = s_sponcer = s_organizer = string.Empty;
            S_sdate = S_edate = S_stime = S_etime = DateTime.MinValue;

            string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

            using (SqlConnection con = new SqlConnection(sqlConnectionString))
            {
                string str = "SELECT * FROM Schedule_Event WHERE S_Id=@S_Id";

                using (SqlCommand cmd = new SqlCommand(str, con))
                {
                    cmd.Parameters.AddWithValue("@S_Id", eId);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            S_ename = GetValueFromReader(reader, "S_Event");
                            S_description = GetValueFromReader(reader, "S_Description");
                            S_sdate = reader.IsDBNull(reader.GetOrdinal("S_Sdate")) ? DateTime.MinValue : reader.GetDateTime(reader.GetOrdinal("S_Sdate"));
                            S_edate = reader.IsDBNull(reader.GetOrdinal("S_Edate")) ? DateTime.MinValue : reader.GetDateTime(reader.GetOrdinal("S_Edate"));

                            TimeSpan startTime = reader.GetTimeSpan(reader.GetOrdinal("S_Stime"));
                            TimeSpan endTime = reader.GetTimeSpan(reader.GetOrdinal("S_Etime"));

                            S_stime = S_sdate.Date + startTime;
                            S_etime = S_edate.Date + endTime;

                            S_venue = GetValueFromReader(reader, "S_Venue");
                            s_room = GetValueFromReader(reader, "S_Room");
                            s_sponcer = GetValueFromReader(reader, "S_Sponsor");
                            s_organizer = GetValueFromReader(reader, "S_Organizer");
                        }
                    }
                }
            }
        }

        private string GetValueFromReader(SqlDataReader reader, string columnName)
        {
            return reader.IsDBNull(reader.GetOrdinal(columnName)) ? string.Empty : reader[columnName].ToString();
        }

    }
}

    public class ScheduleRventDal
    {
        public string Save(Schedule_Event schReg)
        {
            string message = string.Empty;

            try
            {
                using (EventManagementEntities context = new EventManagementEntities())
                {

                    context.Schedule_Event.Add(schReg);
                    int rowsAffected = context.SaveChanges();

                    if (rowsAffected > 0)
                    {
                        message = "Event registration saved successfully!";
                    }
                    else
                    {
                        message = "Failed to save event registration.";
                    }
                }
            }
            catch (DbEntityValidationException ex)
            {
                var validationErrors = ex.EntityValidationErrors
                    .SelectMany(e => e.ValidationErrors)
                    .Select(e => e.ErrorMessage);

                message = "Validation errors occurred while saving event registration: " + string.Join("; ", validationErrors);
            }


            return message;
        }
    }

public class UpdateScheduleEvent
{
    public void UpdateSchedule(int eId, string s_Sname, string s_Sdescription, DateTime s_Ssdate, DateTime s_Sedate, DateTime s_Sstime, DateTime s_Setime, string s_Svenue, string s_room, string s_sponcer, string s_organizer)
    {
        string sqlConnectionString = ConfigurationManager.ConnectionStrings["EventEntities"].ConnectionString;

        using (SqlConnection con = new SqlConnection(sqlConnectionString))
        {
            con.Open();

            using (SqlCommand cmd = new SqlCommand("UpdateSchedule", con)) // Update with your actual stored procedure name
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@S_Id", eId);
                cmd.Parameters.AddWithValue("@S_Event", s_Sname);
                cmd.Parameters.AddWithValue("@S_Description", s_Sdescription);
                cmd.Parameters.AddWithValue("@S_Sdate", s_Ssdate);
                cmd.Parameters.AddWithValue("@S_Edate", s_Sedate);
                cmd.Parameters.AddWithValue("@S_Stime", s_Sstime);
                cmd.Parameters.AddWithValue("@S_Etime", s_Setime);
                cmd.Parameters.AddWithValue("@S_Venue", s_Svenue);
                cmd.Parameters.AddWithValue("@S_Room", s_room);
                cmd.Parameters.AddWithValue("@S_Sponsor", s_sponcer);
                cmd.Parameters.AddWithValue("@S_Organizer", s_organizer);

                // Execute the command
                cmd.ExecuteNonQuery();
            }
        }
    }
}




