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
    public partial class FirstTimeUserContractor_Screen_5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnAgree_Click(object sender, EventArgs e)
        {

            Response.Redirect("FirstTimeUserContractor_Screen_6.aspx");
          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}