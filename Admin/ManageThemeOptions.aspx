<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="ManageThemeOptions.aspx.cs" Inherits="TelerikWebApp3.ManageThemeOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <br />
    <div class="row">
        <div class="col-sm-3">
            <img id="img" runat="server" src="SchoolLogo/Logo.png" />
        </div>
         <div class="col-sm-7">
            <div class="pull-right-center">
                <div class=" lb-lg">
             Manage Theme Options

                <div class="HorizontalFull"></div>
                    </div>
             <div class="lb-sm" style="margin-top:10px">
             On this screen you can manage the configuration options for a single instance of the Self- Service Tools.
                    </div>
            </div>
        </div>
        
    </div>

    <br />
    <div class="row">
  
        <div class="col-sm-3 col-sm-offset-1" id="Tile_ChangeMyQuestions" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnTemplate" AutoPostBack="true" OnClick="btnTemplate_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                           Choose template for the system
                                <br />
                                (Colors / borders)
                            
                        </div>

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
        <div class="col-sm-3" id="Tile_ResetPasswordForStudent" runat="server">
            <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnLogo" AutoPostBack="true" OnClick="btnLogo_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                        <div class="TileText lb-lg">
                            Top<br /> Header Image
                            
                        </div>

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
         <div class="col-sm-3" id="Tile_ResetPasswordForParent" runat="server">
            <div>


                

                 <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnSchoolLogo" AutoPostBack="true"   OnClick="btnSchoolLogo_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                         <div class="TileText lb-lg">
                       District<br />Logo Image
                       
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
    </div>
    <br />
    <div class="row">

         <div class="col-sm-3 col-sm-offset-1" id="Div3" runat="server">
            <div>
                <%--<telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnPolicy" AutoPostBack="true" OnClick="btnPolicy_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                        <div class="TileText lb-lg">
                            Manage<br /> Upload Policy
                        </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>--%>

                 <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnManageTiles" AutoPostBack="true" OnClick="btnManageTiles_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                            Manage<br /> Header Text
                            
                        </div>

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>


            </div>
        </div>
         <div class="col-sm-3" id="Div2" runat="server">
            <div>
                  
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile1" AutoPostBack="true"   OnClick="btnFooter_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                         <div class="TileText lb-lg">
                       Manage<br /> Footer Text
                        
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>

      <%--  <div class="col-sm-3" id="Div1" runat="server">
            <div>


                   <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnSessionTimeOut" AutoPostBack="true"   OnClick="btnSessionTimeOut_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide" >
                    <ContentTemplate>
                         <div class="TileText lb-lg">
                       Manage<br />
                        Global Sessions
                           </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>--%>
    </div>
     <br />
     <div class="row">
       
       
      
          <div class="col-sm-3 col-sm-offset-1" id="Tile_ResetPasswordForContractor" runat="server">
            <div>
               

            </div>
        </div>

    </div>

     <br />
    <table>

        <tr>
           

            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Back" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <br />

</asp:Content>
