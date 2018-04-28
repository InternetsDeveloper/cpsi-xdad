<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_3.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_3" %>

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


      <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Submit Request</h1>
                <h5 class="h5 text-center animation-slideUp">Please review your account information below and make any necessary changes, <br>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end Intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">
                        <!-- Log In Form -->
                        <form action="FirstTimeUserContractor_Screen_3.aspx" method="post" id="form-con-reg-5" class="form-horizontal">

                            <!--==== PERSONAL INFORMATION ====-->
                            <h4 class="underline-heading">Personal Information</h4>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg">
                                            <%=ViewState["FirstName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg">
                                            <%=ViewState["MiddleName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg">
                                            <%= ViewState["LastName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                            <div class="form-control input-lg">
                                            <%= ViewState["BirthDate"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <div class="form-control input-lg">
                                            <%= ViewState["Email"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 2rem">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <div class="form-control input-lg" >
                                            <%= ViewState["UserId"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end Personal Information ====-->

                            <!--==== JOB INFORMATION ====-->
                            <h4 class="underline-heading">Job Information</h4>
                            <h6 class="form-label">Job Classification:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <div class="form-control input-lg">
                                            <%= ViewState["FunctionCode"]%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Requested Start Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <div type="date" class="form-control input-lg">
                                        <%= ViewState["StartDate"]%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Requested End Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <div  class="form-control input-lg">
                                        <%= ViewState["EndDate"]%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Primary Location:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <div  class="form-control input-lg">
                                                <%= Session["DESIGNATEDTYPE"]%>:&nbsp;<%= ViewState["PrimaryLocation"]%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Requested Location(s):</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="form-control input-lg">
                                            <%= Session["DESIGNATEDTYPE"]%>:&nbsp;<%= ViewState["SecondaryLocation"]%>
                                    </div>
                                    <div class="text-center">
                                        <a href="javascript:void(0)"><small>To multi-select, hold the Ctrl or Shift Key</small></a>
                                    </div>
                                </div>
                            </div>
                             <div class="alert col-xs-6" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end Job Information ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Submit" ID="btnSubmit" class="btn btn-sm btn-primary" onclick="btnAgree_Click" runat="server"/>
                                    <asp:button type="button" text="Cancel" ID="btnCancel" class="btn btn-sm btn-danger" onclick="btnCancel_Click" runat="server"/>
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                           
                            <asp:Panel ID="pnlSave" runat="server">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="horizontal-form alert lb-sm">
                                            Do you want to overwrite?
                                        </div>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:Button ID="btnSave" CssClass="flat-button BackGroundColor" OnClick="btnSave_Click" runat="server" Text="Yes" />
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:Button ID="btnNo" CssClass="flat-button-cancel BorderColor" OnClick="btnNo_Click" runat="server" Text="No" />
                                    </div>
                                </div>
                            </asp:Panel>
                          </form>
                    </div>
                </div>
                <hr />
            </div>
        </div>
        <!-- END Log In -->

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
                        <img alt="" class="footer-heading" src="img/CPSI-Logo-Gray.png" />
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


<%--    <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                First Time User Registration - <%= Session["USERTYPE_TEXT"]%> - Submit Request
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please review the information below before submitting your request. Click "Back" to edit any of the information. If this information is correct, click "Submit" to complete your request.
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
               After submitting, the district administrator will review your request. If your request is approved, you will recieve an  e-mail with instructions on how to activate your account.
            </div>
        </div>


    </div>
    <div class="form-horizontal col-sm-12">

        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap text-nowrap" style="min-width: 120px">First Name:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["FirstName"]%>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Middle Name:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["MiddleName"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Last Name:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["LastName"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Birth Date:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["BirthDate"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">E-mail:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["Email"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">ID Number:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["UserId"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Job Classification:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["FunctionCode"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Request Start Date:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["StartDate"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Request End Date:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%= ViewState["EndDate"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Primary Requested:</div>

            <div class="col-sm-6 control-label lb-sm">
                <%--<%= Session["DESIGNATEDTYPE"]%>:&nbsp;--%<%= ViewState["PrimaryLocation"]%>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2-1 control-label lb-sm text-nowrap" style="min-width: 120px">Requested:</div>

            <div class="col-sm-9 control-label lb-sm">
                <%--<%= Session["DESIGNATEDTYPE"]%>:&nbsp;--%<%= ViewState["SecondaryLocation"]%>
            </div>
        </div>

    </div>
    <br />

    <br />



    <div class="row">


        <div class="col-sm-1">
            <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Submit" />
        </div>
        <div class="col-sm-1">
            <asp:Button ID="Button2" CssClass="flat-button-cancel BorderColor" runat="server" Text="Back" OnClick="Button2_Click" />
        </div>
        <div class="col-sm-1">
            <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
        <div class="col-sm-6 control-label">

            <div class="alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="text-danger" runat="server"></asp:Label>

            </div>

        </div>
    </div>





    <br />
    <asp:Panel ID="pnlSave" runat="server">

        <div class="row">


            <div class="col-sm-3">
                <div class="horizontal-form alert alert-info lb-sm">
                    Do you want to overwrite?

                </div>
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnSave" CssClass="flat-button BackGroundColor" OnClick="btnSave_Click" runat="server" Text="Yes" />
            </div>
            <div class="col-sm-1">
                <asp:Button ID="btnNo" CssClass="flat-button-cancel BorderColor" OnClick="btnNo_Click" runat="server" Text="No" />
            </div>

        </div>


    </asp:Panel>
</asp:Content>
--%>