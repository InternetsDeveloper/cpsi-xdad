using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using Telerik.Web.UI;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class SelectUserType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request != null && Request.UrlReferrer != null)
                    ViewState["PreviousPageUrl"] = System.IO.Path.GetFileName(Request.UrlReferrer.LocalPath);
                GetSettings();
             //  rdbDesignatedType.SelectedValue= new Util().GetDesignatedType();
                pnlSaved.Visible = false;


            }

        }
        protected void RadTreeView1_NodeDataBound(object sender, RadTreeNodeEventArgs e)
        {
           if(e.Node.Level>0)
            if (e.Node.DataItem is XmlElement)
            {
              XElement val=  XElement.Parse((e.Node.DataItem as XmlElement).OuterXml);
               e.Node.Text = val.Value;
               if (val.Attribute("ID").Value== "3")
               {
                   e.Node.Text = "Employee";
                  
               }
               if (val.Attribute("ID").Value.ToString().Length == 2)
                   e.Node.Checkable = false;
               e.Node.Attributes["ID"] = "";
               if (val.Attribute("ID") != null)
                   e.Node.Attributes["ID"] = val.Attribute("ID").ToString();
               if (val.Attribute("Checked") != null)
               {
                   string v = val.Attribute("Checked").ToString().Replace("\"", "").Replace("Checked=", "");
                   e.Node.Checked =Convert.ToBoolean(v) ;
               }

            }
            //  e.Node.Text = (e.Node.DataItem as XElement).Value;
        }


        public void GetSettings()
        {
            XmlDataSource x = new XmlDataSource();
            x.ID = "xmlDataSourceParentOUXML";
            x.EnableCaching = false;

           
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            string Data = retXml.Descendants("UserTypes").ElementAt(0).ToString();
            x.Data = Data;
            x.DataBind();
            RadTreeView1.DataSource = x;
            RadTreeView1.DataBind();
            RadTreeView1.ExpandAllNodes();
            RadTreeNode contractorNode = RadTreeView1.FindNodeByText("Contractor");
            if (contractorNode != null)
            {
                string val = new Util().GetDesignatedType();
                RadTreeNode staff = new RadTreeNode("Staff", "2");
                RadTreeNode employee = new RadTreeNode("Employee", "3");
                if (val == "2")
                    staff.Checked = true;
                if (val == "3")
                    employee.Checked = true;
                contractorNode.Nodes.Add(staff);
                contractorNode.Nodes.Add(employee);
            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnAgree_Click(object sender, EventArgs e)
        {
            List<string> nodes = new List<string>();
            List<string> nodesUnchecked = new List<string>();
           List<RadTreeNode>lstNodes= RadTreeView1.GetAllNodes().ToList();
           foreach (RadTreeNode node in lstNodes)
           {
               if (node.Checked)
               {
                   if (node.Attributes["ID"] != null)
                       nodes.Add(node.Attributes["ID"]);
               }
               else
               {
                   if (node.Attributes["ID"]!=null)
                   nodesUnchecked.Add(node.Attributes["ID"]);
               }
           }

          XElement S= SetSettings(nodes, nodesUnchecked);
            if (S!=null)
            {
                string uri = new Util().Uri;
                xdADSelfService ss = new xdADSelfService(uri);
                string ret = ss.SelfServiceSet(S);
                XElement retXml = XElement.Parse(ret);
                pnlSaved.Visible = true;
            }
            //if (retXml.Descendants("Error").Count() > 0)
            //{
            //    notification_ufc.Show(retXml.Descendants("Error").ElementAt(0).Value);
            //    return;
            //}
        }


        XElement SetSettings(List<string> nodes, List<string> nodes_unchecked)
        {
            
            string ret = new Util().GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            retXml.SetAttributeValue("Provider", "database");
            retXml.SetAttributeValue("Type", "setting");
            retXml.SetAttributeValue("Action", "setsettings");
            foreach (string node in nodes)
            {

               string val =node.Replace("\"", "").Replace("ID=","");
               XElement nd = (from q in retXml.Descendants("UserType") where q.Attribute("ID").Value.ToString() == val.ToLower() select q).ElementAt(0);
                nd.SetAttributeValue("Checked", "true");

            }

            foreach (string node in nodes_unchecked)
            {
                string val = node.Replace("\"", "").Replace("ID=", "");
                if (val.Length == 1)
                {
                    XElement nd = (from q in retXml.Descendants("UserType") where q.Attribute("ID").Value.ToString() == val.ToLower() select q).ElementAt(0);
                    nd.SetAttributeValue("Checked", "false");
                }

            }
            XElement nda = null;
            if ((from q in retXml.Descendants("UserType") where q.Value.ToLower() == "contractor" select q).Count() > 0)
            {
                nda = (from q in retXml.Descendants("UserType") where q.Value.ToLower() == "contractor" select q).ElementAt(0);
                RadTreeNode rd = RadTreeView1.FindNodeByText("Contractor");
                if (rd.Checked)
                {
                    List<RadTreeNode> rdList = rd.GetAllNodes().ToList();
                    bool hasValue = false;
                    foreach (RadTreeNode r in rdList)
                    {
                        if (r.Checked)
                        {
                            nda.SetAttributeValue("DesignatedType", r.Value);
                            hasValue = true;
                        }
                    }
                    if (!hasValue)
                    {
                        notification_ufc_error.Show("Select designated type for contractor");
                        return null;
                    }
                }
                else
                {
                    XAttribute att = nda.Attribute("DesignatedType");
                    if(att!=null)
                    att.Remove();
                   
                }
            }

            return retXml;
        }
    }
}