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

    public class ADSetting_FunctionCode
    {

        private string code;

        public string Code
        {
            get { return code; }
            set { code = value; }
        }

        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }

        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        private string code_description;

        public string Code_description
        {
            get { return code_description; }
            set { code_description = value; }
        }

        public ADSetting_FunctionCode()
        {
            description = string.Empty;
            code = string.Empty;
            type = string.Empty;
            Code_description = string.Empty;
        }
    }



    public partial class FirstTimeUserContractor_Screen_2 : System.Web.UI.Page
    {








        protected void Page_Load(object sender, EventArgs e)
        {

            string x = "";
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }

            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                if (Session["CONTRACTOR_EMAIL"] != null)
                    txtEmail.Text = Session["CONTRACTOR_EMAIL"].ToString();
                else
                    Response.Redirect("ContractorEmail.aspx");
            }
            string test = Session["DESIGNATEDTYPE"].ToString();
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                txtIDNumber.ReadOnly = IsRandom();

            }
            if (!Page.IsPostBack)
            {
                //   lblError.Text = " First Name, Last Name, Birth Date, Email, Id number, Request Start Date, Request End Date, Primary Location and Secondary Location are Required.";
                drpJobClassification.DataSource = new Util().GetFunctionCode();
                drpJobClassification.DataBind();
                drpJobClassification.Items.Insert(0, new Util().GetclassificationInsertVal());
                drpPrimaryLocation.DataSource = new Util().GetLocations();
                drpPrimaryLocation.DataBind();
                if (new Util().GetDesignatedType() == "3")
                {
                    drpPrimaryLocation.Items.Insert(0, "Select Location");
                    rvLocation.InitialValue = "Select Location";
                    rvJobClassification.InitialValue = "Select Job Classification";

                }
                else
                {
                    drpPrimaryLocation.Items.Insert(0, "Select School");
                    rvLocation.InitialValue = "Select School";
                    rvJobClassification.InitialValue = "Select Function Code";

                }

                drpLocations.DataSource = new Util().GetLocations();
                drpLocations.DataBind();
                Fill();

            }

            if (Session["FirstTimeUserContractor_Screen_3"] != null)
            {
                Fill();
                Session["FirstTimeUserContractor_Screen_3"] = null;
                // ViewState["PreviousPageUrl"] = "FirstTimeUserContractor_Screen_1.aspx";
            }



        }


        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(txtBirthDate.Text))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Required";
                return;

            }
            DateTime temp;
            if (!DateTime.TryParse(txtBirthDate.Text.ToString(), out temp))
            {

                args.IsValid = false;
                CustomValidator1.ErrorMessage = "invalid";
                return;
            }

        }



        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(RadDatePicker_Start.Text))
            {
                args.IsValid = false;
                CustomValidator3.ErrorMessage = "Required";
                return;

            }
            DateTime temp;
            if (!DateTime.TryParse(RadDatePicker_Start.Text.ToString(), out temp))
            {

                args.IsValid = false;
                CustomValidator3.ErrorMessage = "invalid";
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
                CustomValidator2.ErrorMessage = "invalid";
                return;
            }




        }


        public bool IsRandom()
        {
            int _min = 10000;
            int _max = 99999;
            Random _rdm = new Random();
            int rndNumber = _rdm.Next(_min, _max);
            bool val = false;
            string random = new Util().GetSettingsValue("RandomID");
            if (!string.IsNullOrEmpty(random))
            {
                val = Convert.ToBoolean(random);
                if (val)
                {
                    string PrefixID = new Util().GetSettingsValue("PrefixID");
                    txtIDNumber.Text = PrefixID + rndNumber.ToString();
                }
            }
            return val;
        }

        void Fill()
        {
            if (Session["First_Time_Contractor"] != null)
            {
                XElement retXml = XElement.Parse(Session["First_Time_Contractor"].ToString());
                txtFirstName.Text = retXml.Descendants("FirstName").ElementAt(0).Value.ToString();
                txtLastName.Text = retXml.Descendants("LastName").ElementAt(0).Value.ToString();
                txtMiddleName.Text = retXml.Descendants("MiddleName").ElementAt(0).Value.ToString();
                txtIDNumber.Text = retXml.Descendants("UserId").ElementAt(0).Value.ToString();
                txtBirthDate.Text = DateTime.Parse(retXml.Descendants("BirthDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
                txtEmail.Text = retXml.Descendants("Email").ElementAt(0).Value.ToString();
                SetSelectedIndex(drpJobClassification, retXml.Descendants("FunctionCode").ElementAt(0).Value.ToString());
                RadDatePicker_Start.Text = DateTime.Parse(retXml.Descendants("StartDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
                RadDatePicker_End.Text = DateTime.Parse(retXml.Descendants("EndDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
                XElement primarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "true" select q).ElementAt(0);
                SetSelectedIndex(this.drpPrimaryLocation, primarySite.Value);
                RemoveIndex(this.drpLocations, primarySite.Value);
                List<XElement> secondarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "false" select q).ToList();
                foreach (XElement x in secondarySite)
                {
                    SetSelectedIndexListBox(drpLocations, x.Value);
                }
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
            if (selIndex < 0)
            {
                rb.SelectedIndex = 0;
            }
            else
            {
                rb.Items[selIndex].Selected = true;
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

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            Page.Validate("Date");
            if (Page.IsValid)
            {
                if (string.IsNullOrEmpty(txtFirstName.Text)
                    || string.IsNullOrEmpty(txtFirstName.Text)
                    || string.IsNullOrEmpty(txtLastName.Text)
                    || string.IsNullOrEmpty(txtBirthDate.Text.ToString())
                    || string.IsNullOrEmpty(txtEmail.Text)
                    || string.IsNullOrEmpty(txtIDNumber.Text)
                    || string.IsNullOrEmpty(RadDatePicker_Start.Text.ToString())
                    || string.IsNullOrEmpty(RadDatePicker_End.Text.ToString())
                    )
                {
                    // Util.ShowInfo(notification_ufc, " First Name, Last Name, Birth Date, Email, Id number, Request Start Date, Request End Date, Primary Location and Secondary Location are Required.");
                    return;
                }

                DateTime temp2;
                if (DateTime.TryParse(RadDatePicker_Start.Text.ToString(), out temp2))
                {
                    DateTime St = Convert.ToDateTime(RadDatePicker_Start.Text.ToString());
                    DateTime MaxDate = St.AddYears(1);
                    DateTime En = Convert.ToDateTime(RadDatePicker_End.Text.ToString());
                    if (En < St)
                    {


                        Util.ShowInfo(notification_ufc, "Requested end date cannot be before start date");
                        AjaxManager.ResponseScripts.Add("show();");
                        return;

                    }
                    if (En > MaxDate)
                    {
                        Util.ShowInfo(notification_ufc, "Requested end date cannot be more than one year");
                        AjaxManager.ResponseScripts.Add("show();");

                        return;

                    }


                }

                if (drpPrimaryLocation.SelectedIndex == 0)
                {
                    //   Util.ShowInfo(notification_ufc, " Primary Location Required");
                    return;

                }

                DateTime temp;
                //if (!DateTime.TryParse(txtBirthDate.TextWithLiterals.ToString(), out temp))
                //{
                // //   Util.ShowInfo(notification_ufc, "Invalid BirthDate");
                //    return;
                //}

                XElement XdADSelfService = new XElement("xdADSelfService");
                XdADSelfService.SetAttributeValue("Provider", "database");
                XdADSelfService.SetAttributeValue("Type", "request");
                XdADSelfService.SetAttributeValue("Action", "add");
                XElement UserInfo = new XElement("UserInfo");
                UserInfo.SetAttributeValue("UserType", "4");
                UserInfo.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
                XElement FirstName = new XElement("FirstName", txtFirstName.Text.Trim());
                XElement LastName = new XElement("LastName", txtLastName.Text.Trim());
                XElement MiddleName = new XElement("MiddleName", txtMiddleName.Text.Trim());
                XElement UserId = new XElement("UserId", this.txtIDNumber.Text.Trim());
                if (!IsRandom())
                {
                    string PrefixID = new Util().GetSettingsValue("PrefixID");
                    UserId = new XElement("UserId", PrefixID + "_" + this.txtIDNumber.Text.Trim());
                }
                XElement BirthDate = new XElement("BirthDate", Convert.ToDateTime(txtBirthDate.Text.ToString()).Date.ToString("yyyy-MM-dd"));
                XElement Email = new XElement("Email", this.txtEmail.Text.Trim());
                UserInfo.Add(FirstName);
                UserInfo.Add(LastName);
                UserInfo.Add(MiddleName);
                UserInfo.Add(UserId);
                UserInfo.Add(BirthDate);
                UserInfo.Add(Email);
                XElement Sites = new XElement("Sites");
                XElement SitePrimary = new XElement("SiteInfo", drpPrimaryLocation.SelectedValue);
                SitePrimary.SetAttributeValue("LocalId", drpPrimaryLocation.SelectedItem.Text.Split('-')[0].Trim());
                SitePrimary.SetAttributeValue("Name", drpPrimaryLocation.SelectedItem.Text.Split('-')[1].Trim());
                SitePrimary.SetAttributeValue("isPrimary", "true");
                Sites.Add(SitePrimary);
                for (int i = 0; i < drpLocations.Items.Count; i++)
                {
                    if (drpLocations.Items[i].Selected)
                    {
                        XElement SiteSecondary = new XElement("SiteInfo", drpLocations.Items[i].Value);
                        SiteSecondary.SetAttributeValue("LocalId", drpLocations.Items[i].Text.Split('-')[0].Trim());
                        SiteSecondary.SetAttributeValue("Name", drpLocations.Items[i].Text.Split('-')[1].Trim());
                        SiteSecondary.SetAttributeValue("isPrimary", "false");
                        Sites.Add(SiteSecondary);
                    }

                }

                XElement FunctionCode = new XElement("FunctionCode", drpJobClassification.SelectedValue);
                string test = drpJobClassification.SelectedItem.Text;
                int indx = test.IndexOf("-");
                string code = test.Substring(indx + 1, test.Length - 6).Trim();
                FunctionCode.SetAttributeValue("Name", code);
                XElement StartDate = new XElement("StartDate", Convert.ToDateTime(RadDatePicker_Start.Text).ToString("yyyy-MM-dd"));
                XElement EndDate = new XElement("EndDate", Convert.ToDateTime(RadDatePicker_End.Text).ToString("yyyy-MM-dd"));

                XdADSelfService.Add(UserInfo);
                XdADSelfService.Add(Sites);
                XdADSelfService.Add(FunctionCode);
                XdADSelfService.Add(StartDate);
                XdADSelfService.Add(EndDate);
                Session["First_Time_Contractor"] = XdADSelfService.ToString();
                Response.Redirect("FirstTimeUserContractor_Screen_3.aspx");
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contractor.aspx");
        }


    }
}