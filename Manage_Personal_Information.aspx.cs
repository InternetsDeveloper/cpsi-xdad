using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class Manage_Personal_Information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
           //     pnlSave.Visible = false;
            }

            if (!Page.IsPostBack)
            {
                Fill();
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }
        }

        void Fill()
        {
            XElement retXml = XElement.Parse(Session["First_Time_Contractor"].ToString());
            ViewState["FirstName"] = retXml.Descendants("FirstName").ElementAt(0).Value.ToString();
            ViewState["LastName"] = retXml.Descendants("LastName").ElementAt(0).Value.ToString();
            ViewState["MiddleName"] = retXml.Descendants("MiddleName").ElementAt(0).Value.ToString();
            ViewState["UserId"] = retXml.Descendants("UserId").ElementAt(0).Value.ToString();
            ViewState["BirthDate"] = DateTime.Parse(retXml.Descendants("BirthDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            ViewState["Email"] = retXml.Descendants("Email").ElementAt(0).Value.ToString();
            ViewState["FunctionCode"] =  retXml.Descendants("FunctionCode").ElementAt(0).Value.ToString() + " - " + retXml.Descendants("FunctionCode").ElementAt(0).Attribute("Name").Value.ToString();
            ViewState["StartDate"] = DateTime.Parse(retXml.Descendants("StartDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            ViewState["EndDate"] = DateTime.Parse(retXml.Descendants("EndDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            XElement px = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "true" select q).ElementAt(0);
            ViewState["PrimaryLocation"] = px.Attribute("LocalId").Value + " - " + px.Attribute("Name").Value;
            StringBuilder sb = new StringBuilder();
            List<XElement> secondarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "false" select q).ToList();
            foreach (XElement x in secondarySite)
            {
                if(sb.Length>0)
                    sb.Append(", ");
                sb.Append(x.Attribute("LocalId").Value + " - " + x.Attribute("Name").Value);
               
            }
            ViewState["SecondaryLocation"] = sb.ToString();


        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            string val= Session["First_Time_Contractor"].ToString();
           // VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(new Util().Uri);
            xdADSelfService ss = new xdADSelfService(new Util().Uri);
            XElement XdADSelfService = XElement.Parse(val);
            string ret = ss.SelfServiceSet(XdADSelfService);
            XElement retXml = XElement.Parse(ret);
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }
            if (retXml.Descendants("Type").Count() > 0)
            {
                if (retXml.Descendants("Type").ElementAt(0).Value == "Error")
                {
                    if (retXml.Descendants("Message").ElementAt(0).Value.ToLower().Contains("denied"))
                    {
                     //   pnlSave.Visible = true;
                    }
                    else
                    {
                        Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value.Replace("'", ""));                       
                        AjaxManager.ResponseScripts.Add("show();");
                    }
                    return;
                }
            }
            Util.ShowInfo(notification_ufc, "Request Sent Sucessfully");
            Response.Redirect("Default.aspx");
            
          
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            string val = Session["First_Time_Contractor"].ToString();
            XElement Override = new XElement("Overwrite", "true");
            XElement XdADSelfService = XElement.Parse(val);
            XdADSelfService.Add(Override);


            // VCServiceClient.RESTClient.VCAction vc = new VCServiceClient.RESTClient.VCAction(new Util().Uri);
            xdADSelfService ss = new xdADSelfService(new Util().Uri);
            string ret = ss.SelfServiceSet(XdADSelfService);
            XElement retXml = XElement.Parse(ret);
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                return;
            }
            Response.Redirect("Returning_Contractor.aspx");
            if (retXml.Descendants("Type").Count() > 0)
            {
                if (retXml.Descendants("Type").ElementAt(0).Value == "Error")
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
                    return;
                }
            }

            Util.ShowInfo(notification_ufc, "Personal Information");

        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Returning_Contractor.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["FirstTimeUserContractor_Screen_3"] = "FirstTimeUserContractor_Screen_2";
            Response.Redirect("FirstTimeUserContractor_Screen_2.aspx");
        }
    }
}



//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Xml.Linq;
//using VCServiceClient.RESTClient;

//namespace TelerikWebApp3
//{
//    public partial class Manage_Personal_Information : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {

//                Util.HideInfo(notification_ufc);
//                if (Request != null && Request.UrlReferrer != null)
//                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);

