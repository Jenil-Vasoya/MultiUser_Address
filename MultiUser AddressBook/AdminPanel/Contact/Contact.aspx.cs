using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.MultiUser_AddressBook.AdminPanel.Contact
{
    public partial class Contact : System.Web.UI.Page
    {
        #region Page Load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillGridView();
            }
        }

        #endregion Page Load

        #region gvContact : RowCommand

        protected void gvContact_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRecord")
            {

                if (e.CommandArgument.ToString() != "")
                {
                    DeleteContact(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                }
            }
            if (e.CommandName == "DeleteImage")
            {

                if (e.CommandArgument.ToString() != "")
                {
                    DeleteImage(Convert.ToInt32(e.CommandArgument.ToString().Trim()));
                }

            }
        }

        #region Delete Image
        private void DeleteImage(SqlInt32 ContactID)
        {

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            try
            {
                objConn.Open();
                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_Contact_DeleteFileByPK";
                objCmd.Parameters.AddWithValue("ContactID", ContactID.ToString());
                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }

                objCmd.ExecuteNonQuery();

                FileInfo file = new FileInfo(Server.MapPath("~/Content/Images/" + ContactID + ".jpg"));

                if (file.Exists)
                {
                    file.Delete();
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Image Deleted Successfully";
                }
                else
                {
                    lblMessage.Text = "Image is not available for delete";
                }


                if (objConn.State != ConnectionState.Closed)
                {
                    objConn.Close();
                }


                FillGridView();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State != ConnectionState.Closed)
                    objConn.Close();
            }
            #endregion Delete Image
        }

        #endregion gvContact : RowCommand


        #region FillGridView
        private void FillGridView()
        {
            #region connection string

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            #endregion connection string

            try
            {
                #region Set Connection & Command Object
                objConn.Open();
                if (objConn.State != ConnectionState.Open)
                {
                    objConn.Open();
                }

                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_Contact_SelectAllByPK_UserID";
                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }

                //objCmd.CommandText = "PR_ContactCategory_SelectOrNot";

                #endregion Set Connection & Command Object

                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    gvContact.DataSource = objSDR;
                    gvContact.DataBind();
                }

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State != ConnectionState.Closed)
                    objConn.Close();
            }

        }

        #endregion FillGridView


        #region Delete Contact Record
        private void DeleteContact(SqlInt32 ContactID)
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();
                FileInfo file = new FileInfo(Server.MapPath("~/MultiUserAddressBook/Admin Panel/SaveUploadedFie/" + ContactID.ToString() + ".jpg"));

                if (file.Exists)
                {
                    file.Delete();
                }

                SqlCommand objcmd = objConn.CreateCommand();
                objcmd.CommandType = CommandType.StoredProcedure;
                objcmd.CommandText = "PR_ContactWiseContactCategory_DeleteAllByContactIDUserID";
                if (Session["UserID"] != null)
                    objcmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                objcmd.Parameters.AddWithValue("@ContactID", ContactID.ToString().Trim());

                objcmd.ExecuteNonQuery();

                objConn.Close();

                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = " Data Deleted Successfully";

                FillGridView();
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

        //#region Delete Contact

        //private void DeleteContact(SqlInt32 ContactID)
        //{
        //    SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

        //    try
        //    {
        //        objConn.Open();
        //        SqlCommand objCmd = objConn.CreateCommand();
        //        objCmd.CommandType = CommandType.StoredProcedure;
        //        objCmd.CommandText = "PR_Contact_DeleteByPK";
        //        objCmd.Parameters.AddWithValue("ContactID", ContactID.ToString());
        //        if (Session["UserID"] != null)
        //        {
        //            objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
        //        }

        //        objCmd.ExecuteNonQuery();

        //        if (objConn.State != ConnectionState.Closed)
        //        {
        //            objConn.Close();
        //        }

        //        lblMessage.Text = "Data Deleted Successfully";

        //        FillGridView();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessage.ForeColor = System.Drawing.Color.Red;
        //        lblMessage.Text = ex.Message;
        //    }
        //    finally
        //    {
        //        if (objConn.State != ConnectionState.Closed)
        //            objConn.Close();
        //    }
        //}

        //#endregion Delete Contact

        #endregion Delete Contact Record
    }
}