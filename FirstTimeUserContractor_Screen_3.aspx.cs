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
    public partial class FirstTimeUserContractor_Screen_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                pnlSave.Visible = false;
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
                        pnlSave.Visible = true;
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
            Response.Redirect("Default.aspx");
            if (retXml.Descendants("Type").Count() > 0)
            {
                if (retXml.Descendants("Type").ElementAt(0).Value == "Error")
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
                    return;
                }
            }

            Util.ShowInfo(notification_ufc, "Request Sent Sucessfully");
           
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["FirstTimeUserContractor_Screen_3"] = "FirstTimeUserContractor_Screen_2";
            Response.Redirect("FirstTimeUserContractor_Screen_2.aspx");
        }
    }
}