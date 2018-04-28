<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_5.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



        <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Account Review</h1>
                <h5 class="h5 text-center animation-slideUp">Please review your account information below and make any necessary changes, <br />or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end Intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                    <!--==== PERSONAL INFORMATION ====-->
                          <form action="FirstTimeUserContractor_Screen_5.aspx" method="post" id="form-con-reg-4" class="form-horizontal"> 
                            <h4 class="underline-heading">Personal Information</h4>
                          
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg"  runat="server" placeholder="First Name"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtMiddleName" name="txtMiddleName" class="form-control input-lg"  runat="server" placeholder="Middle Name"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg" runat="server" placeholder="Last Name"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                            <asp:textbox type="date" id="txtBirthDate" name="txtBirthDate" class="form-control input-lg" runat="server" placeholder="Birth Date"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:textbox type="email" id="txtEmail" name="txtEmail" class="form-control input-lg" runat="server" placeholder="E-mail Address"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group" style="margin-bottom: 3rem;">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:textbox type="text" id="txtIDNumber" name="txtIDNumber" class="form-control input-lg" runat="server" placeholder="ID Number"></asp:textbox> 
                                        </div>
                                    </div>
                                </div>
                          
                            <br>
                            <!--==== /end Personal Information ====-->

                            <!--==== JOB INFORMATION ====-->
                            <h4 class="underline-heading">Job Information</h4>
                            <h6 class="form-label">Job Classification:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <asp:textbox id="drpJobClassification" name="drpJobClassification" class="form-control input-lg" runat="server" size="1">
                                        </asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label" >Requested Start Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:textbox type="date" id="TextBox3" name="TextBox3" class="form-control input-lg" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Requested End Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:textbox type="date" id="TextBox5" name="TextBox5" class="form-control input-lg" runat="server"></asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Primary Location:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group" style="margin-bottom: 1rem">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                        <asp:textbox id="priLocations" name="priLocations" class="form-control input-lg" runat="server" size="1">
                                        </asp:textbox>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">Requested Location(s):</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                         <telerik:RadListBox  ID="RadListBox1" SelectionMode="Multiple" CssClass="listContainer drpLong" runat="server" style="margin-bottom: 2rem">
                                            <Items>
                                                <telerik:RadListBoxItem Text="RadMenu" />
                                                <telerik:RadListBoxItem Text="RadComboBox" />
                                                <telerik:RadListBoxItem Text="RadListBox" Selected="true" />
                                            </Items>
                                         </telerik:RadListBox>
                                    <div class="text-center"  style="margin-bottom: 1rem">
                                        <small>To multi-select, hold the Ctrl or Shift Key</small>
                                    </div>
                                </div>
                            </div>
                            <!--==== /end Job Information ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Done" id="btnAgree" class="btn btn-sm btn-primary" onclick="btnAgree_Click" runat="server" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
                                Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
                                EnableShadow="true" AutoCloseDelay="30000">
                            </telerik:RadNotification>
                        </form>
                    </div>
                </div>
                <hr />
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


    <div>

        <h4>First Time User Registration - <%= Session["USERTYPE_TEXT"]%> - Account Review </h4>

        <div class="HorizontalFull"></div>
        <br />
        <div>
            <h6>Please view and save your account information below.  The username and password here will be used to login to all computers at the district.</h6>
        </div>
        <div class="lineHtSmallHeader">
            <h6>Personal Information</h6>

        </div>
        <div class="HorizontalFullBaseMed"></div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>First Name:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtFirstName" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Middle Name:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtMiddleName" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Last Name:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtLastName" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>Birth Date:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtBirthDate" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>E-mail:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtEmail" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>

                <td class="SmallText textContainer">
                    <h6>ID Number:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="txtIDNumber" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div class="lineHtSmallHeader">
            <h6>Job Information</h6>

        </div>
        <div class="HorizontalFullBaseMed"></div>
        <table>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Job Classification:</h6>
                </td>
                <td class="text-left">
                   <asp:TextBox ID="drpJobClassification" ReadOnly="true" CssClass="textBoxWidthLong" runat="server"></asp:TextBox> 
                </td>


            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Request Start Date:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="TextBox3" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Request End Date:</h6>
                </td>
                <td class="text-left">
                    <asp:TextBox ID="TextBox5" ReadOnly="true" CssClass="textBoxWidthMed" runat="server"></asp:TextBox>
                </td>


            </tr>
            <tr>
                <td class="SmallText textContainer">
                    <h6>Requested Location:</h6>

                </td>
                <td class="text-left">
                    <telerik:RadListBox  ID="drpLocations" SelectionMode="Multiple"    CssClass="listContainer drpLong" runat="server">
                        <Items>
                            <telerik:RadListBoxItem Text="RadMenu" />
                            <telerik:RadListBoxItem Text="RadComboBox" />
                            <telerik:RadListBoxItem Text="RadListBox" Selected="true" />
                        </Items>
                    </telerik:RadListBox>
                  
                </td>


            </tr>
        </table>
    </div>
     <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree"  CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Done"  />
                </td>

              
            </tr>
        </table>
    <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>

--%>