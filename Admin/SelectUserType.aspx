<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="SelectUserType.aspx.cs" Inherits="TelerikWebApp3.SelectUserType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript" >

         function UpdateAllChildren(nodes, checked) {
             var i;
             var test;
             for (i = 0; i < nodes.get_count() ; i++) {
                 if (checked) {
                     nodes.getNode(i).check();
                 }
                 else {
                     nodes.getNode(i).set_checked(false);
                 }

                 if (nodes.getNode(i).get_nodes().get_count() > 0) {
                     UpdateAllChildren(nodes.getNode(i).get_nodes(), checked);
                 }
             }
         }

         function UpdateAllChildren(nodes, checked) {
             var i;
             var test;
             for (i = 0; i < nodes.get_count() ; i++) {
                 if (checked) {
                     nodes.getNode(i).check();
                 }
                 else {
                     nodes.getNode(i).set_checked(false);
                 }

                 if (nodes.getNode(i).get_nodes().get_count() > 0) {
                     UpdateAllChildren(nodes.getNode(i).get_nodes(), checked);
                 }
             }
         }
        
         function UpdateAllChildrencheckedFalse(nodes,val) {
             var i;
          
             for (i = 0; i < nodes.get_nodes().get_count() ; i++) {
                 if (nodes.get_nodes().getNode(i).get_text()==val)
                     nodes.get_nodes().getNode(i).set_checked(false);
                 }

                
             
         }

         function clientNodeChecked(sender, eventArgs) {
             var childNodes = eventArgs.get_node().get_nodes();
             var isChecked = eventArgs.get_node().get_checked();
             var nodeLevel = eventArgs.get_node().get_level();
             var nodeText =  eventArgs.get_node().get_text();
             //UpdateAllChildren(childNodes, isChecked);
             // alert("You have checked node " +  node.get_text() + ". Current check state is: " +  node.get_checked());
             // if contractor node is unchecked then uncheck all child nodes of contractor
             if (!isChecked)
                 if (nodeText == "Contractor") {                   
                     UpdateAllChildren(childNodes, false);
                 }
             if (isChecked)
                 if (nodeText == "Staff")
                 {
                     var parentNode = eventArgs.get_node().get_parent();
                     if (parentNode.get_text() == "Contractor") {
                         UpdateAllChildrencheckedFalse(parentNode,"Employee");
                     }
                 
                 }
             if (isChecked)
                 if (nodeText == "Employee") {
                     var parentNode = eventArgs.get_node().get_parent();
                     if (parentNode.get_text() == "Contractor") {
                         parentNode.set_checked(true);
                         UpdateAllChildrencheckedFalse(parentNode, "Staff");
                     }
                 }
             if (isChecked)
                 if (nodeText == "Staff") {
                     var parentNode = eventArgs.get_node().get_parent();
                     if (parentNode.get_text() == "Contractor") {
                         parentNode.set_checked(true);
                         UpdateAllChildrencheckedFalse(parentNode, "Employee");
                     }
                 }

         }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="server">
         <br />
    <div class="form-horizontal">

        <div class="form-group">
            <div class="col-sm-12 lb-lg">
              Configure Global User Types
                <div class="HorizontalFull"></div>
            </div>
             
        </div>
       <div class="lb-sm" style="margin-top:10px">
                Please checkmark the user types that will be using the Self-Servide Tools
                    </div>
    </div>
  
    <br />
    <div class="lb-sm">
     <telerik:RadTreeView ID="RadTreeView1" OnClientNodeChecked="clientNodeChecked" CheckBoxes="true" OnNodeDataBound="RadTreeView1_NodeDataBound" runat="server">              
        <DataBindings>  
            <telerik:RadTreeNodeBinding DataMember="UserTypes"   Checkable="false"   />   
           
       </DataBindings>
    </telerik:RadTreeView>
   </div>
    <br />
    <table>

        <tr>
            <td class="text-left">
                <asp:Button ID="btnSubmit" CssClass="flat-button BackGroundColor" OnClick="btnAgree_Click" runat="server" Text="Save" />
            </td>

           

            <td class="text-left">
                <asp:Button ID="btnCancel" CssClass="flat-button-cancel BorderColor" runat="server" Text="Back" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
    <br />

    <asp:Panel ID="pnlSaved" runat="server">
        <h5>Changes have been Saved</h5>
    </asp:Panel>
      <telerik:RadNotification ID="notification_ufc_error" runat="server" VisibleOnPageLoad="false"
        Width="300px" Height="200px" Position="Center" EnableRoundedCorners="true" TitleIcon="deny"
        EnableShadow="true" AutoCloseDelay="30000">
    </telerik:RadNotification>
</asp:Content>
