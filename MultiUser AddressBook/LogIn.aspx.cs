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

namespace WebApplication2.MultiUser_AddressBook
{
    public partial class LogIn : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {

            #region Local Variable
            SqlString strUserName = new SqlString();
            SqlString strPassword = new SqlString();
            #endregion Local Variable

            #region Server Side Validation

            lblUserName.Text = "";
            lblPassword.Text = "";
            if (txtUserName.Text.Trim() == "")
            {
                lblUserName.Text = "*Invalid UserName";
            }
            if (txtPassword.Text.Trim() == "")
            {
                lblPassword.Text = "*Invalid Password";
            }

            #endregion Server Side Validation

            #region Assign the Values

            if (txtUserName.Text != "")
            {
                strUserName = txtUserName.Text.Trim();
            }
            if (txtPassword.Text != "")
            {
                strPassword = txtPassword.Text.Trim();
            }

            #endregion Assign the Values

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            if (ConnectionState.Open != objConn.State)
            {
                objConn.Open();
            }

            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_User_SelectByUserNamePassword";

            objCmd.Parameters.AddWithValue("UserName", strUserName);
            objCmd.Parameters.AddWithValue("Password", strPassword);

            SqlDataReader objSDR = objCmd.ExecuteReader();
            try
            {
                if (objSDR.HasRows)
                {
                    while (objSDR.Read())
                    {
                        if (!objSDR["UserID"].Equals(DBNull.Value))
                        {
                            Session["UserID"] = objSDR["UserID"].ToString();
                        }
                        if (!objSDR["DisplayName"].Equals(DBNull.Value))
                        {
                            Session["DisplayName"] = objSDR["DisplayName"].ToString();
                        }
                        break;
                    }
                    Response.Redirect("~/MultiUser AddressBook/AdminPanel/HomePage.aspx");
                }
                else
                {
                    if(txtUserName.Text != "" && txtPassword.Text != "")
                    lblMessage.Text = "Invalid UserName or Password !!";
                }
            }
            catch (Exception ex)
            {
               lblMessage.Text = ex.Message;    
            }
            finally
            {
                objConn.Close();
            }


        }
    }
}