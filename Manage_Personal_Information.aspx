<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage_Personal_Information.aspx.cs" Inherits="TelerikWebApp3.Manage_Personal_Information" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 id="user-name" class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 id="school-name" class="h3 text-center animation-slideDown">Manage Personal Information</h3>
                <h5 class="h5 text-center animation-slideUp">Make any needed changes to personal information here, <br />or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== MANAGE PERSONAL INFO FORM ====-->
                        <form action="Manage_Personal_Information.aspx" method="post" id="form-con-personal-info" class="form-horizontal">
                            <h4 class="underline-heading">Manage Personal Information</h4>
                            <div class="form-group">
                                    <div class="col-xs-12">
                                        <h6 class="form-label">* E-mail :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <div class="form-control input-lg" ReadOnly="true" runat="server">
                                            <%= ViewState["Email"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                    <h6 class="form-label">* ID Number :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <div class="form-control input-lg" ReadOnly="true" runat="server">
                                            <%= ViewState["UserId"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                    <h6 class="form-label">* First Name :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg" runat="server">
                                            <%=ViewState["FirstName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                    <h6 class="form-label">  Middle Name :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg" runat="server">
                                            <%=ViewState["MiddleName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                    <h6 class="form-label">* Last Name :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <div class="form-control input-lg" runat="server">
                                            <%= ViewState["LastName"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                    <h6 class="form-label">* Birth Date :</h6>
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                            <div class="form-control input-lg" runat="server">
                                            <%= ViewState["BirthDate"]%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="col-xs-6" style="margin-bottom: 4rem">
                                    <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                                </div>

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Submit" id="btnAgree" class="btn btn-sm btn-primary" runat="server" onclick="btnAgree_Click"/>
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            
                            </form>
                        <!-- /end manage information form -->
                        </div>
                    </div>
                <hr />
            </div>
        </div>
        <!-- /end main content -->

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
                        <div class="col-sm-4 col-md-4">
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
                Manage Personal Information<div class="HorizontalFull"></div>
            </div>

        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please make changes in the information below.
               
            </div>
             <div class="col-sm-12 lb-sm text-danger">
                    Items marked with * are required.
                </div>
        </div>

        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Personal Information
            <div class="HorizontalFull"></div>
            </div>
        </div>


    </div>

    <div class="row">
        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*E-mail:</label>
            <div class="col-sm-3">

                <asp:TextBox ID="txtEmail" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>

            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtEmail"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*ID Number:</label>

            <div class="col-sm-3">

                <asp:TextBox ID="txtIDNumber" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtIDNumber"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>

        </div>

        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*First Name:</label>
            <div class="col-sm-3">

                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtFirstName"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">Middle Name:</label>

            <div class="col-sm-3">

                <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtMiddleName"
                    CssClass="control-label text-danger"
                    Enabled="false"
                    Text="Required"
                    runat="server" />
            </div>

        </div>

        <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Last Name:</label>
            <div class="col-sm-3">

                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtLastName"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>
            <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Birth Date:</label>

            <div class="col-sm-3">

                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>
            <div class="col-sm-1  text-nowrap" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="txtBirthDate" ValidationGroup="Job"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>

            </div>

        </div>


    </div>


    <br />
    <br />
    <div class="row Text-NoWrap">
        <div class="col-sm-1">
            <asp:Button ID="btnAgree" OnClick="btnAgree_Click" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" />
        </div>
        <div class="col-sm-1">
            <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
        <div class="col-sm-6" style="margin-top: 10px">
            <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
        </div>

    </div>
    <br />


</asp:Content>
--%>
