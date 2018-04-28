<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_1.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i> First Time User Registration -
                    <%= Session["USERTYPE_TEXT"]%>
                </h1>
                <h5 class="h5 text-center animation-slideUp">To register for an account fill out the form & agree to the policy, <br />or use the CANCEL button to back out safely.</h5>
            </div>
        </div>
        <!-- /end intro -->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== CONTRACTOR POLICY FORM  ====-->
                        <form action="FirstTimeUserContractor_Screen_1.aspx" method="post" id="form-con-reg-1" class="form-horizontal">
                            <h4 class="policy-label">Please Read & Accept our Policy</h4>
                            <!--*********** FORM PLUG IN HERE **********-->
                            <div class="form-group">
                                <label for="aupTextArea">Acceptable Use Policy</label>
                                <iframe class="form-control" id="docFrame" style="height:250px" runat="server"></iframe>
                            </div>
                            <!--==== /end contractor policy form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                    <label class="switch switch-primary">
                                        <input type="checkbox" id="chkAgree" name="chkAgree" runat="server" /><span></span>
                                    </label>
                                    <small id="terms" runat="server">I agree to the Terms & Conditions above.</small>
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Agree & Continue" ID="btnAgree" class="btn btn-sm btn-primary" onclientclick="radconfirm('Are you sure?', confirmCallBackFn); return false;" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" text="Cancel" ID="btnCancel" class="btn btn-sm btn-danger" onclick="btnCancel_Click" runat="server" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <asp:Label ID="notification_ufc" runat="server"></asp:Label>
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

    <div class="form-horizontal">
        <br />
        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                <%= Session["USERTYPE_TEXT"]%> Change Password
            
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <iframe id="docFrame" runat="server" height="250px" width="100%"></iframe>

        <div class="col-sm-12 checkbox" style="margin-left: 1%">
            
                <asp:CheckBox ID="chkAgree" runat="server" /><asp:Label ID="txt" Text="I agree to the terms and conditions above" runat="server"></asp:Label>
        </div>
         <br />
        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree" OnClientClick="radconfirm('Are you sure?', confirmCallBackFn); return false;" CssClass="flat-button BackGroundColor" runat="server" Text="Agree and Continue" OnClick="btnAgree_Click" />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>

        </div>

            <br />

            <asp:Label ID="notification_ufc" runat="server"></asp:Label>
</asp:Content>

--%>