using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VCServiceClient.RESTClient;
using System.IO;

namespace TelerikWebApp3
{
    public partial class TemplateConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblMessage.Visible = false;
            }

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {

            string s = Session["Template"].ToString();
            File.WriteAllText(Server.MapPath(@"~\Theme\Theme.css"), s);
            lblMessage.Visible = true;



        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}