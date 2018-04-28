<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ContractorEmail.aspx.cs" Inherits="TelerikWebApp3.ContractorEmail" %>

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
                <h1 class="text-center animation-slideDown contractor-name"><i class="fa fa-user-o"></i> New Contractor Registration
                </h1>
                <h5 class="h5 text-center animation-slideUp">To begin your registration, please enter your email below. On the next screen <br />will need to enter other information the district will need in order to approve your account.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-4 col-lg-offset-4 site-block">

                        <!--==== RESET PWD FORM ====-->
                        <form action="ResetYourPassword.aspx" method="post" id="form-reset-pwd-1" class="form-horizontal">
                            <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox type="text" id="txtEmail" name="txtEmail" class="form-control input-lg" runat="server" placeholder="* Email Address"></asp:TextBox>
                                        </div>
                                        <div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                ControlToValidate="txtEmail"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-xs-12 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc"  CssClass="control-label lb-sm danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end reset pwd form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right" style="margin-bottom: 1rem">
                                    <asp:button type="submit" text="Continue" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                           
                        </form>
                    </div>
                </div>
                <hr>
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
                        <div class="col-sm-4 col-md-4" id="Div1">
                        <asp:Label ID="Label1" CssClass="lb-sm text-danger" runat="server"></asp:Label>
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
   <div class="form-horizontal ">

        <div class="form-group">
            <div class="col-sm-12  lb-lg form-group" >
               New Contractor Registration <div class="HorizontalFull"></div>
            </div>
              <div class="col-sm-12 lb-md form-group">
              To begin your registration, please enter your email below. On the next screen you will need to enter other information the district will need in order to approve your account.
            </div>
              <div class="col-sm-12 lb-sm text-danger form-group">

                Items marked with * are required.
            </div>
        </div>
       
    </div>
    <br />
    <div class="form-horizontal form-group">
        
       <div class="col-sm-6">
           <div class="row">
            <div class="col-sm-2-1 control-label lb-sm" style="align-content:center"> *Email:</div>
            <div class="col-sm-8">
               <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
            </div>
           <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtEmail"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
               </div>

        </div>
   </div>
    <br />

    <br />
    <br />

     <div class="row Text-NoWrap">
           <div class="col-sm-2-1" style="margin-top:2px">
                 <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnAgree_Click" />
               </div>
           <div class="col-sm-2-1">
                   <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
               </div>
              <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc"  CssClass="control-label lb-sm danger" runat="server"></asp:Label>
               </div>

          </div>
    <div>
      

    </div>
    <br />
   
</asp:Content>

--%>


