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
    public partial class Manage_Contractor_Requests_Deny : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                Util.HideInfo(notification_ufc);
            }
            //btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            XElement retXmlV = XElement.Parse(Session["REQUESTXML"].ToString());

            string RequestId_value = retXmlV.Descendants("RequestId").ElementAt(0).Value.ToString();
            XElement xdADSelfService = new XElement("xdADSelfService");           
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "request");
            xdADSelfService.SetAttributeValue("Action", "process");
            XElement RequestId = new XElement("RequestId", RequestId_value);
            XElement Approved = new XElement("Approved","false");
            XElement DeniedReason = new XElement("DeniedReason",txtReasonForDenial.Text.Trim());
            xdADSelfService.Add(Approved);
            xdADSelfService.Add(RequestId);
            xdADSelfService.Add(DeniedReason);
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceSet(xdADSelfService);
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

            Util.ShowInfo(notification_ufc, "Message to Deny Sent");
            
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Contractor_Requests_1.aspx");
        }
    }
}