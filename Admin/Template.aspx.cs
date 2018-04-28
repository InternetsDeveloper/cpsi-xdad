using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelerikWebApp3
{
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string myf = File.ReadAllText(Server.MapPath(@"~\Theme\Theme.css"));

                MatchCollection mt = Regex.Matches(myf, @"[^}]?([^{]*{[^}]*})", RegexOptions.Multiline);
                string border = mt[1].Captures[0].ToString();
                string clr = mt[6].Captures[0].ToString();
                txtBorderColor.Text = GetColor(border);
                txtColor.Text = GetColor(clr);
                RadColorPicker2.SelectedColor = ColorTranslator.FromHtml(GetColor(border));
                RadColorPicker1.SelectedColor = ColorTranslator.FromHtml(GetColor(clr));
                pnlSave.Visible = false;
                pnlSaved.Visible = false;

            }


        }

        private string GetColor(string mts)
        {

            string delimiter = "border-color:";
            String[] substrings = Regex.Split(mts, delimiter);
            string borderColor = substrings[1].Split(';')[0];
            return borderColor;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string myf = File.ReadAllText(Server.MapPath(@"~\Theme\Theme.css"));

            MatchCollection mt = Regex.Matches(myf, @"[^}]?([^{]*{[^}]*})", RegexOptions.Multiline);
            string border = mt[1].Captures[0].ToString();
            string clr = mt[6].Captures[0].ToString();
            string borderColor = GetColor(border);
            string color = GetColor(clr);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mt.Count; i++)
            {
                string cs = mt[i].Captures[0].ToString();
                if (i <=1)
                {
                    cs = cs.Replace(borderColor, txtBorderColor.Text.Trim().Replace(";", ""));
                }
                else
                {
                    cs = cs.Replace(color, txtColor.Text.Trim().Replace(";", ""));
                }
                sb.Append(cs);
            }
            Session["Template"] = sb.ToString();
            pnlSave.Visible = true;
            pnlSaved.Visible = false;


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string s = Session["Template"].ToString();
            File.WriteAllText(Server.MapPath(@"~\Theme\Theme.css"), s);
            pnlSaved.Visible = true;
            pnlSave.Visible = false;
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            pnlSave.Visible = false;
            pnlSaved.Visible = false;
        }




        protected void btnAgree_Click(object sender, EventArgs e)
        {

            pnlSave.Visible = true;
            pnlSaved.Visible = false;

        }


        protected void RadColorPicker1_ColorChanged(object sender, EventArgs e)
        {
            string colorName = System.Drawing.ColorTranslator.ToHtml(RadColorPicker1.SelectedColor);
            txtColor.Text = string.Format("Color: {0}  Hue: {1}  Saturation: {2}  Brightness {3}",
                colorName,
                RadColorPicker1.SelectedColor.GetHue(),
                RadColorPicker1.SelectedColor.GetSaturation(),
                RadColorPicker1.SelectedColor.GetBrightness());
            txtColor.Text = colorName;

        }

        protected void RadColorPicker2_ColorChanged(object sender, EventArgs e)
        {
            string colorName = System.Drawing.ColorTranslator.ToHtml(RadColorPicker2.SelectedColor);
            txtBorderColor.Text = string.Format("Color: {0}  Hue: {1}  Saturation: {2}  Brightness {3}",
                colorName,
                RadColorPicker1.SelectedColor.GetHue(),
                RadColorPicker1.SelectedColor.GetSaturation(),
                RadColorPicker1.SelectedColor.GetBrightness());
            txtBorderColor.Text = colorName;

        }
    }
}