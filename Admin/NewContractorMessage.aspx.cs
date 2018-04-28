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
    public partial class NewContractorMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSave.Visible = false;
                pnlSaved.Visible = false;
               
                string ret = new Util().GetInstanceSettings();
                XElement retXml = XElement.Parse(ret);
                if (retXml.Descendants("EmailSettings").Count() == 0)
                {
                    XElement EmailSettings = new XElement("EmailSettings");
                    EmailSettings.Add(new XElement("ManagerEmail"));
                    EmailSettings.Add(new XElement("Messages"));
                    retXml.Add(EmailSettings);
                    string uri = new Util().Uri;
                    xdADSelfService ss = new xdADSelfService(uri);
                    ss.SelfServiceSet(retXml);
                    ret = new Util().GetInstanceSettings();
                    retXml = XElement.Parse(ret);

                }
                if (retXml.Descendants("Message").Count()>0)
                txtHeader.Text =retXml.Descendants("Message").ElementAt(0).Value;

                

            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string header = txtHeader.Text.Trim();
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            if (retXml.Descendants("Message").Count() > 0)
            {
                retXml.Descendants("Message").ElementAt(0).Value = txtHeader.Text;
            }
            else
            {
                XElement Message = new XElement("Message", txtHeader.Text);
                retXml.Descendants("Messages").ElementAt(0).Add(Message);
            }
            string ret2 = ss.SelfServiceSet(retXml);
            XElement retXml2 = XElement.Parse(ret2);
            Response.Redirect("Default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlSave.Visible = false;
            pnlSaved.Visible = false;
        }



        
        protected void btnAgree_Click(object sender, EventArgs e)
        {
           
            pnlSave.Visible = true;
            pnlSaved.Visible = false;

        }
    }
}