<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Returning_User.aspx.cs" Inherits="TelerikWebApp3.Returning_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <div class="col-sm-3">
                </div>
                <h1 class="text-center animation-slideDown staff-name"><i class="fa fa-user-o"></i>
                    <%= Session["LOGONUSER"]%>
                </h1>
                <h3 class="h3 text-center animation-slideDown school-name">
                    <%= Session["SCHOOLNAME"]%>
                </h3>
                <h5 class="h5 text-center animation-slideUp">Below are your network options. <br />If you need help, contact other school staff for help!</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== STAFF USER BUTTONS ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-4" id="Tile_ChangeMyPassword" runat="server">
                        <asp:button type="button" text="CHANGE MY PASSWORD" class="btn-student" id="btnChangePassword" AutoPostBack="true" onclick="btnChangePassword_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_ChangeMyQuestions" runat="server">
                        <asp:button type="button" text="CHANGE MY QUESTIONS" class="btn-student" id="btnChangequestions" AutoPostBack="true" onclick="btnChangeQuestions_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_ManageContratorRequests" runat="server">
                        <asp:button  type="button" text="CONTRACTOR REQUESTS" class="btn-student" id="btnManageContractorRequests" AutoPostBack="true" onclick="btnManageContractorRequests_Click" runat="server"></asp:button>
                    </div>
                </div>
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-4" id="Tile_ResetPasswordForEmployee" runat="server">
                        <asp:button type="button" text="EMPLOYEE P/W RESET" class="btn-student" id="btnResetPasswordParent" AutoPostBack="true" onclick="btnResetPasswordParent_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_ResetPasswordForContractor" runat="server">
                        <asp:button type="button"  text="CONTRACTOR P/W RESET" class="btn-student" id="btnResetPasswordContractor" AutoPostBack="true" onclick="btnResetPasswordContractor_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_ResetPasswordForStaffMember" runat="server">
                        <asp:button type="button"  text="STAFF P/W RESET" class="btn-student" id="btnResetPasswordStaff" AutoPostBack="true" onclick="btnResetPasswordStaff_Click" runat="server"></asp:button>
                    </div>
                </div>
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-4" id="Tile_ResetPasswordForStudent" runat="server">
                        <asp:button type="button"  text="STUDENT P/W RESET" class="btn-student" id="btnResetPasswordStudent" AutoPostBack="true" onclick="btnResetPasswordStudent_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_Contractor_Emails" visible="true" runat="server">
                        <asp:button type="button"  text="CONTRACTOR E-MAIL" class="btn-student" id="btnContractorEmail" AutoPostBack="true" onclick="btnContractorEmail_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-4" id="Tile_AdminTools" visible="false" runat="server">
                        <asp:button type="button"  text="ADMIN TOOLS" class="btn-student" id="btnAdminTools" AutoPostBack="true" BackColor="Transparent" onclick="btnAdminTools_Click" runat="server"></asp:button>
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end staff user buttons ====-->

        <!--==== FOOTER ====-->
            <div class="footer site-footer site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 col-md-4 text-center">
                            <h6 class="footer-heading require">Support: techsupport@cpsiltd.com or dial (618)281-8898</h6>
                        </div>
                        <div class="col-sm-4 col-md-4 text-center">
                            <img alt="footer-img" class="footer-heading" src="img/CPSI-Logo-Gray.png" />
                            <h6 class="footer-heading"><span id="year-copy">2017</span> &copy; <a href="http://www.cpsiltd.com/">CPSI,Ltd.</a></h6>
                        </div>
                        <div class="col-sm-4 col-md-4" >
                        </div>
                    </div>
                </div>
            </div>
            <!--==== /end footer ====-->

        <!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-up"></i></a>

    </asp:Content>

    <%--

     <br />
   
     <div class="row">
        <div class="col-sm-3">
            <img id="img" runat="server" src="SchoolLogo/Logo.png" />
        </div>
         <div class="col-sm-7">
            <div class="pull-right-center">
                <div class=" lb-lg">
             <%= Session["SCHOOLNAME"]%> 

                <div class="HorizontalFull"></div>
                    </div>
                <div class="lb-md" style="margin-top:10px">
                Welcome <%= Session["LOGONUSER"]%> 
                    </div><div class="lb-sm">
                Below are your options.  If you need help, please contact your network administrator for help.
                    </div>
            </div>
        </div>
        
    </div>
    <br />

    <div class="row">
        <div class="col-sm-3 col-sm-offset-2" id="Tile_ChangeMyPassword" runat="server" >
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnChangePassword" AutoPostBack="true"   OnClick="btnChangePassword_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                      <div class="TileText lb-lg">
                        Change My
                        <br />
                        Password
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
        <div class="col-sm-3" id="Tile_ChangeMyQuestions" runat="server" >
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnChangequestions" AutoPostBack="true"  OnClick="btnChangeQuestions_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                      <div class="TileText lb-lg">
                        Change My<br />
                       
                        Secret Questions
                        </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
        <div class="col-sm-3" id="Tile_ResetPasswordForStudent" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnChangeRequestStatus" AutoPostBack="true"  OnClick="btnResetPasswordStudent_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                      <div class="TileText lb-lg">
                        Reset Password for<br />
                        a Student
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-sm-3 col-sm-offset-2" id="Tile_ResetPasswordForEmployee" runat="server">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnRequestAdditionalChanges" AutoPostBack="true"   OnClick="btnResetPasswordParent_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                        <div class="TileText lb-lg">
                        Reset Password for<br />
                        an Employee
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
           <div class="col-sm-3" id="Tile_ResetPasswordForStaffMember" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnManagePersonalInformation" AutoPostBack="true"  OnClick="btnResetPasswordStaff_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                       <div class="TileText lb-lg">
                        Reset Password for<br />
                        a Staff Member
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
        <div class="col-sm-3" id="Tile_ResetPasswordForContractor" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnRequestOtherChanges" AutoPostBack="true"  OnClick="btnResetPasswordContractor_Click" runat="server"  Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                        Reset Password for<br />
                        a Contractor
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
      
     
    </div>
     <br />
    <div class="row">
        <div class="col-sm-3 col-sm-offset-2" id="Tile_ManageContratorRequests" runat="server">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile1" AutoPostBack="true"   OnClick="btnManageContractorRequests_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                        <div class="TileText lb-lg">
                       Manage Contractor<br />
                        Requests
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
         <div class="col-sm-3" id="Tile_Contractor_Emails" visible="true" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile2"   AutoPostBack="true"   OnClick="btnContractorEmail_Click" runat="server" Name="firstContentEmailTemplateTile"  Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                       Contractor<br />
                        Email
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
         <div class="col-sm-3" id="Tile_List_Emails" visible="true" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile3"   AutoPostBack="true"   OnClick="btnListEmail_Click" runat="server" Name="firstContentEmailTemplateTile"  Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                       List of<br />
                        Emails
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
        <div class="col-sm-3" id="Tile_AdminTools" visible="false" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnAdmin"   AutoPostBack="true"  BackColor="Transparent" OnClick="btnAdminTools_Click" runat="server" Name="AdminContentTemplateTile"  Shape="Wide">
                    <ContentTemplate>

                         <div class="AdminTileText">
                       Admin<br />
                        Tools
                           </div>
       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
     </div>
    <br />

   
</asp:Content>

--%>