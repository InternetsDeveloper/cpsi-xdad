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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                Util.HideInfo(notification_ufc);
                Password adPassword = new Password();
                if (Session["AdAttribute"] != null)
                {
                    adPassword = Session["AdAttribute"] as Password;
                    if (!string.IsNullOrEmpty(adPassword.Length)){
                        Length.Visible = true;
                        lblLength.Text = "" + adPassword.Length+  " characters long.";
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


                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }
        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtNewPassword.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Required";
                return;

            }
           

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Required";
                return;

            }
            else
            {
                if (txtNewPassword.Text!= txtConfirmPassword.Text){
                    args.IsValid = false;
                    CustomValidator2.ErrorMessage = "Passwords do not match";
                    return;
                }

            }


        }

        

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (Page.IsValid)
            {
                Util.HideInfo(notification_ufc);

               
                if (Session["AdAttribute_XML"] != null)
                {
                    xdADSelfService ssvalidate = new xdADSelfService(new Util().Uri);
                    XElement _xdADSelfService = new XElement("xdADSelfService");
                    _xdADSelfService.SetAttributeValue("Provider", "db");
                    _xdADSelfService.SetAttributeValue("Type", "password");
                    _xdADSelfService.SetAttributeValue("Action", "validate");
                    XElement _xdADSelfService_attr = XElement.Parse(Session["AdAttribute_XML"].ToString());
                    XElement _password = new XElement("Password", txtConfirmPassword.Text.Trim());
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



                XElement xdADSelfService = new XElement("xdADSelfService");
                xdADSelfService.SetAttributeValue("Provider", "ad");
                xdADSelfService.SetAttributeValue("Type", "password");
                xdADSelfService.SetAttributeValue("Action", "change");
                XElement UserInfo = new XElement("UserInfo");
                UserInfo.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
                if (Session["USERTYPE"].ToString() == "4")
                {
                    UserInfo.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
                }
                XElement objectGuid = new XElement("objectGuid", Session["LOGONUSER_OBJECTGUID"].ToString());
                XElement sAMAccountName = new XElement("sAMAccountName", Session["SAMACCOUNTNAME"].ToString());
                XElement Password = new XElement("Password", txtCurrentPassword.Text.Trim());
                XElement NewPassword = new XElement("NewPassword", txtConfirmPassword.Text.Trim());
                UserInfo.Add(objectGuid);
                UserInfo.Add(sAMAccountName);
                UserInfo.Add(Password);
                UserInfo.Add(NewPassword);
                xdADSelfService.Add(UserInfo);

                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceSet(xdADSelfService);
                XElement retXml = XElement.Parse(ret);
                if (retXml.Descendants("Error").Count() > 0 )
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                if (retXml.Descendants("Type").Count() > 0 && retXml.Descendants("Type").ElementAt(0).Value.ToLower()=="error")
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value);
                 
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }

                 Util.ShowInfo(notification_ufc, "Password sucessfully changed");
                // Response.Redirect(ViewState["PreviousPageUrl"].ToString());
                
            }
           

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }

    }
}