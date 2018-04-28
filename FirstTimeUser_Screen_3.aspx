<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FirstTimeUser_Screen_3.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUser_Screen_3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type="text/javascript">

        $(document).ready(function () {           
            window.setTimeout(function () {
               var number = $('#<%=lblRedirectValue.ClientID%>').html();  
                numberValue = parseInt(number);
                location.href = window.location.protocol + "/" + window.location.host  + "/xdadselfservice//default.aspx";
            }, 30000);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-user-plus"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Account Review</h1>
                <h5 class="h5 text-center animation-slideUp">Please review, alter and save your account information below. <br/>You can use the CANCEL button to back out safely if you are here by mistake.</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== Main Content ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== Account Review ====-->
                        <form action="FirstTimeUser_Screen_3.aspx" method="post" id="form-staff-reg-3" class="form-horizontal">
                            <h4 class="underline-heading">Login Information</h4>
                            <div class="row form-inline text-center">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:Label type="text" id="txtNetwork" name="txtNetwork" class="form-control input-lg" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="gi gi-asterisk"></i></span>
                                            <asp:Label id="txtPassword" name="txtPassword" class="form-control input-lg" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br/>
                            <h4 class="underline-heading">Security Questions</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:TextBox id="txtQA" name="txtQA" class="form-control input-lg" runat="server" size="1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtA" name="txtA" class="form-control input-lg" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:TextBox id="txtQB" name="txtQB" class="form-control input-lg" runat="server" size="1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:TextBox type="text" id="txtB" name="txtB" class="form-control input-lg" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:TextBox id="txtQC" name="txtQC" class="form-control input-lg" runat="server" size="1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                       <asp:TextBox type="text" id="txtC" name="txtC" class="form-control input-lg" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                             <br />
                             <%--BH CODE--%>
                            <div class="col-xs-12" style="margin-bottom: 0.2%">
                                <asp:Label ID="notification_ufc" ForeColor="Red" runat="server"></asp:Label>
                            </div>
                            <%--/end bh code--%>
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Submit" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnDone_Click" />
                                </div>
                            </div>
                        </form>
                        <!--==== /end account review ====-->
                         <div class="col-sm-12" style="margin-bottom: 0.2%">
                            <asp:Label ID="Label1" ForeColor="Red" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
                <hr/>
            </div>
        </div>
        <!--==== /end main content ====-->

        <!--==== Color Container ====-->
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

        <asp:Label ID="lblRedirectValue" style="display:none" Text="2000" runat="server"></asp:Label>

    </asp:Content>

    <%--


    <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                First Time Registration - <%= Session["USERTYPE_TEXT"]%> - Setup Security Questions
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please review and save your account information below. The username and password here will be used to login to all computers at the district.
            </div>

        </div>
    </div>

   
    <div class="form-horizontal">
      <div class="col-sm-12 form-group alert alert-info">

            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Network Username/ID:</label>
            <div class="col-sm-4" style="margin-top:5px">
                <asp:Label ID="txtNetwork" CssClass="control-label lb-sm text-nowrap"  runat="server"></asp:Label>
            </div>
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">&nbsp;&nbsp;&nbsp;Network Password:</label>

            <div class="col-sm-4" style="margin-top:5px">
                <asp:Label ID="txtPassword"  CssClass="control-label lb-sm text-nowrap" runat="server"></asp:Label>
            </div>


        </div>
        </div>
    <div class="row">
      
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Question #1:</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtQA" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Answer #1:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtA" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Question #2:</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtQB" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Answer #2:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtB" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Question #3:</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtQC" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Answer #3:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtC" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />
        <div class="col-sm-12" style="margin-bottom: 0.2%">
            <asp:Label ID="notification_ufc" ForeColor="Red" runat="server"></asp:Label>
        </div>

        <div class="col-sm-12" style="margin-left: -0.5%">
            <table>

                <tr>
                    <td>
                        <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" OnClick="btnDone_Click" runat="server" Text="Done" />
                    </td>


                </tr>
            </table>

        </div>

    </div>
    <asp:Label ID="lblRedirectValue" style="display:none" Text="2000" runat="server"></asp:Label>

    <br />
</asp:Content>

--%>