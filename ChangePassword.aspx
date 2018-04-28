<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TelerikWebApp3.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function confirmCallBackFn(arg) {
            radalert("Confirm returned the following result: " + arg);
        }

        function show() {

            $("#notificationLeft").show();

        }

        function hide() {

            $("#notificationLeft").hide();

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <!--====INTRO====-->
            <div class="section site-section site-section-light site-section-top themed-background-dark">
                <div class="container">
                    <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-unlock"></i>
                        <%= Session["USERTYPE_TEXT"]%> - Reset Password</h1>
                    <h5 class="h5 text-center animation-slideUp">If you need to reset your password, fill out the form below with the appropriate information, <br />or use the CANCEL button to back out safely if you are here by mistake.</h5>
                    <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
                </div>
            </div>
            <!--====/ end intro====-->

            <!--==== MAIN CONTENT ====-->
            <div class="section site-content site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                            <!--==== CHANGE PASSWORD FORM ====-->
                            <form action="ChangePassword.aspx" method="post" id="form-chg-pwd" class="form-horizontal">
                                <div id="Length" visible="false" runat="server">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                                <asp:Label ID="lblLength" CssClass="lb-sm text-danger" Text="Passwords must be at least  characters long." runat="server"></asp:Label>
                                            </div>
            
                                            <div id="Numeric" visible="false" runat="server">
                                                <asp:Label ID="lblNumeric" CssClass="lb-sm text-danger" Text="Numbers: Numeric" runat="server"></asp:Label>
                                            </div>
                                            <div id="LowerCaseLetters" visible="false" runat="server">
                                                <asp:Label ID="lblLowerCaseLetters" CssClass="lb-sm text-danger" Text="LowerCase letters: LowerCaseletters" runat="server"></asp:Label>

                                            </div>
                                            <div id="UpperCaseLetters" visible="false" runat="server">
                                                <asp:Label ID="lblUpperCaseLetters" CssClass="lb-sm text-danger" Text="Uppercase letters: UpperCaseletters" runat="server"></asp:Label>
                                            </div>
                                            <div id="NonAplhaNumeric" visible="false" runat="server">
                                                <asp:Label ID="lblNonAplhaNumeric" CssClass="lb-sm text-danger" Text="NonAlphaNumeric: NonAlphaNumeric" runat="server"></asp:Label>
                                            </div>
                                            <div id="Suffix" visible="false" runat="server">
                                                <asp:Label ID="lblSuffix" CssClass="lb-sm text-danger" Text="Suffix: Suffix" runat="server"></asp:Label>
                                            </div>
                                            <div id="Prefix" visible="false" runat="server">
                                                <asp:Label ID="lblPrefix" CssClass="lb-sm text-danger" Text="Prefix: Prefix" runat="server"></asp:Label>
                                            </div>
                                    </div>
                                </div>
                                <h4 class="underline-heading">Current Password</h4>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-lock"></i></span>
                                            <asp:TextBox  type="password" id="txtCurrentPassword" name="txtCurrentPassword" class="form-control input-lg" runat="server" placeholder="* Current Password"></asp:TextBox>
                                        </div>
                                         <div style="margin-bottom: 2rem">
                                            <asp:RequiredFieldValidator ID="vldCurrent"
                                                ControlToValidate="txtCurrentPassword"
                                                EnableClientScript="false"
                                                ValidationGroup="Date"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <h4 class="underline-heading">Set New Password</h4>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-unlock-alt"></i></span>
                                            <asp:TextBox type="password" id="txtNewPassword" name="txtNewPassword" class="form-control input-lg" runat="server" placeholder="* New Password"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date"
                                                runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" >
                                            <span class="input-group-addon color-i"><i class="fa fa-unlock-alt"></i></span>
                                            <asp:TextBox type="password" id="txtConfirmPassword" name="txtConfirmPassword" class="form-control input-lg" runat="server" placeholder="* Confirm Password"></asp:TextBox>
                                        </div>
                                         <div style="margin-bottom: 2rem">
                                            <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                                                runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 alert" id="notificationLeft">
                                    <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                                    </div>
                                <br />
                                <!--==== /end change password form ====-->

                                <!--==== BUTTON ROW ====-->
                                <div class="form-group form-actions buttons-row">
                                    <div class="col-xs-6">
                                    </div>
                                    <div class="col-xs-6 text-right" style="margin-bottom: 1rem">
                                        <asp:Button type="submit" id="btnSubmit" class="btn btn-sm btn-primary" runat="server" text="Submit" OnClick="btnSubmit_Click"/>
                                        <asp:Button type="button" id="btnCancel" class="btn btn-sm btn-danger" runat="server" text="Cancel" OnClick="btnCancel_Click"/>
                                    </div>
                                </div>
                                <!--==== /end button row ====-->
                            </form>
                            <div class="text-center">
                                <small class="pwd-req">A password must be a minimum of 8 characters long and contain both upper and lower case letters as well as numbers.</small>
                            </div>
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

    <div class="form-horizontal">

        <br />

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                <%= Session["USERTYPE_TEXT"]%> Change Password
            
                <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please complete the information below to reset your password
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
             <div id="pwdInclude" runat="server" class="col-sm-12 lb-sm">
                Password must contain
            </div>
            <div class="col-sm-12 lb-sm">

                <div id="Length" visible="false" runat="server">
                    <asp:Label ID="lblLength" CssClass="lb-sm text-danger" Text="Passwords must be at least  characters long." runat="server"></asp:Label>
                </div>
            
                <div id="Numeric" visible="false" runat="server">
                    <asp:Label ID="lblNumeric" CssClass="lb-sm text-danger" Text="Numbers: Numeric" runat="server"></asp:Label>
                </div>
                <div id="LowerCaseLetters" visible="false" runat="server">
                    <asp:Label ID="lblLowerCaseLetters" CssClass="lb-sm text-danger" Text="LowerCase letters: LowerCaseletters" runat="server"></asp:Label>

                </div>
                <div id="UpperCaseLetters" visible="false" runat="server">
                    <asp:Label ID="lblUpperCaseLetters" CssClass="lb-sm text-danger" Text="Uppercase letters: UpperCaseletters" runat="server"></asp:Label>
                </div>
                <div id="NonAplhaNumeric" visible="false" runat="server">
                    <asp:Label ID="lblNonAplhaNumeric" CssClass="lb-sm text-danger" Text="NonAlphaNumeric: NonAlphaNumeric" runat="server"></asp:Label>
                </div>
                <div id="Suffix" visible="false" runat="server">
                    <asp:Label ID="lblSuffix" CssClass="lb-sm text-danger" Text="Suffix: Suffix" runat="server"></asp:Label>
                </div>
                <div id="Prefix" visible="false" runat="server">
                    <asp:Label ID="lblPrefix" CssClass="lb-sm text-danger" Text="Prefix: Prefix" runat="server"></asp:Label>
                </div>

            </div>

        </div>
        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Current Password
                 <div class="HorizontalFull"></div>
            </div>

        </div>

        <div class="form-group">
            <div class="col-sm-2-2 lb-sm text-nowrap">
                *Current Password
            </div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtCurrentPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator ID="vldCurrent"
                    ControlToValidate="txtCurrentPassword"
                    EnableClientScript="false"
                    ValidationGroup="Date"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>


        </div>
        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Set New Password
                 <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2-2 lb-sm text-nowrap">*New Password:</div>
            <div class="col-sm-6">
                <asp:TextBox ID="txtNewPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1">
                <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>


        </div>
        <div class="form-group" style="margin-bottom: 0.2%">

            <div class="col-sm-2-2 lb-sm text-nowrap">*Confirm Password:</div>

            <div class="col-sm-6">
                <asp:TextBox ID="txtConfirmPassword" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-2 text-left">
                <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>

        </div>

        <div>
        </div>





        <br />

        <div class="row Text-NoWrap">
            <div class="col-sm-2">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

        </div>


    </div>
    <br />

</asp:Content>

--%>