//                txtBirthDate.Text = DateTime.Parse(Session["BIRTHDATE"].ToString()).ToString("MM/dd/yyyy");
//                txtFirstName.Text = Session["FIRSTNAME"].ToString();
//                if (Session["MIDDLENAME"] != null)
//                    txtMiddleName.Text = Session["MIDDLENAME"].ToString();
//                txtLastName.Text = Session["LASTNAME"].ToString();
//                txtIDNumber.Text = Session["EMPLOYEEID"].ToString();
//                txtEmail.Text = Session["Email"].ToString();

//            }
//            btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");

//        }
//        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
//        {
//            if (string.IsNullOrEmpty(txtBirthDate.Text))
//            {
//                args.IsValid = false;
//                CustomValidator1.ErrorMessage = "Required";
//                return;

//            }
//            DateTime temp;
//            if (!DateTime.TryParse(txtBirthDate.Text.ToString(), out temp))
//            {

//                args.IsValid = false;
//                CustomValidator1.ErrorMessage = "Invalid";
//                return;
//            }

//        }


//        protected void btnAgree_Click(object sender, EventArgs e)
//        {

//            Page.Validate("Job");
//            if (string.IsNullOrEmpty(txtBirthDate.Text) || string.IsNullOrEmpty(txtFirstName.Text) || string.IsNullOrEmpty(txtLastName.Text) || string.IsNullOrEmpty(txtIDNumber.Text) || string.IsNullOrEmpty(txtEmail.Text))
//            {

//                return;
//            }
//            else
//            {

//                XElement xdADSelfService = new XElement("xdADSelfService");
//                xdADSelfService.SetAttributeValue("Provider", "database");
//                xdADSelfService.SetAttributeValue("Type", "request");
//                xdADSelfService.SetAttributeValue("Action", "change");
//                XElement UserID = new XElement("UserID");
//                UserID.SetAttributeValue("UserType", "4");
//                UserID.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
//                XElement UserRefId = new XElement("UserRefId", Session["LOGONUSER_REFID"].ToString());
//                XElement sAMAccountName = new XElement("sAMAccountName", Session["SAMACCOUNTNAME"].ToString());
//                UserID.Add(UserRefId);
//                UserID.Add(sAMAccountName);

//                XElement UserInfo = new XElement("UserInfo");
//                UserInfo.SetAttributeValue("UserType", "4");
//                UserInfo.SetAttributeValue("DesignatedType", "3");
//                XElement FirstName = new XElement("FirstName", txtFirstName.Text);
//                XElement LastName = new XElement("LastName", txtLastName.Text);
//                XElement MiddleName = new XElement("MiddleName", txtMiddleName.Text);
//                XElement UserId = new XElement("UserId", txtIDNumber.Text);
//                XElement BirthDate = new XElement("BirthDate", Convert.ToDateTime(txtBirthDate.Text.Trim()).Date.ToString("yyyy-MM-dd"));
//                XElement Email = new XElement("Email", txtEmail.Text);
//                UserInfo.Add(FirstName);
//                UserInfo.Add(LastName);
//                UserInfo.Add(MiddleName);
//                UserInfo.Add(UserId);
//                UserInfo.Add(BirthDate);
//                UserInfo.Add(Email);
//                xdADSelfService.Add(UserID);
//                xdADSelfService.Add(UserInfo);


//                string uri = new Util().Uri;
//                xdADSelfService ss = new xdADSelfService(uri);
//                string ret = ss.SelfServiceSet(xdADSelfService);
//                XElement retval = XElement.Parse(ret);
//                if (retval.Descendants("Error").Count() > 0)
//                {
//                    Util.ShowInfo(notification_ufc, retval.Descendants("Error").ElementAt(0).Value);
//                    return;
//                }
//                if (retval.Descendants("Type").Count() > 0)
//                {
//                    if (retval.Descendants("Type").ElementAt(0).Value == "Error")
//                    {
//                        Util.ShowInfo(notification_ufc, retval.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
//                        return;
//                    }
//                }
//                Util.ShowInfo(notification_ufc, "Message to update personal information has been sent.");


//            }



//        }

//        protected void btnCancel_Click(object sender, EventArgs e)
//        {
//            Response.Redirect("Default.aspx");
//        }
//    }
//}