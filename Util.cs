using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Configuration;
using VCServiceClient.RESTClient;
using System.Text;
using Telerik.Web.UI;

namespace TelerikWebApp3
{
    public class Password
    {

        public string Complex
        {
            get;
            set;
        }
        public string Length
        {
            get;
            set;
        }
        public string UpperCaseLetters
        {
            get;
            set;
        }
        public string LowerCaseLetters
        {
            get;
            set;
        }
        public string Numeric
        {
            get;
            set;
        }
        public string NonAlphaNumeric
        {
            get;
            set;
        }
        public string Suffix
        {
            get;
            set;
        }
        public string Prefix
        {
            get;
            set;
        }

        public Password()
        {
            Complex= Length = Prefix = Suffix = NonAlphaNumeric = Numeric = LowerCaseLetters = UpperCaseLetters = Length = "";

        }

        
    }

    public class Util
    {
        string Footer_Left_Text = "Footer_Left_Text";
        string Footer_Center_Text = "Footer_Center_Text";
        string Footer_Right_Text = "Footer_Right_Text";
        public readonly string Encryptionp = "!##AlUJuEIRmdoCqz4TYVP8CkRjRDz2WkbZxb2rRRrwB0acRpDRgyrs2yPN7uXEIaXyGIwAyo1JSvufPRV3e2m2Hg==$$!";
        string SettingFilePath = AppDomain.CurrentDomain.BaseDirectory + "SelfServiceSettings.Config";
        public string Uri
        {
            get
            {
                string fileName = SettingFilePath;
                string connection = "";
                 XElement KeyStrings=XElement.Load(fileName);
                 List<XElement> keys = XElement.Load(fileName).Descendants("add").ToList();
                 if (keys.Count() > 0)
                     foreach (XElement x in keys)
                    {
                        if (x.Attribute("key").Value.ToLower() == "uri".ToLower())
                        {
                            connection = x.Attribute("value").Value;
                        }
                    }
               
                return connection;
            }
        }


        public static void ShowInfo(System.Web.UI.WebControls.Label lbl,string info)
        {
            lbl.Text = info;
            lbl.Visible = true;
           

        }
    
        public static void HideInfo(System.Web.UI.WebControls.Label lbl)
        {
            lbl.Text = "";
            lbl.Visible = false;
        }

        public string GetPath()
        {
            if (ConfigurationManager.AppSettings["path"] != null)
                return ConfigurationManager.AppSettings["path"].ToString();
            else
                return "";
        }

       public string SearchSingle(string sAMAccount_Name,string userType)
        {
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Action", "searchuser");
            xdADSelfService.SetAttributeValue("Provider", "ad");
            XElement UserInput = new XElement("UserInput");
            UserInput.SetAttributeValue("UserType", userType);
            XElement sAMAccountName = new XElement("sAMAccountName", sAMAccount_Name);
            UserInput.Add(sAMAccountName);
            xdADSelfService.Add(UserInput);

            string uri = new Util().Uri;
            xdADSelfService ss = new xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
           //  string rt=ChangesPasswordSettingsAndReset(true,Session["USERTYPE"],
            XElement retXml = XElement.Parse(ret);
            return retXml.ToString();
        }

        public string Footer_Left_Text_Info
        {
            get
            {
                string fileName = SettingFilePath;
                string connection = "";
                XElement KeyStrings = XElement.Load(fileName);
                List<XElement> keys = XElement.Load(fileName).Descendants("add").ToList();
                if (keys.Count() > 0)
                    foreach (XElement x in keys)
                    {
                        if (x.Attribute("key").Value.ToLower() == Footer_Left_Text.ToLower())
                        {
                            connection = x.Attribute("value").Value;
                        }
                    }

                return Decrypt(connection);
            }
        }

