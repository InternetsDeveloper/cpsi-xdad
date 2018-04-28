<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_4.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_4" %>

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
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Security Questions</h1>
                <h5 class="h5 text-center animation-slideUp">Pick and answer three questions. These questions will be used if you ever need to reset your password. <br>You can use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== SECURITY QUESTIONS ====-->
                        <form action="FirstTimeUserContractor_Screen_4.aspx" method="post" id="form-con-reg-4" class="form-horizontal">
                            <h4 class="underline-heading">Setup - Security Questions</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion1" name="drpQuestion1" class="form-control input-lg" runat="server" placeholder="* Question #1" size="1">
                                        <asp:ListItem Value="1">* Question #1</asp:ListItem>
                                        <asp:ListItem Value="2">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="4">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="5">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="6">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="7">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="8">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="9">What street did you grow up on?</asp:ListItem>
                                         </asp:DropDownList> 
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            ControlToValidate="drpQuestion1"
                                             Placeholder="Select Question"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtA" name="txtA" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            ControlToValidate="txtA"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion2" name="drpQuestion2" class="form-control input-lg" runat="server" size="1">
                                        <asp:ListItem Value="1">* Question #2</asp:ListItem>
                                        <asp:ListItem Value="2">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="4">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="5">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="6">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="7">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="8">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="9">What street did you grow up on?</asp:ListItem>
                                        </asp:DropDownList> 
                                    </div>
                                     <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                             InitialValue="Select Question"
                                            ControlToValidate="drpQuestion2"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtB" name="txtB" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                            ControlToValidate="txtB"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion3" name="drpQuestion3" class="form-control input-lg" runat="server" size="1">
                                        <asp:ListItem Value="1">* Question #3</asp:ListItem>
                                        <asp:ListItem Value="2">What is your favorite book?</asp:ListItem>
                                        <asp:ListItem Value="3">What is your mother's maiden name?</asp:ListItem>
                                        <asp:ListItem Value="4">What is your oldest brother's / sister's name?</asp:ListItem>
                                        <asp:ListItem Value="5">What was the name of the first school you attended?</asp:ListItem>
                                        <asp:ListItem Value="6">What is the first name of your first boyfriend or girlfriend?</asp:ListItem>
                                        <asp:ListItem Value="7">Who was your favorite teacher?</asp:ListItem>
                                        <asp:ListItem Value="8">What was your high school mascot?</asp:ListItem>
                                        <asp:ListItem Value="9">What street did you grow up on?</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                            ControlToValidate="drpQuestion3"
                                            CssClass="control-label text-danger"
                                             InitialValue="Select Question"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtC" name="txtC" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                            ControlToValidate="txtC"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-6 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end security questions ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Continue" id="btnContinue" class="btn btn-sm btn-primary" runat="server" onclick="btnContinue_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                             
                        </form>
                    </div>
                </div>
                <hr/>
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

    <%--

    <br />

    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Complete User Registration - <%= Session["USERTYPE_TEXT"]%> - Setup Security Questions<div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please setup your security questions. These questions will be used to help you if you ever need to reset your password on this site.
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Question #1:</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="drpQuestion1" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">What is your pet's Name?</asp:ListItem>
                </asp:DropDownList>
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Answer #1:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtA" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Question #2:</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="drpQuestion2" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">What is your car make?</asp:ListItem>
                </asp:DropDownList>
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Answer #2:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtB" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Question #3:</label>
            <div class="col-sm-4">
                <asp:DropDownList ID="drpQuestion3" CssClass="form-control" runat="server">
                    <asp:ListItem Value="">What is your favourite movie?</asp:ListItem>
                </asp:DropDownList>
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Answer #3:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtC" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
    </div>

     <br />
     <div class="row Text-NoWrap">
            <div class="col-sm-2-1">
              <asp:Button ID="btnContinue" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnContinue_Click" />
            </div>
            <div class="col-sm-2-1">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

        </div>
    <br />

</asp:Content>

--%>