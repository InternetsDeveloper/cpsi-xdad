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

    public class RequestDetails
    {

        public string RequestId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public string FullName { get; set; }
        public string JobCode { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string sAMAccountName { get; set; }
        public string FunctionCode_Descr { get; set; }
        public string FunctionCode_Value { get; set; }
        public string DeniedReason { get; set; }
        public string Status { get; set; }

        public string XML { get; set; }

        public RequestDetails()
        {
            Status = DeniedReason = FunctionCode_Value = FunctionCode_Descr = MiddleName = LastName = RequestId = FirstName = JobCode = StartDate = EndDate = sAMAccountName = "";
        }
    }

    public partial class Manage_Contractor_Requests_1 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                RadAjaxManager AjaxManager = RadAjaxManager.GetCurrent(Page);
                AjaxManager.ResponseScripts.Add("hide();");
            }
        }


        List<RequestDetails> FillGrid()
        {
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "request");
            xdADSelfService.SetAttributeValue("Action", "get");

            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
            XElement retXml = XElement.Parse(ret);
           
            List<XElement> RequestList = retXml.Descendants("xdADSelfService").ToList();
            List<RequestDetails> q = new List<RequestDetails>();
            q = (from c in retXml.Descendants("xdADSelfService")

                 select new RequestDetails()
                 {
                     XML = c.ToString(),
                     RequestId = GetValue(c, "RequestId"),
                     FirstName = GetValue(c, "FirstName"),
                     LastName = GetValue(c, "LastName"),
                     MiddleName = GetValue(c, "MiddleName"),
                     FullName = GetName(GetValue(c, "FirstName"), GetValue(c, "MiddleName"), GetValue(c, "LastName")),
                     StartDate = GetDateValue(c, "StartDate"),
                     EndDate = GetDateValue(c, "EndDate"),
                     FunctionCode_Value = GetValue(c, "FunctionCode"),
                     FunctionCode_Descr = GetAttributeValue(c, "FunctionCode", "Name"),
                     DeniedReason = GetValue(c, "DeniedReason"),
                     Status = GetDecisionValue(c, "Decision")

                 }).ToList();
            HttpContext.Current.Session["Query"] = q.OrderBy(x=>x.Status).ToList();
            return q;
        }






        protected void LinqDataSourceData_Selecting(object sender,
    LinqDataSourceSelectEventArgs e)
        {
            // Edit_User_RadGrid.MasterTableView.FilterExpression=string.Empty;

          List<RequestDetails>res=  FillGrid();


                    e.Arguments.TotalRowCount = res.Count();
                    e.Result = res;

                
            




        }

        protected void Request_RadGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {

            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filterItem = (GridFilteringItem)e.Item;
                RadComboBox combo = (RadComboBox)filterItem.FindControl("RadComboBoxSite");

                if (!IsPostBack)
                {
                    //set which index you would like initially selected here
                    combo.SelectedIndex = 2;
                }
            }
        }
        protected void LinqDataSourcePropertiesData_Site(object sender, LinqDataSourceSelectEventArgs e)
        {

            List<RequestDetails> query = new List<RequestDetails>();
            List<RequestDetails> DistinctQ = new List<RequestDetails>();
            if (HttpContext.Current.Session["Query"] != null)
                query = HttpContext.Current.Session["Query"] as List<RequestDetails>;
            DistinctQ = query.GroupBy(C => C.Status).Select(E => E.First()).ToList().OrderBy(x=>x.Status).ToList();
            e.Arguments.TotalRowCount = DistinctQ.Count();
            e.Result = DistinctQ;




        }

        protected void Request_RadGrid_PreRender(object sender, System.EventArgs e)
        {

            string x = Request_RadGrid.MasterTableView.FilterExpression;
                //set initial filter on data here (which should correspond to the selected index above)
                if (!Page.IsPostBack)
                {
                Request_RadGrid.MasterTableView.FilterExpression = "(iif(Status == null, \"\", Status).ToString() = \"Awaiting Response\") ";
                //GridColumn column = RadGrid1.MasterTableView.GetColumnSafe("Country");
                //column.CurrentFilterFunction = GridKnownFunction.Contains;
                //column.CurrentFilterValue = "Germany";
                Request_RadGrid.MasterTableView.Rebind();
                }

           

        }

        protected void Request_RadGrid_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridPagerItem)
            {

                //RadComboBox PageSizeCombo = (RadComboBox)e.Item.FindControl("PageSizeComboBox");
                //PageSizeCombo.Items.Clear();

                //PageSizeCombo.Items.Add(new RadComboBoxItem("15"));
                //PageSizeCombo.FindItemByText("15").Attributes.Add("ownerTableViewId", Edit_User_RadGrid.MasterTableView.ClientID);
                //PageSizeCombo.Items.Add(new RadComboBoxItem("20"));
                //PageSizeCombo.FindItemByText("20").Attributes.Add("ownerTableViewId", Edit_User_RadGrid.MasterTableView.ClientID);
                //PageSizeCombo.Items.Add(new RadComboBoxItem("50"));
                //PageSizeCombo.FindItemByText("50").Attributes.Add("ownerTableViewId", Edit_User_RadGrid.MasterTableView.ClientID);
                //PageSizeCombo.Items.Add(new RadComboBoxItem("5000"));
                //PageSizeCombo.FindItemByText("5000").Attributes.Add("ownerTableViewId", Edit_User_RadGrid.MasterTableView.ClientID);
                //PageSizeCombo.Items.Add(new RadComboBoxItem("10000"));
                //PageSizeCombo.FindItemByText("10000").Attributes.Add("ownerTableViewId", Edit_User_RadGrid.MasterTableView.ClientID);

                //PageSizeCombo.FindItemByText(e.Item.OwnerTableView.PageSize.ToString()).Selected = true;

            }

            if (e.Item is GridFilteringItem)
            {
                GridFilteringItem filteringItem = e.Item as GridFilteringItem;
                //set dimensions for the filter textbox  
                TextBox box = filteringItem["FullName"].Controls[0] as TextBox;
                box.Width = Unit.Pixel(100);

                //box = filteringItem["FirstName"].Controls[0] as TextBox;
                //box.Width = Unit.Pixel(60);

                //box = filteringItem["MiddleName"].Controls[0] as TextBox;
                //box.Width = Unit.Pixel(60);
                //box = filteringItem["LastName"].Controls[0] as TextBox;
                //box.Width = Unit.Pixel(60);


                //box = filteringItem["UserId"].Controls[0] as TextBox;
                //box.Width = Unit.Pixel(60);


                ////RadComboBox dp = filteringItem["SiteName"].Controls[0] as RadComboBox;
                ////dp.Width = Unit.Pixel(100);
                ////dp.ID = "drpSiteName";


                ////RadComboBox dp2 = filteringItem["job_grade_classification"].Controls[0] as RadComboBox;
                ////dp2.Width = Unit.Pixel(60);
                ////dp2.ID = "jb";
                //box = filteringItem["NetworkID"].Controls[0] as TextBox;
                //box.Width = Unit.Pixel(60);


            }



        }

        protected void Request_RadGrid_Init(object sender, System.EventArgs e)
        {
            GridFilterMenu menu = Request_RadGrid.FilterMenu;
            for (int i = 0; i < menu.Items.Count;)
                if (menu.Items[i].Text == "NoFilter" || menu.Items[i].Text == "Contains") i++;
                else menu.Items.RemoveAt(i);
        }

        protected void RadComboBoxSite_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {
            Request_RadGrid.MasterTableView.GetColumn("status").ResetCurrentFilterValue();
            Request_RadGrid.MasterTableView.FilterExpression = "";
            Request_RadGrid.Rebind();
        }

        protected void lnkManage_Click(object sender, EventArgs e)
        {
           
            LinkButton lbBtn = sender as LinkButton;
            GridDataItem item = (GridDataItem)(sender as Button).NamingContainer;
            string Request = item.GetDataKeyValue("XML").ToString();
            //if (Session["USERTYPE"].ToString() == "4")
            //{
            //    XElement xdADSelfService = new XElement("xdADSelfService");
            //    xdADSelfService.SetAttributeValue("Action", "searchuser");
            //    xdADSelfService.SetAttributeValue("Provider", "ad");
            //    XElement UserInput = new XElement("UserInput");
            //    UserInput.SetAttributeValue("UserType", "4");
            //    UserInput.SetAttributeValue("DesignatedType", new Util().GetDesignatedType());
            //    XElement StudentId = new XElement("Email", Session["Email"].ToString());
            //   XElement sAMAccountName = new XElement("sAMAccountName", txtNetworkID.Text.Trim());
            //    UserInput.Add(sAMAccountName);
            //    xdADSelfService.Add(UserInput);
            //    string uri = new Util().Uri;
            //    xdADSelfService ss = new xdADSelfService(uri);
            //    string ret = ss.SelfServiceGet(xdADSelfService);
            
            //    XElement retXml = XElement.Parse(ret);
            //    Session["SEARCH_RESULTS_CONTRACTOR"] = retXml.ToString();
            //    string objectGuid = retXml.Descendants("objectGuid").ElementAt(0).Value;
            //    string UserRefId = retXml.Descendants("UserRefId").ElementAt(0).Value;
            //    string samaccountName =  retXml.Descendants("sAMAccountName").ElementAt(0).Value;
            //    string employeeFirstName = retXml.Descendants("FirstName").ElementAt(0).Value;
            //    string employeeLastName = retXml.Descendants("LastName").ElementAt(0).Value;
            //    string employeeMiddleName = retXml.Descendants("MiddleName").ElementAt(0).Value;
            //    string EmployeeId = retXml.Descendants("EmployeeId").ElementAt(0).Value;
            //}
            Session["REQUESTXML"] = Request;
            Response.Redirect("Manage_Contractor_Requests_2.aspx");

        }


        string GetName(string first, string middle, string last)
        {
            string name = first;
            if (!string.IsNullOrEmpty(middle))
                name = name + " " + middle;
            if (!string.IsNullOrEmpty(last))
                name = name + " " + last;
            return name;


        }

        public string GetValue(XElement xele, string elementName)
        {
            string value = "";
            if (xele.Descendants(elementName).Count() > 0)
            {
                XElement ele = xele.Descendants(elementName).ElementAt(0);
                value = ele.Value;
            }
            return value;
        }

        public string GetDateValue(XElement xele, string elementName)
        {
            string value = "";
            if (xele.Descendants(elementName).Count() > 0)
            {
                XElement ele = xele.Descendants(elementName).ElementAt(0);
                value = Convert.ToDateTime(ele.Value.Trim()).Date.ToString("yyyy-MM-dd");
            }
            return value;
        }


       

        public string GetDecisionValue(XElement xele, string elementName)
        {
            string value = "";
            string status = "";
            if (xele.Descendants(elementName).Count() > 0)
            {
                XElement ele = xele.Descendants(elementName).ElementAt(0);
                value = ele.Value;

                status = GetDecision(value);
            }
            return status;
        }

        public string GetAttributeValue(XElement xele, string elementName, string attribute)
        {
            string value = "";
            if (xele.Descendants(elementName).Count() > 0)
            {
                XElement ele = xele.Descendants(elementName).ElementAt(0);
                value = ele.Attribute(attribute).Value;
            }
            return value;
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

            Response.Redirect("Returning_User.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Returning_User.aspx");
        }
    }
}