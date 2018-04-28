using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TelerikWebApp3
{
    public partial class FirstTimeUser_Screen_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
            }
            if (!Page.IsPostBack)
            {
                string userInfo = Session["UserInfo"].ToString();
                string QA = Session["QUESTIONS"].ToString();
                if (!string.IsNullOrEmpty(userInfo))
                {

                    try
                    {
                        XElement UserInfo = XElement.Parse(userInfo);

                        string SignedUp = UserInfo.Descendants("SignedUp").ElementAt(0).Value.ToString();
                        string objectGuid = UserInfo.Descendants("objectGuid").ElementAt(0).Value.ToString();
                        string SAMAccountName = UserInfo.Descendants("sAMAccountName").ElementAt(0).Value.ToString();
                        txtNetwork.Text = SAMAccountName;
                        txtPassword.Text = UserInfo.Descendants("password").ElementAt(0).Value.ToString();

                        XElement Questions = XElement.Parse(QA);
                        txtQA.Text = Questions.Descendants("Question").ElementAt(0).Value;
                        txtQB.Text = Questions.Descendants("Question").ElementAt(1).Value;
                        txtQC.Text = Questions.Descendants("Question").ElementAt(2).Value;
                        txtA.Text = Questions.Descendants("Answer").ElementAt(0).Value;
                        txtB.Text = Questions.Descendants("Answer").ElementAt(1).Value;
                        txtC.Text = Questions.Descendants("Answer").ElementAt(2).Value;


                    }
                    catch (Exception Ex)
                    {
                        Util.ShowInfo(notification_ufc, Ex.Message.Replace("\r\n", ""));
                        btnDone.Enabled = false;
                    }



                }
            }
        }




        protected void btnDone_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}