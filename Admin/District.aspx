<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="District.aspx.cs" Inherits="TelerikWebApp3.District" %>

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
               Manage Global Configuration Options

                <div class="HorizontalFull"></div>
                    </div>
                <div class="lb-sm" style="margin-top:10px">
                Below are the configuration options. "Configure Global Allowed User Types" allows you to select which user types will be using the Self Service Tools. 
                    "Manage Global Security Questions List" allows you to setup and manage the list of available Security Questions in the Self Service Tools.
                    </div>
            </div>
        </div>
        
    </div>
    <br />

    <div class="row">
        <div class="col-sm-3 col-sm-offset-3" id="Tile_ChangeMyPassword" runat="server">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnSelectUserType" AutoPostBack="true" OnClick="btnSelectUserType_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                          <div class="TileText lb-lg">
                         Configure Global<br /> Allowed User Types

                              <br />
                       
                            
                        </div>
                       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
          <div class="col-sm-3" id="Tile_ChangeMyQuestions" runat="server">
           <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="btnManageQuestions" AutoPostBack="true" OnClick="btnManageQuestions_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">


                    <ContentTemplate>
                          <div class="TileText lb-lg">
                           Manage Global<br /> Security Questions List                     
                            
                        </div>
                      

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
    
    </div>
     <div class="row">
        <div class="col-sm-3 col-sm-offset-3" id="Div1" runat="server">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile1" AutoPostBack="true" OnClick="btnNewContractor_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                          <div class="TileText lb-lg">
                          New Contractor Message

                              <br />
                       
                            
                        </div>
                       
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
          <div class="col-sm-3" id="Div2" runat="server">
           <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"    ID="RadContentTemplateTile2" AutoPostBack="true" OnClick="btnEmailList_Click"  runat="server" Name="firstContentTemplateTile" Shape="Wide">


                    <ContentTemplate>
                          <div class="TileText lb-lg">
                          Contractor Email list                     
                            
                        </div>
                      

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

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
