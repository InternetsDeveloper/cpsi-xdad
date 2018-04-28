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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string x = new Util().Encrypt("Copyright CPSI, Ltd. 2016");
            if (!Page.IsPostBack)
            {
                Session["userName"] = null;
                Session["UserInfo"] = null;
                // string url = String.Format("admin/Default.aspx?Id={0}",
                //   Server.UrlEncode("b/HA2h4o+FKbPtl8pM44+mdf8pjXh0zv5hOIDZpkD0o="));

                //   Response.Redirect(url);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
                new Util().SyncSettings();
                Util.HideInfo(notification_ufc_left);
                Util.HideInfo(notification_ufc_right);
                Session.Abandon();
                if (drpUserTypeLogin.Items.Count == 0)
                    GetSettings();


            }
        }

        bool CheckUrl()
        {
            bool ret = false;
            if (Request.UrlReferrer != null)
            {
                if (Request.UrlReferrer.ToString().ToLower().Contains("xdadweb"))
                {
                    ret = true;
                }
                if (Request.UrlReferrer.ToString().ToLower().Contains("xdadselfservice"))
                {
                    ret = true;
                }

            }
            return ret;
        }

        protected void btnContinueRegistraion_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Right");
            if (Page.IsValid)
            {
                if (drpUserTypeRegister.SelectedIndex == 0)
                {
                    // Util.ShowInfo(notification_ufc_right, "Select User Type");
                    return;
                }


                Session["USERTYPE"] = drpUserTypeRegister.SelectedItem.Value.Substring(0, 1);
                Session["USERTYPE_TEXT"] = drpUserTypeRegister.SelectedItem.Text;
                Session["USERTYPE_FULL"] = drpUserTypeRegister.SelectedItem.Value;

                if (Session["USERTYPE_TEXT"].ToString().ToLower().Contains("contractor"))
                {
                    Session["DESIGNATEDTYPE"] = new Util().GetDesignatedType_Text();
                    if (new Util().GetSettingsValue("ValidateContractorEmail") == "true")
                        Response.Redirect("ContractorEmail.aspx");
                    else
                        Response.Redirect("Contractor.aspx");

                }
                else
                {
                    Response.Redirect("FirstTimeUser_Screen_1.aspx");
                }
            }

        }


        public void GetSettings()
        {


            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);





            Session["SETTINGS"] = retXml.ToString();
            List<XElement> lst = retXml.Descendants("UserType").ToList();
            foreach (XElement x in lst)
            {
                if (x.Attribute("HasSubType").Value == "false")
                {
                    if (x.Attribute("Checked").Value == "true")
                    {
                        drpUserTypeLogin.Items.Add(new ListItem(x.Value, x.Attribute("ID").Value));
                        drpUserTypeRegister.Items.Add(new ListItem(x.Value, x.Attribute("ID").Value));
                    }
                }
                else
                {
                    if (x.Attribute("Checked").Value == "true")
                    {
                        List<XElement> lstSubtype = x.Descendants("SubType").ToList();
                        foreach (XElement y in lstSubtype)
                        {

                            drpUserTypeLogin.Items.Add(new ListItem(y.Value, y.Attribute("ID").Value));
                            drpUserTypeRegister.Items.Add(new ListItem(y.Value, y.Attribute("ID").Value));

                        }
                    }
                }

            }
            drpUserTypeRegister.Items.Insert(0, "Select User Type");
            drpUserTypeLogin.Items.Insert(0, "Select User Type");
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc_left, retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }

        }





        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (drpUserTypeLogin.SelectedIndex == 0)
            {
                Util.ShowInfo(notification_ufc_left, "Select User Type");
                //notificationLeft.Visible = true;
                return;
            }
            Session["USERTYPE"] = drpUserTypeLogin.SelectedItem.Value.Substring(0, 1);
            Session["USERTYPE_FULL"] = drpUserTypeLogin.SelectedItem.Value;
            Session["USERTYPE_TEXT"] = drpUserTypeLogin.SelectedItem.Text;
            Response.Redirect("Reset_UserName_Password.aspx");

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            //  notification_ufc_left.Visible = false; 

            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);

            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Left");
            if (Page.IsValid)
            {

                Session["DESIGNATEDTYPE"] = new Util().GetDesignatedType_Text();
                Session["USERTYPE"] = drpUserTypeLogin.SelectedItem.Value.Substring(0, 1);
                Session["USERTYPE_FULL"] = drpUserTypeLogin.SelectedItem.Value;
                Session["USERTYPE_TEXT"] = drpUserTypeLogin.SelectedItem.Text;
                if (drpUserTypeLogin.SelectedIndex == 0)
                {
                    Util.ShowInfo(notification_ufc_left, "Select User Type");
                    // notificationLeft.Visible = true;
                    return;
                }
                if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPassword.Text))
                {
                    Util.ShowInfo(notification_ufc_left, "User Name and Password are Required");
                    //  notificationLeft.Visible = true;
                    return;
                }

                XElement xdADSelfService = new XElement("xdADSelfService");
                xdADSelfService.SetAttributeValue("Action", "authenticate");
                xdADSelfService.SetAttributeValue("Provider", "ad");
                XElement UserInput = new XElement("UserInput");
                UserInput.SetAttributeValue("UserType", drpUserTypeLogin.SelectedItem.Value.Substring(0, 1));
                XElement sAMAccountName = new XElement("sAMAccountName", txtUserName.Text.Trim());
                XElement password = new XElement("password", txtPassword.Text.Trim());


                UserInput.Add(sAMAccountName);
                UserInput.Add(password);
                switch (drpUserTypeLogin.SelectedItem.Value.Substring(0, 1))
                {

                    case "4":
                        UserInput.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
                        break;
                    default:
                        break;
                }
                xdADSelfService.Add(UserInput);
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceGet(xdADSelfService);
                XElement retXml = XElement.Parse(ret);
                Session["AdAttribute_XML"] = null;
                Password adPassword = new Password();
                if (retXml.Descendants("ADAttribute").Count() > 0)
                {
                    // Session["adAttribute"] = retXml.Descendants("adAttribute").ElementAt(0);
                    XElement retXmlPassword = retXml.Descendants("ADAttribute").ElementAt(0);
                    Session["AdAttribute_XML"] = retXmlPassword.ToString();
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

                Session["AdAttribute"] = adPassword;
                if (retXml.Descendants("Error").Count() > 0)
                {
                    Util.ShowInfo(notification_ufc_left, retXml.Descendants("Error").ElementAt(0).Value);
                    // TelerikWebApp3.Site1.RadAjaxManager1.ResponseScripts.Add("alert('ResponseScripts');");

                    AjaxManager.ResponseScripts.Add("show();");
                    //    notification_ufc_left.Visible = true;
                    return;
                }
                else
                {
                    VCRole vcr = new VCRole(uri);
                    XElement userv = vcr.ValidateUser(txtUserName.Text.Trim(), txtPassword.Text.Trim());
                    Session["AUTHORIZATION"] = userv.ToString();
                    if (userv.Descendants("Site").Count() > 0)
                        Session["AUTH_SITES"] = userv.Descendants("Site").ElementAt(0).ToString();
                    if (userv.Descendants("UserType").Count() > 0)
                        Session["AUTH_USERTYPES"] = userv.Descendants("UserType").ElementAt(0).ToString();
                    // string test = userv.ToString();
                    Session["SAMACCOUNTNAME"] = txtUserName.Text.Trim();
                    Session["LOGONUSER"] = retXml.Descendants("FirstName").ElementAt(0).Value + " " + retXml.Descendants("LastName").ElementAt(0).Value;
                    Session["FIRSTNAME"] = retXml.Descendants("FirstName").ElementAt(0).Value;
                    Session["LASTNAME"] = retXml.Descendants("LastName").ElementAt(0).Value;
                    if (retXml.Descendants("MIDDLENAME").Count() > 0)
                        Session["MIDDLENAME"] = retXml.Descendants("MIDDLENAME").ElementAt(0).Value;
                    Session["LOGONUSER_SITE"] = retXml.Descendants("SiteName").ElementAt(0).Value;
                    Session["LOGONUSER_OBJECTGUID"] = retXml.Descendants("objectGuid").ElementAt(0).Value;
                    Session["LOGONUSER_REFID"] = retXml.Descendants("UserRefId").ElementAt(0).Value;
                    Session["SCHOOLNAME"] = retXml.Descendants("SiteName").ElementAt(0).Value;
                    Session["BIRTHDATE"] = retXml.Descendants("BirthDate").ElementAt(0).Value;
                    switch (drpUserTypeLogin.SelectedItem.Value.Substring(0, 1))
                    {
                        case "1":
                            Session["STUDENTID"] = retXml.Descendants("StudentId").ElementAt(0).Value;
                            Response.Redirect("Returning_Student.aspx");
                            break;
                        case "2":
                            Session["STAFFID"] = retXml.Descendants("StaffId").ElementAt(0).Value;
                            Response.Redirect("Returning_Parent.aspx");
                            break;
                        case "3":
                            Session["EMPLOYEEID"] = retXml.Descendants("EmployeeId").ElementAt(0).Value;
                            Response.Redirect("Returning_User.aspx");
                            break;
                        case "4":

                            Session["EMPLOYEEID"] = retXml.Descendants("EmployeeId").ElementAt(0).Value;
                            if (retXml.Descendants("Email").Count() > 0)
                                Session["Email"] = retXml.Descendants("Email").ElementAt(0).Value;
                            Session["PrimarySite"] = retXml.Descendants("SiteName").ElementAt(0).Value;
                            Response.Redirect("Returning_Contractor.aspx");
                            break;
                        default:

                            break;
                    }
                }
            }
        }


    }
}