        public string Footer_Right_Text_Info
        {
            get
            {
                string fileName = SettingFilePath;
                string connection = "";
                XElement KeyStrings = XElement.Load(fileName);
                List<XElement> keys = XElement.Load(fileName).Descendants("add").ToList();
                if (keys.Count() > 0)
                    foreach (XElement x in keys)
                    {
                        if (x.Attribute("key").Value.ToLower() == Footer_Right_Text.ToLower())
                        {
                            connection = x.Attribute("value").Value;
                        }
                    }

                return connection;
            }
        }
        public List<ADSetting_FunctionCode> GetFunctionCode()
        {
            XDocument xmlDoc = null;
            if (new Util().GetDesignatedType() == "3")
                xmlDoc = XDocument.Parse(UserSettings_FunctionCode_Employee_File);
            if (new Util().GetDesignatedType() == "2")
                xmlDoc = XDocument.Parse(UserSettings_FunctionCode_Staff_File);

            string select = string.Empty;



            List<ADSetting_FunctionCode> q = new List<ADSetting_FunctionCode>();
            q = (from c in xmlDoc.Descendants("FunctionCode").Elements("Code")
                 select new ADSetting_FunctionCode()
                 {

                     Description = c.Attribute("Description").Value,
                     Code = c.Value,
                     Type = c.Ancestors("FunctionCode").First().Attribute("Type").Value,
                     Code_description = c.Value + " - " + c.Attribute("Description").Value

                 }).ToList();



            return q.OrderBy(x => x.Code).ToList();
        }

        public List<ADSetting_FunctionCode> GetFunctionCode(string type)
        {
            XDocument xmlDoc = null;
            if (type == "3")
                xmlDoc = XDocument.Parse(UserSettings_FunctionCode_Employee_File);
            if (type == "2")
                xmlDoc = XDocument.Parse(UserSettings_FunctionCode_Staff_File);

            string select = string.Empty;



            List<ADSetting_FunctionCode> q = new List<ADSetting_FunctionCode>();
            q = (from c in xmlDoc.Descendants("FunctionCode").Elements("Code")
                 select new ADSetting_FunctionCode()
                 {

                     Description = c.Attribute("Description").Value,
                     Code = c.Value,
                     Type = c.Ancestors("FunctionCode").First().Attribute("Type").Value,
                     Code_description = c.Value + " - " + c.Attribute("Description").Value

                 }).ToList();



            return q.OrderBy(x => x.Code).ToList();
        }

        public string UserSettings_FunctionCode_Staff_File
        {

            get
            {
                if (HttpContext.Current.Session["FunctionCode_Staff_File"] != null)
                {
                    return HttpContext.Current.Session["FunctionCode_Staff_File"].ToString();
                }
                else
                {
                    string uri = new Util().Uri;
                    VCSetting vcs = new VCSetting(uri);
                    HttpContext.Current.Session["FunctionCode_Staff_File"] = vcs.GetUserFunctionCode(VCServiceClient.RESTClient.UserType.Staff);
                    return HttpContext.Current.Session["FunctionCode_Staff_File"].ToString();
                }

            }
            set
            {
                HttpContext.Current.Session["FunctionCode_Staff_File"] = value;
            }

        }

        public string UserSettings_FunctionCode_Employee_File
        {

            get
            {
                if (HttpContext.Current.Session["FunctionCode_Employee_File"] != null)
                {
                    return HttpContext.Current.Session["FunctionCode_Employee_File"].ToString();
                }
                else
                {
                    string uri = new Util().Uri;
                    VCSetting vcs = new VCSetting(uri);
                    HttpContext.Current.Session["FunctionCode_Employee_File"] = vcs.GetUserFunctionCode(VCServiceClient.RESTClient.UserType.Employee);
                    return HttpContext.Current.Session["FunctionCode_Employee_File"].ToString();
                }

            }
            set
            {
                HttpContext.Current.Session["FunctionCode_Employee_File"] = value;
            }

        }

        public string Footer_Center_Text_Info
        {
            get
            {
                string fileName = SettingFilePath;
                string connection = "";
                XElement KeyStrings = XElement.Load(fileName);
                List<XElement> keys = XElement.Load(fileName).Descendants("add").ToList();
                if (keys.Count() > 0)
                    foreach (XElement x in keys)
                    {
                        if (x.Attribute("key").Value.ToLower() == Footer_Center_Text.ToLower())
                        {
                            connection = x.Attribute("value").Value;
                        }
                    }

                return connection;
            }
        }

