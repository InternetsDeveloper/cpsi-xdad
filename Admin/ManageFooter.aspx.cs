using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class ManageFooter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSave.Visible = false;
                pnlSaved.Visible = false;
                lblMessage.Text = "";
                txtCenter.Text = new Util().GetSettingsValue("Footer_Center_Text");
                txtRight.Text = new Util().GetSettingsValue("Footer_Right_Text");
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
       

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Update("Footer_Center_Text", txtCenter.Text.Trim());
            Update("Footer_Right_Text", txtRight.Text.Trim());
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
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

        private static void Update(string key,string val)
        {
            string header = val;
            string msg = new Util().UpdateSettings(key, header);
           
        }
    }
}