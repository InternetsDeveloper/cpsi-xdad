<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Insert.ascx.cs" Inherits="TelerikWebApp3.Insert" %>
<%@ Import Namespace="Telerik.Web.UI" %>

<table>
    <tr>
        <td>
            <h6>Question&nbsp;</h6>

        </td>
        <td>
            <asp:TextBox ID="txtQuestion" Width="850" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="txtQuestion"><h6>&nbsp;Required</h6></asp:RequiredFieldValidator></td>
    </tr>
</table>
<br />
<table>
    <tr>
        <td class="text-left">
            <asp:Button ID="btnUpdate" CssClass="flat-button BackGroundColor" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>
        </td>
        <td class="text-left">
            <asp:Button ID="Button2" CssClass="flat-button-cancel BorderColor" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />

        </td>
    </tr>
</table>

