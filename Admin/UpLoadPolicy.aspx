<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="UpLoadPolicy.aspx.cs" Inherits="TelerikWebApp3.UpLoadPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
 .reToolCell, .reLeftVerticalSide, .reRightVerticalSide
 {
  display:none !important;
 }
</style>
        <script type="text/javascript">
            function OnRadAsyncUpload1ClientAction(source, args) {
                __doPostBack('RadAsyncUpload1_FileUploaded', args);
            }
          
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Import Aup from file<div class="HorizontalFull"></div>
            </div>
        </div>
      
    </div>
  
    <br />
      <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" OnClientFileUploaded="OnRadAsyncUpload1ClientAction" OnFileUploaded="RadAsyncUpload1_FileUploaded" MaxFileInputsCount="1" Width="300px" TargetFolder="~/uploads">
    </telerik:RadAsyncUpload>
    <br />
<iframe id="docFrame" runat="server" height="250px"  width="100%"></iframe>
    <br />
    <br />
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
        <div class="lb-sm">
            <br />
            Are you sure you want to save the changes?

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
