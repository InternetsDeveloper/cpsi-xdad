using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace TelerikWebApp3
{
    public partial class UpLoadPolicy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/UploadPolicy/"));
                if (filePaths.Count() > 0)
                {
                   
                    string path = @"../UploadPolicy/" + Path.GetFileName(filePaths[0]);
                    docFrame.Attributes["src"] = path;
                   
                }

                pnlSave.Visible = false;
                pnlSaved.Visible = false;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Response.Redirect("Default.aspx");

            Response.Redirect("Instance.aspx");
        }
        protected void btnAgree_Click(object sender, EventArgs e)
        {
           
              string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/UploadPolicy_temp/"));
                if (filePaths.Count() > 0)
                {
                    string path =@"UploadPolicy_temp/" + Path.GetFileName(filePaths[0]);
                    string dstpath = @"UploadPolicy/" + Path.GetFileName(filePaths[0]);
                Session["path_policy"] = path;
                Session["dstpath_policy"] = dstpath;
                // Response.Redirect("PolicyConfirm.aspx");
                //   System.IO.File.Copy(Server.MapPath(path), Server.MapPath(dstpath), true);
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
            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/uploadpolicy"));

            foreach (FileInfo file1 in di.GetFiles())
            {
                file1.Delete();
            }
            string path = Session["path_policy"].ToString();
            string dstpath = Session["dstpath_policy"].ToString();
            System.IO.File.Copy(Server.MapPath(path), Server.MapPath(dstpath), true);
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
        }

        protected void RadAsyncUpload1_FileUploaded(object sender, FileUploadedEventArgs e)
        {

            System.IO.DirectoryInfo di = new DirectoryInfo(Server.MapPath("~/uploadpolicy_temp"));

            foreach (FileInfo file1 in di.GetFiles())
            {
                file1.Delete();
            }
                RadAsyncUpload1.TargetFolder = "~/uploadpolicy_temp";
                string newfilename = e.File.GetNameWithoutExtension() + User.Identity.Name.Replace("\\", String.Empty) + e.File.GetExtension();


                string path = Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename);
                e.File.SaveAs(Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename), true);
                FileInfo file = new FileInfo(Path.Combine(Server.MapPath(RadAsyncUpload1.TargetFolder), newfilename));
                var sizeInBytes = file.Length;
                file = null;
                string path2 = @"UploadPolicy_temp/" + Path.GetFileName(path);
                docFrame.Attributes["src"] = path2;
               
            
          
        }
    }
}