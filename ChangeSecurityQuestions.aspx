<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ChangeSecurityQuestions.aspx.cs" EnableEventValidation="false" Inherits="TelerikWebApp3.ChangeSecurityQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        function show() {

            $("#notificationLeft").show();

        }

        function hide() {

            $("#notificationLeft").hide();

        }

        function cleanSecond(ddl) {
            var val = ddl.options[ddl.selectedIndex].value;
            var selected = document.getElementById("<%=drpQuestion2.ClientID%>").selectedIndex;

            //Clear all items
            $("#<%=drpQuestion2.ClientID%> > option").remove();

            //Add all options from dropdown 1
            $("#" + ddl.id + "> option").each(function () {
                var opt = document.createElement("option");
                opt.text = this.text;
                opt.value = this.value;
                document.getElementById("<%=drpQuestion2.ClientID%>").options.add(opt);
            });

            //Remove selected
            if (ddl.selectedIndex != 0)
                $("#<%=drpQuestion2.ClientID%> option[value='" + val + "']").remove();

        }

        function cleanThird(ddl) {
            var val = ddl.options[ddl.selectedIndex].value;
            var selected = document.getElementById("<%=drpQuestion3.ClientID%>").selectedIndex;

            //Clear all items
            $("#<%=drpQuestion3.ClientID%> > option").remove();

            //Add all options from dropdown 1
            $("#" + ddl.id + "> option").each(function () {
                var opt = document.createElement("option");
                opt.text = this.text;
                opt.value = this.value;
                document.getElementById("<%=drpQuestion3.ClientID%>").options.add(opt);
              });

            //Remove selected
              if (ddl.selectedIndex != 0)
                  $("#<%=drpQuestion3.ClientID%> option[value='" + val + "']").remove();

         }

         function cleanFirst(ddl) {
             var val = ddl.options[ddl.selectedIndex].value;
             var selected = document.getElementById("<%=drpQuestion1.ClientID%>").selectedIndex;
                if (selected == 0) {
                    //Clear all items
                    $("#<%=drpQuestion1.ClientID%> > option").remove();

                 //Add all options from dropdown 1
                 $("#" + ddl.id + "> option").each(function () {
                     var opt = document.createElement("option");
                     opt.text = this.text;
                     opt.value = this.value;
                     document.getElementById("<%=drpQuestion1.ClientID%>").options.add(opt);
                });

                 //Remove selected
                if (ddl.selectedIndex != 0)
                    $("#<%=drpQuestion1.ClientID%> option[value='" + val + "']").remove();



                }
            }

            function clearfirst() { document.getElementById('<%=txtA.ClientID%>').value = ""; }
        function clearsecond() { document.getElementById('<%=txtB.ClientID%>').value = ""; }
        function clearthird() { document.getElementById('<%=txtC.ClientID%>').value = ""; }
              
          
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!--==== INTRO ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-question-circle-o"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Change Security Questions</h1>
                <h5 class="h5 text-center animation-slideUp">Pick and answer three questions. These questions will be used if you ever need to reset your password. <br />You can use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== SECURITY QUESTIONS ====-->
                        <form action="ChangeSecurityQuestions.aspx" method="post" id="form-chg-questions" class="form-horizontal">
                            <h4 class="underline-heading">Security Questions</h4>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                         <asp:DropDownList id="drpQuestion1" name="drpQuestion1" class="form-control input-lg" onchange="cleanSecond(this);cleanThird(this);clearfirst();clearsecond();clearthird();" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                            ControlToValidate="drpQuestion1"
                                            InitialValue="Select Question"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtA" name="txtA" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:textbox> 
                                    </div>
                                     <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                            ControlToValidate="txtA"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion2" name="drpQuestion2" onchange="cleanThird(this);clearsecond();clearthird();" runat="server" class="form-control input-lg" size="1"></asp:DropDownList>    
                                    </div>
                                     <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                            ControlToValidate="drpQuestion2"
                                            placeholder="Select Question"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtB" name="txtB" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:textbox>
                                    </div>
                                     <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                            ControlToValidate="txtB"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-question"></i></span>
                                        <asp:DropDownList id="drpQuestion3" name="drpQuestion3" class="form-control input-lg" onchange="clearthird();" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1 text-nowrap" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                            ControlToValidate="drpQuestion3"
                                            placeholder="Select Question"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-edit"></i></span>
                                        <asp:textbox type="text" id="txtC" name="txtC" class="form-control input-lg" runat="server" placeholder="* Your Answer"></asp:textbox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                                            ControlToValidate="txtC"
                                            CssClass="control-label text-danger"
                                            Text="Required"
                                            runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end security questions ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions buttons-row">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" text="Submit" id="btnContinue" class="btn btn-sm btn-primary" runat="server" onclick="btnContinue_Click" />
                                    <asp:button type="button" text="Cancel" id="btnCancel" class="btn btn-sm btn-danger" runat="server" onclick="btnCancel_Click" />
                                </div>
                            </div>
                            <!-- /end buttons row -->
                             
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
                        <img class="footer-heading" src="img/CPSI-Logo-Gray.png">
                        <h6 class="footer-heading"><span id="year-copy">2017</span> &copy; <a href="http://www.cpsiltd.com/">CPSI,Ltd.</a></h6>
                    </div>
                    <div class="col-sm-4 col-md-4">
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
                <%= Session["USERTYPE_TEXT"]%> - Change Security Questions
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
                Below you can change your security questions. These questions will be used to help you if you ever need to reset your password on this site.
            </div>
            <div class="col-sm-12 lb-sm text-danger">
                Items marked with * are required.
            </div>
        </div>
    </div>
    <div>

        <div class="row">
            <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Question #1:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="drpQuestion1" CssClass="form-control" onchange="cleanThird(this);clearsecond();clearthird();" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="drpQuestion1"
                        InitialValue="Select Question"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>

                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Answer #1:</label>

                <div class="col-sm-3">
                    <asp:TextBox ID="txtA" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtA"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>

            </div>
            <br />
            <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Question #2:</label>
                <div class="col-sm-3">
                    <asp:DropDownList ID="drpQuestion2" CssClass="form-control" onchange="cleanThird(this);clearsecond();clearthird();" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="drpQuestion2"
                        InitialValue="Select Question"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Answer #2:</label>

                <div class="col-sm-3">
                    <asp:TextBox ID="txtB" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtB"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>

            </div>
            <br />
            <div class="col-sm-12 form-group" style="margin-bottom: 0.2%">
                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Question #3:</label>
                <div class="col-sm-3">
                    <%-- <asp:DropDownList ID="drpQuestion3" CssClass="form-control" onchange="cleanThird(this);clearsecond();clearthird();" runat="server">
                    </asp:DropDownList>--
                    <asp:DropDownList ID="drpQuestion3" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="drpQuestion3"
                        InitialValue="Select Question"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>
                <label for="inputType" class="col-sm-2-1 control-label lb-sm text-nowrap">*Answer #3:</label>

                <div class="col-sm-3">
                    <asp:TextBox ID="txtC" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                    <asp:RequiredFieldValidator
                        ControlToValidate="txtC"
                        CssClass="control-label text-danger"
                        Text="Required"
                        runat="server" />
                </div>

            </div>
            <br />
        </div>


        <br />
        <div class="row Text-NoWrap">
            <div class="col-sm-2-1">
                <asp:Button ID="btnContinue" CssClass="flat-button BackGroundColor" runat="server" Text="Submit" OnClick="btnContinue_Click" />
            </div>
            <div class="col-sm-2-1">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>

        </div>


    </div>
    <br />

</asp:Content>

--%>