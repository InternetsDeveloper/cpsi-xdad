<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InsertQ.ascx.cs" Inherits="TelerikWebApp3.InsertQ" %>
<%@ Import Namespace="Telerik.Web.UI" %>


<br />
<div class="form-horizontal form-group">
    <div class="col-sm-1 lb-sm text-nowrap">
        *Question
    </div>
    <div class="col-sm-10">
        <asp:TextBox ID="txtQuestion" Text='<%# DataBinder.Eval(Container, "DataItem.Question") %>' class="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
        <asp:RequiredFieldValidator ID="vldCurrent"
            ControlToValidate="txtQuestion"
            EnableClientScript="true"
            
            CssClass="control-label text-danger"
            Text="Required"
            runat="server" />
    </div>



    <br />
    <br />


    <div class="col-sm-1">
        <asp:Button ID="btnUpdate" CausesValidation="true" CssClass="flat-button BackGroundColor" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Add" : "Update" %>'
            CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>
    </div>
    <div class="col-sm-1">
        <asp:Button ID="Button2" CssClass="flat-button-cancel BorderColor" runat="server" CausesValidation="False"
            CommandName="Cancel" Text="Cancel" />
    </div>



</div>
<br />
<br />
<br />



