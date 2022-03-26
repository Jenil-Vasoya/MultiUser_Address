using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.MultiUser_AddressBook.Content
{
    public partial class MultiUserAddressBook : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserID"] == null)
            {
                Response.Redirect("~/MultiUser AddressBook/LogIn.aspx");
            }
            if(!Page.IsPostBack)
            {
                if(Session["DisplayName"] != null)
                {
                    lblDisplayName.Text = "Welcome " + Session["DisplayName"] + " !";
                }
            }
        }

        protected void iLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/MultiUser AddressBook/LogIn.aspx");
        }
    }
}