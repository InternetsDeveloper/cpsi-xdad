<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FirstTimeUserContractor_Screen_2.aspx.cs" Inherits="TelerikWebApp3.FirstTimeUserContractor_Screen_2" %>

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

    <!--==== Intro ====-->
        <div class="section site-section site-section-light site-section-top themed-background-dark">
            <div class="container">
                <h1 class="text-center animation-slideDown label-intro"><i class="fa fa-cogs"></i>
                    <%= Session["USERTYPE_TEXT"]%> - Additional Information</h1>
                <h5 class="h5 text-center animation-slideUp">In order to create an account fill out the information on this form as accurately as you can, <br/>or use the CANCEL button to back out safely if you are here by mistake.</h5>
                <p class="text-center animation-slideUp require"><em>Items marked with * are required</em></p>
            </div>
        </div>
        <!--==== /end intro ====-->

        <!--==== MAIN CONTENT ====-->
        <div class="section site-content site-section">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 col-lg-6 col-lg-offset-3 site-block">

                        <!--==== PERSONAL INFORMATION ====-->
                        <form action="FirstTimeUserContractor_Screen_2.aspx" method="post" id="form-con-reg-3" class="form-horizontal">
                            <h4 class="underline-heading">Personal Information</h4>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtFirstName" name="txtFirstName" class="form-control input-lg input-red" runat="server" placeholder="* First Name"></asp:textbox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                                ControlToValidate="txtFirstName"
                                                 EnableClientScript="false"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtMiddleName" name="txtMiddleName" class="form-control input-lg input-blue" runat="server" placeholder="* Middle Name"></asp:textbox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                Enabled="false"
                                                ControlToValidate="txtMiddleName"
                                                 EnableClientScript="false"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-user"></i></span>
                                            <asp:textbox type="text" id="txtLastName" name="txtLastName" class="form-control input-lg input-grn" runat="server" placeholder="* Last Name"></asp:textbox>
                                        </div>
                                         <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                                ControlToValidate="txtLastName"
                                                 EnableClientScript="false"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-birthday-cake"></i></span>
                                            <asp:TextBox type="date" id="txtBirthDate" name="txtBirthDate" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" class="form-control input-lg input-orange" runat="server" Mask="##/##/####" masktype="DateTime"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap" style="margin-bottom: 2rem">
                                            <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                                                runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-envelope"></i></span>
                                            <asp:TextBox type="email" id="txtEmail" name="txtEmail" class="form-control input-lg" runat="server" placeholder="* E-mail Address"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                                ControlToValidate="txtEmail"
                                                 EnableClientScript="false"
                                                CssClass="control-label text-danger"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon color-i"><i class="fa fa-id-card"></i></span>
                                            <asp:TextBox type="text" id="txtIDNumber" name="txtIDNumber" class="form-control input-lg" runat="server" placeholder="* ID Number"></asp:TextBox>
                                        </div>
                                         <div class="col-sm-1 text-nowrap" style="margin-bottom: 2rem">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                                                ControlToValidate="txtIDNumber"
                                                CssClass="control-label text-danger"
                                                 EnableClientScript="false"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                    </div>
                                </div>
                            <!--==== /end personal information ====-->

                            <!--==== JOB INFORMATION ====-->
                            <h4 class="underline-heading">Job Information</h4>
                            <h6 class="form-label">* Job Classification:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-id-badge"></i></span>
                                         <asp:DropDownList  id="drpJobClassification" name="drpJobClassification" DataTextField="Code_description" DataValueField="Code" class="form-control input-lg" runat="server" size="1"></asp:DropDownList> 
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator
                                                id="rvJobClassification"
                                                ControlToValidate="drpJobClassification"
                                                  CssClass="control-label text-danger"
                                                InitialValue="Select Function Code"
                                                 EnableClientScript="false"
                                                Text="Required"
                                                runat="server" />
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested Start Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox type="date" id="RadDatePicker_Start" name="RadDatePicker_Start" class="form-control input-lg" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" runat="server" Mask="##/##/####" masktype="DateTime"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1 text-nowrap" style="margin-bottom: 1.5rem">
                                        <asp:CustomValidator 
                                             ID="CustomValidator2" 
                                             ValidateEmptyText="true" 
                                             OnServerValidate="CustomValidator2_ServerValidate" 
                                             ValidationGroup="Date" 
                                             EnableClientScript="true"
                                             runat="server" 
                                             Display="Dynamic" 
                                             ErrorMessage="Required" 
                                             CssClass="control-label text-danger">
                                        </asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <h6 class="form-label">* Requested End Date:</h6>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-calendar"></i></span>
                                        <asp:TextBox type="date" id="RadDatePicker_End" name="RadDatePicker_End" class="form-control input-lg" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" runat="server" Mask="##/##/####" masktype="DateTime"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1" style="margin-bottom: 1.5rem">
                                        <asp:CustomValidator ID="CustomValidator3" ValidateEmptyText="true" OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                                            runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
                                    </div>
                                </div>
                            </div>
                            <label class="h6 form-label">*Primary Requested <%= Session["DESIGNATEDTYPE"]%>:</label>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon color-i"><i class="fa fa-globe"></i></span>
                                        <asp:DropDownList id="drpPrimaryLocation" name="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" class="form-control input-lg" runat="server" size="1"></asp:DropDownList>
                                    </div>
                                    <div class="col-sm-1 text-nowrap">
                                            <asp:RequiredFieldValidator
                                                id="rvLocation"
                                                ControlToValidate="drpPrimaryLocation"
                                                InitialValue="Select School"
                                                CssClass="control-label text-danger"
                                                 EnableClientScript="false"
                                                Text="Required"
                                                runat="server" />
                                        </div>
                                </div>
                            </div>
                            <label class="h6 form-label">Requested <%= Session["DESIGNATEDTYPE"]%>:</label>
                            <div class="form-group">
                                <div class="col-xs-12">
                                    <asp:ListBox id="drpLocations" name="drpLocations" DataTextField="LocalId_name" DataValueField="RecId" SelectionMode="Multiple" runat="server" height="100px" class="form-control input-lg"></asp:ListBox>
                                    <div class="text-center">
                                        <small>To multi-select, hold the Ctrl or Shift Key</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 alert lb-sm" id="notificationLeft">
                                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
                            </div>
                            <!--==== /end job information ====-->

                            <!--==== BUTTONS ROW ====-->
                            <div class="form-group form-actions">
                                <div class="col-xs-6">
                                </div>
                                <div class="col-xs-6 text-right">
                                    <asp:button type="submit" id="btnAgree" class="btn btn-sm btn-primary" text="Continue" OnClick="btnAgree_Click" runat="server" />
                                    <asp:button type="button" id="btnCancel" class="btn btn-sm btn-danger" text="Cancel" onclick="btnCancel_Click" runat="server" />
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
                        <img alt="" class="footer-heading" src="img/CPSI-Logo-Gray.png" />
                        <h6 class="footer-heading"><span id="year-copy">2017</span> &copy; <a href="http://www.cpsiltd.com/">CPSI,Ltd.</a></h6>
                    </div>
                    <div class="col-sm-4 col-md-4">
                    </div>
                </div>
            </div>
        </div>
        <!--==== /end footer ====-->

    </asp:Content>


   


  <%--<br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
                First Time Registration - <%= Session["USERTYPE_TEXT"]%> - Additional Information 
                <div class="HorizontalFull"></div>
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-12 lb-md">
               Below is additional information the district will need in order to approve your account. After completing this screen, you will need to wait for the district administrator to
                approve your account. If your account is approved,  you will receive an email with activation information for your account.
            </div>
            <div class="col-sm-12 lb-sm text-danger">

                Items marked with * are required.
            </div>
             <div class="col-sm-12 lb-sm text-danger">

                Requested end date cannot be more than one year.
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Personal Information
            <div class="HorizontalFull"></div>
            </div>
        </div>


    </div>

    <div class="form-horizontal">

        <div class="form-group">



            <label for="inputType" class="col-sm-2 control-label lb-sm">*First Name:</label>

            <div class="col-sm-3">
                <asp:TextBox ID="txtFirstName" CssClass="form-control text-danger" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtFirstName"
                     EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>

            <label for="inputType" class="col-sm-2 control-label lb-sm">Middle Name:</label>

            <div class="col-sm-3">
                <asp:TextBox ID="txtMiddleName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    Enabled="false"
                    ControlToValidate="txtMiddleName"
                     EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>


        </div>
        <div class="form-group">
            <label for="inputType" class="col-sm-2 control-label lb-sm">*Last Name:</label>

            <div class="col-sm-3">
                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtLastName"
                     EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>


            <label for="inputType" class="col-sm-2 control-label lb-sm">*Birth Date:(MM/DD/YYYY)</label>

            <div class="col-sm-3">

                <asp:TextBox  CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="txtBirthDate" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator1" ValidateEmptyText="true" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>
        </div>
        <div class="form-group">
            <label for="inputType" class="col-sm-2 control-label lb-sm">*E-mail:</label>

            <div class="col-sm-3">
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtEmail"
                     EnableClientScript="false"
                    CssClass="control-label text-danger"
                    Text="Required"
                    runat="server" />
            </div>

            <label for="inputType" class="col-sm-2 control-label lb-sm">*ID Number:</label>

            <div class="col-sm-3">
                <asp:TextBox ID="txtIDNumber" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="txtIDNumber"
                    CssClass="control-label text-danger"
                     EnableClientScript="false"
                    Text="Required"
                    runat="server" />
            </div>
        </div>

    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <div class="col-sm-6 lb-md">
                Job Information
            <div class="HorizontalFull"></div>
            </div>
        </div>
    </div>

    <div class="form-horizontal">
        <div class="form-group">

            <label for="inputType" class="col-sm-2 control-label lb-sm">*Job Classification:</label>

            <div class="col-sm-9">
                <asp:DropDownList ID="drpJobClassification" DataTextField="Code_description" DataValueField="Code" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    id="rvJobClassification"
                    ControlToValidate="drpJobClassification"
                      CssClass="control-label text-danger"
                    InitialValue="Select Function Code"
                     EnableClientScript="false"
                    Text="Required"
                    runat="server" />
            </div>

        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2 control-label lb-sm">*Request Start Date:</label>

            <div class="col-sm-9">
                 <asp:TextBox  CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_Start" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </asp:TextBox>
             
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator2" ValidateEmptyText="true" OnServerValidate="CustomValidator2_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>

        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2 control-label lb-sm">*Request End Date: </label>

            <div class="col-sm-9">
                  <asp:TextBox  CssClass="form-control" EnableEmbeddedBaseStylesheet="false" EnableEmbeddedScripts="true" ID="RadDatePicker_End" runat="server" Mask="##/##/####"
                    MaskType="DateTime">
                </asp:TextBox>
               
            </div>
            <div class="col-sm-1" style="margin-top: 5px">
                <asp:CustomValidator ID="CustomValidator3" ValidateEmptyText="true" OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="Date" EnableClientScript="true"
                    runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="control-label text-danger"></asp:CustomValidator>
            </div>


        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2 control-label lb-sm">*Primary Requested <%= Session["DESIGNATEDTYPE"]%>:</label>

            <div class="col-sm-9">
                <asp:DropDownList ID="drpPrimaryLocation" onchange="cleanSecond(this);" DataTextField="LocalId_name" DataValueField="RecId" CssClass="form-control" runat="server">
                </asp:DropDownList>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    id="rvLocation"
                    ControlToValidate="drpPrimaryLocation"
                    InitialValue="Select School"
                    CssClass="control-label text-danger"
                     EnableClientScript="false"
                    Text="Required"
                    runat="server" />
            </div>

        </div>
        <div class="form-group">

            <label for="inputType" class="col-sm-2 control-label lb-sm">Requested <%= Session["DESIGNATEDTYPE"]%>:</label>

            <div class="col-sm-9">
                <asp:ListBox ID="drpLocations" DataTextField="LocalId_name" DataValueField="RecId" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
            </div>
            <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
                <asp:RequiredFieldValidator
                    ControlToValidate="drpLocations"
                    Enabled="false"
                    InitialValue=""
                    CssClass="control-label text-danger"
                     EnableClientScript="false"
                    Text="Required"
                    runat="server" />
            </div>

        </div>
    </div>
     <br />
     <div class="row">
        <div class="col-sm-10 form-group" style="margin-bottom: 0.2%">
            <div class="col-sm-2">
                <asp:Button ID="btnAgree" CssClass="flat-button BackGroundColor" CausesValidation="true" runat="server" OnClick="btnAgree_Click" Text="Continue" />
            </div>
            <div class="col-sm-2">
               <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" CausesValidation="false" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div class="col-sm-6 alert alert-info lb-sm" id="notificationLeft">
                <asp:Label ID="notification_ufc" CssClass="lb-sm text-danger" runat="server"></asp:Label>
            </div>
            </div>

        </div>

</asp:Content>
--%>