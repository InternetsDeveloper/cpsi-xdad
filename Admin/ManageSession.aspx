<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ManageSession.aspx.cs" Inherits="TelerikWebApp3.ManageSession" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">


        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                alert("Please Enter Only Numeric Value:");
                return false;
            }

            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Manage Instance Configuration<div class="HorizontalFull"></div>
            </div>
        </div>
      
    </div>
  
    <br />
    <div class="form-horizontal">

        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Instance name</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtInstanceName" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
        </div>
           <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Instance user type</label> 
             <div class="col-sm-6">
            <telerik:RadTreeView ID="RadTreeView1" CheckBoxes="true" runat="server">
                 </telerik:RadTreeView>
                 </div>
        </div>
          <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Session time out</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtTimeOut" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
        </div>
          <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Random id prefix</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtPrefix" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
        </div>
           <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Generate random id</label> 
             <div class="col-sm-6">
                 <asp:CheckBox ID="txtRandom" CssClass="css-checkbox css-checklabel" runat="server"></asp:CheckBox>
           
                 </div>
        </div>
        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Validate contractor email</label> 
             <div class="col-sm-6">
                 <asp:CheckBox ID="txtContractor" CssClass="css-checkbox css-checklabel" runat="server"></asp:CheckBox>
           
                 </div>
        </div>
       
    </div>
    <table>

        <tr>
            <td class="text-left">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Save" />
            </td>

           

            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Back" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="pnlSaved" runat="server">
        <h5>Changes have been Saved</h5>
    </asp:Panel>
    <asp:Panel ID="pnlSave" runat="server">
        <div>
            <br />
            <h5>Are you sure you want to save the changes?</h5>

        </div>
        <table>
            <tr>
                <td class="text-left">
                    <asp:Button ID="btnSave" CssClass="flat-button BackGroundColor" OnClick="btnSave_Click" runat="server" Text="Yes" />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnNo" CssClass="flat-button-cancel BorderColor" OnClick="btnNo_Click" runat="server" Text="No" />
                </td>

            </tr>
        </table>
    </asp:Panel>
    <br />


</asp:Content>
