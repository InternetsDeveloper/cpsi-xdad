using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace TelerikWebApp3
{
    public partial class AdminHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = HttpContext.Current.Request.RawUrl;
            lblHeader.Text = new Util().GetSettingsValue("AdminHeaderText").ToString();
            //Color color = System.Drawing.ColorTranslator.FromHtml(ConfigurationManager.AppSettings["HeaderTextBackColor"].ToString());
            btnHeaderLogin.Visible = true;
            // btnHeaderHome.Visible = true;
            if (Session["LOGONUSER"] != null)
            {
                lblUser.Text = "Welcome " + Session["LOGONUSER"].ToString();
                btnHeaderLogin.Visible = true;
            }
            else
            {
                btnHeaderLogin.Visible = false;
                lblUser.Text = "";
                //if (!currentPage.ToLower().Contains("default.aspx"))
                //{
                //    Response.Redirect("Default.aspx");
                //}

            }
            
            if (currentPage.ToLower().Contains("default.aspx"))
            {
                btnHeaderLogin.Visible = false;
            //    btnHeaderHome.Visible = false;
            }
            //pnlHeader.BackColor = color;

           // btnLogin.Visible = btnHome.Visible = true;
            //lblUser.Text = "test";
        }


        void Clear()
        {
            Session.Abandon();
            btnHeaderLogin.Visible = false;
            lblUser.Text = "";
            Response.Redirect("Default.aspx");
        }
       protected void btnLogin_Click(Object sender, EventArgs e)
        {
           
           // if (btnHeaderLogin.Text == "Logout")
            {

                Clear();
            }
        }

        protected void btnHome_Click(Object sender, EventArgs e)
        {
            Clear();
        }
    }
}