<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="TelerikWebApp3.Header" %>



<!--==== HEADER ====-->
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
                            <a id="btnHeaderLogout" href="Default.aspx" class="btn btn-primary" onclick="btnLogin_Click"  runat="server">Log Out</a>
                        </li>
                         <li>
                            <asp:Label ID="lblUser"   ForeColor="White" Visible="true" runat="server" Text=""></asp:Label>
                        </li>
                       
                    </ul>
                                        
                    <!-- END Main Menu -->

                </div>
                <!-- END Site Navigation -->
            </div>
        </div>
        <!--==== /end header ====-->


