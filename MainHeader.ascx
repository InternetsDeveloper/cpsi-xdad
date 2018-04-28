<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainHeader.ascx.cs" Inherits="TelerikWebApp3.MainHeader" %>


<!--==== HEADER ====-->
        <div class="header">
            <div class="container">
                <!-- Site Logo -->
                <h1>
                <span><img alt="" id="logo" runat="server" src=""/></span>
                </h1>
                <a href="Default.aspx" id="lblHeader2" class="site-logo">
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
                            <a id="btnMainHeaderLogout" href="Default.aspx" class="btn btn-primary" onclick="btnLogin_Click" runat="server">Log Out</a>
                        </li>
                        <li>
                            <a id="btnMainHeaderHome" href="Default.aspx" class="btn btn-success" onclick="btnHome_Click" runat="server">Home</a>
                        </li>
                    </ul>
                    <!-- END Main Menu -->

                </div>
                <!-- END Site Navigation -->
            </div>
        </div>
        <!--==== /end header ====-->
