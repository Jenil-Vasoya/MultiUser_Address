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
    public partial class CountryAddEdit : System.Web.UI.Page
    {
        #region Load Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["CountryID"] != null)
                {
                    lblMessageMode.Text = "Edit Mode | CountryID = " + Request.QueryString["CountryID"].ToString();
                    FillControls(Convert.ToInt32(Request.QueryString["CountryID"]));
                }
                else
                {
                    lblMessageMode.Text = "Add Mode";
                }
            }

        }

        #endregion Load Event

        #region Button : Save

        protected void btnSave_Click(object sender, EventArgs e)
        {


            #region Connection String 
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion Connection String 

            try
            {
                #region Local variable
                //Declare Local variables to insert the data
                SqlString strCountryName = SqlString.Null;
                SqlString strCountryCode = SqlString.Null;
                #endregion Local variable

                #region server side Validation
                //Validation | Server side validation
                string strErrorMessage = "";


                if (txtCountryName.Text.Trim() == "")
                    strErrorMessage += " - Enter Country Name ";
                if (txtCountryCode.Text.Trim() == "")
                    strErrorMessage += " - Enter Country Code ";

                if (strErrorMessage != "")
                {
                    lblMessageError.ForeColor = System.Drawing.Color.Red;
                    lblMessageError.Text = strErrorMessage;
                    return;
                }

                if (txtCountryName.Text.Trim() != "")
                {
                    strCountryName = txtCountryName.Text.Trim();
                }
                if (txtCountryCode.Text.Trim() != "")
                {
                    strCountryCode = txtCountryCode.Text.Trim();
                }

                #endregion server side Validation

                //save the country data
                //Establish the connection

                #region Set Connection & Command Object

                if (ConnectionState.Open != objConn.State)
                    objConn.Open();

                //prepare the command

                //SqlCommand objCmd = new SqlCommand();
                //objCmd.Connection = objConn;
                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;


                //Pass the parameter in the SP
                objCmd.Parameters.AddWithValue("@CountryName", strCountryName);
                objCmd.Parameters.AddWithValue("@CountryCode", strCountryCode);

                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }

                #endregion Set Connection & Command Object

                if (Request.QueryString["CountryID"] != null)
                {
                    #region Edit Mode
                    objCmd.Parameters.AddWithValue("@CountryID", Request.QueryString["CountryID"].ToString().Trim());
                    objCmd.CommandText = "PR_Country_UpdateByPK";


                    objCmd.ExecuteNonQuery();


                    Response.Redirect("~/MultiUser AddressBook/AdminPanel/Country/Country.aspx", true);
                    #endregion Edit Mode

                }
                else
                {
                    #region Add Mode

                    objCmd.CommandText = "PR_Country_Insert";



                    objCmd.ExecuteNonQuery();
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Data Inserted Successfully";
                    txtCountryName.Text = txtCountryCode.Text = "";
                    txtCountryName.Focus();
                    #endregion Add Mode

                }
                if (objConn.State != ConnectionState.Closed)
                    objConn.Close();

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (ConnectionState.Closed != objConn.State)
                    objConn.Close();
            }

        }

        #endregion Button : Save

        #region Fill Edit Control

        private void FillControls(SqlInt32 CountryID)
        {
            #region Connection String

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion Connection String


            try
            {
                #region Set Connection & Command Object


                if (objConn.State != ConnectionState.Open)
                    objConn.Open();
                SqlCommand objCmd = new SqlCommand();
                objCmd.Connection = objConn;
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_Country_SelectByPK";
                objCmd.Parameters.AddWithValue("@CountryID", CountryID.ToString());

                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }

                #endregion Set Connection & Command Object


                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    while (objSDR.Read())
                    {
                        if (!objSDR["CountryName"].Equals(DBNull.Value))
                        {
                            txtCountryName.Text = objSDR["CountryName"].ToString().Trim();
                        }
                        if (!objSDR["CountryCode"].Equals(DBNull.Value))
                        {
                            txtCountryCode.Text = objSDR["CountryCode"].ToString().Trim();
                        }
                        break;

                    }
                }
                else
                {
                    lblMessage.Text = "No data avilable for the country id" + CountryID.ToString();
                }
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();




            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State != ConnectionState.Closed)
                    objConn.Close();
            }
        }
        #endregion Fill Edit Control
    }
}