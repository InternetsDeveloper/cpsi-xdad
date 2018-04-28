<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ManageHeader.aspx.cs" Inherits="TelerikWebApp3.ManageHeader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Manage Header Text<div class="HorizontalFull"></div>
            </div>
        </div>
      
    </div>
  
    <br />
    <div class="form-horizontal">

        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Header</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtHeader" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
        </div>
       
    </div>
      <div class="form-horizontal">

        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Admin Header</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtAdminHeader" CssClass="form-control" runat="server"></asp:TextBox>
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
        <div class="alert alert-info">
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
