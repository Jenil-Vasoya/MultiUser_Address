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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            #region Local Variable
            SqlString strUserName = new SqlString();
            SqlString strPassword = new SqlString();
            SqlString strDisplayName = new SqlString();
            SqlString strMobileNo = new SqlString();
            SqlString strEmail = new SqlString();

            #endregion Local Variable

            #region Server Side Validation

            lblUserName.Text = "";
            lblPassword.Text = "";
            lblDisplayName.Text = "";
            lblMobileNo.Text = "";
            lblEmail.Text = "";
            if (txtUserName.Text.Trim() == "")
            {
                lblUserName.Text = "*Enter UserName";
            }
            if (txtPassword.Text.Trim() == "")
            {
                lblPassword.Text = "*EnterPassword";
            }
            if (txtDisplayName.Text.Trim() == "")
            {
                lblPassword.Text = "*Enter DisplayName";
            }
            if (txtMobileNo.Text.Trim() == "")
            {
                lblPassword.Text = "*Enter MobileNo";
            }
            if (txtEmail.Text.Trim() == "")
            {
                lblPassword.Text = "*Enter Email";
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
            if (txtDisplayName.Text != "")
            {
                strDisplayName = txtDisplayName.Text.Trim();
            }
            if (txtMobileNo.Text != "")
            {
                strMobileNo = txtMobileNo.Text.Trim();
            }
            if (txtEmail.Text != "")
            {
                strEmail = txtEmail.Text.Trim();
            }
            #endregion Assign the Values

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            if (ConnectionState.Open != objConn.State)
            {
                objConn.Open();
            }

            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_User_Insert";

            objCmd.Parameters.AddWithValue("UserName", strUserName);
            objCmd.Parameters.AddWithValue("Password", strPassword);
            objCmd.Parameters.AddWithValue("DisplayName", strDisplayName);
            objCmd.Parameters.AddWithValue("MobileNo", strMobileNo);
            objCmd.Parameters.AddWithValue("Email", strEmail);
            objCmd.ExecuteNonQuery();
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtDisplayName.Text = "";
            txtMobileNo.Text = "";
            txtEmail.Text = "";
            lblMessage.Text = "Account Created Successfully";
            if (ConnectionState.Open == objConn.State)
            {
                objConn.Close();
            }
        }
    }
}