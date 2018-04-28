<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstTimeParent_Screen_3.aspx.cs" Inherits="TelerikWebApp3.FirstTimeParent_Screen_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> Parent - Account Review</h1>
                <h5 class="h5 text-center animation-slideUp">Review the information on this page and set your password in order to register a new account, <br/>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== SET PASSWORD ====-->
                        <form action="FirstTimeParent_Screen_3.aspx" method="post" id="form-par-reg-3" class="form-horizontal">
                            <h4 class="underline-heading">Set New Password</h4>
                            <div class="row form-inline text-center">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-lock"></i></span>
                                            <asp:TextBox type="password" id="TextBox1" name="TextBox1" runat="server" class="form-control input-lg" placeholder="* New Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-lock"></i></span>
                                            <asp:TextBox type="password" id="TextBox3" name="TextBox3" runat="server" class="form-control input-lg" placeholder="* Confirm New Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <!--==== /end set password ====-->

                            <!--==== SECURITY QUESTIONS ====-->
                            <h4 class="underline-heading">Confirm Security Questions</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:textbox id="txtQA" name="txtQA" runat="server" class="form-control input-lg" size="1"></asp:textbox> 
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtA" name="txtA" runat="server" class="form-control input-lg"></asp:textbox> 
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:textbox id="txtQB" name="txtQB" runat="server" class="form-control input-lg" size="1"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtB" name="txtB" runat="server" class="form-control input-lg"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:textbox id="txtQC" name="txtQC" runat="server" class="form-control input-lg" size="1"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" >
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtC" name="txtC" runat="server" class="form-control input-lg"></asp:textbox>
                                    </div>
                                </div>
                            </div >
                            <div class="col-sm-4 col-md-4" id="notificationLeft" style="margin-bottom: 2rem">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end security questions ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right" style="margin-bottom: 1rem">
                                    <asp:button type="submit" text="Submit" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnContinue_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <telerik:RadNotification ID="notification_ufc_error" runat="server" VisibleOnPageLoad="false"
                                Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
                                EnableShadow="true" AutoCloseDelay="30000">
                            </telerik:RadNotification>
                        </form>
                        <br />
                        <div class="text-center buttons-row">
                            <small class="pwd-req">A password must be a minimum of 8 characters long and contain both upper and lower case letters as well as numbers.</small>
                        </div>
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

    <div>

        <h4>First Time Parent Login - Account Review</h4>

        <div class="HorizontalFull"></div>
        <br />
        <div>
            <h6>Please review your account information below and reset your password.</h6>
        </div>
        <div class="span10">
            <h6>Set New Password</h6>
        </div>
        <div class="HorizontalFullBase span10"></div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>New Password:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="TextBox1" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Confirm Password:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="TextBox3" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>


            </tr>

        </table>

        <div class="span10">
            <h6>Confirm Security Questions</h6>
        </div>
        <div class="HorizontalFullBase span10"></div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Question #1:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtQA" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Answer #1:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtA" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Question #2:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtQB" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Answer #2:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtB" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Question #3</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtQC" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Answer #3:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtC" CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>



        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Done" />
                </td>


            </tr>
        </table>
        <br />
    </div>
    <telerik:RadNotification ID="notification_ufc_error" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>

--%>