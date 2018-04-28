using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class SiteAdminDeny : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    if (Request.QueryString["Id"] == null)
            //    {
            //        Response.Redirect("AcessDenied.aspx");
            //        // Response.Write(ex.ToString());
            //        return;
            //    }
            //    else
            //    {
            //        string Id = Request.QueryString["Id"];
            //        try { string val = new Util().Decrypt(Id); }
            //        catch (Exception ex)
            //        {
            //            Response.Redirect("AcessDenied.aspx");
            //            //  Response.Write(ex.ToString());
            //            return;
            //        }
            //    }
            //}
        }
    }
}