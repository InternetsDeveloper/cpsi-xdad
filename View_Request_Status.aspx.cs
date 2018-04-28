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
    public partial class View_Request_Status : System.Web.UI.Page
    {

        public class RequestStatus
        {

            public string RequestId { get; set; }
            public string RequestType { get; set; }
            public string RequestTime { get; set; }
            public string Processed { get; set; }
            public string Decision { get; set; }

            public RequestStatus()
            {
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    Util.HideInfo(notification_ufc);
            //    XElement xdADSelfService = new XElement("xdADSelfService");
            //    xdADSelfService.SetAttributeValue("Provider", "database");
            //    xdADSelfService.SetAttributeValue("Type", "request");
            //    xdADSelfService.SetAttributeValue("Action", "get");
            //    XElement UserInfo = new XElement("UserID");
            //    UserInfo.SetAttributeValue("UserType","4");
            //    UserInfo.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
            //    XElement UserRefId = new XElement("UserRefId", Session["LOGONUSER_REFID"].ToString());
            //    UserInfo.Add(UserRefId);
            //    xdADSelfService.Add(UserInfo);
            //    string uri = new Util().Uri;
            //    xdADSelfService ss = new xdADSelfService(uri);
            //    string ret = ss.SelfServiceGet(xdADSelfService);
            //    //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
            //    XElement retXml = XElement.Parse(ret);

            //    if (retXml.Descendants("Error").Count() > 0)
            //    {
            //        Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
            //        return;
            //    }
            //    List<RequestStatus> q = new List<RequestStatus>();
            //    q = (from c in retXml.Descendants("RequestStatus")

            //         select new RequestStatus()
            //         {
            //             RequestId = c.Element("RequestId").Value,
            //             RequestType = c.Element("RequestType").Value,
            //             RequestTime = c.Element("RequestTime").Value,
            //             Processed = c.Element("Processed").Value,
            //             Decision = GetDecision(c.Element("Decision").Value)
                        
            //         }).ToList();
            //    Request_RadGrid.DataSource = q;


            //}

        }


        string GetDecision(string value)
        {
            switch (value)
            {
                case "0":
                    value = "Awaiting Response";
                    break;
                case "1":
                    value = "Approved";
                    break;
                case "2":
                    value = "Denied";
                    break;
            }

            return value;

        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            Response.Redirect("Returning_Contractor.aspx");

        }

        protected void btnAgree_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Returning_Contractor.aspx");
        }
    }
}