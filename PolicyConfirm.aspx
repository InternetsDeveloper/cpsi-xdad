<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PolicyConfirm.aspx.cs" Inherits="TelerikWebApp3.PolicyConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
       <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Are you sure you want to upload new policy?  <div class="HorizontalFull"></div>
            </div>
        </div>
       
           </div>
    <div>

        
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="Changes Saved"></asp:Label>
       

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
    <br />
    <telerik:RadNotification ID="notification_ufc" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>
