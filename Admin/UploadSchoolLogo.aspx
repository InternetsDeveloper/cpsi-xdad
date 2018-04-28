<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="UploadSchoolLogo.aspx.cs" Inherits="TelerikWebApp3.UploadSchoolLogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnRadAsyncUpload1ClientAction(source, args) {
            __doPostBack('RadAsyncUpload1_FileUploaded', args);
        }

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
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                District Logo Image<div class="HorizontalFull"></div>
            </div>
        </div>
        <div class="col-sm-12 lb-sm text-danger form-group">
            Allowed File extensions JPG and PNG.(233 x 89 pixels)
        </div>
    </div>

    
    <br />
    <br />

    <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" AllowedFileExtensions="jpg,png" OnClientFileUploaded="OnRadAsyncUpload1ClientAction" OnFileUploaded="RadAsyncUpload1_FileUploaded" MaxFileInputsCount="1" Width="300px" TargetFolder="~/uploads">
    </telerik:RadAsyncUpload>
    <br />
    <img src="images/" runat="server" id="img" alt="Image Preview" />
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-sm-10 form-group" style="margin-bottom: 0.2%">
            <div class="col-sm-1">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Save" />
            </div>
            <div class="col-sm-2">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Back" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>
        </div>

    </div>
    <br />

    <asp:Panel ID="pnlSaved" runat="server">
        Changes have been Saved
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
