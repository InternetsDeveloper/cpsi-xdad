﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class ResetPassword_Staff : System.Web.UI.Page
    {

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtNetworkID.Text) && string.IsNullOrEmpty(txtLocalID.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Username or Local ID is Required";
                return;

            }


        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtNetworkID.Text) && string.IsNullOrEmpty(txtLocalID.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Username or Local ID is Required";
                return;

            }


        }

        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            if (Session["SEARCH_RESULTS_STAFF"] == null)
            {
                Util.ShowInfo(notification_ufc, "Find Staff to reset password");
                AjaxManager.ResponseScripts.Add("show();");
                return;
            }
            Page.Validate("pass");
            if (Page.IsValid)
            {
                Util.HideInfo(notification_ufc);

                List<XElement> AccountOptions = XElement.Parse(Session["SETTINGS"].ToString()).Descendants("AccountOptions").ToList();
                if (string.IsNullOrEmpty(this.txtConfirmPassword.Text) || string.IsNullOrEmpty(this.txtNewPassword.Text))
                {
                    Util.ShowInfo(notification_ufc, "Password and Confirm Password are Required");
                    return;
                }

                if (this.txtConfirmPassword.Text != this.txtNewPassword.Text)
                {
                    Util.ShowInfo(notification_ufc, "Password and Confirm Password are not the same");
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                XElement retXml = XElement.Parse(Session["SEARCH_RESULTS_STAFF"].ToString());
                string objectGuid = retXml.Descendants("objectGuid").ElementAt(0).Value;
                string UserRefId = retXml.Descendants("UserRefId").ElementAt(0).Value;
                string samaccountName = this.txtNetworkID_Result.Text = retXml.Descendants("sAMAccountName").ElementAt(0).Value;
                string employeeFirstName = retXml.Descendants("FirstName").ElementAt(0).Value;
                string employeeLastName = retXml.Descendants("LastName").ElementAt(0).Value;
                string employeeMiddleName = retXml.Descendants("MiddleName").ElementAt(0).Value;
                string EmployeeId = this.txtLocalID_Result.Text = retXml.Descendants("StaffId").ElementAt(0).Value;
                txtStudentName.Text = employeeFirstName + " " + employeeMiddleName + " " + employeeLastName;
                string ret = ChangesPasswordSettingsAndReset(objectGuid, txtConfirmPassword.Text, "3", "2", AccountOptions[1]);
                XElement retval = XElement.Parse(ret);

                if (retval.Descendants("Error").Count() > 0)
                {
                    Response.Redirect(ViewState["PreviousPageUrl"].ToString());
                    Util.ShowInfo(notification_ufc, retval.Descendants("Error").ElementAt(0).Value);
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                else
                {
                    Util.ShowInfo(notification_ufc, "Message to Reset Password Sent");
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");

                string ret = new Util().GetInstanceSettings();
                XElement retXml = XElement.Parse(ret);
                Session["SETTINGS"] = retXml.ToString();
                List<XElement> lst = retXml.Descendants("UserType").ToList();
            }

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
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            Util.HideInfo(notification_ufc);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (string.IsNullOrEmpty(txtNetworkID.Text.Trim()) && string.IsNullOrEmpty(txtLocalID.Text.Trim()))
            {

              //  Util.ShowInfo(notification_ufc, "Network Id or Local Id is Required");
                return;
            }
            txtNetworkID_Result.Text = txtStudentName.Text = txtLocalID_Result.Text = "";
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Action", "searchuser");
            xdADSelfService.SetAttributeValue("Provider", "ad");
            XElement UserInput = new XElement("UserInput");
            UserInput.SetAttributeValue("UserType", "2");

            XElement StudentId = new XElement("UserId", txtLocalID.Text.Trim());
            XElement sAMAccountName = new XElement("sAMAccountName", txtNetworkID.Text.Trim());
            if (!string.IsNullOrEmpty(StudentId.Value))
                UserInput.Add(StudentId);
            else
                UserInput.Add(sAMAccountName);
            xdADSelfService.Add(UserInput);
            XElement site = XElement.Parse(Session["AUTH_SITES"].ToString());
            XElement Sites = new XElement("Sites");
            foreach (XElement x in site.Descendants("School").ToList())
            {
                Sites.Add(new XElement("Site", x.Attribute("LocalId").Value));
            }
            xdADSelfService.Add(Sites);
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
            XElement retXml = XElement.Parse(ret);
          
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }
            if (retXml.Descendants("FirstName").Count() == 0)
            {
                Util.ShowInfo(notification_ufc, "No Records Found");
                return;
            }
            else
            {
                Session["SEARCH_RESULTS_STAFF"] = retXml.ToString();
                string objectGuid = retXml.Descendants("objectGuid").ElementAt(0).Value;
                string UserRefId = retXml.Descendants("UserRefId").ElementAt(0).Value;
                string samaccountName =this.txtNetworkID_Result.Text= retXml.Descendants("sAMAccountName").ElementAt(0).Value;
                string employeeFirstName = retXml.Descendants("FirstName").ElementAt(0).Value;
                string employeeLastName = retXml.Descendants("LastName").ElementAt(0).Value;
                string employeeMiddleName = retXml.Descendants("MiddleName").ElementAt(0).Value;
                string EmployeeId =this.txtLocalID_Result.Text= retXml.Descendants("StaffId").ElementAt(0).Value;
                txtStudentName.Text = employeeFirstName + " " + employeeMiddleName + " " + employeeLastName;
            }
           

        }

       

        public string ChangesPasswordSettingsAndReset(string object_Guid, string newPassword,  string Type, string userType,XElement PasswordActions)
        {
            XElement action = new XElement("Action");
            action.SetAttributeValue("ObjectType", "user");
            action.SetAttributeValue("ActionType", "Change");
            action.SetAttributeValue("Source", "AD");
            action.SetAttributeValue("Type", Type);
            XElement UserID = new XElement("UserID");
            switch (userType)
            {
                case "1":
                    UserID.SetAttributeValue("UserType", "1");
                    break;
                case "2":
                    UserID.SetAttributeValue("UserType", "2");
                    break;
                case "3":
                    UserID.SetAttributeValue("UserType", "3");
                    break;
                default:
                    break;
            }
            XElement PasswordActionsA = new XElement("PasswordActions");
            action.Add(UserID);

            XElement objectGuid = new XElement("objectGuid", object_Guid);
            UserID.Add(objectGuid);



            XElement ResetPassword = new XElement("ResetPassword", newPassword);
            PasswordActionsA.Add(ResetPassword);
            action.Add(PasswordActionsA);
            action.Add(PasswordActions);


            VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(new Util().Uri);
            string ret = vc.SetAction(action);
            return ret;


        }
    }
}