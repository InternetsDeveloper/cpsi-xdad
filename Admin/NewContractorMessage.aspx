<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="NewContractorMessage.aspx.cs" Inherits="TelerikWebApp3.NewContractorMessage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Email Message<div class="HorizontalFull"></div>
            </div>
        </div>

    </div>

    <div class="form-horizontal">

        <div class="col-sm-12 form-group">
            <label for="inputType" class="col-sm-1 control-label lb-sm">Message</label>

        </div>
        <div class="col-sm-12 form-group">
            <asp:TextBox ID="txtHeader" TextMode="MultiLine" Rows="10" CssClass="form-control" runat="server"></asp:TextBox>
        </div>


    </div>



    <table>
        <tr>
            <td class="text-left">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Save" />
            </td>

            <td class="text-left">
                <asp:Button ID="Button2" CssClass="flat-button-cancel BorderColor" OnClick="btnCancel_Click" runat="server" Text="Done" />
            </td>

          
        </tr>
    </table>
    <br />
    <asp:Panel ID="pnlSaved" runat="server">
        Changes have been Saved
    </asp:Panel>
    <asp:Panel ID="pnlSave" runat="server">
        <div class="form-horizontal">
            <div class="col-sm-12 form-group">
                <label for="inputType" class="control-label lb-md">Are you sure you want to save the changes?</label>

            </div>
        </div>
        <br />
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
