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
    public partial class FirstTimeUserContractor_Screen_4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            string objectGuid = "";
            if (string.IsNullOrEmpty(txtA.Text.Trim()) || string.IsNullOrEmpty(txtB.Text.Trim()) || string.IsNullOrEmpty(txtC.Text.Trim()))
            {
                Util.ShowInfo(notification_ufc, "Answers for all questions are Required");
                return;
            }
            else
            {
                //
                Response.Redirect("FirstTimeUserContractor_Screen_5.aspx");
                string userInfo = Session["UserInfo"].ToString();
                if (!string.IsNullOrEmpty(userInfo))
                {
                    XElement UserInfoDoc = XElement.Parse(userInfo);
                    try
                    {

                        objectGuid = UserInfoDoc.Descendants("objectGuid").ElementAt(0).Value.ToString();

                    }
                    catch (Exception Ex)
                    {
                        Util.ShowInfo(notification_ufc, Ex.Message.Replace("\r\n", ""));
                        return;

                    }



                }
                XElement xdADSelfService = new XElement("xdADSelfService");
                xdADSelfService.SetAttributeValue("Action", "set");
                xdADSelfService.SetAttributeValue("Type", "secretqa");
                xdADSelfService.SetAttributeValue("Provider", "database");
                XElement AUPSignUp = new XElement("AUPSignUp", "true");
                xdADSelfService.Add(AUPSignUp);
                XElement UserInfo = new XElement("UserInfo");
                UserInfo.SetAttributeValue("UserType", Session["USERTYPE"].ToString());
                XElement UserRefId = new XElement("UserRefId", objectGuid);
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
                    return;
                }
                else { Session["QUESTIONS"] = xdADSelfService.ToString(); Response.Redirect("FirstTimeUserContractor_Screen_5.aspx"); ; }

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}