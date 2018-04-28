<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ManageFooter.aspx.cs" Inherits="TelerikWebApp3.ManageFooter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Manage Footer Text<div class="HorizontalFull"></div>
            </div>
        </div>
      
    </div>
  
    <br />
    <div class="form-horizontal">

        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2-2 control-label lb-sm">Center Footer</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtCenter" CssClass="form-control"   runat="server"></asp:TextBox>
                 </div>
        </div>
        <div class="col-sm-12 form-group">
             <label for="inputType" class="col-sm-2-2 control-label lb-sm">Right Footer</label> 
               <div class="col-sm-6">
            <asp:TextBox ID="txtRight" CssClass="form-control"   runat="server"></asp:TextBox>
                 </div>
            
        </div>
    </div>


    
        <asp:Label ID="lblMessage" runat="server" Text="Changes Saved"></asp:Label>
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
    <br />
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



</asp:Content>
