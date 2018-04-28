<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ManageEmails.aspx.cs" Inherits="TelerikWebApp3.ManageEmails" %>

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

    <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Manage Emails 
                <div class="HorizontalFull"></div>
            </div>

        </div>
        <div class="lb-sm" style="margin-top: 10px">
            On this screen add emails.
        </div>

    </div>
    <br />
    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="LinqDataSourceSite"
        AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
        AllowAutomaticDeletes="true" AllowSorting="true" OnItemCreated="RadGrid1_ItemCreated" OnUpdateCommand="RadGrid1_UpdateCommand" OnItemDataBound="RadGrid1_ItemDataBound" OnInsertCommand="RadGrid1_InsertCommand"
        OnItemInserted="RadGrid1_ItemInserted" OnDeleteCommand="RadGrid1_DeleteCommand" OnPreRender="RadGrid1_PreRender" OnItemCommand="RadGrid1_ItemCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <MasterTableView DataSourceID="LinqDataSourceSite"  AllowAutomaticInserts="false" AutoGenerateColumns="false" DataKeyNames="Question"
            CommandItemDisplay="Top">
            <HeaderStyle CssClass="Myheader" />
            <CommandItemSettings AddNewRecordText="Add New Question" />
            <Columns>
                <telerik:GridEditCommandColumn Visible="true" UniqueName="EditCommandColumn">
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="Question" HeaderText="Security Questions"   SortExpression="Question"
                    UniqueName="Question">
                </telerik:GridBoundColumn>

                <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                        <ItemTemplate>
                            <asp:Button ID="lnkDelete" CssClass="flat-button BackGroundColor" Width="120px" runat="server" CausesValidation="false" Text="Delete" OnClick="lnkDelete_Click"></asp:Button>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

            </Columns>
            <EditFormSettings UserControlName="InsertQ.ascx" EditFormType="WebUserControl">
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>                
                </EditFormSettings>
            <EditFormSettings EditFormType="WebUserControl">
            </EditFormSettings>
            
           
        </MasterTableView>
    </telerik:RadGrid>
    <br />
    <table>

        <tr>


            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Back" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
        runat="server">
    </asp:LinqDataSource>
    <br />

    <asp:Label ID="notification_ufc" runat="server"></asp:Label>

</asp:Content>
