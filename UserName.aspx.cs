using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using VCServiceClient.RESTClient;

namespace TelerikWebApp3
{
    public partial class UserName : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
               

        }

       

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }

}