using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TelerikWebApp3
{
    public partial class FirstTimeParent_Screen_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //string userInfo = Session["UserInfo"].ToString();
                //string QA = Session["QUESTIONS"].ToString();
                //if (!string.IsNullOrEmpty(userInfo))
                //{
                   
                //    try {
                //        XElement UserInfo = XElement.Parse(userInfo);
                //        txtNetwork.Text = UserInfo.Descendants("UserRefId").ElementAt(0).Value.ToString();
                //        string SignedUp = UserInfo.Descendants("SignedUp").ElementAt(0).Value.ToString();
                //        string objectGuid = UserInfo.Descendants("objectGuid").ElementAt(0).Value.ToString();
                //        string SAMAccountName = UserInfo.Descendants("sAMAccountName").ElementAt(0).Value.ToString();
                //        txtPassword.Text = UserInfo.Descendants("password").ElementAt(0).Value.ToString();

                //        XElement Questions = XElement.Parse(QA);
                //        txtQA.Text= Questions.Descendants("Question").ElementAt(0).Value;
                //        txtQB.Text = Questions.Descendants("Question").ElementAt(1).Value;
                //        txtQC.Text = Questions.Descendants("Question").ElementAt(2).Value;
                //        txtA.Text = Questions.Descendants("Answer").ElementAt(0).Value;
                //        txtB.Text = Questions.Descendants("Answer").ElementAt(1).Value;
                //        txtC.Text = Questions.Descendants("Answer").ElementAt(2).Value;


                //    }
                //    catch (Exception Ex) {
                //        notification_ufc_error.Show(Ex.Message.Replace("\r\n", ""));
                //        btnDone.Enabled = false;
                //    }
                   
                   

                //}
            }
        }

         protected void btnContinue_Click(object sender, EventArgs e)
        {
            string objectGuid = "";
            if (string.IsNullOrEmpty(txtA.Text.Trim()) || string.IsNullOrEmpty(txtB.Text.Trim()) || string.IsNullOrEmpty(txtC.Text.Trim()))
            {
                notification_ufc_error.Show("Answers for all questions are Required");
                return;
            }
            else
            {//
                  Response.Redirect("FirstTimeParent_Screen_4.aspx");
                string userInfo = Session["UserInfo"].ToString();
                if (!string.IsNullOrEmpty(userInfo))
                {
                    XElement UserInfoDoc = XElement.Parse(userInfo);
                    try
                    {

                        objectGuid = UserInfoDoc.Descendants("objectGuid").ElementAt(0).Value.ToString();
                      
                    }
                    catch (Exception Ex)
                    {
                        notification_ufc_error.Show(Ex.Message.Replace("\r\n", ""));
                        return;
                      
                    }



                }

            }
        }

         protected void btnCancel_Click(object sender, EventArgs e)
         {
             Response.Redirect("Default.aspx");
         }
    }
}