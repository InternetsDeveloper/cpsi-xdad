using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class Returning_Parent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void btnChangeQuestions_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeSecurityQuestions.aspx");
        }
    }
}