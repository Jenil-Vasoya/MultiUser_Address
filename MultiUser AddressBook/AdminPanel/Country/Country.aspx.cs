using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.MultiUser_AddressBook.AdminPanel.Country
{
    public partial class Country : System.Web.UI.Page
    {
        #region Load event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillGridView();
            }
        }
        #endregion Load event

        #region gvCountry : RowCommand
        protected void gvCountry_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {

                if (e.CommandArgument.ToString() != "")
                {
                    DeleteCountry(Convert.ToInt32(e.CommandArgument.ToString().Trim()));

                }

            }


        }

        #endregion gvCountry : RowCommand

        #region FillGridView
        private void FillGridView()
        {
            #region connection string
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            //Read the connection string from web.Config file
            #endregion connection string

            try
            {
                #region Set Connection & Command Object

                objConn.Open();

                SqlCommand objCmd = new SqlCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_Country_SelectAll";

                if(Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }

                #endregion Set Connection & Command Object


                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    gvCountry.DataSource = objSDR;
                    gvCountry.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (ConnectionState.Closed != objConn.State)
                    objConn.Close();
            }

        }
        #endregion FillGridView

        #region Delete Country
        private void DeleteCountry(SqlInt32 CountryID)
        {

            #region connection string
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion connection string

            try
            {
                #region Set Connection & Command Object
                if (ConnectionState.Open != objConn.State)
                    objConn.Open();

                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_Country_DeleteByPK";
                objCmd.Parameters.AddWithValue("@CountryID", CountryID.ToString());
                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }
                objCmd.ExecuteNonQuery();
                #endregion Set Connection & Command Object


                objConn.Close();

                lblMessage.Text = CountryID + "Data Deleted Successfully";

                FillGridView();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (ConnectionState.Closed != objConn.State)
                    objConn.Close();
            }

        }
        #endregion Delete Country
    }
}