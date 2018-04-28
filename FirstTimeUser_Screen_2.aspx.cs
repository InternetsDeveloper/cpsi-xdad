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
    public partial class FirstTimeUser_Screen_2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetSettings();
                drpQuestion1.Items.Insert(0, "Select Question");
                drpQuestion2.Items.Insert(0, "Select Question");
                drpQuestion3.Items.Insert(0, "Select Question");
            }
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }
        }

        public void GetSettings()
        {
          
            XElement xdADSelfService=new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider","database");
            xdADSelfService.SetAttributeValue("Type","setting");
            xdADSelfService.SetAttributeValue("Action","getsettings");
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            XElement retXml = XElement.Parse(ret);
            List<XElement> lst = retXml.Descendants("SecretQuestion").ToList();
            foreach (XElement x in lst)
            {

                drpQuestion1.Items.Add(new ListItem(x.Value, x.Value.Replace("'","-")));
                drpQuestion2.Items.Add(new ListItem(x.Value, x.Value.Replace("'", "-")));
                drpQuestion3.Items.Add(new ListItem(x.Value, x.Value.Replace("'", "-")));
            }
            if (retXml.Descendants("Error").Count() > 0)
            {
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                AjaxManager.ResponseScripts.Add("show();");
                return;
            }
            
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            string objectGuid = "";
            if (drpQuestion1.SelectedIndex==0 || drpQuestion2.SelectedIndex == 0 || drpQuestion3.SelectedIndex == 0)
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
                string userInfo = Session["UserInfo"].ToString();
                if (!string.IsNullOrEmpty(userInfo))
                {
                    XElement UserInfoDoc = XElement.Parse(userInfo);
                    try
                    {

                        objectGuid = UserInfoDoc.Descendants("UserRefId").ElementAt(0).Value.ToString();
                      
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
                XElement AUPSignUp = new XElement("AUPSignUp","true");
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
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
                else {
                    Session["QUESTIONS"] = xdADSelfService.ToString();
                    string retValue= UnlockUsers();
                    XElement retXmlV = XElement.Parse(retValue);
                    if (retXmlV.Descendants("Error").Count() > 0)
                    {
                        Util.ShowInfo(notification_ufc, retXmlV.Descendants("Error").ElementAt(0).Value);
                        AjaxManager.ResponseScripts.Add("show();");
                        return;
                    }
                    Response.Redirect("FirstTimeUser_Screen_3.aspx"); }
                
            }
        }

        public string UnlockUsers()
        {
            string xml = Session["UserInfo"].ToString();
            XElement val = XElement.Parse(xml);
            string samAccountName = val.Descendants("sAMAccountName").ElementAt(0).Value.ToString();
            string guid = val.Descendants("objectGuid").ElementAt(0).Value.ToString(); 
            string statusType = "2";
            string description = "Enable";
            XElement action = new XElement("Action");
            action.SetAttributeValue("ObjectType", "user");
            action.SetAttributeValue("ActionType", "Change");
            action.SetAttributeValue("Source", "AD");
            action.SetAttributeValue("Type", "3");
            XElement OperatorId = new XElement("Operator", samAccountName);
            OperatorId.SetAttributeValue("IDType", "sAMAccountName");
            XElement UserID = new XElement("UserID");

            XElement AccountActions = new XElement("AccountActions");
           

            XElement objectGuid = new XElement("objectGuid", guid);
            UserID.Add(objectGuid);
            
            XElement SetAccountStatus = new XElement("SetAccountStatus");
            SetAccountStatus.SetAttributeValue("StatusType", statusType);
            SetAccountStatus.SetAttributeValue("Description", description);
            AccountActions.Add(SetAccountStatus);
            action.Add(OperatorId);
            action.Add(UserID);
            action.Add(AccountActions);
            string uri = new Util().Uri;
            VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(uri);
            string ret = vc.SetAction(action);
            return ret;



        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor.aspx");
        }
    }
}