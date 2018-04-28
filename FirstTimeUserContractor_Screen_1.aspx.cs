using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class FirstTimeUserContractor_Screen_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");
            //if (!IsPostBack)
            //{
            //    if (Request != null && Request.UrlReferrer != null)
            //        ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
            //    string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/UploadPolicy/"));
            //    if (filePaths.Count() > 0)
            //    {
            //        string path = @"UploadPolicy/" + Path.GetFileName(filePaths[0]);
            //        docFrame.Attributes["src"] = path;
            //    }
            //}

            //if (!Page.IsPostBack)
            //{
            //    Util.HideInfo(notification_ufc);
            //}
        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
          
            if (!chkAgree.Checked)
            {
                Util.ShowInfo(notification_ufc, "Agreement Required ?");
                return;
            }
         
             Response.Redirect("FirstTimeUserContractor_Screen_2.aspx");
            
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor.aspx");
        }
    }
}