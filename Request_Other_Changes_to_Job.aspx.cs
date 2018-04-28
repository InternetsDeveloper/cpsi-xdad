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
    public partial class Request_Other_Changes_to_Job : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
            }
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                drpJobClassification.DataSource = new Util().GetFunctionCode();
                drpJobClassification.DataBind();
                drpJobClassification.Items.Insert(0, new Util().GetclassificationInsertVal());

                string sAMAccountName = Session["SAMACCOUNTNAME"].ToString();
                string ret = new Util().SearchSingle(sAMAccountName, "3");
                XElement retXml = XElement.Parse(ret);
                string jobCode = retXml.Descendants("JobClassification").ElementAt(0).Value;
                SetSelectedIndex(drpJobClassification, jobCode);
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(RadDatePicker_Start.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Required";
                return;

            }
            DateTime temp;
            if (!DateTime.TryParse(RadDatePicker_Start.Text.ToString(), out temp))
            {

                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Invalid";
                return;
            }

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(RadDatePicker_End.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Required";
                return;

            }
            DateTime temp;
            if (!DateTime.TryParse(RadDatePicker_End.Text.ToString(), out temp))
            {

                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Invalid";
                return;
            }




        }

        void SetSelectedIndex(DropDownList rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex > -1)
            {

                rb.Items[selIndex].Selected = true;
            }


        }





        protected void btnAgree_Click(object sender, EventArgs e)
        {
            
            Page.Validate("Job");
            if (Page.IsValid)
            {

                XElement XdADSelfService = new XElement("xdADSelfService");
                XdADSelfService.SetAttributeValue("Provider", "database");
                XdADSelfService.SetAttributeValue("Type", "request");
                XdADSelfService.SetAttributeValue("Action", "change");
                XElement UserID = new XElement("UserInfo");
                UserID.SetAttributeValue("UserType", "4");
                UserID.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());

                XElement UserRefId = new XElement("UserRefId", Session["LOGONUSER_REFID"].ToString());
                XElement sAMAccountName = new XElement("sAMAccountName", Session["SAMACCOUNTNAME"].ToString());
                XElement Email = new XElement("Email", Session["Email"].ToString());
                UserID.Add(UserRefId);
                UserID.Add(sAMAccountName);
                UserID.Add(Email);
                XElement FunctionCode = new XElement("FunctionCode", drpJobClassification.SelectedValue);
                FunctionCode.SetAttributeValue("Name", drpJobClassification.SelectedItem.Text.Split('-')[1].Trim());
                XElement StartDate = new XElement("StartDate", Convert.ToDateTime(RadDatePicker_Start.Text).ToString("yyyy-MM-dd"));
                XElement EndDate = new XElement("EndDate", Convert.ToDateTime(RadDatePicker_End.Text).ToString("yyyy-MM-dd"));

                XdADSelfService.Add(UserID);
                XdADSelfService.Add(FunctionCode);
                XdADSelfService.Add(StartDate);
                XdADSelfService.Add(EndDate);

                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceSet(XdADSelfService);
                XElement retval = XElement.Parse(ret);
                if (retval.Descendants("Error").Count() > 0)
                {
                    Util.ShowInfo(notification_ufc, retval.Descendants("Error").ElementAt(0).Value);
                    return;
                }
                if (retval.Descendants("Type").Count() > 0)
                {
                    if (retval.Descendants("Type").ElementAt(0).Value == "Error")
                    {
                        Util.ShowInfo(notification_ufc, retval.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
                        return;
                    }
                   
                }
                Util.ShowInfo(notification_ufc, "Message to update Job Information sent");
            }
            
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
    }
}