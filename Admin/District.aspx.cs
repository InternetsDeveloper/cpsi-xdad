using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TelerikWebApp3
{
    public partial class District : System.Web.UI.Page
    {
        void showSchoolLogo()
        {
            string path = "";
            string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo/"));
            if (filePaths.Count() > 0)
            {
                path = @"~/SchoolLogo/" + Path.GetFileName(filePaths[0]);


                string fileNameDest = Server.MapPath(path);
                using (Bitmap imgb = new Bitmap(fileNameDest))
                {

                    var imageHeight = imgb.Height;
                    var imageWidth = imgb.Width;
                    img.Attributes.Add("src", path);
                    img.Attributes.Add("height", imageHeight.ToString());
                    img.Attributes.Add("width", imageWidth.ToString());
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showSchoolLogo();
                if (Request!=null && Request.UrlReferrer!=null)
                ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                string path = "";
                string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo/"));
                if (filePaths.Count() > 0)
                {
                    path = @"~/SchoolLogo/" + Path.GetFileName(filePaths[0]);


                    string fileNameDest = Server.MapPath(path);
                    using (Bitmap imgb = new Bitmap(fileNameDest))
                    {

                        var imageHeight = imgb.Height;
                        var imageWidth = imgb.Width;
                        img.Attributes.Add("src", path);
                        img.Attributes.Add("height", imageHeight.ToString());
                        img.Attributes.Add("width", imageWidth.ToString());
                    }
                }


            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }


        protected void btnNewContractor_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewContractorMessage.aspx");
        }


        protected void btnEmailList_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmailList.aspx");
        }

        protected void btnSelectUserType_Click(object sender, EventArgs e)
        {
            Response.Redirect("SelectUserType.aspx");
        }

        protected void btnTemplate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Template.aspx");
        }

        protected void btnLogo_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadLogo.aspx");
        }

        protected void btnPolicy_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadPolicy.aspx");
        }

        protected void btnManageQuestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageQuestions.aspx");
        }

        protected void btnManageTiles_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageHeader.aspx");
        }
        protected void btnFooter_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageFooter.aspx");
        }
        protected void btnSessionTimeOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageSession.aspx");
        }

        protected void btnSchoolLogo_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadSchoolLogo.aspx");
        }




    }

}