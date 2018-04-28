<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="TelerikWebApp3.Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Choose Template for System (colors/borders)<div class="HorizontalFull"></div>
            </div>
        </div>
      
    </div>
  
    <br />

     <div class="form-horizontal">

        <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Color</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtColor" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
              <div class="col-sm-1">
             <telerik:RadColorPicker RenderMode="Lightweight" ID="RadColorPicker1" PaletteModes="All" CssClass="ColorPickerPreview"
                    KeepInScreenBounds="true" AutoPostBack="true" AccessKey="A" Skin="Silk" OnColorChanged="RadColorPicker1_ColorChanged" runat="server" ShowIcon="true" />
                 </div>
        </div>

          <div class="col-sm-12 form-group">
           <label for="inputType" class="col-sm-2 control-label lb-sm">Border Color</label> 
             <div class="col-sm-6">
            <asp:TextBox ID="txtBorderColor" CssClass="form-control" runat="server"></asp:TextBox>
                 </div>
              <div class="col-sm-1">
             <telerik:RadColorPicker RenderMode="Lightweight" ID="RadColorPicker2" PaletteModes="All" CssClass="ColorPickerPreview"
                    KeepInScreenBounds="true" AutoPostBack="true" AccessKey="A" Skin="Silk" OnColorChanged="RadColorPicker1_ColorChanged" runat="server" ShowIcon="true" />
                 </div>
        </div>
         </div>


    <table>

        <tr>
            <td class="text-left">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnSubmit_Click" runat="server" Text="Save" />
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
