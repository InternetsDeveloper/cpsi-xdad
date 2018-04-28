using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string Id = "hd6c+uq8bvZ8y3gW5IHOmeLMao1iqicvjzmpPz2VrBE=";
            // string val = new Util().Decrypt(Id); 
          //  Check();
        }

        void Check()
        {
            if (!Page.IsPostBack)
            {

                if (Request == null || Request.UrlReferrer == null)
                {
                    Response.Redirect("AcessDenied.aspx");
                }
                if (Request != null && Request.UrlReferrer != null)
                {
                    if(!Request.UrlReferrer.ToString().ToLower().Contains("xdad"))
                    Response.Redirect("AcessDenied.aspx");
                }

                if (Request.QueryString["Id"] == null)
                {
                    Response.Redirect("AcessDenied.aspx");

                      return;
                }
                else
                {
                    string Id = Request.QueryString["Id"];
                    try { string val = new Util().Decrypt(Id); }
                    catch (Exception ex)
                    {
                        Response.Redirect("AcessDenied.aspx");

                        return;
                    }
                }
            }
        }
    }
}