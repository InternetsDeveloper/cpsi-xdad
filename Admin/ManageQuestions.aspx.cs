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
    public partial class ManageQuestions : System.Web.UI.Page
    {
        public class Questions
        {
            public string Question { get; set; }
            public Questions()
            {
                Question = "";
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
                    //GridEditableItem item = e.Item as GridEditableItem;
                    //GridEditManager manager = item.EditManager;
                    //GridTextBoxColumnEditor editor = manager.GetColumnEditor("Question") as GridTextBoxColumnEditor;
                    //string oldVal = item.GetDataKeyValue("Question").ToString();

                }
            }
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
            RadGrid1.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>", text)));
        }

        private void SetMessage(string message)
        {
            gridMessage = message;
        }

        private string gridMessage = null;

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
                TextBox txtADGroupName = (TextBox)MyUserControl.FindControl("txtQuestion");
                string val = txtADGroupName.Text;
                if (string.IsNullOrEmpty(val))
                {
                    e.Canceled = true;
                    return;
                }
                List<Questions> lst = GetQuestions();
                Questions qn = lst.Find(x => x.Question.ToLower() == val.ToLower());
                if (qn == null)
                {
                    Questions n = new Questions();
                    n.Question = val;
                    lst.Insert(0, n);
                    ReplaceQuestion(lst);
                }
            }
        }

        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName)
            {
                e.Canceled = true;
                RadGrid1.EditIndexes.Clear();

                e.Item.OwnerTableView.EditFormSettings.UserControlName = "InsertQ.ascx"; //load the insert form
                e.Item.OwnerTableView.InsertItem();
            }
            //else if (e.CommandName == RadGrid.EditCommandName)
            //{
            //    e.Item.OwnerTableView.IsItemInserted = false;
            //    e.Item.OwnerTableView.EditFormSettings.UserControlName = "UserControl/EditADGroupToDataStewardRoleMapping.ascx";  //load the update form
            //}
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            Button btn1 = sender as Button;
            GridDataItem item = btn1.NamingContainer as GridDataItem;
            string question= item.GetDataKeyValue("Question").ToString();
            List<Questions> lst = GetQuestions();
            Questions qn = lst.Find(x => x.Question.ToLower() == question.ToLower());
            lst.Remove(qn);
            ReplaceQuestion(lst);
            RadGrid1.Rebind();


        }

        protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.DeleteCommandName)
            {
                e.Canceled = true;
                RadGrid1.EditIndexes.Clear();

                e.Item.OwnerTableView.EditFormSettings.UserControlName = "InsertQ.ascx"; //load the insert form
                e.Item.OwnerTableView.InsertItem();
            }
            //else if (e.CommandName == RadGrid.EditCommandName)
            //{
            //    e.Item.OwnerTableView.IsItemInserted = false;
            //    e.Item.OwnerTableView.EditFormSettings.UserControlName = "UserControl/EditADGroupToDataStewardRoleMapping.ascx";  //load the update form
            //}
        }


        void ReplaceQuestion(List<Questions> lst)
        {
            XElement SecretQuestions = new XElement("SecretQuestions");
            foreach (Questions qn in lst)
            {
                if (!string.IsNullOrEmpty(qn.Question))
                {
                    XElement SecretQuestion = new XElement("SecretQuestion", qn.Question);
                    SecretQuestions.Add(SecretQuestion);
                }
            }
          
            string retA = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(retA);
            retXml.Descendants("SecretQuestions").ElementAt(0).ReplaceWith(SecretQuestions);
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
            List<Questions> lq = GetQuestions();
            e.Result = lq;



        }

        private static List<Questions> GetQuestions()
        {
            
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            List<XElement> dt = retXml.Descendants("SecretQuestion").ToList();
            List<Questions> lq = new List<Questions>();
            foreach (XElement x in dt)
            {
                Questions qn = new Questions();
                qn.Question = x.Value;
                if (!string.IsNullOrEmpty(qn.Question.Trim()))
                    lq.Add(qn);

            }
            return lq;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("District.aspx");
        }
        protected void btnAgree_Click(object sender, EventArgs e)
        {
        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditFormItem editedItem = (GridEditFormItem)e.Item;
            UserControl MyUserControl = editedItem.FindControl(GridEditFormItem.EditFormUserControlID) as UserControl;
            if (e.CommandName == RadGrid.UpdateCommandName)
            {
                TextBox txtADGroupName = (TextBox)MyUserControl.FindControl("txtQuestion");
                string val = txtADGroupName.Text;
                if (string.IsNullOrEmpty(val))
                {
                    e.Canceled = true;
                    return;
                }
                string question =  (string)e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["Question"]; ;
                List<Questions> lst = GetQuestions();
                Questions qn = lst.Find(x => x.Question.ToLower() == question.ToLower());
                if (qn != null)
                {                    
                    qn.Question = val;                   
                    ReplaceQuestion(lst);
                }
                RadGrid1.MasterTableView.ClearEditItems();
                RadGrid1.Rebind();
            }
        }
    }
}