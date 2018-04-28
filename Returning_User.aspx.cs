using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TelerikWebApp3
{
    public partial class Returning_User : System.Web.UI.Page
    {

        void showSchoolLogo()
        {
            string path = "";
            string[] filePaths = Directory.GetFiles(Server.MapPath(@"~/SchoolLogo/"));
            if (filePaths.Count() > 0)
            {
                path = @"~/SchoolLogo/" + Path.GetFileName(filePaths[0]);


                string fileNameDest = Server.MapPath(path);
                using (Bitmap imgb = new Bitmap(fileNameDest))
                {

                    var imageHeight = imgb.Height;
                    var imageWidth = imgb.Width;
                   // img.Attributes.Add("src", path);
                   // img.Attributes.Add("height", imageHeight.ToString());
                   // img.Attributes.Add("width", imageWidth.ToString());
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showSchoolLogo();
                if (Session["AUTHORIZATION"] != null)
                {
                  
                    bool resetPasswordStudent = false;
                    bool resetPasswordStaff = false;
                    bool resetPasswordContractor = false;
                    bool ManageContractor = false;
                    bool resetEmployee = false;
                    bool changePassword = true;
                    string auth = Session["AUTHORIZATION"].ToString();
                    XElement autorizedMenuXML = XElement.Parse(auth);
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2423" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2423").Attribute("Hidden").Value))
                            changePassword = false;
                        else
                            changePassword = true;
                    }
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2424" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2424").Attribute("Hidden").Value))
                            ManageContractor = false;
                        else
                            ManageContractor = true;
                    }
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2425" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2425").Attribute("Hidden").Value))
                            resetPasswordStudent = false;
                        else
                            resetPasswordStudent = true;
                    }
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2427" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2427").Attribute("Hidden").Value))
                            resetPasswordStaff = false;
                        else
                            resetPasswordStaff = true;
                    }
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2426" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2426").Attribute("Hidden").Value))
                            resetPasswordContractor = false;
                        else
                            resetPasswordContractor = true;
                    }
                    if ((from x in autorizedMenuXML.Descendants("Node") where x.Attribute("ID").Value == "2428" select x).ToList().Count > 0)
                    {
                        if (Convert.ToBoolean(autorizedMenuXML.Descendants("Node").First(x => (string)x.Attribute("ID") == "2428").Attribute("Hidden").Value))
                            resetEmployee = false;
                        else
                            resetEmployee = true;
                    }
                    Tile_ChangeMyPassword.Disabled= changePassword;
                    Tile_ChangeMyQuestions.Disabled = changePassword;
                    Tile_ResetPasswordForStudent.Disabled = resetPasswordStudent;
                    Tile_ResetPasswordForEmployee.Disabled = resetEmployee;
                    Tile_ResetPasswordForContractor.Disabled = resetPasswordContractor;
                    Tile_ResetPasswordForStaffMember.Disabled = resetPasswordStaff;
                    Tile_ManageContratorRequests.Disabled = ManageContractor;
                    //Tile_AdminTools.Visible = false;
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void btnContractorEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContractorEmailList.aspx");
        }

        protected void btnChangeQuestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeSecurityQuestions.aspx");
        }

        protected void btnResetPasswordStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword.aspx");
        }

        protected void btnListEmail_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmailList.aspx");
        }

        protected void btnResetPasswordParent_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword_Employee.aspx");
        }
        protected void btnResetPasswordContractor_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword_Contractor.aspx");
        }
        protected void btnResetPasswordStaff_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPassword_Staff.aspx");
        }
        protected void btnManageContractorRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Contractor_Requests_1.aspx");
        }
        protected void btnAdminTools_Click(object sender, EventArgs e)
        {
            // Response.Redirect("Manage_Contractor_Requests_1.aspx");
        }

    }

}