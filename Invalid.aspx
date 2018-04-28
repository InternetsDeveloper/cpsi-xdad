<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Invalid.aspx.cs" Inherits="TelerikWebApp3.Invalid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Authorization Failed</h1>
            </div>
        </div>
        <!--==== /end intro ====-->

         <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4 site-block">

                        <!--==== QUESTION ====-->
                        <form action="ResetYourPassword2.aspx" method="post" id="form-reset-pwd-2" class="form-horizontal">
                            <h2 class="input-question-text" id="authDeny" runat="server">Error</h2>
                            <h4 class="input-question-text" id="authDeny2" runat="server">Authorization Failed</h4> 
                            <!--==== /end question ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->

                            
                        </form>
                        <!-- END Log In Form -->
                    </div>
                </div>
               <hr />
            </div>
        </div>
        <!--==== /end main content ====-->

        <!--==== COLOR CONTAINER ====-->
        <div class="section site-content site-section themed-background">
            <div class="container">
            </div>
        </div>
        <!--==== /end color container ====-->

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
    <div class="row">
       
        <div class="span9">
            <div class="pull-right-center">
                <h1>Error</h1>

                <div class="HorizontalFull"></div>                
                <h6>Authorization Failed</h6>
            </div>
        </div>
    </div>

</asp:Content>
--%>
