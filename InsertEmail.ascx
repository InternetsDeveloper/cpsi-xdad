<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InsertEmail.ascx.cs" Inherits="TelerikWebApp3.InsertEmail" %>
<%@ Import Namespace="Telerik.Web.UI" %>
<br />
 <div class="col-sm-9 form-group">
     <div>
            <label for="inputType" class="col-sm-1 control-label lb-sm text-nowrap" >*Email:</label>
            <div class="col-sm-3">

                 <asp:TextBox ID="txtEmail" CssClass="form-control"  runat="server"></asp:TextBox>

            </div>
               <div class="col-sm-1 text-nowrap" style="margin-top: 5px">
               <asp:Label runat="server"  CssClass="control-label lb-sm text-danger"  ID="lbError"></asp:Label>
            </div>
         </div>
     </div>


<br />

    <div class="col-sm-9 form-group">
   
        <div class="col-sm-2-1" style="margin-top:3px; margin-left: 1rem;">
            <asp:Button ID="btnUpdate" CssClass="flat-button BackGroundColor" runat="server" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>
            <asp:Button ID="Button2" CssClass="flat-button-cancel BorderColor" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </div>
     
  </div>


