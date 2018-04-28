using System;
using System.Collections;
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
    public partial class ContractorEmailList : System.Web.UI.Page
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
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                Util.HideInfo(notification_ufc);

            }

        }

        protected void RadGrid1_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridEditableItem && e.Item.IsInEditMode)
            {
                if (!(e.Item is GridEditFormInsertItem))
                {
                    GridEditableItem item = e.Item as GridEditableItem;
                    GridEditManager manager = item.EditManager;
                    GridTextBoxColumnEditor editor = manager.GetColumnEditor("Email") as GridTextBoxColumnEditor;
                    string oldVal = item.GetDataKeyValue("Email").ToString();

                }
            }
        }

        protected void RadGrid1_Init(object sender, System.EventArgs e)
        {
            GridFilterMenu menu = RadGrid1.FilterMenu;
            for (int i = 0; i < menu.Items.Count;)
                if (menu.Items[i].Text == "NoFilter" || menu.Items[i].Text == "Contains") i++;
                else menu.Items.RemoveAt(i);
        }
        protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {

                e.ExceptionHandled = true;
                SetMessage("Customer cannot be inserted. Reason: " + e.Exception.Message);

            }
            else
            {
                SetMessage("New customer is inserted!");
            }
        }
        private void DisplayMessage(string text)
        {
           RadGrid1.Controls.Add(new LiteralControl(string.Format("<span><h3>{0}</h3></span>", text)));
        }

        private void SetMessage(string message)
        {
            gridMessage = message;
        }

        private string gridMessage = null;
        private int index = 0;

        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(gridMessage))
            {
                DisplayMessage(gridMessage);
            }
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {
           
            GridEditFormItem editedItem = (GridEditFormItem)e.Item;
            UserControl MyUserControl = editedItem.FindControl(GridEditFormItem.EditFormUserControlID) as UserControl;
            if (e.CommandName == RadGrid.PerformInsertCommandName)
            {
              
                TextBox txtADGroupName = (TextBox)MyUserControl.FindControl("txtEmail");
                Label lbl = (Label)MyUserControl.FindControl("lbError");
                string val = txtADGroupName.Text;
                if (string.IsNullOrEmpty(val))
                {
                   
                    lbl.Text = "Required";
                    e.Canceled = true;
                    return;
                }else
                {
                    txtADGroupName = (TextBox)MyUserControl.FindControl("txtEmail");
                     val = txtADGroupName.Text;
                    XElement XdADSelfService = new XElement("xdADSelfService");
                    XdADSelfService.SetAttributeValue("Provider", "ad");
                    XdADSelfService.SetAttributeValue("Type", "contractoremail");
                    XdADSelfService.SetAttributeValue("Action", "searchemail");
                    XElement email = new XElement("Email", val);
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
                   val = retXml.Descendants("EmailRegistered").ElementAt(0).Value;
                    if (Convert.ToBoolean(val))
                    {
                     //   DisplayMessage("Email already registered");
                        lbl.Text = "<h6>Email already registered</h6>";
                        e.Canceled = true;
                        return;
                    }
                    else
                    {
                        txtADGroupName = (TextBox)MyUserControl.FindControl("txtEmail");
                        val = txtADGroupName.Text;
                        XdADSelfService.SetAttributeValue("Provider", "database");
                        XdADSelfService.SetAttributeValue("Type", "Contractoremail");
                        XdADSelfService.SetAttributeValue("Action", "add");
                        XElement ContractorEmail = new XElement("ContractorEmail");
                        email = new XElement("Email", val);
                        ContractorEmail.Add(email);
                        XdADSelfService.Add(ContractorEmail);
                        ret = ss.SelfServiceSet(XdADSelfService);
                        retXml = XElement.Parse(ret);
                        if (retXml.Descendants("Error").Count() > 0)
                        {
                          
                            lbl.Text = retXml.Descendants("Error").ElementAt(0).ToString();
                            e.Canceled = true;
                            return;
                          
                        }
                        if (retXml.Descendants("Type").Count() > 0)
                        {
                            if (retXml.Descendants("Type").ElementAt(0).Value == "Error")
                            {
                                lbl.Text = retXml.Descendants("Type").ElementAt(0).ToString();
                                e.Canceled = true;
                                return;
                            }
                        }
                        Session["NewEmail"] = txtADGroupName.Text;
                        RadGrid1.Rebind();
                        DisplayMessage("<h6>Email Sucessfully added</h6>");
                    }

                
            }

              
            }
        }

        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                e.Canceled = true;
                RadGrid1.EditIndexes.Clear();

                e.Item.OwnerTableView.EditFormSettings.UserControlName = "InsertEmail.ascx"; //load the insert form
                e.Item.OwnerTableView.InsertItem();
              
            }
            //else if (e.CommandName == RadGrid.EditCommandName)
            //{
            //    e.Item.OwnerTableView.IsItemInserted = false;
            //    e.Item.OwnerTableView.EditFormSettings.UserControlName = "UserControl/EditADGroupToDataStewardRoleMapping.ascx";  //load the update form
            //}
        }


        void ReplaceEmail(List<Emails> lst)
        {
            XElement SecretEmails = new XElement("SecretEmails");
            foreach (Emails qn in lst)
            {
                if (!string.IsNullOrEmpty(qn.Email))
                {
                    XElement SecretEmail = new XElement("SecretEmail", qn.Email);
                    SecretEmails.Add(SecretEmail);
                }
            }
           
            string retA = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(retA);
            retXml.Descendants("SecretEmails").ElementAt(0).ReplaceWith(SecretEmails);
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceSet(retXml);
            XElement retXmlE = XElement.Parse(ret);
            if (retXmlE.Descendants("Error").Count() > 0)
            {
                string err = retXmlE.Descendants("Error").ElementAt(0).Value;
                Util.ShowInfo(notification_ufc, err.Replace("'", ""));

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

        private  List<Emails> GetEmails()
        {
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "ContractorEmail");
            xdADSelfService.SetAttributeValue("Action", "get");
            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            XElement retXml = XElement.Parse(ret);
            List<Emails> lq = new List<Emails>();
            if (Session["NewEmail"] != null)
            {
                // string val = Session["NewEmail"].ToString();
                // XElement n = new XElement("Email", val);
                Emails qn = new Emails();
                qn.Email = Session["NewEmail"].ToString();
                lq.Add(qn);
                Session["NewEmail"] = null;
            }
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

        protected void btnAgree_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Returning_User.aspx");
        }
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            Button btn1 = sender as Button;
            GridDataItem item = btn1.NamingContainer as GridDataItem;
            string email = item.GetDataKeyValue("Email").ToString();
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "ContractorEmail");
            xdADSelfService.SetAttributeValue("Action", "delete");
            XElement ContractorEmail = new XElement("ContractorEmail");
            XElement Email = new XElement("Email", email);
            ContractorEmail.Add(Email);
            xdADSelfService.Add(ContractorEmail);


            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceSet(xdADSelfService);
            XElement retXmlE = XElement.Parse(ret);
            if (retXmlE.Descendants("Error").Count() > 0)
            {
                string err = retXmlE.Descendants("Error").ElementAt(0).Value;
                Util.ShowInfo(notification_ufc, err.Replace("'", ""));

            }
            else
            {
                RadGrid1.Rebind();
            }


        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            var editableItem = ((GridEditableItem)e.Item);
            var productId = (int)editableItem.GetDataKeyValue("Email");
        }
    }

}

