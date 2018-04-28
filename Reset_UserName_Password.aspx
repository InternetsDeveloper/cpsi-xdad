<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Reset_UserName_Password.aspx.cs" Inherits="TelerikWebApp3.Reset_UserName_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown parent-name"><i class="fa fa-user-o"></i>
                    Recover Username or Password 
                </h1>
                <h5 class="h5 text-center animation-slideUp">If you do not know your username, please click "Recover Username". <br /> If you need to reset your password, please click "Reset Password".</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== RETURNING USER BUTTONS ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row row-items text-center">
                    <div class="col-sm-6 col-md-6">
                        <asp:button type="button" text="RECOVER USERNAME" class="btn-student" id="btnSelectUserType" AutoPostBack="true" onclick="btnSelectUserType_Click" runat="server"></asp:button>
                    </div>
                    <div class="col-sm-6 col-md-6">
                        <asp:button type="button" text="RESET PASSWORD" class="btn-student" id="btnTemplate" AutoPostBack="true" onclick="btnTemplate_Click" runat="server"></asp:button>
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end returning user buttons ====-->

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
                        <div class="col-sm-4 col-md-4" >
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
                Recover Username or Password   <div class="HorizontalFull"></div>
            </div>
        </div>
       

        <div class="form-group">
            <div class="col-sm-12 lb-md">
               If you do not know your username, please click "Recover Username".  If you need to reset your password, please click "Reset Password".
            </div>
        </div>
        </div>
    <br />
   
    <div class="row">
        <div class="col-sm-3 col-sm-offset-3" id="Tile_ChangeMyPassword" runat="server">
            <div>
                <asp:button CssClass="metro-tile" text="Recover Username" ID="btnSelectUserType" AutoPostBack="true" OnClick="btnSelectUserType_Click" runat="server" Shape="Wide">
                </asp:button>
            </div>
        </div>
        <div class="col-sm-3" id="Tile_ChangeMyQuestions" runat="server">
            <div>
                <asp:button CssClass="metro-tile" text="Reset Password" ID="btnTemplate" AutoPostBack="true" OnClick="btnTemplate_Click" runat="server" Shape="Wide">
                </asp:button>

            </div>
        </div>
    </div>
    <br />

</asp:Content>
--%>