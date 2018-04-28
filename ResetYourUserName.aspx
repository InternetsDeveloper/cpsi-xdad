<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetYourUserName.aspx.cs" Inherits="TelerikWebApp3.ResetYourUserName" %>

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
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> Forgot Username</h1>
                <h5 class="h5 text-center animation-slideUp">Please enter your information below to recover your username.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== RESET USERNAME ====-->
                        <form action="ResetYourUserName.aspx" method="post" id="form-par-reg-1" class="form-horizontal">
                            <h6 class="form-label">* First Name</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="reuired input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg" runat="server" placeholder="* First Name"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFirstName" EnableClientScript="false" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Last Name</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="* Last Name"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLastName" EnableClientScript="false" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            *<asp:Label ID="lblType" runat="server" Text="ID"></asp:Label>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                        <asp:textbox type="text" id="txtStudentID" name="txtStudentID" class="form-control input-lg" runat="server" placeholder="* ID"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtStudentID" EnableClientScript="false" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Birth Date</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" >
                                        <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                        <asp:TextBox type="date" id="txtBirthDate" name="txtBirthDate" CssClass="form-control input-lg" runat="server" placeholder="* Birthdate"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                       <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtBirthDate" ValidationGroup="Date"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="alert col-xs-12" id="notificationLeft" style="margin-bottom: 2rem">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end RESET USERNAME ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6 buttons-row">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Continue" class="btn btn-sm btn-primary" id="btnDone" runat="server" onclick="btnSubmit_Click" />
                                    <asp:button type="button" text="Cancel" class="btn btn-sm btn-danger" id="btnCancel" runat="server" onclick="btnCancel_Click" />
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
                    <div class="col-sm-4 col-md-4">
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end footer ====-->

        <!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-up"></i></a>

    </asp:Content>

  

    <%--<br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Forgot Username
            </div>

            <div class="col-sm-12 lb-md">
                <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please Enter your information below to recover your username.
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
        </div>
    </div>



    <div class="col-sm-12 form-horizontal">


        <div class="form-group">



            <div class="form-group">
                <div class="col-sm-2 control-label lb-sm text-nowrap">*First Name:</div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtFirstName"
                        EnableClientScript="false"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 control-label lb-sm text-nowrap">*Last Name:</div>

                <div class="col-sm-3">
                    <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtLastName"
                        EnableClientScript="false"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 control-label lb-sm text-nowrap">
                    *<asp:Label ID="lblType" runat="server" Text="Student ID"></asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtStudentID" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtStudentID"
                        EnableClientScript="false"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2 control-label lb-sm">*Birth Date:(MM/DD/YYYY)</div>

                <div class="col-sm-3">
                    <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####"
                        MaskType="DateTime">
                    </telerik:RadMaskedTextBox>

                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                        runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                </div>
            </div>
        </div>
    </div>


    <br />

    <%--<div class="row Text-NoWrap">
        <div class="col-sm-2">
            <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnSubmit_Click" />
        </div>
        <div class="col-sm-2">
            <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>


    </div>
    <br />
    <div class="form-horizontal  control-label" style="margin-right: 20px">

        <div class="alert alert-info lb-sm" id="notificationLeft">
            <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
        </div>


    </div>
    <br />
        <div class="row">


            <div class="col-sm-1">
                <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnSubmit_Click" />
            </div>

            <div class="col-sm-1">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 control-label">

                <div class="alert alert-info lb-sm" id="notificationLeft">
                    <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>

                </div>

            </div>
        </div>

        <br />

        </asp:Content>
--%>
      