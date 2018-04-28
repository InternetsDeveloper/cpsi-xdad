<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Complete_Registration.aspx.cs" Inherits="TelerikWebApp3.Complete_Registration" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            function show() {

                $("#notificationLeft").show();

            }

            function hide() {

                $("#notificationLeft").hide();

            }

            function show2() {

                $("#notificationLeft2").show();

            }

            function hide2() {

                $("#notificationLeft2").hide();

            }
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i> First Time Registration for -
                    <%= Session["USERTYPE_TEXT"]%>
                </h1>
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
                                    <div class="col-xs-12 text-nowrap" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtFirstName" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="* Last Name"></asp:textbox>
                                    </div>
                                    <div class="col-xs-12 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtLastName" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                        <asp:textbox type="email" id="txtID" name="txtID" class="form-control input-lg" runat="server" placeholder="* E-mail"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtID" CssClass="control-label text-danger" Text="Required" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" >
                                        <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                        <asp:TextBox type="date" class="form-control input-lg" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" placeholder="mm/dd/yyyy" MaskType="DateTime"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1  text-nowrap" style="margin-bottom: 2rem">
                                         <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtBirthDate" ValidationGroup="Date" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>

                            <br />
                            <!--==== /end parent info ====-->

                            <!--==== POLICY ====-->
                            <h4 class="underline-heading">Please Read & Accept our Policy</h4>
                            <iframe class="form-control" id="docFrame" runat="server" style="height:250px;" rows="6"></iframe>
                            <!--==== /end policy ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6 buttons-row">
                                    <label class="switch switch-primary">
                                        <input type="checkbox" id="chkAgree" name="chkAgree" runat="server" /><span></span>
                                    </label>
                                    <small>I agree to the Terms & Conditions above.</small>
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Agree & Continue" class="btn btn-sm btn-primary" id="btnAgree" onclientclick="radconfirm('Are you sure?', confirmCallBackFn); return false;" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" text="Cancel" class="btn btn-sm btn-danger" id="btnCancel" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <div class="alert col-xs-6 text-center" id="notificationLeft">
                                <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date" runat="server" Display="Dynamic" CssClass="control-label text-danger"></asp:CustomValidator>
                            </div>
                            <div class="alert col-xs-12 text-center" id="notificationLeft2">
                                <asp:Label ID="notification_ufc" CssClass="text-danger" runat="server"></asp:Label>
                            </div>
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
                First Time Registration for - <%= Session["USERTYPE_TEXT"]%>
        <div class="HorizontalFull"></div>
        </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
        </div>


        </div>
        <br />

        <div class="form-horizontal">
            <div class="form-group">
                <div class="col-sm-2-4 control-label lb-sm text-nowrap">*First Name:</div>
                <div class="col-sm-2 text-nowrap">
                    <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtFirstName" CssClass="control-label text-danger" Text="Required" runat="server" />
                </div>
                <div class="col-sm-2-4 control-label lb-sm text-nowrap">*Last Name:</div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>

                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtLastName" CssClass="control-label text-danger" Text="Required" runat="server" />
                </div>
            </div>

        </div>

        <div class="form-horizontal">
            <div class="form-group">

                <div class="col-sm-2-4 control-label lb-sm text-nowrap">*
                    <asp:Label ID="lblUserType" runat="server"></asp:Label>
                </div>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtID" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtID" CssClass="control-label text-danger" Text="Required" runat="server" />
                </div>

                <div class="col-sm-2-4 control-label lb-sm">*Birth Date:(MM/DD/YYYY)</div>
                <div class="col-sm-2">
                    <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" placeholder="##/##/####" MaskType="DateTime">
                    </telerik:RadMaskedTextBox>




                </div>

                <div class="col-sm-1  text-nowrap" style="margin-top: 5px">
                    <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtBirthDate" ValidationGroup="Date" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>

                </div>

            </div>

        </div>



        <div class="row">
            <div class="col-sm-12">
                <iframe id="docFrame" runat="server" height="200px" width="98%"></iframe>
            </div>
        </div>



        <div class="form-horizontal">
            <div class="col-sm-4 checkbox">
                <asp:CheckBox ID="chkAgree" Text="" runat="server" />
                <asp:Label ID="txt" Text="I agree to the terms and conditions above" runat="server"></asp:Label>


            </div>
            <div class="col-sm-4">

                <div class="alert alert-info col-sm-11 text-center" id="notificationLeft">
                    <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date" runat="server" Display="Dynamic" CssClass="control-label text-danger"></asp:CustomValidator>

                </div>
            </div>


        </div>
        <br />
        <br />



        <div class="row">
            <div class="col-sm-11">
                <div class="col-sm-1 text-nowrap Align-Submit-Button">
                    <asp:Button ID="btnAgree" OnClientClick="radconfirm('Are you sure?', confirmCallBackFn); return false;" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnAgree_Click" />
                </div>
                <div class="col-sm-1">
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                </div>

                <div class="col-sm-6" style="margin-left:10px">
                    <div class="control-label">
                        <div class="alert alert-info lb-sm text-center" id="notificationLeft2">
                            <asp:Label ID="notification_ufc" CssClass="text-danger" runat="server"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <br />
        </asp:Content>
--%>
