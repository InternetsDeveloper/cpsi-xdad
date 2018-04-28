<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPassword_Parent.aspx.cs" Inherits="TelerikWebApp3.ResetPassword_Parent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-users"></i> Parent - Reset Password</h1>
                <h5 class="h5 text-center animation-slideUp">In order to reset your password search for parent, and fill out the password per the requirements, <br/>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== PARENT SEARCH ====-->
                        <form action="ResetPassword_Parent.aspx" method="post" id="form-par-reset-pwd" class="form-horizontal">
                            <h4 class="underline-heading">Search for Parent</h4>
                                <small>Parent Network ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:TextBox type="text" id="txtNetworkID" name="txtNetworkID" class="form-control input-lg" runat="server" placeholder="Parent Network ID"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date"
                                             runat="server" Display="Dynamic"  CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                                <small> or E-mail: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox type="email" id="txtLocalID" name="txtLocalID" class="form-control input-lg" runat="server" placeholder="Parent E-mail"></asp:TextBox>
                                        </div>
                                        <div style="margin-bottom: 2rem">
                                        <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                                              runat="server" Display="Dynamic" CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end parent search ====-->

                            <!--==== SEARCH BUTTON ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" Text="Parent Search" id="btnSearch" class="btn btn-sm btn-success" onclick="btnSearch_Click" runat="server"></asp:button>
                                </div>
                            </div>
                            <!--==== /end search button row ====-->

                            <!--==== SEARCH RESULTS ====-->
                            <h4 class="underline-heading">Search Results</h4>
                                <small> Parent Name: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:TextBox type="text" id="txtParentName" name="txtParentName" class="form-control input-lg" runat="server" placeholder="Parent Name" />
                                        </div>
                                    </div>
                                </div>
                                <small> Parent E-mail: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox type="email" id="txtLocalID_Result" name="txtLocalID_Result" class="form-control input-lg" runat="server" placeholder="Parent E-mail"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <small> Network ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 2rem">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:TextBox type="text" id="txtNetworkID_Result" name="txtNetworkID_Result" class="form-control input-lg" runat="server" placeholder="Network ID"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end search results ====-->

                            <!--==== SET PASSWORD ====-->
                            <h4 class="underline-heading">Set New Password</h4>
                                <small>* New Password: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-unlock-alt"></i></span>
                                            <asp:TextBox type="password" id="txtNewPassword" name="txtNewPassword" class="form-control input-lg" runat="server" placeholder="* New Password"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                ControlToValidate="txtNewPassword"
                                                ValidationGroup="pass"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <small>* Confirm Password: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-unlock-alt"></i></span>
                                            <asp:TextBox type="password" id="txtConfirmPassword" name="txtConfirmPassword" class="form-control input-lg" runat="server" placeholder="* Confirm Password"></asp:TextBox>                                      
                                        </div>
                                        <div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                ControlToValidate="txtConfirmPassword"
                                                ValidationGroup="pass"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 alert" id="notificationLeft">
                                    <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                                </div>
                            <!--==== /end set password ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Submit" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnSubmit_Click"></asp:button>
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click"></asp:button>
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

    <div>

        <h4>Reset a Password for a Parent</h4>

        <div class="HorizontalFull"></div>

        <div>
            <h6>Enter the information below to reset the password for a specific parent.</h6>
        </div>


        <div class="lineHtSmallHeader">
            <h6>Search for the Parent</h6>

        </div>
        <div class="HorizontalFullBase"></div>
    </div>
    <div class="span12">
        <table>
            <tr>
                <td>
                    <h6>Enter the Parent Login ID:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtNetworkID" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
                <td>
                    <h6 class="space-left-right">OR</h6>
                </td>
                <td>
                    <h6>Enter the Parent Email:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtLocalID" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btnSearch" CssClass="flat-button-two BackGroundColor" runat="server" Text="Find Parent" /></td>
            </tr>
        </table>
    </div>
    <div class="span12">
        <h6>Search Results</h6>
    </div>


    <div class="span12 DivBorder Text-NoWrap">
        <table class="span10">
            <tr class="TableRow">
                <td>
                    <h6 class="">Parent Name:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtStudentName" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
                <td>
                    <h6 class="space-left">E-mail:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtLocalID_Result" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
                <td>
                    <h6 class="space-left">Login ID:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtNetworkID_Result" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <div class="span10">
            <h6>Set New Password</h6>
        </div>
        <div class="HorizontalFullBase span10"></div>

        <table class="span9">
            <tr>
                <td>
                    <h6>New Password:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>
                <td>
                    <h6 class="space-left">Confirm Password:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="textBoxWidth" runat="server"></asp:TextBox></td>

            </tr>
        </table>
        <table class="span10">

            <tr class="TableRowDownSpacing">
                <td class="text-left">
                    <asp:Button ID="btnpwdSubmit" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnpwdCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnpwdCancel_Click" />
                </td>
            </tr>
        </table>


    </div>


    <table class="span12">

        <tr class="TableRow">
            <td class="text-left">
                <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Done" OnClick="btnSubmit_Click" />
            </td>

            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>

    <div>
        <table class="span12">

            <tr class="TableRow">
                <td class="text-left">
                   
                    <h5>
                        <asp:Label ID="notification_ufc" runat="server"></asp:Label></h5>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

--%>