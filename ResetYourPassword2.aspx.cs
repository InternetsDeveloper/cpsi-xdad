using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class ResetYourPassword2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Util.HideInfo(notification_ufc);
                if (Session["SECRET_QUESTIONS_ANSWERS"] != null)
                {
                    Session["CURRENT_INDEX"] = -1;
                    SetQuestion();

                }

            }
        }


        private void SetQuestion()
        {
            XElement retXml = XElement.Parse(Session["SECRET_QUESTIONS_ANSWERS"].ToString());
            List<XElement> lst = retXml.Descendants("SecretQA").ToList();
            lblQuestion.Text = lst[GetCurrentIndex()].Element("Question").Value;
        }

        private string GetAnswer()
        {
            XElement retXml = XElement.Parse(Session["SECRET_QUESTIONS_ANSWERS"].ToString());
            List<XElement> lst = retXml.Descendants("Answer").ToList();
            int index = Convert.ToInt32(Session["CURRENT_INDEX"].ToString());
            string answer = lst[index].Value;
            return answer;
        }

        int GetCurrentIndex()
        {
            int index = Convert.ToInt32(Session["CURRENT_INDEX"].ToString());
            switch (index){
                case -1:
                    index = 0; break;
                case 0:
                    index = 1;break;
                case 1:
                    index = 2;break;
                case 2:
                    Response.Redirect("ResetYourPassword3.aspx");
                    break;
               
            }
            Session["CURRENT_INDEX"] = index;
            return index;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string answer = GetAnswer();
                if (txtAnswer.Text == answer)
                {
                    Response.Redirect("ResetYourPassword4.aspx");
                }
                else
                {
                    Util.ShowInfo(notification_ufc, "Invalid Answer");
                }
            }
           

        }

        protected void btnForgotQuestion_Click(object sender, EventArgs e)
        {
            SetQuestion();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}