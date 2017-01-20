<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Kodowanie_hasel.aspx.cs" Inherits="HLOB2.Views.Admin.Operacje.Kodowanie_hasel" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="atlastoolkit" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="jquery-1.4.1.min.js" type="text/javascript"></script>
<script type="text/javascript">

    function GetGridViewTemplateTextBoxValues() {
            var inputs = grid.getElementsByTagName("input");
            var grid = document.getElementById('<%= grdInvoice.ClientID %>');

            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].type == "text") {         
                    amnt = parseInt(grid.rows[i].cells[2].childNodes[0].value;);
                    alert(amnt.toString()); // Getting Nan here
                    //var v = document.getElementById('<%= lblTotal.ClientID %>').value;
                }
            }
    }
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 <asp:GridView ID="gridView3"   runat="server" AutoGenerateColumns="False" 
        DataSourceID="AccessDataSource1">
     <Columns>
         <asp:BoundField DataField="numer" HeaderText="numer" SortExpression="numer" />
         <asp:BoundField DataField="polprodukt" HeaderText="polprodukt" 
             SortExpression="polprodukt" />
         <asp:BoundField DataField="wagaPolproduktu" HeaderText="wagaPolproduktu" 
             SortExpression="wagaPolproduktu" />
         <asp:BoundField DataField="status" HeaderText="status" 
             SortExpression="status" />
     </Columns>
    
                       
</asp:GridView>
             
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT [numer], [polprodukt], [wagaPolproduktu], [status] FROM [Zlecenia]">
    </asp:AccessDataSource>
             
    <div>
        <input id="Button4" type="button" value="Get Values" onclick="GetGridViewTemplateTextBoxValues()" />
    </div>
   
</asp:Content>
