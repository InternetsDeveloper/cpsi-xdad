<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TelerikWebApp3.Default" %>

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
     
        //$(document).ready(function () {
        //    $("#password_show_button").mouseup(function () {
        //        $("#txtPassword").attr("type", "password");
        //    });
        //    $("#password_show_button").mousedown(function () {
        //        $("#txtPassword").attr("type", "text");
        //    });
        //});


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-user"></i> Log In / Registration</h1>
                <h5 class="h5 text-center animation-slideUp">Use your username and password to log in, or if you need to <br/> create an account, scroll down and follow the steps under USER REGISTRATION.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4 site-block">

                        <!--==== LOG IN FORM ====-->
                        <form action="Default.aspx" method="post" id="form-log-in" class="form-horizontal">
                        <h4 class="underline-heading">Log In</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h5 class="form-label"> I am a:</h5>
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                      <asp:DropDownList id="drpUserTypeLogin" name="drpUserTypeLogin" class="form-control input-lg" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                            ControlToValidate="drpUserTypeLogin"
                                            CssClass="control-label text-danger"
                                            ValidationGroup="Left"
                                            InitialValue="Select User Type"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="text" id="txtUserName" name="txtUserName" class="form-control input-lg" runat="server" placeholder="* Username"></asp:textbox>
                                    </div>
                                     <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            ControlToValidate="txtUserName"
                                            CssClass="control-label text-danger"
                                            ValidationGroup="Left"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-lock"></i></span>
                                        <asp:textbox type="password" id="txtPassword" name="txtPassword" class="form-control input-lg" runat="server" placeholder="* Password"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                            ControlToValidate="txtPassword"
                                            CssClass="control-label text-danger"
                                            ValidationGroup="Left"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 text-center" id="notificationLeft">
                                <asp:Label ID="notification_ufc_left" CssClass="text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end log in form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                    <label class="switch switch-primary">
                                        <input type="checkbox" id="login-remember-me" name="login-remember-me" /><span></span>
                                    </label>
                                    <small>Remember me</small>
                                </div>
                                <div class="col-xs-6 text-right" style="margin-bottom: 2rem;">
                                   <asp:button text="Log In" id="btnSignIn" class="btn btn-sm btn-success" runat="server" onclick="btnSignIn_Click" />
                                </div>
                                 <div class="text-center">
                                    <asp:Button ID="btnCancel" style="margin-bottom: 2rem" CssClass="btn btn-sm btn-danger" runat="server" Text="Help, I forgot my username or password" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            
                            <hr />
                           
                             <h4 class="underline-heading">First Time User Registration</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h5 class="form-label"> I am a:</h5>
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                         <asp:DropDownList id="drpUserTypeRegister" name="drpUserTypeRegister" class="form-control input-lg" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                                            ControlToValidate="drpUserTypeRegister"
                                            CssClass="control-label text-danger"
                                            ValidationGroup="Right"
                                            InitialValue="Select User Type"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 text-center" id="notificationRight">
                                 <asp:Label ID="notification_ufc_right" class="text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end register form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                    <label class="switch switch-primary">
                                        <input type="checkbox" id="Checkbox2" name="login-remember-me" /><span></span>
                                    </label>
                                    <small>Remember me</small>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Continue" id="btnContinueRegistraion" class="btn btn-sm btn-primary" runat="server" onclick="btnContinueRegistraion_Click" />
                                    
                                    </div>
                            </div>
                                <!--==== /end buttons row ====-->
                            </form>  
                       </div>
                    </div>
                </div>
                <hr />
            </div>
        <!--==== /end main content ====-->

        <!--==== PIC CONTAINER ====-->
        <div class="section site-content site-section site-bottom-pic">
            <div class="container text-center">
                <div class="row row-items">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <img alt="" class="lower-pic" src="img/HowItWorksGraphic32.png" />
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end pic container ====-->

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
                        <div class="col-sm-4 col-md-4" id="Div1">
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
        <div class="lb-lg" style="margin-top: 10px">Returning User</div>
        <div class="HorizontalFull"></div>
        <div class="lb-sm text-danger" style="margin-top:10px">
            Items marked with * are required.
        </div>
        <br />
        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-2 control-label lb-sm text-nowrap">*I am a:</div>
                    <div class="col-sm-8">
                       <asp:DropDownList ID="drpUserTypeLogin" class="form-control" runat="server">
                        </asp:DropDownList>

                    </div>
                    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                        <asp:RequiredFieldValidator
                            ControlToValidate="drpUserTypeLogin"
                            CssClass="control-label text-danger"
                            ValidationGroup="Left"
                            InitialValue="Select User Type"
                            Text="Required"
                            runat="server" />
                    </div>
                </div>


            </div>
        </div>


        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-2 control-label lb-sm text-nowrap">*Username:</div>
                    <div class="col-sm-8">
                       <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                        <asp:RequiredFieldValidator
                            ControlToValidate="txtUserName"
                            CssClass="control-label text-danger"
                            ValidationGroup="Left"
                            Text="Required"
                            runat="server" />
                    </div>
                </div>

            </div>
        </div>

        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-2 control-label lb-sm text-nowrap">*Password:</div>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>                      
                       <span style="width:0%" id="password_show_button"  class="input-group-addon"><i class="fa fa-eye-slash" aria-hidden="true"></i></span>
                    </div>
                    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                        <asp:RequiredFieldValidator
                            ControlToValidate="txtPassword"
                            CssClass="control-label text-danger"
                            ValidationGroup="Left"
                            Text="Required"
                            runat="server" />
                    </div>
                </div>


            </div>
            <div class="rowFirst">
                <div class="form-horizontal">
                    <div class="form-group" style="margin-bottom: 0.2%">
                        <div class="col-sm-2 control-label lb-sm">
                            <asp:Button ID="btnSignIn" CssClass="flat-button BackGroundColor" runat="server" Text="Sign in" OnClick="btnSignIn_Click" />

                        </div>

                        <div class="col-sm-8 alert alert-info lb-sm" id="notificationLeft">
                            <asp:Label ID="notification_ufc_left" CssClass="text-danger" runat="server"></asp:Label>
                        </div>
                          <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                        <asp:RequiredFieldValidator
                             Enabled="false"
                           ControlToValidate="txtPassword"
                            CssClass="control-label text-danger"
                            ValidationGroup="Left"
                            Text="Required"
                            runat="server" />
                    </div>

                    </div>
                  


                </div>
            </div>
        </div>


        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-5 control-label lb-sm">
                        <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Help, I forgot my Username or Password" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>







        <br />

    </div>

    <div class="col-sm-6">

        <div class="lb-lg" style="margin-top: 10px">
            First Time User Registration
        </div>
        <div class="HorizontalFull"></div>
        <div class="lb-sm text-danger" style="margin-top:10px">
            Items marked with * are required.
        </div>
        <br />
        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-2-4 control-label lb-sm text-nowrap">*I am a:</div>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="drpUserTypeRegister" CssClass="form-control" runat="server">
                        </asp:DropDownList>

                    </div>
                    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                        <asp:RequiredFieldValidator
                            ControlToValidate="drpUserTypeRegister"
                            CssClass="control-label text-danger"
                            ValidationGroup="Right"
                            InitialValue="Select User Type"
                            Text="Required"
                            runat="server" />
                    </div>
                </div>


            </div>
        </div>
        <div class="rowFirst">
            <div class="form-horizontal">
                <div class="form-group" style="margin-bottom: 0.2%">
                    <div class="col-sm-6 control-label lb-sm">
                        <asp:Button ID="btnContinueRegistraion" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnContinueRegistraion_Click" />
                        <asp:Label ID="notification_ufc_right" class="text-danger" runat="server"></asp:Label>
                    </div>

                </div>


            </div>
        </div>



    </div>


</asp:Content>
--%>