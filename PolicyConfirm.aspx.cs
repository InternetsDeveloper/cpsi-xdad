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
    public partial class PolicyConfirm : System.Web.UI.Page
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
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/uploadpolicy"));

            foreach (FileInfo file1 in di.GetFiles())
            {
                file1.Delete();
            }
            string path = Session["path_policy"].ToString();
            string dstpath = Session["dstpath_policy"].ToString();
            System.IO.File.Copy(Server.MapPath(path), Server.MapPath(dstpath), true);
            lblMessage.Visible = true;



        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}