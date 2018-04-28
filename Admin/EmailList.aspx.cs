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
    public partial class EmailList : System.Web.UI.Page
    {

        public class Emails
        {
            public string Email { get; set; }
            public Emails()
            {
                Email = "";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                notification_ufc.Text = "";
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
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
                 
                }
                

            }

        }

        protected void LinqDataSourcePropertiesData_Site(object sender, LinqDataSourceSelectEventArgs e)
        {

            //List<VcUser> query = new List<VcUser>();
            //List<VcUser> DistinctQ = new List<VcUser>();
            //if (HttpContext.Current.Session["Query"] != null)
            //    query = HttpContext.Current.Session["Query"] as List<VcUser>;
            //DistinctQ = query.GroupBy(C => C.SiteName).Select(E => E.First()).ToList();
            //e.Arguments.TotalRowCount = DistinctQ.Count();
            //e.Result = DistinctQ;
            List<Emails> lq = GetEmails();
            e.Result = lq;



        }

        private List<Emails> GetEmails()
        {
            List<Emails> lq = new List<Emails>();
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            List<XElement> dt = retXml.Descendants("Email").ToList();

            foreach (XElement x in dt)
            {
                Emails qn = new Emails();
                qn.Email = x.Value;
                if (!string.IsNullOrEmpty(qn.Email.Trim()))
                    lq.Add(qn);

            }
            return lq;
        }



        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("District.aspx");
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Button btn1 = sender as Button;
            GridDataItem item = btn1.NamingContainer as GridDataItem;
            string email = item.GetDataKeyValue("Email").ToString();
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);

            XElement nd = (from q in retXml.Descendants("Email") where q.Value.ToLower() == email.ToLower() select q).ElementAt(0);
            nd.Remove();
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            ss.SelfServiceSet(retXml);
            RadGrid1.Rebind();
           
            


        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {

        }
        protected void RadGrid1_Init(object sender, GridItemEventArgs e)
        {

        }

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {


        }
        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
        {

        }
        protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
        {

        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtEmail.Text))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Required";
                return;

            }
            else
            {
                List < Emails >lst= GetEmails();
                int nd = (from q in lst where q.Email.ToString().ToLower() == txtEmail.Text.ToLower() select q).Count();
              
                if (nd>0)
                {
                    args.IsValid = false;
                    CustomValidator2.ErrorMessage = "Email Already exists";
                    return;
                }

            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (Page.IsValid)
            {
                string ret = new Util().GetInstanceSettings();
                XElement retXml = XElement.Parse(ret);
                retXml.Descendants("ManagerEmail").ElementAt(0).Add(new XElement("Email", txtEmail.Text));
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                ss.SelfServiceSet(retXml);
                RadGrid1.Rebind();
                txtEmail.Text = "";

            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("District.aspx");
        }
    }

}