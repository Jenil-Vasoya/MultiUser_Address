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
    public partial class ContactAddEdit : System.Web.UI.Page
    {

        #region page load
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCheckBoxContactCategoryList();
                FillDropDownCountryList();

                if (Request.QueryString["ContactID"] != null)
                {
                    lblMessageMode.Text = "Edit Mode  |  CityID =" + Request.QueryString["ContactID"].Trim();
                    FillControls(Convert.ToInt32(Request.QueryString["ContactID"].Trim()));
                    FillContactCategory(Convert.ToInt32(Request.QueryString["ContactID"].Trim()));
                    FillDropDownStateList();
                    FillDropDownCityList();
                }
                else
                {
                    lblMessageMode.Text = "Add Mode";
                }
            }

        }



        #endregion page load


        #region Button : save
        protected void btnSave_Click(object sender, EventArgs e)
        {
            #region Local Variable

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            SqlInt32 strCountryID = new SqlInt32();
            SqlInt32 strStateID = new SqlInt32();
            SqlInt32 strCityID = new SqlInt32();
            SqlInt32 strcblContactCategory = new SqlInt32();
            SqlString strContactName = new SqlString();
            SqlString strContactNo = new SqlString();
            SqlString strWhatsappNo = new SqlString();
            SqlString strBirthDate = new SqlString();
            SqlString strEmail = new SqlString();
            SqlInt32 strAge = new SqlInt32();
            SqlString strAddress = new SqlString();
            SqlString strBloodGroup = new SqlString();
            SqlString strFacebook = new SqlString();
            SqlString strLinkedIn = new SqlString();

            #endregion Local Variable

            lblCountry.Text = "";
            lblState.Text = "";
            lblCity.Text = "";
            lblContactCategory.Text = "";
            lblContactName.Text = "";
            lblContactNo.Text = "";
            lblEmail.Text = "";
            lblAddress.Text = "";

         
            try
            {
                #region Server Side Validation


                if (ddlCountry.SelectedIndex == 0)
                {
                    lblCountry.Text = "Select the Country";
                    return;
                }
                if (ddlState.SelectedIndex == 0)
                {
                    lblState.Text = "Select the State";
                    return;
                }
                if (ddlCity.SelectedIndex == 0)
                {
                    lblCity.Text = "Select the City";
                    return;
                }
                if (cblContactCategory.SelectedItem == null)
                {
                    lblContactCategory.Text = "Select the ContactCategory";
                    return;
                }
                if (txtContactName.Text == "")
                {
                    lblContactName.Text = "Please fill the ContactName";
                    return;
                }
                if (txtContactNo.Text == "")
                {
                    lblContactNo.Text = "Please fill the ContactNo";
                    return;
                }
                if (txtEmail.Text == "")
                {
                    lblEmail.Text = "Please fill the Email";
                    return;
                }
                if (txtAddress.Text == "")
                {
                    lblAddress.Text = "Please fill the Address";
                    return;
                }

                #endregion Server Side Validation

                #region Gather Information

                if (ddlCountry.SelectedIndex > 0)
                {
                    strCountryID = Convert.ToInt32(ddlCountry.SelectedValue);
                }
                if (ddlState.SelectedIndex > 0)
                {
                    strStateID = Convert.ToInt32(ddlState.SelectedValue);
                }
                if (ddlCity.SelectedIndex > 0)
                {
                    strCityID = Convert.ToInt32(ddlCity.SelectedValue);
                }
                if (cblContactCategory.SelectedItem != null)
                //{
                //    strcblContactCategory = Convert.ToInt32(cblContactCategory.SelectedValue);
                //}
                {
                    strcblContactCategory = Convert.ToInt32(cblContactCategory.SelectedValue);
                }
                if (txtContactName.Text.Trim() != "")
                {
                    strContactName = txtContactName.Text.Trim();
                }
                if (txtContactNo.Text.Trim() != "")
                {
                    strContactNo = txtContactNo.Text.Trim();
                }
                if (txtWhatsappNo.Text.Trim() != "")
                {
                    strWhatsappNo = txtWhatsappNo.Text.Trim();
                }
                if (txtBirthDate.Text.Trim() != "")
                {
                    strBirthDate = txtBirthDate.Text.Trim();
                }
                if (txtEmail.Text.Trim() != "")
                {
                    strEmail = txtEmail.Text.Trim();
                }
                if (txtAge.Text.Trim() != "")
                {
                    strAge = Convert.ToInt32(txtAge.Text.Trim());
                }
                if (txtAddress.Text.Trim() != "")
                {
                    strAddress = txtAddress.Text.Trim();
                }
                if (txtBloodGroup.Text.Trim() != "")
                {
                    strBloodGroup = txtBloodGroup.Text.Trim();
                }
                if (txtFacebook.Text.Trim() != "")
                {
                    strFacebook = txtFacebook.Text.Trim();
                }
                if (txtLinkedIN.Text.Trim() != "")
                {
                    strLinkedIn = txtLinkedIN.Text.Trim();
                }

                #endregion Gather Information

                #region Set Connection & Command Object

                if (objConn.State != ConnectionState.Open)
                {
                    objConn.Open();
                }
                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;

                objCmd.Parameters.AddWithValue("@CountryID", Convert.ToInt32(ddlCountry.SelectedValue));
                objCmd.Parameters.AddWithValue("@StateID", Convert.ToInt32(ddlState.SelectedValue));
                objCmd.Parameters.AddWithValue("@CityID", Convert.ToInt32(ddlCity.SelectedValue));
               // objCmd.Parameters.AddWithValue("@ContactCategoryID", strcblContactCategory);
                objCmd.Parameters.AddWithValue("@ContactName", strContactName);
                objCmd.Parameters.AddWithValue("@ContactNo", strContactNo);
                objCmd.Parameters.AddWithValue("@WhatsappNo", strWhatsappNo);
                objCmd.Parameters.AddWithValue("@BirthDate", strBirthDate);
                objCmd.Parameters.AddWithValue("@Email", strEmail);
                objCmd.Parameters.AddWithValue("@Age", strAge);
                objCmd.Parameters.AddWithValue("@Address", strAddress);
                objCmd.Parameters.AddWithValue("@BloodGroup", strBloodGroup);
                objCmd.Parameters.AddWithValue("@FacebookID", strFacebook);
                objCmd.Parameters.AddWithValue("@LinkedINID", strLinkedIn);

                #endregion Set Connection & Command Object

               

                if (Request.QueryString["ContactID"] != null)
                {
                    #region Edit Mode
                    //Edit Mode

                    objCmd.Parameters.AddWithValue("@ContactID", Request.QueryString["ContactID"].ToString().Trim());
                    objCmd.CommandText = "PR_Contact_UpdateByPK";
                    if (Session["UserID"] != null)
                    {
                        objCmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    }



                    SqlInt32 ContactID = 0;
                    ContactID = Convert.ToInt32(Request.QueryString["ContactID"]);

                    DeleteContactCategory(ContactID);

                    AddContactCategory(ContactID);

                    string FileType = Path.GetExtension(fuFile.FileName).ToLower();

                    if (fuFile.HasFile)
                    {
                        if (FileType == ".jpge" || FileType == ".jpg" || FileType == ".png" || FileType == ".gif")
                        {
                            UploadImage(ContactID, FileType);
                            //UploadImage(Convert.ToInt32(Request.QueryString["ContactID"]), FileType);
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Please Upload Valid File(File must have .jpg or .jpge or .png or .gif extention).";
                            return;
                        }


                    }
                    objCmd.ExecuteNonQuery();


                    Response.Redirect("~/MultiUser AddressBook/AdminPanel/Contact/Contact.aspx", true);
                    lblMessage.Text = "Data Updated Successfully";
                    ddlCountry.Focus();

                    #endregion Edit Mode
                }
                else
                {
                    #region Add Mode
                    //Add Mode
                    objCmd.CommandText = "PR_Contact_Insert";
                    if (Session["UserID"] != null)
                    {
                        objCmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                    }


                    objCmd.Parameters.Add("@ContactID",SqlDbType.Int,4).Direction = ParameterDirection.Output;

                    objCmd.ExecuteNonQuery();

                    SqlInt32 ContactID = 0;
                    ContactID = Convert.ToInt32(objCmd.Parameters["@ContactID"].Value);

                    string FileType = Path.GetExtension(fuFile.FileName).ToLower();

                    if (fuFile.HasFile)
                    {
                        if (FileType == ".jpge" || FileType == ".jpg" || FileType == ".png" || FileType == ".gif")
                        {
                            UploadImage(ContactID, FileType);
                            //UploadImage(Convert.ToInt32(Request.QueryString["ContactID"]), FileType);
                        }
                        else
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Please Upload Valid File(File must have .jpg or .jpge or .png or .gif extention).";
                            return;
                        }


                    }

                    AddContactCategory(ContactID);




                    ddlCountry.SelectedIndex = 0;
                    ddlState.SelectedIndex = -1;
                    ddlCity.SelectedIndex = -1;
                    //cblContactCategory.SelectedValue = "";
                    txtContactName.Text = "";
                    txtContactNo.Text = "";
                    txtWhatsappNo.Text = "";
                    txtBirthDate.Text = "";
                    txtEmail.Text = "";
                    txtAge.Text = "";
                    txtAddress.Text = "";
                    txtBloodGroup.Text = "";
                    txtFacebook.Text = "";
                    txtLinkedIN.Text = "";
                    txtContactName.Focus();
                    txtContactNo.Focus();
                    txtWhatsappNo.Focus();
                    txtBirthDate.Focus();
                    txtEmail.Focus();
                    txtAge.Focus();
                    txtAddress.Focus();
                    txtBloodGroup.Focus();
                    txtFacebook.Focus();
                    txtLinkedIN.Focus();
                    lblMessage.Focus();


                    lblMessage.Text = " Data Inserted successfully";

                    #endregion Add Mode
                }

                if (objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
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
        #endregion Button : save

        #region Add ContactCategory
        private void AddContactCategory(SqlInt32 ContactID)
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();



                foreach (ListItem liContactCategoryID in cblContactCategory.Items)
                {
                    if (liContactCategoryID.Selected)
                    {
                        SqlCommand objCmdContactCategory = objConn.CreateCommand();
                        objCmdContactCategory.CommandType = CommandType.StoredProcedure;
                        objCmdContactCategory.CommandText = "[PR_ContactWiseContactCategory_Insert]";
                        objCmdContactCategory.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        objCmdContactCategory.Parameters.AddWithValue("@ContactID", ContactID.ToString());
                        objCmdContactCategory.Parameters.AddWithValue("@ContactCategoryID", liContactCategoryID.Value.ToString());
                        objCmdContactCategory.ExecuteNonQuery();
                    }
                }

                if (objConn.State == ConnectionState.Open)
                    objConn.Close();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message + ex;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }

        }

        #endregion Add ContactCategory

        #region Delete ContactCategory
        private void DeleteContactCategory(SqlInt32 ID)
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            try
            {
                if (objConn.State != ConnectionState.Open)
                    objConn.Open();



                foreach (ListItem liContactCategoryID in cblContactCategory.Items)
                {
                    if (liContactCategoryID.Selected)
                    {
                        SqlCommand objCmdContactCategory = objConn.CreateCommand();
                        objCmdContactCategory.CommandType = CommandType.StoredProcedure;
                        objCmdContactCategory.CommandText = "PR_ContactWiseContactCategory_Delete";
                        objCmdContactCategory.Parameters.AddWithValue("@UserID", Session["UserID"]);
                        objCmdContactCategory.Parameters.AddWithValue("@ContactID", ID.ToString());
                        objCmdContactCategory.ExecuteNonQuery();
                    }
                }

                if (objConn.State == ConnectionState.Open)
                    objConn.Close();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message + ex;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }

        }

        #endregion Delete ContactCategory

        #region Fill Drop Down Country
        protected void FillDropDownCountryList()
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_Country_SelectCountryDropDownList";

            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows == true)
            {
                ddlCountry.DataSource = objSDR;
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();
            }

            ddlCountry.Items.Insert(0, new ListItem("- Select Country -", "-1"));

            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();
            }
        }
        #endregion Fill Drop Down Country

        #region Fill Drop Down State
        protected void FillDropDownStateList()
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_City_StateDropDownList";
            objCmd.Parameters.AddWithValue("CountryID", Convert.ToInt32(ddlCountry.SelectedValue));

            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows == true)
            {
                ddlState.DataSource = objSDR;
                ddlState.DataValueField = "StateID";
                ddlState.DataTextField = "StateName";
                ddlState.DataBind();
            }

            ddlState.Items.Insert(0, new ListItem("- Select State -", "-1"));
            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();
            }

        }
        #endregion Fill Drop Down State

        #region Fill Drop Down City
        protected void FillDropDownCityList()
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_City_SelectCityDropDownList";
            objCmd.Parameters.AddWithValue("StateID", Convert.ToInt32(ddlState.SelectedValue));

            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows == true)
            {
                ddlCity.DataSource = objSDR;
                ddlCity.DataValueField = "CityID";
                ddlCity.DataTextField = "CityName";
                ddlCity.DataBind();
            }

            ddlCity.Items.Insert(0, new ListItem("- Select City -", "-1"));

            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();
            }
        }
        #endregion Fill Drop Down City

        #region Fill Check BOX Contact Category List
        protected void FillCheckBoxContactCategoryList()
        {
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString.Trim());

            if (objConn.State != ConnectionState.Open)
            {
                objConn.Open();
            }
            SqlCommand objCmd = objConn.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_ContactCategory_SelectContactCategoryDropDownList";

            SqlDataReader objSDR = objCmd.ExecuteReader();

            if (objSDR.HasRows == true)
            {

                cblContactCategory.DataValueField = "ContactCategoryID";
                cblContactCategory.DataTextField = "ContactCategoryName";
                cblContactCategory.DataSource = objSDR;
                cblContactCategory.DataBind();
            }


            //cblContactCategory.Items.Insert(0, new ListItem("- Select Contact Category -", "-1"));

            if (objConn.State == ConnectionState.Open)
            {
                objConn.Close();
            }
        }
        #endregion Fill Drop Down Contact Category

        #region FillControl
        private void FillControls(SqlInt32 ContactID)
        {
            #region Local variable

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            #endregion Local variable

            try
            {
                #region Connection Open And Command Object

                if (ConnectionState.Open != objConn.State)
                {
                    objConn.Open();
                }

                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "[PR_Contact_SelectByPK]";
                if(Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("UserID", Session["UserID"]);
                }
                objCmd.Parameters.AddWithValue("ContactID", ContactID.ToString());

                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    while (objSDR.Read())
                    {
                        if (!objSDR["CountryID"].Equals(DBNull.Value))
                        {
                            ddlCountry.SelectedValue = objSDR["CountryID"].ToString().Trim();
                        }
                        if (!objSDR["StateID"].Equals(DBNull.Value))
                        {
                            ddlState.SelectedValue = objSDR["StateID"].ToString().Trim();
                        }
                        if (!objSDR["CityID"].Equals(DBNull.Value))
                        {
                            ddlCity.SelectedValue = objSDR["CityID"].ToString().Trim();
                        }
                        //if (!objSDR["ContactCategoryID"].Equals(DBNull.Value))
                        //{
                        //    cblContactCategory.SelectedValue = objSDR["ContactCategoryID"].ToString().Trim();
                        //}
                        if (!objSDR["ContactName"].Equals(DBNull.Value))
                        {
                            txtContactName.Text = objSDR["ContactName"].ToString().Trim();
                        }
                        if (!objSDR["ContactNo"].Equals(DBNull.Value))
                        {
                            txtContactNo.Text = objSDR["ContactNo"].ToString().Trim();
                        }
                        if (!objSDR["WhatsappNo"].Equals(DBNull.Value))
                        {
                            txtWhatsappNo.Text = objSDR["WhatsappNo"].ToString().Trim();
                        }
                        if (!objSDR["BirthDate"].Equals(DBNull.Value))
                        {
                            txtBirthDate.Text = Convert.ToDateTime(objSDR["BirthDate"].ToString().Trim()).ToString("yyyy-MM-dd");
                        }
                        if (!objSDR["Email"].Equals(DBNull.Value))
                        {
                            txtEmail.Text = objSDR["Email"].ToString().Trim();
                        }
                        if (!objSDR["Age"].Equals(DBNull.Value))
                        {
                            txtAge.Text = objSDR["Age"].ToString().Trim();
                        }
                        if (!objSDR["Address"].Equals(DBNull.Value))
                        {
                            txtAddress.Text = objSDR["Address"].ToString().Trim();
                        }
                        if (!objSDR["BloodGroup"].Equals(DBNull.Value))
                        {
                            txtBloodGroup.Text = objSDR["BloodGroup"].ToString().Trim();
                        }
                        if (!objSDR["FacebookID"].Equals(DBNull.Value))
                        {
                            txtFacebook.Text = objSDR["FacebookID"].ToString().Trim();
                        }
                        if (!objSDR["LinkedINID"].Equals(DBNull.Value))
                        {
                            txtFacebook.Text = objSDR["LinkedINID"].ToString().Trim();
                        }

                        if (!objSDR["FilePath"].Equals(DBNull.Value))
                        {
                            imgImage.ImageUrl = objSDR["FilePath"].ToString().Trim();
                        }

                        break;
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "No Contact data Available for the =" + ContactID.ToString();
                }

                #endregion Connection Open And Command Object

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message;
            }
            finally
            {
                if (objConn.State != ConnectionState.Closed)
                {
                    objConn.Close();
                }
            }

        }




        #endregion FillControl

        #region Selected ContactCategory

        private void FillContactCategory(SqlInt32 ContactID)
        {
            #region Local variable

            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);

            #endregion Local variable

            try
            {

                if (ConnectionState.Open != objConn.State)
                {
                    objConn.Open();
                }

                SqlCommand objCmd = objConn.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_ContactCategory_SelectOrNot";
                if (Session["UserID"] != null)
                {
                    objCmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
                }
                objCmd.Parameters.AddWithValue("@ContactID", ContactID.ToString());

                
                SqlDataReader objSDR = objCmd.ExecuteReader();

                if (objSDR.HasRows)
                {
                    while (objSDR.Read())
                    {
                        if (objSDR["SelectOrNot"].ToString() == "Selected")
                        {
                            cblContactCategory.Items.FindByValue(objSDR["ContactCategoryID"].ToString()).Selected = true;
                        }

                    }
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
                {
                    objConn.Close();
                }
            }

        }






        #endregion Selected ContactCategory

        #region Upload Image
        private void UploadImage(SqlInt32 Id, string FileExtention)
        {
            SqlString strFilePath = SqlString.Null;

            #region Set Connection
            SqlConnection objConn = new SqlConnection(ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString);
            #endregion Set Connection
            try
            {


                if (objConn.State != ConnectionState.Open)
                    objConn.Open();

                #region Image Upload
                strFilePath = "~/Content/Images/" + Id + ".jpg";
                if (!Directory.Exists(Server.MapPath("~/Content/Images/")))
                {
                    Directory.CreateDirectory(Server.MapPath("~/Content/Images/"));
                }
                fuFile.SaveAs(Server.MapPath("~/Content/Images/" + Id + ".jpg"));
                long length = new FileInfo(Server.MapPath(strFilePath.ToString())).Length;
                #endregion Image Upload

                #region Create Command and Set Parameters
                SqlCommand objCmd = new SqlCommand("PR_Contact_UpdateFileByPK", objConn);
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.Parameters.AddWithValue("@ContactID", Id);
                objCmd.Parameters.AddWithValue("@FilePath", strFilePath);
                objCmd.Parameters.AddWithValue("@FileType", Convert.ToString(FileExtention));
                objCmd.Parameters.AddWithValue("@FileSize", Convert.ToString(length));
                if (Session["UserID"] != null)
                    objCmd.Parameters.AddWithValue("@UserID", Convert.ToInt32(Session["UserID"]));

                objCmd.ExecuteNonQuery();
                #endregion Create Command and Set Parameters

                if (objConn.State == ConnectionState.Open)
                    objConn.Close();

            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = ex.Message + ex;
            }
            finally
            {
                if (objConn.State == ConnectionState.Open)
                    objConn.Close();
            }
        }
        #endregion Upload Image


        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlState.Items.Clear();


            FillDropDownStateList();

        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCity.Items.Clear();
            FillDropDownCityList();
        }

    }
}