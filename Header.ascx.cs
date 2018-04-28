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
    public partial class Header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentPage = HttpContext.Current.Request.RawUrl;
            if (Session["LOGONUSER"] != null)
            {
                lblUser.Text = "Welcome " + Session["LOGONUSER"].ToString();
                btnHeaderLogout.Visible = true;
            }
            else
            {
                
                lblUser.Text = "";
                //if (!currentPage.ToLower().Contains("default.aspx"))
                //{
                //    Response.Redirect("Default.aspx");
                //}

            }
            
            if (currentPage.ToLower().Contains("default.aspx"))
            {
                btnHeaderLogout.Visible = false;
             //   btnHeaderHome1.Visible = false;
            }
            //pnlHeader.BackColor = color;

           // btnLogin.Visible = btnHome.Visible = true;
            //lblUser.Text = "test";
        }


        void Clear()
        {
            Session.Abandon();
            btnHeaderLogout.Visible = false;
            lblUser.Text = "";
            Response.Redirect("Default.aspx");
        }
       protected void btnLogin_Click(Object sender, EventArgs e)
        {

            //if (btnHeaderLogout.Text == "Logout")
            //{

            //    Clear();
            //}
        }

        protected void btnHome_Click(Object sender, EventArgs e)
        {
            Clear();
        }
    }
}