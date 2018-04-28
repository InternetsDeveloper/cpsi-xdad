using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class ResetPassword_Parent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtNetworkID.Text) && string.IsNullOrEmpty(txtLocalID.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "A Valid Network ID or Email is Required";
                return;

            }


        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtNetworkID.Text) && string.IsNullOrEmpty(txtLocalID.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "A Valid Network ID or Email is Required";
                return;

            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
           

        }

        protected void btnpwdCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
          //  RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            Util.HideInfo(notification_ufc);
        //     AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (Page.IsValid)
            {
                if (string.IsNullOrEmpty(txtNetworkID.Text.Trim()) && string.IsNullOrEmpty(txtLocalID.Text.Trim()))
                {

                    //   Util.ShowInfo(notification_ufc, "Network Id or Local Id is Required");
                    return;
                }

            }

           //RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
           // Util.HideInfo(notification_ufc);
           // AjaxManager.ResponseScripts.Add("hide();");
           // Page.Validate("Date");
            if (Page.IsValid)
            {

                txtNetworkID_Result.Text = txtParentName.Text = txtLocalID_Result.Text = "";
                XElement xdADSelfService = new XElement("xdADSelfService");
                xdADSelfService.SetAttributeValue("Action", "searchuser");
                xdADSelfService.SetAttributeValue("Provider", "ad");
                XElement UserInput = new XElement("UserInput");
                UserInput.SetAttributeValue("UserType", "3");

                XElement StudentId = new XElement("UserId", txtLocalID.Text.Trim());
                XElement sAMAccountName = new XElement("sAMAccountName", txtNetworkID.Text.Trim());
                if (!string.IsNullOrEmpty(StudentId.Value))
                    UserInput.Add(StudentId);
                else
                    UserInput.Add(sAMAccountName);
                xdADSelfService.Add(UserInput);
                XElement site = XElement.Parse(Session["AUTH_SITES"].ToString());
                XElement Sites = new XElement("Sites");

                foreach (XElement x in site.Descendants("Location").ToList())
                {
                    Sites.Add(new XElement("Site", x.Attribute("LocalId").Value));
                }

                xdADSelfService.Add(Sites);
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceGet(xdADSelfService);

                XElement retXml = XElement.Parse(ret);

                if (retXml.Descendants("Error").Count() > 0)
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                //    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                if (retXml.Descendants("FirstName").Count() == 0)
                {
                    Util.ShowInfo(notification_ufc, "No Records Found");
               //     AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                else
                {
                    Session["SEARCH_RESULTS_PARENT"] = retXml.ToString();
                    string objectGuid = retXml.Descendants("objectGuid").ElementAt(0).Value;
                    string UserRefId = retXml.Descendants("UserRefId").ElementAt(0).Value;
                    string samaccountName = this.txtNetworkID_Result.Text = retXml.Descendants("sAMAccountName").ElementAt(0).Value;
                    string employeeFirstName = retXml.Descendants("FirstName").ElementAt(0).Value;
                    string employeeLastName = retXml.Descendants("LastName").ElementAt(0).Value;
                    string employeeMiddleName = retXml.Descendants("MiddleName").ElementAt(0).Value;
                    string EmployeeId = this.txtLocalID_Result.Text = retXml.Descendants("EmployeeId").ElementAt(0).Value;
                    txtParentName.Text = employeeFirstName + " " + employeeMiddleName + " " + employeeLastName;
                }
            }


        }

    }
}