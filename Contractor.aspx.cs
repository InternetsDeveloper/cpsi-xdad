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
    public partial class Contractor : System.Web.UI.Page
    {

        void showSchoolLogo()
        {
            string path = "";
           // string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo/"));
          //  if (filePaths.Count() > 0)
            {
               // path = @"~/SchoolLogo/" + Path.GetFileName(filePaths[0]);


                string fileNameDest = Server.MapPath(path);
               // using (Bitmap imgb = new Bitmap(fileNameDest))
                {

                 //   var imageHeight = imgb.Height;
                 //   var imageWidth = imgb.Width;
                   // img.Attributes.Add("src", path);
                  // img.Attributes.Add("height", imageHeight.ToString());
                   // img.Attributes.Add("width", imageWidth.ToString());
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showSchoolLogo();
                Session["CONTRACTOR_EMAIL"] = null;
                Session["FirstTimeUserContractor_Screen_3"] = null;
            }

        }

        protected void btnSelectUserType_Click(object sender, EventArgs e)
        {
            Response.Redirect("FirstTimeUserContractor_Screen_2.aspx");
        }

        protected void btnTemplate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Complete_Registration.aspx");
        }

       



    }

}