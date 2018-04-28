using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Telerik.Web.UI;

namespace TelerikWebApp3
{
    public partial class ManageSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlSave.Visible = false;
                pnlSaved.Visible = false;
                txtTimeOut.Text = new Util().GetSettingsValue("SessionTimeOut");
                txtRandom.Checked = Convert.ToBoolean(new Util().GetSettingsValue("RandomID"));
                txtContractor.Checked= Convert.ToBoolean(new Util().GetSettingsValue("ValidateContractorEmail"));
                txtPrefix.Text= new Util().GetSettingsValue("PrefixID");
                txtInstanceName.Text = new Util().GetSettingsValue("InstanceName");
                List<string> AllowedDistrictSettings = new Util().GetDistrictSettings();
                XElement Tree= new XElement("Tree");
                XElement student = new XElement("Node");
                student.SetAttributeValue("Text","Student");
                student.SetAttributeValue("Value", "1");
                if(AllowedDistrictSettings.Contains("Student"))
                Tree.Add(student);
                XElement staff = new XElement("Node");
                staff.SetAttributeValue("Text", "Staff");
                staff.SetAttributeValue("Value", "2");
                if (AllowedDistrictSettings.Contains("Staff"))
                    Tree.Add(staff);
                XElement employee = new XElement("Node");
                employee.SetAttributeValue("Text", "Employee");
                employee.SetAttributeValue("Value", "3");
                if (AllowedDistrictSettings.Contains("Employee"))
                    Tree.Add(employee);
                XElement contractor = new XElement("Node");
                contractor.SetAttributeValue("Text", "Contractor");
                contractor.SetAttributeValue("Value", "4");
                if (AllowedDistrictSettings.Contains("Contractor"))
                    Tree.Add(contractor);
                RadTreeView1.LoadXml(Tree.ToString());

                string instanceValue = new Util().GetSettingsValue("InstanceUsertype");
                List<string> Allowed = new List<string>();
                if (!string.IsNullOrEmpty(instanceValue))
                {
                    Allowed = instanceValue.Split(',').ToList();
                }
                foreach (string s in Allowed)
                {
                    switch (s)
                    {
                        case "1":
                            CheckNode("Student");
                            break;
                        case "2":
                            CheckNode("Staff");
                            break;
                        case "3":
                            CheckNode("Employee");
                            break;
                        case "4":
                            CheckNode("Contractor");
                            break;
                    }
                }


              
            }
            //txtRandom.InputAttributes["class"] = "css-checkbox";
            //txtRandom.LabelAttributes["class"] = "css-checklabel";

        }

        private void CheckNode(string val)
        {
            RadTreeNode foundNode = RadTreeView1.FindNodeByText(val);
            if (foundNode != null)
            {
                foundNode.Checked = true;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Instance.aspx");
        }
       

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string val = txtTimeOut.Text.Trim();
            string val1 = txtInstanceName.Text.Trim();
            string val2 = txtPrefix.Text.Trim();
            string val3 = txtRandom.Checked.ToString().ToLower();
            string val4 = txtContractor.Checked.ToString().ToLower();
            StringBuilder val5 = new StringBuilder();
            foreach (RadTreeNode r in RadTreeView1.Nodes)
            {
                if (r.Checked)
                {
                    if (val5.Length>0)
                        val5.Append(",");
                    val5.Append(r.Value);
                }
            }

            string msg = new Util().UpdateSettings("SessionTimeOut", val);
            new Util().UpdateSettings("PrefixID", val2);
            new Util().UpdateSettings("RandomID", val3);
            new Util().UpdateSettings("ValidateContractorEmail", val4);
            new Util().UpdateSettings("InstanceUsertype", val5.ToString());
            new Util().UpdateSettings("InstanceName", val1.ToString());
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
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