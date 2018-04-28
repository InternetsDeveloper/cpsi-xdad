﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Returning_Parent.aspx.cs" Inherits="TelerikWebApp3.Returning_Parent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown parent-name"><i class="fa fa-user-o"></i>
                    <%= Session["LOGONUSER"]%>
                </h1>
                <h3 class="h3 text-center animation-slideDown school-name">
                    <%= Session["SCHOOLNAME"]%>
                </h3>
                <h5 class="h5 text-center animation-slideUp">Below are your network options. <br />If you need further help, you can contact school staff.</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== RETURNING USER BUTTONS ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-6">
                        <asp:button type="button" text="CHANGE MY PASSWORD" class="btn-student" id="btnChangePassword" AutoPostBack="true" onclick="btnChangePassword_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <asp:button type="button" text="CHANGE SECRET QUESTION" class="btn-student" id="btnChangequestions" AutoPostBack="true" onclick="btnChangeQuestions_Click" runat="server"></asp:button>
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end returning user buttons ====-->

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
                <div class="lb-md">
                Welcome <%= Session["LOGONUSER"]%> 
                    </div><div class="lb-sm">
                Below are your network options.If you need help, contact your teacher or other school staff for help.
                    </div>
            </div>
        </div>
        
    </div>
    <br />
    <div class="row">
        <div class="col-sm-3 col-sm-offset-3">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnChangePassword" AutoPostBack="true" OnClick="btnChangePassword_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
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
          <div class="col-sm-3">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnChangequestions" AutoPostBack="true" OnClick="btnChangeQuestions_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                            Change My<br />

                                Secret Questions
                        </div>

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
    
    </div>

</asp:Content>

--%>