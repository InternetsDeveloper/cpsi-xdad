using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class ContractorEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                notification_ufc.Text = "";
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");

            }

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
            {
               // Util.ShowInfo(notification_ufc,"Email is Required");
                return;
            }
            else
            {
                string emailValidationEnabled = new Util().GetSettingsValue("ValidateContractorEmail");
                string validEmail = "true";
                if (string.IsNullOrEmpty(emailValidationEnabled) && Convert.ToBoolean(emailValidationEnabled))
                {
                    XElement XdADSelfService = new XElement("xdADSelfService");
                    XdADSelfService.SetAttributeValue("Provider", "ad");
                    XdADSelfService.SetAttributeValue("Type", "contractoremail");
                    XdADSelfService.SetAttributeValue("Action", "searchemail");
                    XElement email = new XElement("Email", txtEmail.Text.Trim());
                    XdADSelfService.Add(email);
                    xdADSelfService ss = new xdADSelfService(new Util().Uri);
                    string ret = ss.SelfServiceGet(XdADSelfService);
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
                            Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
                            return;
                        }
                    }
                    validEmail = retXml.Descendants("EmailRegistered").ElementAt(0).Value;
                }
                if (Convert.ToBoolean(validEmail))
                {
                    Session["CONTRACTOR_EMAIL"] = txtEmail.Text.Trim();
                    // Response.Redirect("Contractor.aspx");
                    Response.Redirect("FirstTimeUserContractor_Screen_2.aspx");
                }
                else
                {
                    Util.ShowInfo(notification_ufc, txtEmail.Text.Trim() + " is not a registered email");
                    RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                    AjaxManager.ResponseScripts.Add("show();");
                }
            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }

}