<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LogoConfirm.aspx.cs" Inherits="TelerikWebApp3.LogoConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>

        <h4>Are you sure you want to upload new logo?</h4>

        <div class="HorizontalFull"></div>
        <br />
        <h4><asp:Label ID="lblMessage" runat="server" Text="Changes Saved"></asp:Label></h4>
       

        <br />
        <table>

            <tr>
                <td class="text-left">
                    <asp:Button ID="btnAgree" OnClick="btnAgree_Click"  CssClass="flat-button BackGroundColor" runat="server" Text="Yes"  />
                </td>

                <td class="text-left">
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>


    </div>
    <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>
