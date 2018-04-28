using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace TelerikWebApp3
{
    public partial class UploadSchoolLogo : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
                Util.HideInfo(notification_ufc);

            }

            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                string path = "";
                string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo/"));
                if (filePaths.Count() > 0)
                {
                   // path = @"~/Logo/" + Path.GetFileName(filePaths[0]);
                    path =  @"~/SchoolLogo/" + Path.GetFileName(filePaths[0]);


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

                pnlSave.Visible = false;
                pnlSaved.Visible = false;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnAgree_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Util.HideInfo(notification_ufc);
            int imageHeight = Convert.ToInt32(Session["imageHeight"].ToString());
                int imageWidth = Convert.ToInt32(Session["imageWidth"].ToString());
                if (imageHeight > 233 || imageWidth > 89)
                {
                
                AjaxManager.ResponseScripts.Add("show();");
                    Util.ShowInfo(notification_ufc,"Image size must be 233 x 99 pixels");

                    return;
                }
            string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo_temp/"));
            if (filePaths.Count() > 0)
            {
                string path = new Util().GetPath() + @"SchoolLogo_temp/" + Path.GetFileName(filePaths[0]);
                string dstpath = new Util().GetPath() + @"SchoolLogo/" + Path.GetFileName(filePaths[0]);
                Session["path"] = path;
                Session["dstpath"] = dstpath;
                pnlSave.Visible = true;
                pnlSaved.Visible = false;
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlSave.Visible = false;
            pnlSaved.Visible = false;
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/SchoolLogo"));

            foreach (FileInfo file1 in di.GetFiles())
            {
                file1.Delete();
            }
            string path = Session["path"].ToString();
            string dstpath = Session["dstpath"].ToString();
            System.IO.File.Copy(Server.MapPath(path), Server.MapPath(dstpath), true);
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
        }


        protected void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            try
            {
                System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/SchoolLogo_temp"));

                foreach (FileInfo file1 in di.GetFiles())
                {
                    file1.Delete();
                }
                RadAsyncUpload1.TargetFolder = "~/SchoolLogo_temp";
                string newfilename = e.File.GetNameWithoutExtension() + User.Identity.Name.Replace("\\", String.Empty) + e.File.GetExtension();


                string path = Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename);
                e.File.SaveAs(Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename), true);
                FileInfo file = new FileInfo(Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename));
                var sizeInBytes = file.Length;
                file = null;
                string path2 = new Util().GetPath() + @"SchoolLogo_temp/" + Path.GetFileName(path);
                img.Attributes["src"] = path2;
                using (Bitmap imgb = new Bitmap(Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename)))
                {

                    var imageHeight = imgb.Height;
                    var imageWidth = imgb.Width;
                    img.Attributes.Add("src", path2);
                    img.Attributes.Add("height", imageHeight.ToString());
                    img.Attributes.Add("width", imageWidth.ToString());
                    Session["imageHeight"] = imageHeight.ToString();
                    Session["imageWidth"] = imageHeight.ToString();
                }
            }
            catch (Exception ex)
            {
               
            }
        }

    }
}