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
    public partial class ResetYourPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                HideErrorInfo();
                if (Session["USERTYPE"].ToString() == "1")
                    lblType.Text = "Student ID";
                if (Session["USERTYPE"].ToString() == "2")
                    lblType.Text = "Staff ID";
                if (Session["USERTYPE"].ToString() == "3")
                    lblType.Text = "Employee ID";
                if (Session["USERTYPE"].ToString() == "4")
                    lblType.Text = "Email";
                
             


            }
        }

        void HideErrorInfo()
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
        }
        void ShowErrorInfo()
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("show();");
        }


        public void GetSettings()
        {


            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            List<XElement> lst = retXml.Descendants("UserType").ToList();
            foreach (XElement x in lst)
            {
                if (x.Attribute("HasSubType").Value == "false")
                {
                    if (x.Attribute("Checked").Value == "true")
                        return;
                     //   drpUserType.Items.Add(new ListItem(x.Value, x.Attribute("ID").Value));

                }
                else
                {
                    List<XElement> lstSubtype = x.Descendants("SubType").ToList();
                    foreach (XElement y in lstSubtype)
                    {
                      //  drpUserType.Items.Add(new ListItem(y.Value, y.Attribute("ID").Value));

                    }
                }

            }
          //  drpUserType.Items.Insert(0, "Select User Type");

            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
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
                CustomValidator1.ErrorMessage = "invalid";
                return;
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            HideErrorInfo();
            Page.Validate("Date");

           
            if (Page.IsValid)
            {

               
                XElement xdADSelfService = new XElement("xdADSelfService");
                xdADSelfService.SetAttributeValue("Action", "authenticate");
                xdADSelfService.SetAttributeValue("Type", "secretqa");
                xdADSelfService.SetAttributeValue("Provider", "database");
                XElement UserInput = new XElement("UserInput");
                UserInput.SetAttributeValue("UserType", Session["USERTYPE"].ToString());

                XElement FirstName = new XElement("FirstName", txtFirstName.Text);
                XElement LastName = new XElement("LastName", txtLastName.Text);
                XElement StudentId = new XElement("StudentId", txtStudentID.Text);
                if (Session["USERTYPE"].ToString() == "2")
                    StudentId = new XElement("StaffId", txtStudentID.Text.Trim());
                if (Session["USERTYPE"].ToString() == "3")
                    StudentId = new XElement("EmployeeId", txtStudentID.Text.Trim());
                switch (Session["USERTYPE"].ToString())
                {

                    case "4":
                        UserInput.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
                        string DesignatedType = new Util().GetDesignatedType();
                        if (DesignatedType == "2")
                            StudentId = new XElement("Email", txtStudentID.Text.Trim());
                        if (DesignatedType == "3")
                            StudentId = new XElement("Email", txtStudentID.Text.Trim());
                        break;
                    default:
                        break;
                }


                XElement BirthDate = new XElement("BirthDate", Convert.ToDateTime(txtBirthDate.Text.ToString()).Date.ToString("yyyy-MM-dd"));
                XElement sAMAccountName = new XElement("sAMAccountName", txtNetWorkID.Text);
                UserInput.Add(FirstName);
                UserInput.Add(LastName);
                UserInput.Add(StudentId);
                UserInput.Add(BirthDate);
                xdADSelfService.Add(UserInput);
                xdADSelfService.Add(sAMAccountName);
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceGet(xdADSelfService);
                //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
                XElement retXml = XElement.Parse(ret);
                if (retXml.Descendants("Error").Count() > 0)
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                    ShowErrorInfo();
                    return;
                }
                else
                {
                    Session["SECRET_QUESTIONS_ANSWERS"] = retXml.ToString();
                    Session["AdAttribute_XML"] = null;
                    Password adPassword = new Password();
                    if (retXml.Descendants("ADAttribute").Count() > 0)
                    {
                        // Session["adAttribute"] = retXml.Descendants("adAttribute").ElementAt(0);
                        XElement retXmlPassword = retXml.Descendants("ADAttribute").ElementAt(0);
                        Session["AdAttribute_XML_reset"] = retXmlPassword.ToString();
                        if (retXmlPassword.Attribute("Complex") != null)
                            adPassword.Complex = retXmlPassword.Attribute("Complex").Value;
                        if (retXmlPassword.Element("Length") != null)
                            adPassword.Length = retXmlPassword.Element("Length").Value;
                        if (retXmlPassword.Element("UpperCaseLetters") != null)
                            adPassword.UpperCaseLetters = retXmlPassword.Element("UpperCaseLetters").Value;
                        if (retXmlPassword.Element("LowerCaseLetters") != null)
                            adPassword.LowerCaseLetters = retXmlPassword.Element("LowerCaseLetters").Value;
                        if (retXmlPassword.Element("Numeric") != null)
                            adPassword.Numeric = retXmlPassword.Element("Numeric").Value;
                        if (retXmlPassword.Element("NonAlphaNumeric") != null)
                            adPassword.NonAlphaNumeric = retXmlPassword.Element("NonAlphaNumeric").Value;

                        if (retXmlPassword.Element("Suffix") != null)
                            adPassword.Suffix = retXmlPassword.Element("Suffix").Value;
                        if (retXmlPassword.Element("Prefix") != null)
                            adPassword.Prefix = retXmlPassword.Element("Prefix").Value;


                    }

                    Session["AdAttribute_Reset"] = adPassword;
                    Response.Redirect("ResetYourPassword2.aspx");

                }
            }
            
        }

        public string ChangesPasswordSettingsAndReset(bool reset, string object_Guid, string newPassword, bool user_must_change_password_at_next_login, bool user_cannot_change_password, bool password_never_expires, string Type, string userType)
        {
            XElement action = new XElement("Action");
            action.SetAttributeValue("ObjectType", "user");
            action.SetAttributeValue("ActionType", "Change");
            action.SetAttributeValue("Source", "AD");
            action.SetAttributeValue("Type", Type);
            XElement UserID = new XElement("UserID");
            switch (userType)
            {
                case "Student":
                    UserID.SetAttributeValue("UserType", "1");
                    break;
                case "Staff":
                    UserID.SetAttributeValue("UserType", "2");
                    break;
                case "Employee":
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
            if (reset)
            {
                XElement PasswordActions = new XElement("AccountOptions");
                XElement OptionA = new XElement("Option", "User must change password at next logon");
                OptionA.SetAttributeValue("ID", "1");
                OptionA.SetAttributeValue("Checked", user_must_change_password_at_next_login.ToString().ToLower());
                PasswordActions.Add(OptionA);

                XElement OptionB = new XElement("Option", "User cannot change password");
                OptionB.SetAttributeValue("ID", "2");
                OptionB.SetAttributeValue("Checked", user_cannot_change_password.ToString().ToLower());
                PasswordActions.Add(OptionB);

                XElement OptionC = new XElement("Option", "Password never expires");
                OptionC.SetAttributeValue("ID", "3");
                OptionC.SetAttributeValue("Checked", password_never_expires.ToString().ToLower());
                PasswordActions.Add(OptionC);
                action.Add(PasswordActions);

            }


            VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(new Util().Uri);
            string ret = vc.SetAction(action);
            return ret;
          

        }

        //public void GetSettings()
        //{

        //    XElement xdADSelfService = new XElement("xdADSelfService");
        //    xdADSelfService.SetAttributeValue("Provider", "database");
        //    xdADSelfService.SetAttributeValue("Type", "setting");
        //    xdADSelfService.SetAttributeValue("Action", "getsettings");
        //    string uri = new Util().Uri;
        //    xdADSelfService ss = new xdADSelfService(uri);
        //    string ret = ss.SelfServiceGet(xdADSelfService);
        //    XElement retXml = XElement.Parse(ret);
        //    //List<XElement> lst = retXml.Descendants("UserType").ToList();
        //    //foreach (XElement x in lst)
        //    //{
        //    //    if (x.Attribute("HasSubType").Value == "false")
        //    //    {
        //    //        drpUserTypeLogin.Items.Add(new ListItem(x.Value, x.Attribute("ID").Value));
        //    //        drpUserTypeRegister.Items.Add(new ListItem(x.Value, x.Attribute("ID").Value));
        //    //    }
        //    //    else
        //    //    {
        //    //        List<XElement> lstSubtype = x.Descendants("SubType").ToList();
        //    //        foreach (XElement y in lstSubtype)
        //    //        {
        //    //            drpUserTypeLogin.Items.Add(new ListItem(y.Value, y.Attribute("ID").Value));
        //    //            drpUserTypeRegister.Items.Add(new ListItem(y.Value, y.Attribute("ID").Value));
        //    //        }
        //    //    }

        //    //}
        //    //drpUserTypeRegister.Items.Insert(0, "Select User Type");
        //    //drpUserTypeLogin.Items.Insert(0, "Select User Type");
        //    //if (retXml.Descendants("Error").Count() > 0)
        //    //{
        //    //    notification_ufc_err.Show(retXml.Descendants("Error").ElementAt(0).Value);
        //    //    return;
        //    //}

        //}

        void SetSelectedIndex(DropDownList rb, string value)
        {
            
           
            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex < 0)
            {
                rb.SelectedIndex = 0;
            }
            else
            {
                rb.SelectedValue = value;
            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}