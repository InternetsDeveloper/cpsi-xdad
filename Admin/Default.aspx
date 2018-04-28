<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TelerikWebApp3.DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-sm-3">
            <img id="img" class="img-rounded" alt="Cinque Terre" width="304" height="236" runat="server" src="SchoolLogo/Logo.png" />
        </div>
         <div class="col-sm-7">
            <div class="pull-right-center">
                <div class=" lb-lg">
               <%= Session["SCHOOLNAME"]%> 

                <div class="HorizontalFull"></div>
                    </div>
                <div class="lb-md" style="margin-top:10px">
                Welcome <%= Session["LOGONUSER"]%> 
                    </div><div class="lb-sm">
                Below are the configuration options. To manage configuration settings that affect the full installation click "Manage Global Configuration options". To manage the configuration settings for a specific instance click "Manage Instance" Configuration Options".
                    </div>
            </div>
        </div>
        
    </div>
    <br />
    <div class="row">
     <div class="col-sm-3 col-sm-offset-3"  id="Tile_ChangeMyPassword" runat="server">
            <div>


                <telerik:RadContentTemplateTile  CssClass="metro-tile"   ID="btnSelectUserType"   AutoPostBack="true" OnClick="btnSelectUserType_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>
                        <div class="TileText lb-lg">
                           Manage Global <br />
                            Configuration Options
                       
                            
                        </div>
                    </ContentTemplate>
                </telerik:RadContentTemplateTile>
            </div>
        </div>
        <div class="col-sm-3"   id="Tile_ChangeMyQuestions" runat="server">
             <div>
                <telerik:RadContentTemplateTile  CssClass="metro-tile"   ID="btnTemplate"   AutoPostBack="true"  OnClick="btnTemplate_Click" runat="server" Name="firstContentTemplateTile" Shape="Wide">
                    <ContentTemplate>

                        <div class="TileText lb-lg">
                           Manage Instance<br />
                            Configuration Options
                            
                        </div>

                    </ContentTemplate>
                </telerik:RadContentTemplateTile>

            </div>
        </div>
        </div>
    <br />
  




</asp:Content>
