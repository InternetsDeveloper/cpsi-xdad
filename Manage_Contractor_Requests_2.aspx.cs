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
    public partial class Manage_Contractor_Requests_2 : System.Web.UI.Page
    {

       
        

        void Fill()
        {
            XElement retXml = XElement.Parse(Session["REQUESTXML"].ToString());
            if (retXml.Descendants("FirstName").Count() > 0)
                txtFirstName.Text = retXml.Descendants("FirstName").ElementAt(0).Value.ToString();
            if (retXml.Descendants("LastName").Count() > 0)
                txtLastName.Text = retXml.Descendants("LastName").ElementAt(0).Value.ToString();
            if (retXml.Descendants("MiddleName").Count() > 0)
                txtMiddleName.Text = retXml.Descendants("MiddleName").ElementAt(0).Value.ToString();
            if (retXml.Descendants("UserId").Count() > 0)
                txtIDNumber.Text = retXml.Descendants("UserId").ElementAt(0).Value.ToString();
            if (retXml.Descendants("EmployeeId").Count() > 0)
                txtIDNumber.Text = retXml.Descendants("EmployeeId").ElementAt(0).Value.ToString();
            if (retXml.Descendants("BirthDate").Count() > 0)
            {
                txtBirthDate.Text = DateTime.Parse(retXml.Descendants("BirthDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            }
            if (retXml.Descendants("Email").Count() > 0)
                txtEmail.Text = retXml.Descendants("Email").ElementAt(0).Value.ToString();
            if (retXml.Descendants("FunctionCode").Count() > 0)
                SetSelectedIndex(drpJobClassification, retXml.Descendants("FunctionCode").ElementAt(0).Value.ToString());
            if (retXml.Descendants("JobClassification").Count() > 0)
                SetSelectedIndex(drpJobClassification, retXml.Descendants("JobClassification").ElementAt(0).Value.ToString());
            if (retXml.Descendants("StartDate").Count() > 0)
                RadDatePicker_Start.Text = DateTime.Parse(retXml.Descendants("StartDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            if (retXml.Descendants("EndDate").Count() > 0)
                RadDatePicker_End.Text = DateTime.Parse(retXml.Descendants("EndDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");

            if (retXml.Descendants("JobStartDate").Count() > 0)
                RadDatePicker_Start.Text = DateTime.Parse(retXml.Descendants("JobStartDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");
            if (retXml.Descendants("JobEndDate").Count() > 0)
                RadDatePicker_End.Text= DateTime.Parse(retXml.Descendants("JobEndDate").ElementAt(0).Value.ToString()).ToString("MM/dd/yyyy");

            //if (retXml.Descendants("SiteInfo").Count() > 0)
            //{
            //    if (retXml.Descendants("SiteInfo").ElementAt(0).Attribute("isPrimary") != null)
            //        if ((from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "true" select q).Count() > 0)
            //        {
            //            XElement primarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "true" select q).ElementAt(0);
            //            SetSelectedIndex(this.drpPrimaryLocation, primarySite.Value);
            //            RemoveIndex(this.drpLocations, primarySite.Value);
            //        }
            //}
            //if (retXml.Descendants("SiteInfo").Count() > 0)
            //{
            //    if (retXml.Descendants("SiteInfo").ElementAt(0).Attribute("isPrimary") != null)
            //        if ((from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "false" select q).Count() > 0)
            //        {
            //            List<XElement> secondarySite = (from q in retXml.Descendants("SiteInfo") where q.Attribute("isPrimary").Value == "false" select q).ToList();
            //            foreach (XElement x in secondarySite)
            //            {
            //                SetSelectedIndexListBox(drpLocations, x.Value);
            //            }
            //        }
            //}

            List<ADSetting_School> secondaryLocations = new List<ADSetting_School>();
            List<ADSetting_School> primaryLocation = new List<ADSetting_School>();
            secondaryLocations = (from c in retXml.Descendants("SiteInfo")
                                  where c.Attribute("isPrimary").Value.ToLower() == "false"
                                  select new ADSetting_School()
                                  {


                                      RecId = c.Value,
                                      LocalId = c.Attribute("LocalId").Value,
                                      Name = c.Attribute("Name").Value,
                                      LocalId_name = c.Attribute("LocalId").Value + " - " + c.Attribute("Name").Value
                                  }).ToList();

            primaryLocation = (from c in retXml.Descendants("SiteInfo")
                               where c.Attribute("isPrimary").Value.ToLower() == "true"
                               select new ADSetting_School()
                               {


                                   RecId = c.Value,
                                   LocalId = c.Attribute("LocalId").Value,
                                   Name = c.Attribute("Name").Value,
                                   LocalId_name = c.Attribute("LocalId").Value + " - " + c.Attribute("Name").Value
                               }).ToList();

            drpPrimaryLocation.DataSource = primaryLocation;
            drpPrimaryLocation.DataBind();
            drpLocations.DataSource = secondaryLocations;
            drpLocations.DataBind();

            if (retXml.Descendants("Decision").ElementAt(0).Value == "0")
            {
                btnDeny.Enabled = btnAgree.Enabled = true;
            }
            else
            {
                btnDeny.Enabled = btnAgree.Enabled = false;
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

        void SetSelectedIndexListBox(ListBox rb, string value)
        {


            int selIndex = rb.Items.IndexOf(((ListItem)rb.Items.FindByValue(value)));
            if (selIndex > -1)
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["PreviousPageUrl"] = "Manage_Contractor_Requests_2.aspx";
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
                btnAgree.Enabled = btnDeny.Enabled = true;
                btnCancel.Text = "Cancel";
           
                
              
               
                if (Session["REQUESTXML"] != null)
                {
                   
                    XElement retXml = XElement.Parse(Session["REQUESTXML"].ToString());
                    string designatedType = retXml.Descendants("UserInfo").ElementAt(0).Attribute("DesignatedType").Value;
                   
                    string processed = retXml.Descendants("Processed").ElementAt(0).Value;
                    if (Convert.ToBoolean(processed))
                    {
                        btnAgree.Visible = false;
                        btnDeny.Visible= false;
                    }
                    drpJobClassification.DataSource = new Util().GetFunctionCode(designatedType);
                    drpJobClassification.DataBind();
                    drpJobClassification.Items.Insert(0, new Util().GetclassificationInsertVal(designatedType));
                    List <ADSetting_School>lst= new Util().GetLocations(designatedType);
                    //drpPrimaryLocation.DataSource = new Util().GetLocations(designatedType);
                    //drpPrimaryLocation.DataBind();
                    //if (designatedType == "3")
                    //    drpPrimaryLocation.Items.Insert(0, "Select Location");
                    //else
                    //    drpPrimaryLocation.Items.Insert(0, "Select School");
                   

                   
                    Fill();


                }

            }
        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {
            Util.HideInfo(notification_ufc);

            RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
            AjaxManager.ResponseScripts.Add("hide();");
            XElement retXmlV = XElement.Parse(Session["REQUESTXML"].ToString());

            string RequestId_value = retXmlV.Descendants("RequestId").ElementAt(0).Value.ToString();
            XElement xdADSelfService = new XElement("xdADSelfService");           
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "request");
            xdADSelfService.SetAttributeValue("Action", "process");
            XElement RequestId = new XElement("RequestId", RequestId_value);
            XElement Approved = new XElement("Approved","true");
            xdADSelfService.Add(Approved);
            xdADSelfService.Add(RequestId);
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceSet(xdADSelfService);
            XElement retXml = XElement.Parse(ret);
            if (retXml.Descendants("Error").Count() > 0)
            {
                Util.ShowInfo(notification_ufc, retXml.Descendants("Error").ElementAt(0).Value);
                AjaxManager.ResponseScripts.Add("show();");
                return;
            }
            if (retXml.Descendants("Type").Count() > 0)
            {
                if (retXml.Descendants("Type").ElementAt(0).Value == "Error")
                {
                    Util.ShowInfo(notification_ufc, retXml.Descendants("Message").ElementAt(0).Value.Replace("'", ""));
                    AjaxManager.ResponseScripts.Add("show();");
                    return;
                }
            }

            Util.ShowInfo(notification_ufc, "Message to Approve Sent");
            btnAgree.Enabled = btnDeny.Enabled = false;
            btnCancel.Text = "Done";
            Response.Redirect("Manage_Contractor_Requests_1.aspx");


        }

        protected void btnDeny_Click(object sender, EventArgs e)
        {

            Response.Redirect("Manage_Contractor_Requests_Deny.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Contractor_Requests_1.aspx");
        }
    }
}