        public string GetSettingsValue(string val)
        {
           
                string fileName = SettingFilePath;
                string connection = "";
                XElement KeyStrings = XElement.Load(fileName);
                List<XElement> keys = XElement.Load(fileName).Descendants("add").ToList();
                if (keys.Count() > 0)
                    foreach (XElement x in keys)
                    {
                        if (x.Attribute("key").Value.ToLower() == val.ToLower())
                        {
                            connection = x.Attribute("value").Value;
                        }
                    }

                return connection;
            
        }

        public string GetclassificationInsertVal()
        {
            string val = "Select Job Classification";
            if (new Util().GetDesignatedType() == "2")
                val = "Select Function Code";
            return val;

        }

        public string GetclassificationInsertVal(string loc)
        {
            string val = "Select Job Classification";
            if (loc == "2")
                val = "Select Function Code";
            return val;

        }
        public string Location_Info_File
        {

            get
            {
                if (HttpContext.Current.Session["Location_Info_File"] != null)
                {
                    return HttpContext.Current.Session["Location_Info_File"].ToString();
                }
                else
                {
                    string uri = new Util().Uri;
                    VCSetting vcs = new VCSetting(uri);
                    HttpContext.Current.Session["Location_Info_File"] = vcs.GetSiteList(SiteType.Location);
                    return HttpContext.Current.Session["Location_Info_File"].ToString();
                }

            }
            set
            {
                HttpContext.Current.Session["Location_Info_File"] = value;
            }

        }
        public string School_Info_File
        {

            get
            {
                if (HttpContext.Current.Session["School_Info_File"] != null)
                {
                    return HttpContext.Current.Session["School_Info_File"].ToString();
                }
                else
                {
                    string uri = new Util().Uri;
                    VCSetting vcs = new VCSetting(uri);
                    HttpContext.Current.Session["School_Info_File"] = vcs.GetSiteList(SiteType.School);
                    return HttpContext.Current.Session["School_Info_File"].ToString();
                }

            }
            set
            {
                HttpContext.Current.Session["School_Info_File"] = value;
            }

        }



        public void SyncSettings()
        {
            StringBuilder SysncSettings = new StringBuilder();
            string instanceValue = GetSettingsValue("InstanceUsertype");
            List<string> Allowed = new List<string>();
            if (!string.IsNullOrEmpty(instanceValue))
            {
                Allowed = instanceValue.Split(',').ToList();
            }

            List<string> DistrictSettings = GetDistrictSettingsIds();
            foreach (string s in Allowed)
            {
                if (DistrictSettings.Contains(s))
                {
                    if (SysncSettings.Length != 0)                   
                        SysncSettings.Append(",");
                    SysncSettings.Append(s);


                }

            }

            new Util().UpdateSettings("InstanceUsertype", SysncSettings.ToString());




        }

