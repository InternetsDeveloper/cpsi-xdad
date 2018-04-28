<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstTimeParent_Screen_1.aspx.cs" Inherits="TelerikWebApp3.FirstTimeParent_Screen_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> Parent - Registration</h1>
                <h5 class="h5 text-center animation-slideUp">To register for an account fill out the form below, confirm your information & agree to the policy, <br />or use the CANCEL button to back out safely.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== PARENT INFO ====-->
                        <form action="FirstTimeParent_Screen_1.aspx" method="post" id="form-par-reg-1" class="form-horizontal">
                            <h4 class="underline-heading">Personal Information</h4>
                            
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="reuired input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg" runat="server" placeholder="* First Name"></asp:textbox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                ControlToValidate="txtFirstName"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="* Last Name"></asp:textbox>
                                        </div>
                                         <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                ControlToValidate="txtLastName"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                            
                           
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:textbox type="email" id="txtID" name="txtID" class="form-control input-lg" runat="server" placeholder="* ID Number"></asp:textbox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                ControlToValidate="txtID"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 2rem">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                            <asp:TextBox type="date" id="txtBirthDate" name="txtBirthDate" class="form-control input-lg" runat="server" placeholder="* Birth Date"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-1  text-nowrap" style="margin-bottom: 3rem;">
                                            <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtBirthDate" ValidationGroup="Date"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                            
                           
                            <!--==== /end parent info ====-->

                            <!--==== POLICY ====-->
                            <h4 class="underline-heading">Please Read & Accept our Policy</h4>
                            <!--*********** FORM PLUG IN HERE **********-->
                            <iframe class="form-control" id="docFrame" runat="server" style="height:250px;" rows="6"></iframe>
                            <!--==== /end policy ====-->
                            <div class="col-xs-12 alert" id="notificationLeft">
                                <asp:Label ID="" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6 buttons-row">
                                    <label class="switch switch-primary">
                                        <asp:CheckBox type="checkbox" id="chkAgree" runat="server" />
                                    </label>
                                    <small>I agree to the Terms & Conditions above.</small>
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Agree & Continue" class="btn btn-sm btn-primary" id="btnAgree" onclientclick="radconfirm('Are you sure?', confirmCallBackFn); return false;" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" text="Cancel" class="btn btn-sm btn-danger" id="btnCancel" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
                                Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
                                EnableShadow="true" AutoCloseDelay="30000">
                            </telerik:RadNotification>
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

        <h4>First Time Parent Login </h4>

        <div class="HorizontalFull"></div>
       

        <div>
            <h6>Please confirm your information and sign the Acceptable Use Policy.</h6>
        </div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>First Name:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtFirstName" CssClass="textBoxWidth" Text="jen" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Last Name:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtLastName" CssClass="textBoxWidth" Text="hall" runat="server"></asp:TextBox>
                </td>
                <td class="SmallText textContainer">
                    <h6>E-mail:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtID" CssClass="textBoxWidth" Text="901200" runat="server"></asp:TextBox>
                </td>
                <td class="SmallText textContainer">
                    <h6>BirthDate:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtBirthDate" CssClass="textBoxWidth" Text="1996-04-22" runat="server"></asp:TextBox>
                </td>


            </tr>
        </table>

       <iframe id="docFrame" runat="server" height="250px"  width="100%"></iframe>
       
        <div class="checkbox">
            <h6>
                <asp:CheckBox ID="chkAgree"  runat="server" /><asp:Label ID="txt"  Text="I agree to the terms and conditions above" runat="server"></asp:Label></h6>
        </div>
        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree" OnClientClick="radconfirm('Are you sure?', confirmCallBackFn); return false;" CssClass="flat-button BackGroundColor" runat="server" Text="Agree and Continue" OnClick="btnAgree_Click" />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>


    </div>
    <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>

--%>