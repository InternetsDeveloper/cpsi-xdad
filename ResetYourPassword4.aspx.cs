using System;
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
    public partial class ResetYourPassword4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
                Password adPassword = new Password();
                if (Session["AdAttribute_Reset"] != null)
                {
                    adPassword = Session["AdAttribute_Reset"] as Password;
                    if (!string.IsNullOrEmpty(adPassword.Length))
                    {
                        Length.Visible = true;
                        lblLength.Text = "" + adPassword.Length + " characters long.";
                    }
                    if (!string.IsNullOrEmpty(adPassword.Numeric))
                    {
                        Numeric.Visible = true;
                        lblNumeric.Text = "Numeric: " + adPassword.Numeric;
                    }
                    if (!string.IsNullOrEmpty(adPassword.LowerCaseLetters))
                    {
                        LowerCaseLetters.Visible = true;
                        lblLowerCaseLetters.Text = "LowerCaseLetters: " + adPassword.LowerCaseLetters;
                    }
                    if (!string.IsNullOrEmpty(adPassword.UpperCaseLetters))
                    {
                        UpperCaseLetters.Visible = true;
                        lblUpperCaseLetters.Text = "UpperCaseLetters: " + adPassword.UpperCaseLetters;
                    }
                    if (!string.IsNullOrEmpty(adPassword.NonAlphaNumeric))
                    {
                        NonAplhaNumeric.Visible = true;
                        lblNonAplhaNumeric.Text = "NonAlphaNumeric: " + adPassword.NonAlphaNumeric;
                    }
                    if (!string.IsNullOrEmpty(adPassword.Suffix))
                    {
                        Suffix.Visible = true;
                        lblSuffix.Text = "Suffix: " + adPassword.Suffix;
                    }
                    if (!string.IsNullOrEmpty(adPassword.Prefix))
                    {
                        Prefix.Visible = true;
                        lblPrefix.Text = "Prefix: " + adPassword.Prefix;
                    }
                }

            }
        }

        protected void btnDone_Click(object sender, EventArgs e)
        {

            Response.Redirect("Default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (Page.IsValid)
            {
                if (Session["AdAttribute_XML_Reset"] != null)
                {
                    xdADSelfService ssvalidate = new xdADSelfService(new Util().Uri);
                    XElement _xdADSelfService = new XElement("xdADSelfService");
                    _xdADSelfService.SetAttributeValue("Provider", "db");
                    _xdADSelfService.SetAttributeValue("Type", "password");
                    _xdADSelfService.SetAttributeValue("Action", "validate");
                    XElement _xdADSelfService_attr = XElement.Parse(Session["AdAttribute_XML_Reset"].ToString());
                    XElement _password = new XElement("Password", txtPasswordConfirm.Text.Trim());
                    _xdADSelfService.Add(_password);
                    _xdADSelfService.Add(_xdADSelfService_attr);

                    string retPasswordValidate = ssvalidate.SelfServiceGet(_xdADSelfService);
                    XElement errXml = XElement.Parse(retPasswordValidate);
                    if (errXml.Descendants("Error").Count() > 0)
                    {
                        Util.ShowInfo(notification_ufc, errXml.Descendants("Error").ElementAt(0).Value);
                        AjaxManager.ResponseScripts.Add("show();");
                        return;
                    }
                }

                XElement retXmlQA = XElement.Parse(Session["SECRET_QUESTIONS_ANSWERS"].ToString());
                XElement xdADSelfServiceR = new XElement("xdADSelfService");
                xdADSelfServiceR.SetAttributeValue("Provider", "ad");
                xdADSelfServiceR.SetAttributeValue("Type", "password");
                xdADSelfServiceR.SetAttributeValue("Action", "reset");
                XElement UserInfo = new XElement("UserInfo");
                UserInfo.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
                XElement objectGuid = new XElement("objectGuid", retXmlQA.Descendants("objectGuid").ElementAt(0).Value);
                XElement password = new XElement("NewPassword", txtPassword.Text);
                UserInfo.Add(objectGuid);
                UserInfo.Add(password);
                xdADSelfServiceR.Add(UserInfo);
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceSet(xdADSelfServiceR);
                XElement retXml = XElement.Parse(ret);
                if (retXml.Descendants("Error").Count() > 0)
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);

                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                else { Util.ShowInfo(notification_ufc, "Message to reset password has been sent"); Response.Redirect("Default.aspx"); }
            }

        }
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtPasswordConfirm.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Required";
                return;

            }
            else
            {
                if (txtPassword.Text != txtPasswordConfirm.Text)
                {
                    args.IsValid = false;
                    CustomValidator2.ErrorMessage = "Passwords do not match";
                    return;
                }

            }


        }



        //public void ChangesPasswordSettingsAndReset_TeacherTool(List<PasswordSettings> U, string newPassword, bool user_must_change_password_at_next_login, bool user_cannot_change_password, bool password_never_expires, string Type, bool userTemplate, bool User_must_change_password_at_next_logon_visible, bool User_cannot_change_password_visible, bool Password_never_expires_visible)
        //{
        //    string Logged_In_User = string.Empty;
        //    if (HttpContext.Current.Session["Logged_In_User"] != null)
        //        Logged_In_User = HttpContext.Current.Session["Logged_In_User"].ToString();
        //    XElement action = new XElement("Action");
        //    action.SetAttributeValue("ObjectType", "user");
        //    action.SetAttributeValue("ActionType", "Change");
        //    action.SetAttributeValue("Source", "AD");
        //    action.SetAttributeValue("Type", "3");
        //    XElement OperatorId = new XElement("Operator", Logged_In_User); OperatorId.SetAttributeValue("IDType", "sAMAccountName");
        //    XElement UserID = new XElement("UserID");
        //    UserID.SetAttributeValue("UserType", Type);
        //    XElement PasswordActionsA = new XElement("PasswordActions");
        //    action.Add(OperatorId);
        //    action.Add(UserID);
        //    foreach (PasswordSettings user in U)
        //    {
        //        XElement objectGuid = new XElement("objectGuid", user.objectGuid);
        //        UserID.Add(objectGuid);


        //    }
        //    XElement ResetPassword = new XElement("ResetPassword");
        //    ResetPassword.SetAttributeValue("UseAccountTemplate", userTemplate);
        //    if (!userTemplate)
        //        ResetPassword.SetValue(newPassword);



        //    PasswordActionsA.Add(ResetPassword);

        //    action.Add(PasswordActionsA);

        //    XElement PasswordActions = new XElement("AccountOptions");
        //    if (User_must_change_password_at_next_logon_visible)
        //    {
        //        XElement OptionA = new XElement("Option", "User must change password at next logon");
        //        OptionA.SetAttributeValue("ID", "1");
        //        OptionA.SetAttributeValue("Checked", user_must_change_password_at_next_login.ToString().ToLower());
        //        PasswordActions.Add(OptionA);
        //    }

        //    if (User_cannot_change_password_visible)
        //    {
        //        XElement OptionB = new XElement("Option", "User cannot change password");
        //        OptionB.SetAttributeValue("ID", "2");
        //        OptionB.SetAttributeValue("Checked", user_cannot_change_password.ToString().ToLower());
        //        PasswordActions.Add(OptionB);
        //    }

        //    if (Password_never_expires_visible)
        //    {
        //        XElement OptionC = new XElement("Option", "Password never expires");
        //        OptionC.SetAttributeValue("ID", "3");
        //        OptionC.SetAttributeValue("Checked", password_never_expires.ToString().ToLower());
        //        PasswordActions.Add(OptionC);
        //    }
        //    action.Add(PasswordActions);




        //    VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(uri);
        //    string ret = vc.SetAction(action);


        //}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}