        public List<ADSetting_School> GetCurrentUserLocations(string loc)
        {

            string var = "SiteInfo";
            XDocument xmlDoc = null;
            if (loc == "3")
                xmlDoc = XDocument.Parse(Location_Info_File);
            else
                xmlDoc = XDocument.Parse(School_Info_File);
            string select = string.Empty;



            List<ADSetting_School> q = new List<ADSetting_School>();

            q = (from c in xmlDoc.Descendants(var).Elements("Site")
                 select new ADSetting_School()
                 {

                     Id = c.Attribute("ID").Value,
                     Type = c.Attribute("Type").Value,
                     RecId = c.Attribute("RecId").Value,
                     LocalId = c.Attribute("LocalId").Value,
                     Name = c.Attribute("Name").Value,
                     LocalId_name = c.Attribute("LocalId").Value + " - " + c.Attribute("Name").Value
                 }).ToList();



            //List<Authorized_Sites> authorisedSites = new Authorized_Sites().Get_Authorized_Sites_Employee();
            //if (authorisedSites.Count > 0)
            //{
            //    q = (from p in q
            //         join sites in authorisedSites on p.LocalId equals sites.LocalId
            //         select p).ToList();
            //}
            return q.OrderBy(x => x.Name).ToList();
        }
        public List<ADSetting_School> GetLocations()
        {

            string var = "SiteInfo";
            XDocument xmlDoc = null;
            if(GetDesignatedType()=="3")
            xmlDoc = XDocument.Parse(Location_Info_File);
            else
            xmlDoc = XDocument.Parse(School_Info_File);
            string select = string.Empty;



            List<ADSetting_School> q = new List<ADSetting_School>();

            q = (from c in xmlDoc.Descendants(var).Elements("Site")
                 select new ADSetting_School()
                 {

                     Id = c.Attribute("ID").Value,
                     Type = c.Attribute("Type").Value,
                     RecId = c.Attribute("RecId").Value,
                     LocalId = c.Attribute("LocalId").Value,
                     Name = c.Attribute("Name").Value,
                     LocalId_name = c.Attribute("LocalId").Value + " - " + c.Attribute("Name").Value
                 }).ToList();



            //List<Authorized_Sites> authorisedSites = new Authorized_Sites().Get_Authorized_Sites_Employee();
            //if (authorisedSites.Count > 0)
            //{
            //    q = (from p in q
            //         join sites in authorisedSites on p.LocalId equals sites.LocalId
            //         select p).ToList();
            //}
            return q.OrderBy(x => x.Name).ToList();
        }

        public List<ADSetting_School> GetLocations(string type)
        {

            string var = "SiteInfo";
            XDocument xmlDoc = null;
            if (type == "3")
                xmlDoc = XDocument.Parse(Location_Info_File);
            else
                xmlDoc = XDocument.Parse(School_Info_File);
            string select = string.Empty;



            List<ADSetting_School> q = new List<ADSetting_School>();

            q = (from c in xmlDoc.Descendants(var).Elements("Site")
                 select new ADSetting_School()
                 {

                     Id = c.Attribute("ID").Value,
                     Type = c.Attribute("Type").Value,
                     RecId = c.Attribute("RecId").Value,
                     LocalId = c.Attribute("LocalId").Value,
                     Name = c.Attribute("Name").Value,
                     LocalId_name = c.Attribute("LocalId").Value + " - " + c.Attribute("Name").Value
                 }).ToList();



            //List<Authorized_Sites> authorisedSites = new Authorized_Sites().Get_Authorized_Sites_Employee();
            //if (authorisedSites.Count > 0)
            //{
            //    q = (from p in q
            //         join sites in authorisedSites on p.LocalId equals sites.LocalId
            //         select p).ToList();
            //}
            return q.OrderBy(x => x.Name).ToList();
        }


        public string GetInstanceSettings()
        {
            string instanceValue=GetSettingsValue("InstanceUsertype");
            List<string> Allowed = new List<string>();
            if (!string.IsNullOrEmpty(instanceValue))
            {
                Allowed = instanceValue.Split(',').ToList();
            }
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "setting");
            xdADSelfService.SetAttributeValue("Action", "getsettings");
            string uri = new Util().Uri;
            VCServiceClient.RESTClient.xdADSelfService ss = new VCServiceClient.RESTClient.xdADSelfService(uri);
           string ret= ss.SelfServiceGet(xdADSelfService);
            XElement settings = XElement.Parse(ret);
            if (Allowed.Count > 0)
            {
                List<XElement>UserTypes = settings.Descendants("UserType").ToList();
                foreach (XElement userType in UserTypes)
                {
                    XElement u = (from q in settings.Descendants("UserType") where q.Attribute("ID").Value == userType.Attribute("ID").Value select q).ElementAt(0);
                    if (Allowed.Contains(userType.Attribute("ID").Value))
                    {
                       
                        u.SetAttributeValue("Checked", "true");


                    }
                    else
                    {

                        u.SetAttributeValue("Checked", "false");
                    }
                }
                

            }
            return settings.ToString();
        }

