<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="UserName.aspx.cs" Inherits="TelerikWebApp3.UserName" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                window.setTimeout(function () {

                    location.href = window.location.protocol + "/" + window.location.host + "/xdadselfservice//default.aspx";
                }, 30000);
            });
        </script>

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> UserName</h1>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== PARENT INFO ====-->
                        <form action="Username.aspx" method="post" id="form-par-reg-1" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h6> Your Username: </h6>
                                    <div class="input-group">
                                    <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <div class="form-control">
                                             <%=  Session["userName"]%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--==== /end parent info ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6 buttons-row">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="button" text="Done" class="btn btn-sm btn-danger" id="btnCancel" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                        </form>
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
                </div>
            </div>
        </div>
        <!--==== /end footer ====-->

        <!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-up"></i></a>

    </asp:Content>


    <%--
    <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12  lb-lg">
                UserName 
                <div class="HorizontalFull"></div>
            </div>
           </div>
         <div class="form-group" style="margin-left:5px">
             <div class="col-sm-2 alert alert-info lb-sm" id="notificationLeft">
            UserName:&nbsp; <%=  Session["userName"]%>
        </div>
        </div>
        <div class="col-sm-2-1">
            <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Done" OnClick="btnCancel_Click" />
        </div>


        </div>
        <br />

        <div class="row Text-NoWrap">

        </div>
        <div class="row Text-NoWrap">




        </div>
        <div>
        </div>
        <br />

        </asp:Content>

        --%>