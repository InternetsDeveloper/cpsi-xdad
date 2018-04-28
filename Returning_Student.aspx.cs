using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class Returning_Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                showSchoolLogo();
        }
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
                   // img.Attributes.Add("src", path);
                   // img.Attributes.Add("height", imageHeight.ToString());
                   // img.Attributes.Add("width", imageWidth.ToString());
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
        protected void btnChangequestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeSecurityQuestions.aspx");
        }
        protected void btnChangeRequestTools_Click(object sender, EventArgs e)
        {

        }
    }
}