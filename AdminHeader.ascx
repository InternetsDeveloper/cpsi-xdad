<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminHeader.ascx.cs" Inherits="TelerikWebApp3.AdminHeader" %>

       <div class="header">
            <div class="container">
                <!-- Site Logo -->
                <a href="Default.aspx" class="site-logo">
                    <i class="fa fa-bolt"></i> xdAD<strong> Self Service </strong>Tool
                </a>
                <!-- Site Logo -->
                <!-- Site Navigation -->
                <div class="nav">
                    <!-- Menu Toggle -->
                    <!-- Toggles menu on small screens -->
                    <a href="javascript:void(0)" class="btn btn-default site-menu-toggle visible-xs visible-sm">
                        <i class="fa fa-bars"></i>
                    </a>
                    <!-- END Menu Toggle -->

                    <!-- Main Menu -->
                    <ul class="site-nav">
                        <!-- Toggles menu on small screens -->
                        <li class="visible-xs visible-sm">
                            <a href="javascript:void(0)" class="site-menu-toggle text-center">
                                <i class="fa fa-times"></i>
                            </a>
                        </li>
                        <!-- END Menu Toggle -->
                        <li>
                            <a id="btnHeaderLogin" href="Default.aspx" class="btn btn-primary" onclick="btnLogin_Click"  runat="server">Home</a>
                        </li>
                       
                    </ul>
                                        
                    <!-- END Main Menu -->

                </div>
                <!-- END Site Navigation -->
            </div>
        </div>
        <!--==== /end header ====-->

        <!--

    <asp:Panel ID="pnlHeader"  BackColor="#00ff00"  runat="server">

        <div class="BackGroundColor">
            <div class="pull-left BackGroundColor">
                <h3 class="BackGroundColor">
                    <b><asp:Label ID="lblHeader"   ForeColor="White" runat="server" Text="Label"></asp:Label></b>
                </h3>
            </div>


          
             <div class="pull-right" style="margin-right:10px">
                  <h5 class="BackGroundColor">
                      <b>
                    <asp:LinkButton ID="btnLogin" Font-Underline="true" CausesValidation="false" ForeColor="White" Text="Logout"  OnClick="btnLogin_Click"  runat="server" />&nbsp;&nbsp;&nbsp;

             
                    <asp:LinkButton ID="btnHome" Font-Underline="true" CausesValidation="false" ForeColor="White"  Text="Home" onClick="btnHome_Click"   runat="server" />&nbsp;&nbsp;&nbsp;
            
                    <asp:Label ID="lblUser"   ForeColor="White" Visible="true" runat="server" Text=""></asp:Label>
                          </b>
                      </h5>
                 </div>
            </div>
    </asp:Panel>

    -->
