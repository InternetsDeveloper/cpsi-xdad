<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetPassword_Contractor.aspx.cs" Inherits="TelerikWebApp3.ResetPassword_Contractor" %>

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
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i> Contractor - Reset Password</h1>
                <h5 class="h5 text-center animation-slideUp">In order to reset contactor's password, search for the contractor and fill out the password per the requirements, <br/>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-8 col-lg-offset-2 site-block">

                        <!--==== CONTRACTOR SEARCH ====-->
                        <form action="ResetPassword_Contractor.aspx" method="post" id="form-con-reset-pwd" class="form-horizontal">
                            <h4 class="underline-heading">Search for Contractor</h4>
                                <small>Contractor Network ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                             <asp:TextBox ID="txtNetworkID" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                        </div>
                                         <div>
                                           <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" runat="server" Display="Dynamic"  CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                                <small> or Local ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                             <asp:TextBox ID="txtLocalID" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                        </div>
                                         <div style="margin-bottom: 2rem;">
                                            <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                                                runat="server" Display="Dynamic" CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end contractor search ====-->

                            <!--==== SEARCH BUTTON ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" ID="btnSearch" class="btn btn-sm btn-success" text="Find Contractor" onclick="btnSearch_Click" runat="server" />
                                </div>
                            </div>
                            <br/>
                            <!--==== /end search button ====-->

                            <!--==== SEARCH RESULTS ====-->
                            <h4 class="underline-heading">Search Results</h4>
                                <small>Contractor Name: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtStudentName" name="txtStudentName" class="form-control input-lg" runat="server" ReadOnly="true" placeholder="Contractor Name"></asp:textbox>
                                        </div>
                                    </div>
                                </div>
                                <small> Contractor Local ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:textbox type="email" id="txtLocalID_Result" name="txtLocalID_Result" class="form-control input-lg" runat="server" ReadOnly="true" placeholder="Contractor E-mail"></asp:textbox>
                                        </div>
                                    </div>
                                </div>
                                <small> Network ID: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 2rem;">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:textbox type="text" id="txtNetworkID_Result" name="txtNetworkID_Result" class="form-control input-lg" runat="server" ReadOnly="true" placeholder="Contractor ID"></asp:textbox>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end search results ====-->

                            <!--==== SET NEW PASSWORD ====-->
                            <h4 class="underline-heading">Set New Password</h4>
                                <small>* New Password: </small>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-unlock-alt"></i></span>
                                            <asp:textbox  type="password" id="txtNewPassword" name="txtNewPassword" class="form-control input-lg" runat="server" placeholder="New Password"></asp:textbox>
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
                                            <asp:textbox  type="password" id="txtConfirmPassword" name="txtConfirmPassword" class="form-control input-lg" runat="server" placeholder="Confirm Password"></asp:textbox>
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
                                <div class="col-xs-6 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end set new password ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row" style="margin-bottom: 1rem;">
                                    <asp:button type="submit" id="btnSubmit" class="btn btn-sm btn-primary" text="Submit" runat="server" onclick="btnSubmit_Click" /> 
                                    <asp:button type="button" id="btnCancel" class="btn btn-sm btn-danger" text="Cancel" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                        </form>
                        <div class="text-center">
                            <small class="pwd-req">A password must be a minimum of 8 characters long and contain both upper and lower case letters as well as numbers.</small>
                        </div>
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
                Reset a Password for a Contractor 
                <div class="HorizontalFull"></div>
            </div>


        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Enter the information below to reset the password for a specific contractor.
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Search for the Contractor
            </div>

            <div class="col-sm-12 lb-md">
                <div class="HorizontalFull"></div>
            </div>
        </div>
    </div>

    <div class="form-horizontal">

        <div class="form-group" style="margin-bottom: 0.1%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Contractor Username:</label>
            <div class="col-sm-2">
                <asp:TextBox ID="txtNetworkID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
             <div class="col-sm-3 lb-sm">
                <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date"
                    runat="server" Display="Dynamic"  CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
            </div>

        </div>
        <div class="form-group" style="margin-bottom: 0.1%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap text-center" >OR</label>




        </div>
         <div class="form-group">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Contractor Local ID:</label>
            <div class="col-sm-2">
                  <asp:TextBox ID="txtLocalID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
              <div class="col-sm-3 lb-sm">
                <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                    runat="server" Display="Dynamic" CssClass="control-label lb-sm text-danger"></asp:CustomValidator>
            </div>

        </div>
      
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-2 lb-sm">
                <asp:Button ID="btnSearch" CssClass="flat-button-two BackGroundColor" runat="server" Text="Find Contractor" OnClick="btnSearch_Click" />
            </div>
           
        </div>

        <div class="form-horizontal">

            <div class="form-group">
                <div class="col-sm-12 lb-md">
                    Search Results
                </div>
            </div>
        </div>
    </div>



    <div class="DivBorder">
        <div class="form-horizontal Text-NoWrap">
            <div class="form-group" style="margin-bottom: 0.2%">
                <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Contractor Name:</label>
                <div class="col-sm-2">

                    <asp:TextBox ID="txtStudentName" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                </div>
                <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Local ID:</label>

                <div class="col-sm-2">
                    <asp:TextBox ID="txtLocalID_Result" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>

                </div>
                <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Username:</label>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtNetworkID_Result" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                </div>

            </div>

        </div>
        <div class="form-horizontal">

            <div class="form-group">
                <div class="col-sm-10 lb-sm">
                    Set New Password
                </div>

                <div class="col-sm-10 lb-md">
                    <div class="HorizontalFull"></div>
                </div>
            </div>
        </div>
        <br />
        <div class="form-horizontal Text-NoWrap">
            <div class="form-group" >
                <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*New Password:</label>
                <div class="col-sm-2">
                    <asp:TextBox ID="txtNewPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtNewPassword"
                        ValidationGroup="pass"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
                


            </div>
              <div class="form-group">
                  <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Confirm Password:</label>

                <div class="col-sm-2">
                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtConfirmPassword"
                        ValidationGroup="pass"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
                  </div>


        </div>
    </div>
    <br />
     <div class="row">
            <div class="col-sm-2">
               <asp:Button ID="btnpwdSubmit" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-sm-2">
               <asp:Button ID="btnpwdCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnpwdCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

        </div>
    <br />

</asp:Content>

--%>