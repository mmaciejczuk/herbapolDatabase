<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Polprodukt.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Edycja.Polprodukt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>PÓŁPRODUKTY - EDYCJA</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                
                    &nbsp;</td>
            </tr>
                <td>
                
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="IndeksPolproduktu" 
                        DataSourceID="AccessDataSource1" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color:#CCFFFF;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                        Text="Usuń" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="WagaPaletyLabel" runat="server" 
                                        Text='<%# Eval("WagaPalety") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="UwagiLabel" runat="server" Text='<%# Eval("Uwagi") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="background-color:#008A8C;color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                        Text="Aktualizuj" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                        Text="Anuluj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksPolproduktuLabel1" runat="server"
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NazwaPolproduktuTextBox" runat="server"
                                        Text='<%# Bind("NazwaPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="WagaPaletyTextBox" runat="server" 
                                        Text='<%# Bind("WagaPalety") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="UwagiTextBox" runat="server" Text='<%# Bind("Uwagi") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table id="Table1" runat="server" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                <tr>
                                    <td>
                                        No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                        Text="Nowy" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                        Text="Wyczyść" />
                                </td>
                                <td>
                                    <asp:TextBox ID="IndeksPolproduktuTextBox" runat="server" 
                                        Text='<%# Bind("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NazwaPolproduktuTextBox" runat="server" 
                                        Text='<%# Bind("NazwaPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="WagaPaletyTextBox" runat="server" 
                                        Text='<%# Bind("WagaPalety") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="UwagiTextBox" runat="server" Text='<%# Bind("Uwagi") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color:#DCDCDC;color: #000000;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                        Text="Usuń" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="WagaPaletyLabel" runat="server" 
                                        Text='<%# Eval("WagaPalety") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="UwagiLabel" runat="server" Text='<%# Eval("Uwagi") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table id="Table2" runat="server">
                                <tr id="Tr1" runat="server">
                                    <td id="Td1" runat="server">
                                        <table ID="itemPlaceholderContainer" runat="server" style="border: solid 2px #336699;"
                                        cellspacing="0" cellpadding="3" rules="all">
                                            <tr style="background-color: #336699; color: White;">
                                                <th id="Th1" runat="server">
                                                </th>
                                                <th id="Th2" runat="server">
                                                    Indeks</th>
                                                <th id="Th3" runat="server">
                                                    Nazwa</th>
                                                <th id="Th4" runat="server">
                                                    Waga palety</th>
                                                <th id="Th5" runat="server">
                                                    Uwagi</th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="Tr2" runat="server">
                                    <td id="Td2" runat="server" 
                                        style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="17">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                    ShowLastPageButton="True" />    
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Usuń" 
                                        Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="WagaPaletyLabel" runat="server" 
                                        Text='<%# Eval("WagaPalety") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="UwagiLabel" runat="server" Text='<%# Eval("Uwagi") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/BazaHLOB.mdb" 
                        DeleteCommand="DELETE FROM [NazwyPolproduktow] WHERE [IndeksPolproduktu] = ?" 
                        InsertCommand="INSERT INTO [NazwyPolproduktow] ([IndeksPolproduktu], [NazwaPolproduktu], [WagaPalety], [Uwagi]) VALUES (?, ?, ?, ?)" 
                        SelectCommand="SELECT * FROM [NazwyPolproduktow] ORDER BY [NazwaPolproduktu]" 
                        UpdateCommand="UPDATE [NazwyPolproduktow] SET [NazwaPolproduktu] = ?, [WagaPalety] = ?, [Uwagi] = ? WHERE [IndeksPolproduktu] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                            <asp:Parameter Name="NazwaPolproduktu" Type="String" />
                            <asp:Parameter Name="WagaPalety" Type="Int16" />
                            <asp:Parameter Name="Uwagi" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NazwaPolproduktu" Type="String" />
                            <asp:Parameter Name="WagaPalety" Type="Int16" />
                            <asp:Parameter Name="Uwagi" Type="String" />
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                
                </td>
            </tr>
        </table>
</asp:Content>
