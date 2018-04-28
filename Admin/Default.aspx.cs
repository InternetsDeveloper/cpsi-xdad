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
    public partial class DefaultAdmin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
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
     /*   protected void Page_Load(object sender, EventArgs e)
        {

           if (!IsPostBack)
            {
                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("AcessDenied.aspx");
                    // Response.Write(ex.ToString());
                    return;
                }
                else
                {
                    string Id = Request.QueryString["Id"];
                    try { string val = new Util().Decrypt(Id); }
                    catch (Exception ex)
                    {
                        Response.Redirect("AcessDenied.aspx");
                        //  Response.Write(ex.ToString());
                        return;
                    }
                    // ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
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
           /* string id = "hd6c+uq8bvZ8y3gW5IHOmeLMao1iqicvjzmpPz2VrBE=";

               if (!IsPostBack)
               {
                   if (id == null)
                   {
                       Response.Redirect("AcessDenied.aspx");
                       return;
                   }
                   else
                   {
                       string Id = id;
                       try { string val = new Util().Decrypt(Id); }
                       catch (Exception ex)
                       {
                           Response.Redirect("AcessDenied.aspx");
                           return;
                       }
                       // ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
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

        }*/

        protected void btnSelectUserType_Click(object sender, EventArgs e)
        {
            Response.Redirect("District.aspx");
        }

        protected void btnTemplate_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instance.aspx");
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