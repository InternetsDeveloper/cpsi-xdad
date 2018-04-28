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
    public partial class Request_Locations : System.Web.UI.Page
    {

        public class ADSetting_School
        {
            private string id;

            public string Id
            {
                get { return id; }
                set { id = value; }
            }



            private string type;

            public string Type
            {
                get { return type; }
                set { type = value; }
            }

            private string recId;

            public string RecId
            {
                get { return recId; }
                set { recId = value; }
            }

            private string localId;

            public string LocalId
            {
                get { return localId; }
                set { localId = value; }
            }

            private string name;

            public string Name
            {
                get { return name; }
                set { name = value; }
            }

            private string localId_name;

            public string LocalId_name
            {
                get { return localId_name; }
                set { localId_name = value; }
            }
            public ADSetting_School()
            {
                Id = string.Empty;
                Type = string.Empty;
                RecId = string.Empty;
                LocalId = string.Empty;
                Name = string.Empty;
                LocalId_name = string.Empty;



            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                Util.HideInfo(notification_ufc);
            }
            if (!Page.IsPostBack)
            {

                drpPrimaryLocation.DataSource = new Util().GetLocations();
                drpPrimaryLocation.DataBind();
                if (new Util().GetDesignatedType() == "3")
                    drpPrimaryLocation.Items.Insert(0, "Select Location");
                else
                    drpPrimaryLocation.Items.Insert(0, "Select School");
                drpLocations.DataSource = new Util().GetLocations();
                drpLocations.DataBind();
                Fill();


            }
            btnAgree.Attributes.Add("onclick", "return radconfirm('Are you sure?', event, 400, 200,'','Custom title');");

        }

        void Fill()
        {
            string sAMAccountName = Session["SAMACCOUNTNAME"].ToString();
            string ret = new Util().SearchSingle(sAMAccountName, "3");
            XElement retXml = XElement.Parse(ret);
            // XElement retXml = XElement.Parse(Session["PrimarySite"].ToString());

            XElement primarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "true" select q).ElementAt(0);
            string strSite = primarySite.Value;
            SetSelectedIndex(this.drpPrimaryLocation, strSite);
            RemoveIndex(this.drpLocations, strSite);
            List<XElement> secondarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "false" select q).ToList();
            foreach (XElement x in secondarySite)
            {
                SetSelectedIndexListBox(drpLocations, x.Value);
            }



        }



        void RemoveIndex(ListBox rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex < 0)
            {

            }
            else
            {
                rb.Items.RemoveAt(selIndex);
            }


        }


        void SetSelectedIndex(DropDownList rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex < 0)
            {
                rb.SelectedIndex = 0;
            }
            else
            {
                rb.SelectedValue = value;
            }


        }

        void SetSelectedIndexListBox(ListBox rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex > -1)
            {
                rb.Items[selIndex].Selected = true;
            }


        }





        protected void btnAgree_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);
            if (drpPrimaryLocation.SelectedIndex == 0)
            {
                Util.ShowInfo(notification_ufc, " Select Primary location");
                return;
            }

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
            XElement Sites = new XElement("Sites");

            XElement SitePrimary = new XElement("SiteInfo", drpPrimaryLocation.SelectedValue);
            SitePrimary.SetAttributeValue("LocalId", drpPrimaryLocation.SelectedItem.Text.Split('-')[0].Trim());
            SitePrimary.SetAttributeValue("Name", drpPrimaryLocation.SelectedItem.Text.Split('-')[1].Trim());
            SitePrimary.SetAttributeValue("isPrimary", "true");
            SitePrimary.SetAttributeValue("ActionType", "change");
            Sites.Add(SitePrimary);
            for (int i = 0; i < drpLocations.Items.Count; i++)
            {
                if (drpLocations.Items[i].Selected)
                {
                    XElement SiteSecondary = new XElement("SiteInfo", drpLocations.Items[i].Value);
                    SiteSecondary.SetAttributeValue("LocalId", drpLocations.Items[i].Text.Split('-')[0].Trim());
                    SiteSecondary.SetAttributeValue("Name", drpLocations.Items[i].Text.Split('-')[1].Trim());
                    SiteSecondary.SetAttributeValue("isPrimary", "false");
                    SiteSecondary.SetAttributeValue("ActionType", "add");
                    Sites.Add(SiteSecondary);
                }

            }



            XdADSelfService.Add(UserID);
            XdADSelfService.Add(Sites);

            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceSet(XdADSelfService);
            //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
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

            Util.ShowInfo(notification_ufc, "Message to change locations sent");




        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(ViewState["PreviousPageUrl"].ToString());
        }
    }
}