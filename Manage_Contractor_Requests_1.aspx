<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Manage_Contractor_Requests_1.aspx.cs" Inherits="TelerikWebApp3.Manage_Contractor_Requests_1" %>

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
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown school-name"><%= Session["SCHOOLNAME"]%></h3>
                <h5 class="h5 text-center animation-slideUp">You will be able to review and manage any contractor requests made on this page, <br>or use the CANCEL button to back out safely.</h5>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!-- MAIN CONTENT -->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12  col-lg-12  site-block">

                        <!--==== CONTRACTOR REQUEST FORM ====-->
                        <form action="Manage_Contractor_Requests_1.aspx" method="post" id="manage-contractor-req" class="form-horizontal">
                            <h3 class="policy-label">Manage Contractor Requests</h3>
                            <telerik:RadGrid ID="Request_RadGrid" AllowPaging="true" OnPreRender="Request_RadGrid_PreRender"  OnItemDataBound="Request_RadGrid_ItemDataBound" AllowMultiRowSelection="false" DataSourceID="LinqDataSourceData" OnItemCreated="Request_RadGrid_ItemCreated" OnInit="Request_RadGrid_Init"
                                Height="300px" runat="server">
                                <EditItemStyle BackColor="green" />
                                <MasterTableView PagerStyle-AlwaysVisible="false" AllowPaging="false" AllowFilteringByColumn="true" AllowSorting="true" CommandItemDisplay="None" DataKeyNames="RequestId,XML"
                                    AutoGenerateColumns="false">
                                    <HeaderStyle CssClass="Myheader" />
                                    <ItemStyle CssClass="rgMasterTable" />
                                    <Columns>
                                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                                            <ItemTemplate>
                                                <asp:Button ID="lnkManage" CssClass="flat-button BackGroundColor" Width="120px" runat="server" Text="Manage User" OnClick="lnkManage_Click"></asp:Button>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="FullName" HeaderStyle-Width="130px" ItemStyle-Width="130px"
                                            HeaderText="FullName" UniqueName="FullName">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Status" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            HeaderText="Status" UniqueName="Status">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <FilterTemplate>
                                                <telerik:RadComboBox ID="RadComboBoxSite" DataSourceID="LinqDataSourceSite" DataTextField="Status"
                                                    OnSelectedIndexChanged="RadComboBoxSite_SelectedIndexChanged" DropDownAutoWidth="Enabled"
                                                    Width="150px" DataValueField="Status" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Status").CurrentFilterValue %>'
                                                    runat="server" OnClientSelectedIndexChanged="SiteIndexChanged">
                                                    <Items>
                                                        <telerik:RadComboBoxItem Text="All" />
                                                    </Items>
                                                </telerik:RadComboBox>
                                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                    <script type="text/javascript">
                                                        function SiteIndexChanged(sender, args) {
                                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                                            tableView.filter("Status", args.get_item().get_value(), "EqualTo");
                                                        }
                                                    </script>
                                                </telerik:RadScriptBlock>
                                            </FilterTemplate>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FunctionCode_Descr" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            HeaderText="JobCode" UniqueName="FunctionCode_Descr">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="StartDate" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            HeaderText="StartDate" UniqueName="StartDate">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="EndDate" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            HeaderText="EndDate" UniqueName="EndDate">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="DeniedReason" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                                            HeaderText="DeniedReason" UniqueName="DeniedReason">
                                            <ItemStyle HorizontalAlign="Left" />
                                        </telerik:GridBoundColumn>

                                    </Columns>
                                </MasterTableView>
                                <ClientSettings AllowGroupExpandCollapse="True" ReorderColumnsOnClient="false" AllowDragToGroup="false"
                                    Selecting-AllowRowSelect="false" Scrolling-AllowScroll="true" AllowColumnsReorder="false">
                                    <Scrolling UseStaticHeaders="True" SaveScrollPosition="True" />
                                </ClientSettings>
                            </telerik:RadGrid>
                            <div class="col-xs-12 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end contractors req form ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right buttons-row">
                                    <asp:button type="submit" text="Done" id="btnAgree" class="btn btn-sm btn-primary" onclick="btnAgree_Click" runat="server" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" onclick="btnCancel_Click" runat="server" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
                                runat="server">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LinqDataSourceData" AutoPage="true" OnSelecting="LinqDataSourceData_Selecting"
                                runat="server">
                            </asp:LinqDataSource>
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
                Manage Contractor Requests   <div class="HorizontalFull"></div>
            </div>
        </div>
       

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Below are the list of contractor requests.
            </div>
        </div>
        <div class="row" style="margin-right:20px;margin-left:2px;">

            <telerik:RadGrid ID="Request_RadGrid" AllowPaging="true" OnPreRender="Request_RadGrid_PreRender"  OnItemDataBound="Request_RadGrid_ItemDataBound" AllowMultiRowSelection="false" DataSourceID="LinqDataSourceData" OnItemCreated="Request_RadGrid_ItemCreated" OnInit="Request_RadGrid_Init"
                Height="300px" runat="server">
                <EditItemStyle BackColor="green" />
                <MasterTableView PagerStyle-AlwaysVisible="false" AllowPaging="false" AllowFilteringByColumn="true" AllowSorting="true" CommandItemDisplay="None" DataKeyNames="RequestId,XML"
                    AutoGenerateColumns="false">
                    <HeaderStyle CssClass="Myheader" />
                    <ItemStyle CssClass="rgMasterTable" />
                    <Columns>
                        <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                            <ItemTemplate>
                                <asp:Button ID="lnkManage" CssClass="flat-button BackGroundColor" Width="120px" runat="server" Text="Manage User" OnClick="lnkManage_Click"></asp:Button>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="FullName" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="FullName" UniqueName="FullName">
                            <ItemStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="Status" UniqueName="Status">
                            <ItemStyle HorizontalAlign="Left" />
                            <FilterTemplate>
                                <telerik:RadComboBox ID="RadComboBoxSite" DataSourceID="LinqDataSourceSite" DataTextField="Status"
                                    OnSelectedIndexChanged="RadComboBoxSite_SelectedIndexChanged" DropDownAutoWidth="Enabled"
                                    Width="150px" DataValueField="Status" AppendDataBoundItems="true" SelectedValue='<%# ((GridItem)Container).OwnerTableView.GetColumn("Status").CurrentFilterValue %>'
                                    runat="server" OnClientSelectedIndexChanged="SiteIndexChanged">
                                    <Items>
                                        <telerik:RadComboBoxItem Text="All" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                    <script type="text/javascript">
                                        function SiteIndexChanged(sender, args) {
                                            var tableView = $find("<%# ((GridItem)Container).OwnerTableView.ClientID %>");
                                            tableView.filter("Status", args.get_item().get_value(), "EqualTo");
                                        }
                                    </script>
                                </telerik:RadScriptBlock>
                            </FilterTemplate>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FunctionCode_Descr" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="JobCode" UniqueName="FunctionCode_Descr">
                            <ItemStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StartDate" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="StartDate" UniqueName="StartDate">
                            <ItemStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="EndDate" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="EndDate" UniqueName="EndDate">
                            <ItemStyle HorizontalAlign="Left" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DeniedReason" AllowFiltering="false" AllowSorting="false" HeaderStyle-Width="150px" ItemStyle-Width="150px"
                            HeaderText="DeniedReason" UniqueName="DeniedReason">
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
          </div>
    <br />
    <div class="row">
         <div class="col-sm-2">
               <asp:Button ID="btnAgree" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Done" />
            </div>
        <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>
         </div>
    <br />
    <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
        runat="server">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LinqDataSourceData" AutoPage="true" OnSelecting="LinqDataSourceData_Selecting"
        runat="server">
    </asp:LinqDataSource>
   
   --%>

