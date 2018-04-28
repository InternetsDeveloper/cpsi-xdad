<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstTimeParent_Screen_2.aspx.cs" Inherits="TelerikWebApp3.FirstTimeParent_Screen_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> Parent - Security Questions</h1>
                <h5 class="h5 text-center animation-slideUp">Pick and answer three questions. These questions will be used if you ever need to reset your password. <br />You can use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== SECURITY QUESTIONS ====-->
                        <form action="FirstTimeParent_Screen_2.aspx" method="post" id="form-par-reg-2" class="form-horizontal">
                            <h4 class="underline-heading text-left">Setup - Security Questions</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion1" name="drpQuestion1" runat="server" class="form-control input-lg" size="1">
                                        <asp:ListItem Value="0">* Question #1</asp:ListItem>
                                        <asp:ListItem Value="1">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="2">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="4">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="5">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="6">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="7">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="8">What street did you grow up on?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            ControlToValidate="drpQuestion1"
                                             Placeholder="Select Question"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtA" name="txtA" runat="server" class="form-control input-lg" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            ControlToValidate="txtA"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion2" name="drpQuestion2" runat="server" class="form-control input-lg" size="1">
                                        <asp:ListItem Value="0">* Question #2</asp:ListItem>
                                        <asp:ListItem Value="1">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="2">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="4">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="5">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="6">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="7">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="8">What street did you grow up on?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtB" name="txtB" runat="server" class="form-control input-lg" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                            ControlToValidate="txtB"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion3" name="drpQuestion3" runat="server" class="form-control input-lg" size="1">
                                        <asp:ListItem Value="0">* Question #3</asp:ListItem>
                                        <asp:ListItem Value="1">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="2">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="4">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="5">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="6">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="7">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="8">What street did you grow up on?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                     <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                            ControlToValidate="drpQuestion3"
                                            CssClass="control-label text-danger"
                                             InitialValue="Select Question"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" >
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtC" name="txtC" runat="server" class="form-control input-lg" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                     <div style="margin-bottom: 2rem">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                            ControlToValidate="txtC"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <!--==== /end security questions ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Continue" id="btnContinue" class="btn btn-sm btn-primary" runat="server" onclick="btnContinue_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <telerik:RadNotification ID="notification_ufc_error" runat="server" VisibleOnPageLoad="false"
                                Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
                                EnableShadow="true" AutoCloseDelay="30000">
                            </telerik:RadNotification>
                        </form>
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
                        <div class="col-sm-4 col-md-4" id="notificationLeft">
                        <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
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

        <h4>First Time Parent Login - Setup Security Questions</h4>

        <div class="HorizontalFull"></div>
        <br />
        <div>
            <h6>Please setup your security questions. These questions will be used to help you if you ever need to reset your password on this site</h6>
        </div>
       

        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Question #1:</h6>
                </td>
                <td class="text-left">
                    <asp:DropDownList ID="drpQuestion1"  CssClass="textBoxWidthLong" runat="server">
                    <asp:ListItem Value="">What is your pet's Name?</asp:ListItem>
                    </asp:DropDownList>
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
                   <asp:DropDownList ID="drpQuestion2"  CssClass="textBoxWidthLong" runat="server">
                        <asp:ListItem Value="">What is your car make?</asp:ListItem>
                   </asp:DropDownList>
                </td>

                <td class="SmallText textContainer">
                    <h6>Answer #2:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtB"  CssClass="textBoxWidthLong" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Question #3</h6>
                </td>
                <td class="text-left">
                  <asp:DropDownList ID="drpQuestion3"  CssClass="textBoxWidthLong" runat="server">
                       <asp:ListItem Value="">What is your favourite movie?</asp:ListItem>
                  </asp:DropDownList>
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
                <asp:Button ID="btnContinue" CssClass="flat-button BackGroundColor" runat="server" Text="Continue"  onclick="btnContinue_Click" />
            </td>

            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
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