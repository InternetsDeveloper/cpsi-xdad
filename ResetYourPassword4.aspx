<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetYourPassword4.aspx.cs" Inherits="TelerikWebApp3.ResetYourPassword4" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            function show() {

                $("#notificationLeft").show();

            }

            function hide() {

                $("#notificationLeft").hide();

            }
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-lock"></i>
                    <%= Session["USERTYPE_TEXT"]%> Password Reset</h1>
                <h5 class="h5 text-center animation-slideUp"> Please complete the information below and reset your password.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== RESET PWD FORM ====-->
                        <form action="ResetYourPassword.aspx" method="post" id="form-reset-pwd-1" class="form-horizontal">
                            <h6 class="form-label">Password must contain:</h6>
                             <div class="col-xs-12">
                                    <div id="Length" visible="false" runat="server">
                                        <asp:Label ID="lblLength" CssClass="lb-sm text-danger" Text="Passwords must be at least 8 characters long." runat="server"></asp:Label>
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
                            <h4 class="underline-heading">Set New Password</h4>
                            <h6 class="form-label">* New Password: </h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-lock"></i></span>
                                        <asp:textbox type="password" id="txtPassword" name="txtPassword" class="form-control input-lg" runat="server" placeholder="* New Password"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtPassword" EnableClientScript="false" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Confirm Password:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="password" id="txtPasswordConfirm" name="txtPasswordConfirm" class="form-control input-lg" runat="server" placeholder="* Confirm Password"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 control-label alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end reset pwd form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Continue" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnSubmit_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            
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
                <%= Session["USERTYPE_TEXT"]%> Password Reset

        <div class="HorizontalFull"></div>
        </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please complete the information below and reset your password.
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
            <div class="col-sm-12 lb-sm">
                Set New Password

                <div class="HorizontalFull"></div>
            </div>
        </div>
        </div>
        <div class="form-horizontal Text-NoWrap">
            <div class="row form-group cols-sm-8">
                <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*New Password:</label>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator ControlToValidate="txtPassword" EnableClientScript="false" CssClass="control-label text-danger" Text="Required" runat="server" />
                </div>



            </div>
            <div class="form-horizontal Text-NoWrap">
                <div class="row form-group cols-sm-8">
                    <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Confirm Password:</label>

                    <div class="col-sm-2">
                        <asp:TextBox ID="txtPasswordConfirm" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-1 text-nowrap">
                        <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                    </div>
                </div>

            </div>

        </div>


        <br />
        <div class="row Text-NoWrap">
            <div class="col-sm-2">
                <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Reset" OnClick="btnSubmit_Click" />

            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>

            <div class="col-sm-6 control-label alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>



        </div>
        <br />

        </asp:Content>

        --%>