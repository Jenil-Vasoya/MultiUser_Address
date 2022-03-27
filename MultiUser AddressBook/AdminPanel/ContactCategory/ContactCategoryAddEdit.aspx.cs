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

namespace WebApplication2.MultiUser_AddressBook.AdminPanel.ContactCategory
{
    public partial class ContactCategoryAddEdit : System.Web.UI.Page
    {
        #region Load Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["ContactCategoryID"] != null)
                {

                    lblMessageMode.Text = "Edit Mode | ContactCategoryID = " + Request.QueryString["ContactCategoryID"].ToString();
                    FillControls(Convert.ToInt32(Request.QueryString["ContactCategoryID"]));
                }
                else
                {
                    lblMessageMode.Text = " Add Mode";
                }
            }
           

        }

        #endregion Load Event


        #region Button : Save
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            #region local variable

            SqlString strContactCategoryName = new SqlString();


            #endregion local variable

            try
            {
                #region Server Side Validation

                if (txtContactCategoryName.Text.Trim() == "")
                {
                    lblMessage.Text = "Please enter the ContactCategory";
                }

                #endregion Server Side Validation

                #region Gather Enformation

                if (txtContactCategoryName.Text.Trim() != "")
                {
                    strContactCategoryName = txtContactCategoryName.Text.Trim();
                }

                #endregion Gather information

                #region Connection Open & Command Object

                if (objConn.State != ConnectionState.Open)
                {

                    objConn.Open();
                }

                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;

                strContactCategoryName = txtContactCategoryName.Text.Trim();

                objCmd.Parameters.AddWithValue("@ContactCategoryName", strContactCategoryName);



                #endregion Connection Open & Command Object


                if (Request.QueryString["ContactCategoryID"] != null)
                {

                    #region Edit Mode
                    //Edit Mode
                    objCmd.Parameters.AddWithValue("@ContactCategoryID", Request.QueryString["ContactCategoryID"].ToString().Trim());
                    objCmd.CommandText = "PR_ContactCategory_UpdateByPK";
                    if (Session["UserID"] != null)
                    {
                        objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                    }
                    objCmd.ExecuteNonQuery();
                    Response.Redirect("~/MultiUser AddressBook/AdminPanel/ContactCategory/ContactCategory.aspx", true);
                    #endregion Edit Mode
                }
                else
                {
                    #region Add Mode
                    //Add Mode
                    objCmd.CommandText = "PR_ContactCategory _Insert";
                    if (Session["UserID"] != null)
                    {
                        objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                    }
                    objCmd.ExecuteNonQuery();
                    txtContactCategoryName.Text = "";
                    lblMessage.Text = "Data Inserted Successfully";
                    txtContactCategoryName.Focus();
                    #endregion Add Mode
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }

        }
        #endregion Button : Save

        #region FillControls

        private void FillControls(SqlInt32 ContactCategoryID)
        {
            #region Local variable
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());
            #endregion Local variable
            try
            {
                #region Connection Open And Command Object

                if (objConn.State != ConnectionState.Open)
                {
                    objConn.Open();
                }
                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_ContactCategory_SelectByPK";
                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }
                objCmd.Parameters.AddWithValue("@ContactCategoryID", ContactCategoryID.ToString().Trim());

                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    while (objSDR.Read())
                    {
                        if (!objSDR["ContactCategoryName"].Equals(DBNull.Value))
                        {
                            txtContactCategoryName.Text = objSDR["ContactCategoryName"].ToString().Trim();
                        }

                        break;
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "No Date Available for the ContactCategoryID =" + ContactCategoryID.ToString();
                }

                if (objConn.State == ConnectionState.Open)
                    objConn.Close();


                #endregion Connection Open And Command Object

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
            }

        }

        #endregion FillControls
    }
}