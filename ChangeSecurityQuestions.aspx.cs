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
    public partial class ChangeSecurityQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");

                GetSettings();
                GetSecretQuestions();
                SetQuestion();
                drpQuestion1.Items.Insert(0, "Select Question");
                drpQuestion2.Items.Insert(0, "Select Question");
                drpQuestion3.Items.Insert(0, "Select Question");
                txtA.Attributes["type"] = "password";
                txtB.Attributes["type"] = "password";
                txtC.Attributes["type"] = "password";
            }
        }

        void SetSelectedIndex(DropDownList rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByText(value)));
            if (selIndex < 0)
            {
                rb.SelectedIndex = 0;
            }
            else
            {
                rb.SelectedIndex = selIndex;
            }


        }

        void RemoveItem(DropDownList rb, string value)
        {
            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByText(value)));
            if (selIndex < 0)
            {

            }
            else
            {
                rb.Items.RemoveAt(selIndex);
            }
        }

        private void SetQuestion()
        {

            if (Session["SECRET_QUESTIONS_ANSWERS"] != null) { 
            XElement retXml = XElement.Parse(Session["SECRET_QUESTIONS_ANSWERS"].ToString());
            List<XElement> lst = retXml.Descendants("SecretQA").ToList();
            if (lst.Count > 0)
            {
                SetSelectedIndex(drpQuestion1, lst[0].Element("Question").Value);
                RemoveItem(drpQuestion2, lst[0].Element("Question").Value);
                SetSelectedIndex(drpQuestion2, lst[1].Element("Question").Value);
                RemoveItem(drpQuestion3, lst[0].Element("Question").Value);
                RemoveItem(drpQuestion3, lst[1].Element("Question").Value);
                SetSelectedIndex(drpQuestion3, lst[2].Element("Question").Value);
                txtA.Text = GetAnswer(0);
                txtB.Text = GetAnswer(1);
                txtC.Text = GetAnswer(2);
            }
        }

        }

        private string GetAnswer(int index)
        {
            XElement retXml = XElement.Parse(Session["SECRET_QUESTIONS_ANSWERS"].ToString());
            List<XElement> lst = retXml.Descendants("Answer").ToList();
            string answer = lst[index].Value;
            return answer;
        }


        protected void GetSecretQuestions()
        {
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Action", "authenticate");
            xdADSelfService.SetAttributeValue("Type", "secretqa");
            xdADSelfService.SetAttributeValue("Provider", "database");
            XElement UserInput = new XElement("UserInput");
            UserInput.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
            switch (Session["USERTYPE"].ToString())
            {

                case "4":
                    UserInput.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
                    break;
                default:
                    break;
            }
            XElement FirstName = new XElement("FirstName", Session["FIRSTNAME"].ToString());
            XElement LastName = new XElement("LastName", Session["LASTNAME"].ToString());
            XElement StudentId = new XElement("StudentId");
            if (Session["USERTYPE"].ToString()=="1")
                StudentId = new XElement("StudentId", Session["STUDENTID"].ToString().Trim());
            if (Session["USERTYPE"].ToString() == "2")
                  StudentId = new XElement("StaffId", Session["STAFFID"].ToString().Trim());
            if (Session["USERTYPE"].ToString() == "3")
                StudentId = new XElement("EmployeeId", Session["EMPLOYEEID"].ToString().Trim());
            switch (Session["USERTYPE"].ToString())
            {

                case "4":
                    string DesignatedType = new Util().GetDesignatedType();
                    if (DesignatedType == "2")
                        StudentId = new XElement("Email", Session["Email"].ToString().Trim());
                    if (DesignatedType == "3")
                        StudentId = new XElement("Email", Session["Email"].ToString().Trim());
                    break;
                default:
                    break;
            }
           
            XElement BirthDate = new XElement("BirthDate", Session["BIRTHDATE"].ToString());
            XElement sAMAccountName = new XElement("sAMAccountName", Session["SAMACCOUNTNAME"].ToString());
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
                Util.ShowInfo(notification_ufc,retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }
            else { Session["SECRET_QUESTIONS_ANSWERS"] = retXml.ToString(); }
        }

        public void GetSettings()
        {

           
            string ret =new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            List<XElement> lst = retXml.Descendants("SecretQuestion").ToList();
            foreach (XElement x in lst)
            {

                drpQuestion1.Items.Add(new ListItem(x.Value, x.Value.Replace("'", "-")));
                drpQuestion2.Items.Add(new ListItem(x.Value, x.Value.Replace("'", "-")));
                drpQuestion3.Items.Add(new ListItem(x.Value, x.Value.Replace("'", "-")));
            }
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            if (Page.IsValid)
            {
                Util.HideInfo(notification_ufc);
                if (drpQuestion1.SelectedIndex == 0 || drpQuestion2.SelectedIndex == 0 || drpQuestion3.SelectedIndex == 0)
                {
                    Util.ShowInfo(notification_ufc, "Select Question");
                    return;
                }
                if (string.IsNullOrEmpty(txtA.Text.Trim()) || string.IsNullOrEmpty(txtB.Text.Trim()) || string.IsNullOrEmpty(txtC.Text.Trim()))
                {
                    Util.ShowInfo(notification_ufc, "Answers for all questions are Required");
                    return;
                }
                else
                {


                    string userRfId = Session["LOGONUSER_REFID"].ToString();
                    XElement xdADSelfService = new XElement("xdADSelfService");
                    xdADSelfService.SetAttributeValue("Action", "set");
                    xdADSelfService.SetAttributeValue("Type", "secretqa");
                    xdADSelfService.SetAttributeValue("Provider", "database");
                    XElement AUPSignUp = new XElement("AUPSignUp", "false");
                    xdADSelfService.Add(AUPSignUp);
                    XElement UserInfo = new XElement("UserInfo");
                    UserInfo.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
                    XElement UserRefId = new XElement("UserRefId", userRfId);
                    UserInfo.Add(UserRefId);
                    xdADSelfService.Add(UserInfo);
                    XElement SecretQAs = new XElement("SecretQAs");

                    XElement SecretQA = new XElement("SecretQA");
                    XElement Question = new XElement("Question", drpQuestion1.SelectedItem.Text);
                    XElement Answer = new XElement("Answer", txtA.Text);
                    SecretQA.Add(Question);
                    SecretQA.Add(Answer);

                    XElement SecretQAb = new XElement("SecretQA");
                    XElement Questionb = new XElement("Question", drpQuestion2.SelectedItem.Text);
                    XElement Answerb = new XElement("Answer", txtB.Text);
                    SecretQAb.Add(Questionb);
                    SecretQAb.Add(Answerb);

                    XElement SecretQAc = new XElement("SecretQA");
                    XElement Questionc = new XElement("Question", drpQuestion3.SelectedItem.Text);
                    XElement Answerc = new XElement("Answer", txtC.Text);
                    SecretQAc.Add(Questionc);
                    SecretQAc.Add(Answerc);

                    SecretQAs.Add(SecretQA);
                    SecretQAs.Add(SecretQAb);
                    SecretQAs.Add(SecretQAc);
                    xdADSelfService.Add(SecretQAs);
                    string uri = new Util().Uri;
                    xdADSelfService ss = new xdADSelfService(uri);
                    string ret = ss.SelfServiceSet(xdADSelfService);
                    XElement retXml = XElement.Parse(ret);
                    if (retXml.Descendants("Error").Count() > 0)
                    {
                        Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                        AjaxManager.ResponseScripts.Add("show();");
                        return;
                    }
                    else { Session["QUESTIONS"] = xdADSelfService.ToString();
                        Util.ShowInfo(notification_ufc, "SelfService Questions changed sucessfully");
                     //   Response.Redirect("Default.aspx");
                    }
                }
            }
        }
    }
}