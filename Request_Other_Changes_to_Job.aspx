<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Request_Other_Changes_to_Job.aspx.cs" Inherits="TelerikWebApp3.Request_Other_Changes_to_Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown">Request Other Changes to Job</h3>
                <h5 class="h5 text-center animation-slideUp">Make any further changes to a specific job request in the information below, <br>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== REQUEST CHANGE ====-->
                        <form action="Request_Other_Changes_to_Job.aspx" method="post" id="form-con-req-changes" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h4 class="underline-heading">Request Job Information Changes</h4>
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <asp:DropDownList  id="drpJobClassification" name="drpJobClassification" DataTextField="Code_description" DataValueField="Code" class="form-control input-lg" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested Start Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                       <asp:TextBox type="date" id="RadDatePicker_Start" name="RadDatePicker_Start" class="form-control input-lg" runat="server" placeholder="* Start Date" masktype="DateTime"></asp:TextBox>
                                    </div>
                                     <div class="col-sm-1  text-nowrap" >
                                        <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="RadDatePicker_Start" ValidationGroup="Job"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested End Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox  type="date" id="RadDatePicker_End" name="RadDatePicker_End" class="form-control input-lg" runat="server" placeholder="* End Date" masktype="DateTime"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1  text-nowrap" ">
                                        <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" ValidationGroup="Job" OnServerValidate="CustomValidator2_ServerValidate" ControlToValidate="RadDatePicker_End"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                             <div class="col-sm-6" id="notificationLeft"
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end request changes ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" ID="btnAgree" class="btn btn-sm btn-primary" onclick="btnAgree_Click" text="Submit" runat="server" />
                                    <asp:button type="button" ID="btnCancel" class="btn btn-sm btn-danger" onclick="btnCancel_Click" text="Cancel" runat="server" />
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
                Request Other Changes to Job
                <div class="HorizontalFull"></div>
            </div>

        </div>

        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Please make changes in the information below.
            <div class="HorizontalFull"></div>
                <div class="lb-sm text-danger">
                    Items marked with * are required.
                </div>
            </div>
        </div>

    </div>

    <div class="form-horizontal">
        <div class="form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Job Classification:</label>
            <div class="col-sm-7">

                <asp:DropDownList ID="drpJobClassification" DataTextField="Code_description" DataValueField="Code" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="drpJobClassification"
                    CssClass="control-label text-danger"
                    InitialValue="Select Job Classification"
                    ValidationGroup="Job"
                    Text="Required"
                    runat="server" />
            </div>


        </div>
        <div class="form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Request Start Date:</label>
            <div class="col-sm-7">


                <telerik:RadMaskedTextBox CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_Start" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>
            <div class="col-sm-1  text-nowrap" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ControlToValidate="RadDatePicker_Start" ValidationGroup="Job"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>

            </div>


        </div>
        <div class="form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Request End Date:</label>
            <div class="col-sm-7">


                <telerik:RadMaskedTextBox CssClass="form-control" ValidationGroup="Job" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_End" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </telerik:RadMaskedTextBox>
            </div>
            <div class="col-sm-1  text-nowrap" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" ValidationGroup="Job" OnServerValidate="CustomValidator2_ServerValidate" ControlToValidate="RadDatePicker_End"
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