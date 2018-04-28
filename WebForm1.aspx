<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TelerikWebApp3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid_content">
        
        <h4>Reset Your Password</h4>
        <hr />
        <h5>Please enter your information below to reset your password</h5>
       
        <table >
            <tr>
                <td class="text-right">
                    <h6>Im a:</h6>
                </td>
                <td>
                    <asp:DropDownList ID="drpUserType" CssClass="dropdown" runat="server">
                        <asp:ListItem>Select User Type</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                 <td class="text-right">
                    <h6>Network Username/ID:</h6>
                </td>
                <td>
                    <asp:TextBox ID="txtUserId" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <h6>First Name:</h6>
                </td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                 <td>&nbsp;&nbsp;&nbsp;</td>
                <td class="text-right">
                    <h6>Last Name:</h6>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">
                    <h6>Student ID:</h6>
                </td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td class="text-right">
                    <h6>Birth Date:</h6>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
           
        <table>
            <tr>

                <td>
                    <asp:Button ID="btnContinue" CssClass="flat-button BackGroundColor" runat="server" Text="Continue" /></td>
                <td>
                    <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" /></td>
            </tr>
        </table>
        <br />
        <br />
    </div>

    

</asp:Content>