        public List<string> GetDistrictSettings()
        {
       
            List<string> Allowed = new List<string>();           
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "setting");
            xdADSelfService.SetAttributeValue("Action", "getsettings");
            string uri = new Util().Uri;
            VCServiceClient.RESTClient.xdADSelfService ss = new VCServiceClient.RESTClient.xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            XElement settings = XElement.Parse(ret);
          
                List<XElement> UserTypes = settings.Descendants("UserType").ToList();
                foreach (XElement userType in UserTypes)
                {
                    XElement u = (from q in settings.Descendants("UserType") where q.Attribute("ID").Value == userType.Attribute("ID").Value select q).ElementAt(0);
                switch (u.Attribute("ID").Value)
                {
                    case "1":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("Student");
                        break;
                    case "2":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("Staff");
                        break;
                    case "3":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("Employee");
                        break;
                    case "4":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("Contractor");
                        break;
                }

            }


            
            return Allowed;
        }

        public List<string> GetDistrictSettingsIds()
        {

            List<string> Allowed = new List<string>();
            XElement xdADSelfService = new XElement("xdADSelfService");
            xdADSelfService.SetAttributeValue("Provider", "database");
            xdADSelfService.SetAttributeValue("Type", "setting");
            xdADSelfService.SetAttributeValue("Action", "getsettings");
            string uri = new Util().Uri;
            VCServiceClient.RESTClient.xdADSelfService ss = new VCServiceClient.RESTClient.xdADSelfService(uri);
            string ret = ss.SelfServiceGet(xdADSelfService);
            XElement settings = XElement.Parse(ret);

            List<XElement> UserTypes = settings.Descendants("UserType").ToList();
            foreach (XElement userType in UserTypes)
            {
                XElement u = (from q in settings.Descendants("UserType") where q.Attribute("ID").Value == userType.Attribute("ID").Value select q).ElementAt(0);
                switch (u.Attribute("ID").Value)
                {
                    case "1":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("1");
                        break;
                    case "2":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("2");
                        break;
                    case "3":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("3");
                        break;
                    case "4":
                        if (u.Attribute("Checked").Value.ToLower() == "true")
                            Allowed.Add("4");
                        break;
                }

            }



            return Allowed;
        }
        public string GetDesignatedType()
        {



            string ret = GetInstanceSettings();
            XElement retXml = XElement.Parse(ret);
            string data = "";
            XElement nd = null;
            if ((from q in retXml.Descendants("UserType") where q.Value.ToLower() == "contractor" select q).Count() > 0)
            {
                nd = (from q in retXml.Descendants("UserType") where q.Value.ToLower() == "contractor" select q).ElementAt(0);
                if (nd.Attribute("DesignatedType") != null)
                {
                    data = nd.Attribute("DesignatedType").Value.ToString();
                }
            }            
            return data;
           


        }

        public string GetDesignatedType_Text()
        {

            string val = "";
            if (GetDesignatedType() == "3")
                val = "Location";
            else
                val = "School";
            return val;


        }

        public string UpdateSettings(string val, string newVal)
        {
            string msg = "";
            try
            {
                string fileName = SettingFilePath;
                XElement SettingsXml = XElement.Load(fileName);
             //   XElement ConnectionStrings = SettingsXml.Element("appSettings");
                foreach (XElement x in SettingsXml.Descendants("add"))
                {
                    if (x.Attribute("key").Value == val)
                    {
                        x.Attribute("value").Value = newVal;
                    }
                }
                SettingsXml.Save(fileName);
              
            }
            catch (Exception Ex)
            {
                msg = Ex.ToString();
            }
            return msg;

        }

        public string Encrypt(string val){
            return CPSI_Crypto_LIB.Crypto.Encrypt(val, Encryptionp);
        }
        public string Decrypt(string val)
        {
            return CPSI_Crypto_LIB.Crypto.Decrypt(val, Encryptionp);
        }
       
       
        
        public Util()
        {
        }

       

    }
}