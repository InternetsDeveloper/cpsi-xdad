<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage_Contractor_Requests_2.aspx.cs" Inherits="TelerikWebApp3.Manage_Contractor_Requests_2" %>

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
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown">Manage Contractor Request - Contractor Details</h3>
                <h5 class="h5 text-center animation-slideUp">You can view and manage contractor details, and approve or deny the <br/> overall request on this page.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== PERSONAL INFORMATION ====-->
                        <form action="Manage_Contractor_Requests_2.aspx" method="post" id="form-log-in" class="form-horizontal">
                            <h4 class="underline-heading">Personal Information</h4>
                            
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:TextBox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg" runat="server" placeholder="* First Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:TextBox type="text" id="txtMiddleName" name="txtMiddleName" class="form-control input-lg" runat="server" placeholder="Middle Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:TextBox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="* Last Name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                                <asp:TextBox CssClass="form-control input-lg" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####" MaskType="DateTime"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox  type="email" id="txtEmail" name="txtEmail" class="form-control input-lg" runat="server" placeholder="* E-mail Address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 2rem">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:TextBox type="text" id="txtIDNumber" name="txtIDNumber" class="form-control input-lg" runat="server" placeholder="ID Number"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end personal information ====-->

                            <!--==== JOB INFORMATION ====-->
                            <h4 class="underline-heading">Job Information</h4>
                            <h6 class="form-label">* Job Classification:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <asp:DropDownList  id="drpJobClassification" name="drpJobClassification" class="form-control input-lg" DataTextField="Code_description" DataValueField="Code" runat="server" size="1">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested Start Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox CssClass="form-control input-lg" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_Start" runat="server" Mask="##/##/####" MaskType="DateTime">
                                        </asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested End Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_End" runat="server" Mask="##/##/####" MaskType="DateTime"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Primary Location
                                <%= Session["DESIGNATEDTYPE"]%>:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-globe"></i></span>
                                        <asp:DropDownList id="drpPrimaryLocation" name="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" class="form-control input-lg" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Possible Secondary Location(s)
                                <%= Session["DESIGNATEDTYPE"]%>:</h6>
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <asp:ListBox id="drpLocations"  name="drpLocations" SelectionMode="Multiple" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" runat="server" class="form-control"></asp:ListBox>
                                </div>
                                <div class="text-center" style="margin-bottom: 1.5rem;">
                                    <a href="javascript:void(0)"><small>To multi-select, hold the Ctrl or Shift Key</small></a>
                                </div>
                            </div>
                            <div class="col-xs-12 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end job information ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right" style="margin-bottom: 1rem;">
                                    <asp:Button type="submit" text="Approve" id="btnAgree" class="btn btn-sm btn-success" runat="server" onclick="btnAgree_Click" />
                                    <asp:Button type="button" text="Deny" id="btnDeny" class="btn btn-sm btn-danger" runat="server" onclick="btnDeny_Click" />
                                    <asp:Button ID="btnCancel" CssClass="btn btn-sm btn-info" runat="server" Text="Done" OnClick="btnCancel_Click" />
           
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
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Manage Contractor Request - Contractor Details
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
               Below are the list of contractor requests.  To manage the requests, click "Manage User" by the name of the contractor you would like to manage.
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Personal Information
            <div class="HorizontalFull"></div>
            </div>
        </div>


    </div>
    <div class="form-horizontal">

        <div class="form-group">



            <label for="inputType" class="col-sm-2-2 control-label lb-sm">First Name:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Middle Name:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>


        </div>
        <div class="form-group">
            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Last Name:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>


            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Birth Date:</label>

            <div class="col-sm-4">
                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="inputType" class="col-sm-2-2 control-label lb-sm">E-mail:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>


            <label for="inputType" class="col-sm-2-2 control-label lb-sm">ID Number:</label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtIDNumber" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>

    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Job Information
            <div class="HorizontalFull"></div>
            </div>
        </div>
    </div>

    <div class="form-horizontal">
        <div class="form-group">

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Job Classification:</label>

            <div class="col-sm-10">
                <asp:DropDownList ID="drpJobClassification" DataTextField="Code_description" DataValueField="Code" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>


        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Request Start Date:</label>

            <div class="col-sm-10">

                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_Start" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>


        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Request End Date:</label>

            <div class="col-sm-10">
                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_End" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>


        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Primary Requested <%= Session["DESIGNATEDTYPE"]%>:</label>

            <div class="col-sm-10">
                <asp:DropDownList ID="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>


        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2-2 control-label lb-sm">Requested <%= Session["DESIGNATEDTYPE"]%>:</label>

            <div class="col-sm-10">
                <asp:ListBox ID="drpLocations" DataTextField="LocalId_name" DataValueField="RecId" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
            </div>


        </div>
    </div>

    <br />

     <div class="row Text-NoWrap">
            <div class="col-sm-2-1">
               <asp:Button ID="btnAgree" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Approve" />
            </div>
            <div class="col-sm-2-1">
              <asp:Button ID="btnDeny" CssClass="flat-button BackGroundColor" OnClick="btnDeny_Click" runat="server" Text="Deny" />
            </div>
          <div class="col-sm-2-1">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Done" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

        </div>

    <br />

    
</asp:Content>

--%>