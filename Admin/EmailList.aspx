<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EmailList.aspx.cs" Inherits="TelerikWebApp3.EmailList" %>

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
    <br />

        <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                List of Emails
            </div>

            <div class="col-sm-12 lb-md">
                <div class="HorizontalFull"></div>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Please enter your email below.
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
           
            
        </div>
   

       
        <div class="form-group">


            <div class="col-sm-1 control-label lb-sm text-nowrap">*Email:</div>
            <div class="col-sm-3">

                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-2 text-nowrap" style="margin-top: 5px">
               <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date"
                    runat="server" Display="Dynamic" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>
            </div>
                  <div class="form-group">
           <div class="col-sm-1">
                 <asp:Button ID="btnDone" CssClass="flat-button BackGroundColor" runat="server" Text="Add" OnClick="btnAdd_Click" />
               </div>
           <div class="col-sm-1">
                 <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Done" OnClick="btnCancel_Click" />
               </div>
                       <%-- <div class="col-sm-1">
                 <asp:Button ID="btnReturn" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnDone_Click" />
               </div>--%>
           <div class="col-sm-6 alert alert-info lb-sm" style="margin-left:30px" id="notificationLeft">
               <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>
          

          </div>
        </div>
    <br />
         <div class="form-horizontal" style="margin-right:27px">
        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="LinqDataSourceSite"  
            AllowPaging="True" AllowAutomaticUpdates="True" AllowAutomaticInserts="True"
            AllowAutomaticDeletes="true" AllowSorting="true" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView DataSourceID="LinqDataSourceSite"  AllowFilteringByColumn="true" AllowAutomaticInserts="false" AutoGenerateColumns="false" DataKeyNames="Email" PagerStyle-AlwaysVisible="true"
                CommandItemDisplay="Top">
                <CommandItemSettings ShowAddNewRecordButton="false" />
                <HeaderStyle  CssClass="control-label" />
                <CommandItemSettings AddNewRecordText="Add New Email" />
                <Columns>
                    <telerik:GridEditCommandColumn Visible="false" UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="Email" HeaderStyle-CssClass="control-label"  HeaderText="Email" SortExpression="Email"
                        UniqueName="Email">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn AllowFiltering="false" HeaderStyle-Width="120px" AllowSorting="false">
                        <ItemTemplate>
                            <asp:Button ID="lnkDelete" CssClass="flat-button BackGroundColor" Width="120px" runat="server" CausesValidation="false" Text="Delete" OnClick="lnkDelete_Click"></asp:Button>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                </Columns>
               
            </MasterTableView>
        </telerik:RadGrid>

    </div>
         


     <asp:LinqDataSource ID="LinqDataSourceSite" AutoPage="true" OnSelecting="LinqDataSourcePropertiesData_Site"
        runat="server">
    </asp:LinqDataSource>
 
   
    <br />
    
  


   
    
   


   
</asp:Content>



