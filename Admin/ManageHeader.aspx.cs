using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class ManageHeader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSave.Visible = false;
                pnlSaved.Visible = false;
                txtHeader.Text = new Util().GetSettingsValue("HeaderText");
                txtAdminHeader.Text= new Util().GetSettingsValue("AdminHeaderText");


            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string header = txtHeader.Text.Trim();
            string adminheader = txtAdminHeader.Text.Trim();
            string msg = new Util().UpdateSettings("HeaderText", header);
             msg = new Util().UpdateSettings("AdminHeaderText", adminheader);
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
            Response.Redirect("Default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlSave.Visible = false;
            pnlSaved.Visible = false;
        }



        
        protected void btnAgree_Click(object sender, EventArgs e)
        {
           
            pnlSave.Visible = true;
            pnlSaved.Visible = false;

        }
    }
}