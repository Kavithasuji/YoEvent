using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;

namespace Event_management.common
{
    public class DBCommunicator
    {

        static SqlConnection connection;
        static SqlCommand cmd;
        static SqlDataAdapter da;
        static string strConnection = "";


        #region Linq To Datatable
        public static DataTable ListToDataTable<T>(IEnumerable<T> varlist)
        {
            DataTable dtReturn = new DataTable();

            // column names 
            PropertyInfo[] oProps = null;

            if (varlist == null) return dtReturn;

            foreach (T rec in varlist)
            {
                // Use reflection to get property names, to create table, Only first time, others will follow 
                if (oProps == null)
                {
                    oProps = ((Type)rec.GetType()).GetProperties();
                    foreach (PropertyInfo pi in oProps)
                    {
                        Type colType = pi.PropertyType;

                        if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition()
                        == typeof(Nullable<>)))
                        {
                            colType = colType.GetGenericArguments()[0];
                        }

                        dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                    }
                }

                DataRow dr = dtReturn.NewRow();

                foreach (PropertyInfo pi in oProps)
                {
                    dr[pi.Name] = pi.GetValue(rec, null) == null ? DBNull.Value : pi.GetValue
                    (rec, null);
                }

                dtReturn.Rows.Add(dr);
            }
            return dtReturn;
        }
        #endregion Linq To Datatable

        #region Linq To Array List
        public static ArrayList LINQToArrayList<T>(IEnumerable<T> varlist)
        {
            //var QueryList = varlist.ToList();

            ArrayList ArrayListReturn = new ArrayList();

            // column names 
            PropertyInfo[] oProps = null;

            if (varlist == null) return ArrayListReturn;

            foreach (T rec in varlist)
            {
                if (oProps == null)
                {
                    oProps = ((Type)rec.GetType()).GetProperties();
                }
                foreach (PropertyInfo pi in oProps)
                {
                    string strValue = Convert.ToString(pi.GetValue(rec, null).ToString() == "" ? DBNull.Value : pi.GetValue(rec, null));
                    ArrayListReturn.Add(strValue);
                }
            }
            return ArrayListReturn;
        }
        #endregion Linq To Array List


        public static string AppConnectionString
        {
            get
            {
                strConnection = ConfigurationManager.ConnectionStrings["UnifiedPortal"].ConnectionString;
                return strConnection;
            }
        }


        public static DataTable GetDtDataAdapter(StringBuilder Qry)
        {
            DataTable dt = new DataTable();
            connection = new SqlConnection(AppConnectionString);

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(Qry.ToString(), connection);
                //Added by Bala for time out
                da.SelectCommand.CommandTimeout = 60000000;
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }

            return dt;
        }

        public static void InsertData(string query)
        {
            try
            {
                connection = new SqlConnection(AppConnectionString);
                SqlCommand MyCommand2 = new SqlCommand(query, connection);
                SqlDataReader MyReader2;
                connection.Open();
                MyReader2 = MyCommand2.ExecuteReader();
                //Message = "Successfuly ";
            }
            catch
            {

            }
        }


        public static DateTime ConvertDate(string DateOnly)
        {
            string[] formats = {"M/d/yyyy", "M/d/yyyy",
                         "MM/dd/yyyy", "M/d/yyyy",
                         "M/d/yyyy", "M/d/yyyy",
                         "M/d/yyyy", "M/d/yyyy",
                         "MM/dd/yyyy", "M/dd/yyyy","dd-MM-yyyy"};

            DateTime dateValue;


            if (DateTime.TryParseExact(DateOnly, formats,
                                       new CultureInfo("en-US"),
                                       DateTimeStyles.None,
                                       out dateValue))
            {
                return dateValue;
            }
            else
            {
                return Convert.ToDateTime(DateOnly);
            }


        }
    }
}