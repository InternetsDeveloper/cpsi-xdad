using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class Complete_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");
            string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/UploadPolicy/"));
            if (filePaths.Count() > 0)
            {
                string path = @"UploadPolicy/" + Path.GetFileName(filePaths[0]);
                docFrame.Attributes["src"] = path;
            }

            if (!Page.IsPostBack)
            {
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();hide2();");
              //  lblUserType.Text = Session["USERTYPE_TEXT"].ToString() + " ID:";
                if (Session["USERTYPE_TEXT"].ToString().ToLower().Contains("contractor"))
                //    lblUserType.Text = "Email Id";
                Util.HideInfo(notification_ufc);
                if (Session["CONTRACTOR_EMAIL"] != null)
                {
                    txtID.Text = Session["CONTRACTOR_EMAIL"].ToString();

                }

            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!chkAgree.Checked)
            {
                args.IsValid = false;
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("show();");
                CustomValidator2.ErrorMessage = "You must agree to terms and conditions";
                return;

            }


        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtBirthDate.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Required";
                return;

            }
            DateTime temp;
            if (!DateTime.TryParse(txtBirthDate.Text.ToString(), out temp))
            {

                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Invalid";
                return;
            }

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();hide2();");
            Page.Validate("Date");
            Util.HideInfo(notification_ufc);
            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()) 
                || string.IsNullOrEmpty(txtLastName.Text.Trim()) 
                || string.IsNullOrEmpty(txtID.Text.Trim())
                || string.IsNullOrEmpty(txtBirthDate.Text.Trim()))
            {
                Util.ShowInfo(notification_ufc,"First Name, LastName, ID, BirthDate are Required");
            return;
            }
            DateTime temp;
            if (!DateTime.TryParse(txtBirthDate.Text.ToString(), out temp))
            {
                Util.ShowInfo(notification_ufc, "Invalid BirthDate");
                return;
            }
            if (!chkAgree.Checked)
            {
               // Util.ShowInfo(notification_ufc, "Agreement Required ?");
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
            UserInput.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
            XElement FirstName = new XElement("FirstName", txtFirstName.Text.Trim());
            XElement LastName = new XElement("LastName", txtLastName.Text.Trim());
            XElement Email = new XElement("Email", txtID.Text.Trim());
     //   XElement StudentId = new XElement("StudentId", txtID.Text.Trim());
     //  if(Session["USERTYPE_TEXT"].ToString().ToLower().Contains("staff"))
     //       StudentId = new XElement("StaffId", txtID.Text.Trim());
     //   if (Session["USERTYPE_TEXT"].ToString().ToLower().Contains("employee"))
     //       StudentId = new XElement("EmployeeId", txtID.Text.Trim());
            XElement BirthDate = new XElement("BirthDate", Convert.ToDateTime(txtBirthDate.Text.ToString()).Date.ToString("yyyy-MM-dd"));
            xdADSelfService.Add(AUPSignUp);
            UserInput.Add(FirstName);
            UserInput.Add(LastName);
            UserInput.Add(Email);
          //  UserInput.Add(StudentId);
            UserInput.Add(BirthDate);
            xdADSelfService.Add(UserInput);
            string ret = ss.SelfServiceGet(xdADSelfService);
            XElement retXml = XElement.Parse(ret);
            if (retXml.Descendants("Error").Count() > 0)
            {
                string err = retXml.Descendants("Error").ElementAt(0).Value;
                Util.ShowInfo(notification_ufc, err.Replace("'",""));
                AjaxManager.ResponseScripts.Add("show2();");

            }
            else
            {

                Session["UserInfo"] = retXml.ToString();
                Response.Redirect("FirstTimeUser_Screen_2.aspx");
            }
          
        }

      

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor.aspx");
        }
    }
}