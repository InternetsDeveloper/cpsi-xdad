<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="View_Request_Status.aspx.cs" Inherits="TelerikWebApp3.View_Request_Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown school-name"><%= Session["SCHOOLNAME"]%></h3>
                <h5 class="h5 text-center animation-slideUp">Below are the list of requests you have made and the status of each. <br>You can use the DONE button when finished, or use the CANCEL button to back out safely.</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== REQUEST STATUS ====-->
                        <form action="View_Request_Status.aspx" method="post" id="form-con-req-status" class="form-horizontal">

                            <h4 class="underline-heading">View Request Status</h4>
                                <telerik:RadGrid ID="Request_RadGrid"  AllowPaging="true" AllowMultiRowSelection="false"
                                Height="300px" runat="server">
                                    <EditItemStyle BackColor="green" />
                                    <MasterTableView PagerStyle-AlwaysVisible="false" AllowPaging="false" CommandItemDisplay="None"
                                    AutoGenerateColumns="false">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="RequestTime"
                                            HeaderText="RequestTime" UniqueName="RequestTime">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Decision" HeaderText="Decision" UniqueName="Decision">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    </MasterTableView>
                                    <ClientSettings AllowGroupExpandCollapse="True" ReorderColumnsOnClient="false" AllowDragToGroup="false"
                                    Selecting-AllowRowSelect="false" Scrolling-AllowScroll="true" AllowColumnsReorder="false">
                                    <Scrolling UseStaticHeaders="True" SaveScrollPosition="True" />
                                    </ClientSettings>
                            </telerik:RadGrid>
                            <div class="col-xs-6 alert" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end request status ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Done" id="btnAgree" runat="server" class="btn btn-sm btn-primary" />
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
                View Request Status
           
                <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Below are the list of requests you have made.
            </div>
        </div>

    </div>

    <div class="form-group" style="margin-right:25px">

        <telerik:RadGrid ID="Request_RadGrid"  AllowPaging="true" AllowMultiRowSelection="false"
            Height="300px" runat="server">
            <EditItemStyle BackColor="green" />
            <MasterTableView PagerStyle-AlwaysVisible="false" AllowPaging="false" CommandItemDisplay="None"
                AutoGenerateColumns="false">
                <Columns>
                    <telerik:GridBoundColumn DataField="RequestTime"
                        HeaderText="RequestTime" UniqueName="RequestTime">
                        <ItemStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Decision" HeaderText="Decision" UniqueName="Decision">
                        <ItemStyle HorizontalAlign="Left" />
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings AllowGroupExpandCollapse="True" ReorderColumnsOnClient="false" AllowDragToGroup="false"
                Selecting-AllowRowSelect="false" Scrolling-AllowScroll="true" AllowColumnsReorder="false">
                <Scrolling UseStaticHeaders="True" SaveScrollPosition="True" />
            </ClientSettings>
        </telerik:RadGrid>
    </div>

    
    <div class="row Text-NoWrap">
        <div class="col-sm-1">
            <asp:Button ID="btnAgree" CssClass="flat-button BackGroundColor" runat="server" Text="Done" OnClick="btnAgree_Click" />
        </div>
        <div class="col-sm-1">
            <asp:Label ID="notification_ufc" runat="server"></asp:Label>
        </div>
    </div>
    <br />

</asp:Content>

--%>