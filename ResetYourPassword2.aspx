<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetYourPassword2.aspx.cs" Inherits="TelerikWebApp3.ResetYourPassword2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">s


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-lock"></i> Reset Your Password</h1>
                <h5 class="h5 text-center animation-slideUp">Please answer your security question to continue resetting your password, <br>or use the CANCEL button to back out safely.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== QUESTION ====-->
                        <form action="ResetYourPassword2.aspx" method="post" id="form-reset-pwd-2" class="form-horizontal">
                            <asp:Label class="input-question-text" id="lblQuestion" runat="server"></asp:Label>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question-circle"></i></span>
                                        <asp:TextBox type="text" id="txtAnswer" name="txtAnswer" TextMode="Password" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            ControlToValidate="txtAnswer"
                                            EnableClientScript="false"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 col-md-4" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end question ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions"> 
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right" style="margin-bottom: 2rem">
                                    <asp:button type="submit" text="Continue" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnSubmit_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            
                        </form>
                        <div class="text-center">
                            <asp:LinkButton ID="btnForgotQuestion" runat="server" Text="I forgot the answer" onclick="btnForgotQuestion_Click" /> 
                        </div>
                        <!-- END Log In Form -->
                    </div>
                </div>
                <hr/>
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

    <br />

    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Reset Your Password
                <div class="HorizontalFull"></div>
            </div>



        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                *Please answer your secret question
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-3 control-label lb-sm ">
                *<asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label>

            </div>
            <div class="col-sm-3">

                <asp:TextBox ID="txtAnswer" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtAnswer"
                    EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>

            <div class="col-sm-3" style="margin-top:5px;">
                <asp:LinkButton ID="btnForgotQuestion" runat="Server" Text="I forgot the answer" CssClass="btn-link form-label"   OnClick="btnForgotQuestion_Click" />
            </div>

        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />


            </div>

            <div class="col-sm-6">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>


        </div>


    </div>

</asp:Content>

--%>