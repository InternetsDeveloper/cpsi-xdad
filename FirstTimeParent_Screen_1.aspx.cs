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
    public partial class FirstTimeParent_Screen_1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/UploadPolicy/"));
                if (filePaths.Count() > 0)
                {
                    string path = @"UploadPolicy/" + Path.GetFileName(filePaths[0]);
                    docFrame.Attributes["src"] = path;
                }
            }

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()) 
                || string.IsNullOrEmpty(txtLastName.Text.Trim()) 
                || string.IsNullOrEmpty(txtID.Text.Trim()) 
                || string.IsNullOrEmpty(txtBirthDate.Text.Trim()))
            { 
                notification_ufc.Show("First Name, LastName, ID, BirthDate are Required");
            return;
            }
            DateTime temp;
            if (!DateTime.TryParse(txtBirthDate.Text.Trim(), out temp))
            {
                notification_ufc.Show("Invalid BirthDate");
                return;
            }
            if (!chkAgree.Checked)
            {
                notification_ufc.Show("Agreement Required ?");
                return;
            }

            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Action", "authenticate");
            xdADSelfService.SetAttributeValue("Provider", "database");
            XElement AUPSignUp = new XElement("AUPSignUp", "true");
            XElement UserInput = new XElement("UserInput");
            UserInput.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
            XElement FirstName = new XElement("FirstName", txtFirstName.Text.Trim());
            XElement LastName = new XElement("LastName", txtLastName.Text.Trim());
            XElement StudentId = new XElement("StudentId", txtID.Text.Trim());
          

            if (Session["USERTYPE"].ToString() == "1")
                StudentId = new XElement("StudentId", txtID.Text.Trim());
            if (Session["USERTYPE"].ToString() == "2")
                StudentId = new XElement("StaffId", txtID.Text.Trim());
            if (Session["USERTYPE"].ToString() == "3")
                StudentId = new XElement("EmployeeId", txtID.Text.Trim());

            XElement BirthDate = new XElement("BirthDate", Convert.ToDateTime(txtBirthDate.Text.Trim()).Date.ToString("yyyy-MM-dd"));
            xdADSelfService.Add(AUPSignUp);
            UserInput.Add(FirstName);
            UserInput.Add(LastName);
            UserInput.Add(StudentId);
            UserInput.Add(BirthDate);
            xdADSelfService.Add(UserInput);
            string ret = ss.SelfServiceGet(xdADSelfService);XElement retXml = XElement.Parse(ret);
            if (retXml.Descendants("Error").Count() > 0)
            {
                string err = retXml.Descendants("Error").ElementAt(0).Value;
                notification_ufc.Show(err.Replace("'",""));
              
            }
            
            else
            {
                Session["UserInfo"] = retXml.ToString();
                Response.Redirect("FirstTimeParent_Screen_2.aspx");
            }
            //
            Response.Redirect("FirstTimeParent_Screen_2.aspx");
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}