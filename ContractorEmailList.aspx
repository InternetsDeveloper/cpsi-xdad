<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ContractorEmailList.aspx.cs" Inherits="TelerikWebApp3.ContractorEmailList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
    .rgHeader 
    {
        
        font-size: 16px !important;
        font-weight:bold !important;

    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-group"></i>Manage Contractor E-mail</h1>
                <h5 class="h5 text-center animation-slideUp">You can use this screen to Manage the list of Contractor E-mail, <br />or use the CANCEL button to back out safely.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-lg-12 site-block">

                    <!--==== CONTRACTOR EMAIL LIST ====-->
                    <div class="form-horizontal" style="margin-right:27px">
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="LinqDataSourceSite"  
                                        AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
                                        AllowAutomaticDeletes="true" AllowSorting="true" OnItemCreated="RadGrid1_ItemCreated" OnInit="RadGrid1_Init" OnUpdateCommand="RadGrid1_UpdateCommand" OnItemDataBound="RadGrid1_ItemDataBound" OnInsertCommand="RadGrid1_InsertCommand"
                                        OnItemInserted="RadGrid1_ItemInserted" OnPreRender="RadGrid1_PreRender" OnItemCommand="RadGrid1_ItemCommand">
                                        <PagerStyle Mode="NextPrevAndNumeric" />
                                        <MasterTableView DataSourceID="LinqDataSourceSite" AllowFilteringByColumn="true" AllowAutomaticInserts="false" AutoGenerateColumns="false" DataKeyNames="Email" PagerStyle-AlwaysVisible="true"
                                            CommandItemDisplay="Top">
                                           <HeaderStyle CssClass="Myheader" />
                                            <CommandItemSettings AddNewRecordText="Add New Email" />
                                            <Columns>
                                                <telerik:GridEditCommandColumn Visible="false" UniqueName="EditCommandColumn">
                                                </telerik:GridEditCommandColumn>
                                                <telerik:GridBoundColumn DataField="Email"   HeaderText="Email" SortExpression="Email"
                                                    UniqueName="Email">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                                                    <ItemTemplate>
                                                        <asp:Button ID="lnkDelete" CssClass="flat-button BackGroundColor" Width="120px" runat="server" CausesValidation="false" Text="Delete" OnClick="lnkDelete_Click"></asp:Button>
                                                    </ItemTemplate>
                                                </telerik:GridTemplateColumn>

                                            </Columns>
                                            <EditFormSettings EditFormType="WebUserControl">
                                            </EditFormSettings>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>
                                <br />
                    <!--==== /end contractor e-mail list ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Continue" id="btnAgree" class="btn btn-sm btn-primary" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
                                runat="server">
                            </asp:LinqDataSource>
                            <asp:Label ID="notification_ufc" runat="server"></asp:Label>
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
                        <div class="col-sm-4 col-md-4" id="notificationLeft">
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
                Manage contractor email
            
                <div class="HorizontalFull"></div>
            </div>
        </div>
         </div>
 
    <br />
    <div class="form-horizontal" style="margin-right:27px">
        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="LinqDataSourceSite"  
            AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
            AllowAutomaticDeletes="true" AllowSorting="true" OnItemCreated="RadGrid1_ItemCreated" OnInit="RadGrid1_Init" OnUpdateCommand="RadGrid1_UpdateCommand" OnItemDataBound="RadGrid1_ItemDataBound" OnInsertCommand="RadGrid1_InsertCommand"
            OnItemInserted="RadGrid1_ItemInserted" OnPreRender="RadGrid1_PreRender" OnItemCommand="RadGrid1_ItemCommand">
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView DataSourceID="LinqDataSourceSite" AllowFilteringByColumn="true" AllowAutomaticInserts="false" AutoGenerateColumns="false" DataKeyNames="Email" PagerStyle-AlwaysVisible="true"
                CommandItemDisplay="Top">
               <HeaderStyle CssClass="Myheader" />
                <CommandItemSettings AddNewRecordText="Add New Email" />
                <Columns>
                    <telerik:GridEditCommandColumn Visible="false" UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="Email"   HeaderText="Email" SortExpression="Email"
                        UniqueName="Email">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                        <ItemTemplate>
                            <asp:Button ID="lnkDelete" CssClass="flat-button BackGroundColor" Width="120px" runat="server" CausesValidation="false" Text="Delete" OnClick="lnkDelete_Click"></asp:Button>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                </Columns>
                <EditFormSettings EditFormType="WebUserControl">
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
    <br />
    <table>
        <tr>
            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button BackGroundColor" CausesValidation="false" runat="server" Text="Done" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
        runat="server">
    </asp:LinqDataSource>

   
        <asp:Label ID="notification_ufc" runat="server"></asp:Label>

</asp:Content>

--%>
