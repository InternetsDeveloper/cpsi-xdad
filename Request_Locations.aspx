<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Request_Locations.aspx.cs" Inherits="TelerikWebApp3.Request_Locations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function cleanSecond(ddl) {
            var val = ddl.options[ddl.selectedIndex].value;
            var selected = document.getElementById("<%=drpLocations.ClientID%>").selectedIndex;

            //Clear all items
            $("#<%=drpLocations.ClientID%> > option").remove();

            //Add all options from dropdown 1
            $("#" + ddl.id + "> option").each(function () {
                var opt = document.createElement("option");
                opt.text = this.text;
                opt.value = this.value;
                document.getElementById("<%=drpLocations.ClientID%>").options.add(opt);
            });

            //Remove selected
            if (ddl.selectedIndex != 0)
                $("#<%=drpLocations.ClientID%> option[value='" + val + "']").remove();

            var list = document.getElementById("<%=drpLocations.ClientID%>");
            if (list.options.length > 0) {
                for (var i = list.options.length - 1; i >= 0; i--) {
                    if (list.options[i].text == "Select Location") {
                        list.remove(i);

                    }
                }
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown user-name"><i class="fa fa-user-o"></i> <%= Session["LOGONUSER"]%></h1>
                <h3 class="h3 text-center animation-slideDown school-name"><%= Session["SCHOOLNAME"]%></h3>
                <h5 class="h5 text-center animation-slideUp">Make any further changes to a specific job request in the information below, <br/>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

         <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== REQUEST LOCATIONS ====-->
                        <form action="Request_Locations.aspx" method="post" id="form-con-req-changes" class="form-horizontal">
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h6 class="form-label">* Primary Location:</h6>
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                         <asp:DropDownList id="drpPrimaryLocation" name="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" runat="server" class="form-control input-lg" size="1"></asp:DropDownList>
                                          <asp:RequiredFieldValidator
                                            ControlToValidate="drpPrimaryLocation"
                                            CssClass="control-label text-danger"
                                            ValidationGroup="Left"
                                            Placeholder="Select Location"
                                            Text="Required"
                                            runat="server" />
                                    </div> 
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <h6 class="form-label">Request Additional Locations:</h6>
                                    <div class="form-group">
                                         <asp:ListBox id="drpLocations" name="drpLocations" DataTextField="LocalId_name" DataValueField="RecId" SelectionMode="Multiple" runat="server" class="form-control"></asp:ListBox>
                                    </div>
                                    <div class="text-center">
                                        <a href="javascript:void(0)"><small>To multi-select, hold the Ctrl or Shift Key</small></a>
                                    </div>
                                </div>
                            </div>
                             <div class="col-xs-6 alert" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end request locations ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" id="btnAgree" class="btn btn-sm btn-primary" text="Submit" runat="server" onclick="btnAgree_Click" />
                                    <asp:button type="button" id="btnCancel" class="btn btn-sm btn-danger" text="Cancel" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!--==== /end buttons row ====-->
                            
                        </form>
                    </div>
                </div>
                <hr/>
            </div>
        </div>
        <!--==== /end main content ====-->

        <!--==== COLOR CONTAINER ====-->
        <div class="section site-content site-section themed-background">
            <div class="container">
            </div>
        </div>
        <!--==== /end color container ====-->

        <!--==== FOOTER ====-->
            <div class="footer site-footer site-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 col-md-4 text-center">
                            <h6 class="footer-heading require">Support: techsupport@cpsiltd.com or dial (618)281-8898</h6>
                        </div>
                        <div class="col-sm-4 col-md-4 text-center">
                            <img alt="footer-img" class="footer-heading" src="img/CPSI-Logo-Gray.png" />
                            <h6 class="footer-heading"><span id="year-copy">2017</span> &copy; <a href="http://www.cpsiltd.com/">CPSI,Ltd.</a></h6>
                        </div>
                        <div class="col-sm-4 col-md-4" id="notificationLeft">
                        <asp:Label ID="Label1" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <!--==== /end footer ====-->

        <!-- Scroll to top link, initialized in js/app.js - scrollToTop() -->
        <a href="#" id="to-top"><i class="fa fa-angle-up"></i></a>

    </asp:Content>

    <%--

    <br />

    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                Request Additional <%= Session["DESIGNATEDTYPE"]%>s 
                <div class="HorizontalFull"></div>
            </div>
            <div class="col-sm-12 lb-sm text-danger" style="margin-top:10px">
                Items marked with * are required.
            </div>
        </div>




        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Select <%= Session["DESIGNATEDTYPE"]%>s you would like access to.
            <div class="HorizontalFull"></div>

            </div>
        </div>



    </div>

    <div class="form-horizontal">
        <div class="form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">*Primary Requested <%= Session["DESIGNATEDTYPE"]%>:</label>
            <div class="col-sm-9">

                <asp:DropDownList ID="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>
            <asp:RequiredFieldValidator
                ControlToValidate="drpPrimaryLocation"
                CssClass="control-label text-danger"
                ValidationGroup="Left"
                InitialValue="Select Location"
                Text="Required"
                runat="server" />


        </div>

        <div class="form-group" style="margin-bottom: 0.2%">
            <label for="inputType" class="col-sm-2 control-label lb-sm text-nowrap">Requested Locations:</label>
            <div class="col-sm-9">
                <asp:ListBox ID="drpLocations" DataTextField="LocalId_name" DataValueField="RecId" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
            </div>


        </div>

    </div>


    <br />
    <br />
    <div class="row Text-NoWrap">
        <div class="col-sm-1">
            <asp:Button ID="btnAgree" OnClick="btnAgree_Click" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" />
        </div>
        <div class="col-sm-1">
            <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
        <div class="col-sm-6" style="margin-top:10px">
            <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
        </div>

    </div>
    <br />
</asp:Content>

--%>