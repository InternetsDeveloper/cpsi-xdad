<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage_Contractor_Requests_Deny.aspx.cs" Inherits="TelerikWebApp3.Manage_Contractor_Requests_Deny" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

         <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown">Manage Contractor Request - Deny Request</h3>
                <h5 class="h5 text-center animation-slideUp">Please explain why the request has been denied, <br>or use the CANCEL button to back out safely.</h5>
            </div>
        </div>
        <!-- END Intro -->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== REQ DENIED FORM ====-->
                        <form action="Manage_Contractor_Requests_Deny.aspx" method="post" id="form-contractor-req-3" class="form-horizontal">

                            <h4 class="underline-heading">Contractor Request - Request Denied</h4>
                            <h6 class="form-label">Denial Reason:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" >
                                        <span class="input-group-addon color-i"><i class="fa fa-ban"></i></span>
                                        <asp:TextBox id="txtReasonForDenial" TextMode="MultiLine" class="form-control" runat="server" rows="4"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                             <div class="alert col-xs-12 lb-sm" id="notificationLeft" style="margin-bottom: 2rem;">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                        </div>
                            <!--==== /end req denied ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6 ">
                                </div>
                                <div class="col-xs-6 text-right ">
                                    <asp:Button type="submit " text="Submit" id="btnAgree" class="btn btn-sm btn-primary " runat="server" OnClick="btnAgree_Click" />
                                    <asp:Button type="button " text="Cancel" id="btnCancel" class="btn btn-sm btn-danger " runat="server" onclick="btnCancel_Click" />
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
        <div  class="section site-content site-section themed-background">
            <div class="container">
            </div>
        </div>
        <!-- /end color container -->

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
                Manage Contractor Request - Deny Request <div class="HorizontalFull"></div>
            </div>
        </div>
      

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please explain why the request is being denied.
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Reason for Denial:
            <div class="HorizontalFull"></div>
            </div>
        </div>


    </div>


    <div>
        <asp:TextBox ID="txtReasonForDenial" TextMode="MultiLine" CssClass="txtMultiline" runat="server"></asp:TextBox>




        <br />
        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree" OnClick="btnAgree_Click" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Done" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>


    </div>
    <br />
   
        <asp:Label ID="notification_ufc" runat="server"></asp:Label>
</asp:Content>

--%>