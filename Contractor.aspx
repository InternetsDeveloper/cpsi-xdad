<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Contractor.aspx.cs" Inherits="TelerikWebApp3.Contractor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown contractor-name"><i class="fa fa-user-o"></i> Welcome
                    <%= Session["LOGONUSER"]%>
                </h1>
                <h3 class="h3 text-center animation-slideDown school-name">
                    <%= Session["LOGONUSER_SITE"]%>
                </h3>
                <h5 class="h5 text-center animation-slideUp">Here you can request a district login account.  If you are a new user, <br />click "Request Account" to start the registration to start the registration.  If you have already requested <br />
               an account and are returning to complete your registration, click "Complete Registration".</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== USER BUTTONS ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-6">
                         <asp:button type="button" text="REQUEST ACCOUNT" class="btn-student" id="btnSelectUserType" AutoPostBack="true" onclick="btnSelectUserType_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <asp:button type="button" text="COMPLETE REGISTRATION" class="btn-student" id="btnTemplate" AutoPostBack="true" onclick="btnTemplate_Click" runat="server"></asp:button>
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end user buttons ====-->

        <!--==== FOOTER ====-->
        <div class="footer site-footer site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-md-4 text-center">
                        <h6 class="footer-heading require">Support: techsupport@cpsiltd.com or dial (618)281-8898</h6>
                    </div>
                    <div class="col-sm-4 col-md-4 text-center">
                        <img class="footer-heading" src="img/CPSI-Logo-Gray.png">
                        <h6 class="footer-heading"><span id="year-copy">2017</span> &copy; <a href="http://www.cpsiltd.com/">CPSI,Ltd.</a></h6>
                    </div>
                    <div class="col-sm-4 col-md-4">
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
                
                <div class=" lb-lg form-group">
                    <%= Session["SCHOOLNAME"]%>

                    <div class="HorizontalFull"></div>
                </div>
                      
             
                <div class="lb-md form-group">
                    Welcome <%= Session["LOGONUSER"]%>
                     <div class="lb-sm">
                    Here you can request a district login account.  If you are a new user, click "Request Account" to start the registration to start the registration.  If you have already requested
               an account and are returning to complete your registration, click "Complete Registration".
                </div>
                </div>
                    
               
            </div>
        </div>

    </div>
    <br />
    <div class="row">

        <div class="col-sm-3 col-sm-offset-3">

            <telerik:RadContentTemplateTile CssClass="metro-tile" ID="btnSelectUserType" AutoPostBack="true" OnClick="btnSelectUserType_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                <ContentTemplate>
                    <div class="TileText lb-lg">
                        Request<br />
                        <br />
                        Account 
                       
                        
                    </div>
                </ContentTemplate>
            </telerik:RadContentTemplateTile>
        </div>
        <div class="col-sm-3">

            <telerik:RadContentTemplateTile CssClass="metro-tile" ID="btnTemplate" AutoPostBack="true" OnClick="btnTemplate_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                <ContentTemplate>

                    <div class="TileText lb-lg">
                        Complete<br />
                        <br />
                        Registration                                
                        
                    </div>

                </ContentTemplate>
            </telerik:RadContentTemplateTile>
        </div>

    </div>

    <br />




</asp:Content>

--%>