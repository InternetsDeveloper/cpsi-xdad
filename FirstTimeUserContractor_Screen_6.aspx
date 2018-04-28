<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_6.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Request Denied</h1>
                <h5 class="h5 text-center animation-slideUp">Your request for district access has been denied. Feedback about your request is below.<br /> If you feel this in error, please contact the district personnel.</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== DENIAL DETAILS ====-->
                        <form action="FirstTimeUserContractor_Screen_6.aspx" method="post" id="form-con-reg-6" class="form-horizontal">
                            <h6 class="form-label">Requested Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox type="date" id="txtRequestDate" name="txtRequestDate" class="form-control input-lg" runat="server" placeholder="Requested Start Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Reason for Denial:</h6>
                                        <asp:TextBox type="text" class="form-control input-lg" id="txtReasonForDenial" height="100px" runat="server"></asp:TextBox>
                            <!--==== /end denial details ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Done" id="btnAgree" runat="server" class="btn btn-sm btn-primary" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" runat="server" class="btn btn-sm btn-danger" onclick="btnCancel_Click" />
                                </div>
                            </div>
                        </form>
                        <!--==== /end buttons row ====-->
                         <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
                            Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
                            EnableShadow="true" AutoCloseDelay="30000">
                        </telerik:RadNotification>
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

    <%--

    <div>

        <h4>First Time User Registration - <%= Session["USERTYPE_TEXT"]%> - Request Denied</h4>

        <div class="HorizontalFull"></div>
        <br />

        <div>
            <h6>Your request for district access had been denied. Feedback about your request is below. If you feel this is in error, please contact the district personnel below.</h6>
        </div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Request Date:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtRequestDate" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>


            </tr>
        </table>
        <h6>Reason for Denial:</h6>
        <asp:TextBox ID="txtReasonForDenial" TextMode="MultiLine" CssClass="txtMultiline" runat="server"></asp:TextBox>



        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree"  CssClass="flat-button BackGroundColor" runat="server" Text="Done"  />
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