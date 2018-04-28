<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResetYourPassword.aspx.cs" Inherits="TelerikWebApp3.ResetYourPassword" %>

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
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-lock"></i> Reset Your Password</h1>
                <h5 class="h5 text-center animation-slideUp">Use this form to reset your password. Fill out the required information, <br/>or use the CANCEL button to back out safely.</h5>
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
                            <h6 class="form-label">* I am a:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <select  id="drpUserType" name="drpUserType" class="form-control input-lg" runat="server" size="1">
                                            <option class="dropdown-item" value="0" disabled selected>SELECT USER TYPE</option>
                                            <option class="dropdown-item" value="1">STUDENT</option>
                                            <option class="dropdown-item" value="2">PARENT/GUARDIAN</option>
                                            <option class="dropdown-item" value="3">F/T TEACHING STAFF</option>
                                            <option class="dropdown-item" value="4">P/T TEACHING STAFF</option>
                                            <option class="dropdown-item" value="5">F/T NON-TEACHING STAFF</option>
                                            <option class="dropdown-item" value="6">P/T NON-TEACHING STAFF</option>
                                            <option class="dropdown-item" value="7">TEMPORARY STAFF</option>
                                            <option class="dropdown-item" value="8">CONTRACTORS & OTHER STAFF</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label"><small>* if necessary</small></h6>
                            <h6 class="form-label">Network Username/ID: </h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                        <asp:textbox type="text" id="txtNetWorkID" name="txtNetWorkID" class="form-control input-lg" runat="server" placeholder="Network Username/ID"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            ControlToValidate="txtNetWorkID"
                                              EnableClientScript="false"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* First Name:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                       <asp:textbox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg" runat="server" placeholder="First Name"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            ControlToValidate="txtFirstName"
                                              EnableClientScript="false"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Last Name:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                        <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="Last Name"></asp:textbox>
                                    </div>
                                     <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                            ControlToValidate="txtLastName"
                                              EnableClientScript="false"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-label">
                            <asp:Label class="h6 form-label" ID="lblType" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                        <asp:textbox type="text" id="txtStudentID" name="txtStudentID" class="form-control input-lg" runat="server" placeholder="* ID"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap" style="margin-bottom: 2rem">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                            ControlToValidate="txtStudentID"
                                             EnableClientScript="false"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <h6 class="form-label">* Birth Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                        <asp:TextBox type="date" id="txtBirthDate" name="txtBirthDate" class="form-control input-lg" runat="server" placeholder="* Birth Date" masktype="DateTime"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap" style="margin-bottom: 2rem">
                                         <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="alert col-xs-6 lb-sm" id="notificationLeft">
                               <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end reset pwd form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Continue" id="btnDone" class="btn btn-sm btn-primary" runat="server" onclick="btnSubmit_Click" />
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
                        <div class="col-sm-4 col-md-4" >
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
                Reset Your Password
            </div>

            <div class="col-sm-12 lb-md">
                <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please Enter your information below to reset your password.
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
           
            
        </div>
    </div>



    <div class="form-horizontal">

       
        <div class="form-group">


            <div class="col-sm-2 control-label lb-sm text-nowrap">*Username:</div>
            <div class="col-sm-3">

                <asp:TextBox ID="txtNetWorkID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtNetWorkID"
                      EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
            </div>
         <div class="form-group">
            <div class="col-sm-2 control-label lb-sm text-nowrap">*First Name:</div>
            <div class="col-sm-3">
                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtFirstName"
                      EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
             </div>
         <div class="form-group">
            <div class="col-sm-2 control-label lb-sm text-nowrap">*Last Name:</div>

            <div class="col-sm-3">
                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtLastName"
                      EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
             </div>
         <div class="form-group">
            <div class="col-sm-2 control-label lb-sm text-nowrap">
                *<asp:Label ID="lblType" runat="server" Text="Student ID"></asp:Label>
            </div>
            <div class="col-sm-3">
                <asp:TextBox ID="txtStudentID" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtStudentID"
                     EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
             </div>
         <div class="form-group">
            <div class="col-sm-2 control-label lb-sm">*Birth Date:(MM/DD/YYYY)</div>

            <div class="col-sm-3">
                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
               
            </div>
              <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                 <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>
             </div>
        </div>

   
    <br />
 
     <div class="row Text-NoWrap">
           <div class="col-sm-2">
                 <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" OnClick="btnSubmit_Click" />
               </div>
           <div class="col-sm-2">
                 <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
               </div>
            <div class="alert alert-info lb-sm" id="notificationLeft">
               <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

          </div>
   
   <br />
    
</asp:Content>

--%>