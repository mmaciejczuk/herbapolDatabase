<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="BOM.aspx.cs" Inherits="HLOB2.Views.WydzialAdustacji.Inne.BOM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 220px;
        }
        .style3
        {
            width: 278px;
        }
        .style4
        {
            width: 15px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>BOM - EDYCJA</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
        <table class="style1">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:ListView ID="ListViewPolprodukty" runat="server" DataKeyNames="IndeksPolproduktu" 
                        DataSourceID="AccessDataSource1" 
                        onitemcommand="ListViewPolprodukty_ItemCommand">
                        <AlternatingItemTemplate>
                            <tr style="background-color:#CCFFFF;">
                                <td>
                                    <asp:LinkButton ID="IndeksPolproduktuLabel" runat="server" CommandName="Select" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color:#DCDCDC;color: #000000;">
                                <td>
                                    <asp:LinkButton ID="IndeksPolproduktuLabel" runat="server" CommandName="Select" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table ID="itemPlaceholderContainer" runat="server" style="border: solid 2px #336699;"
                                        cellspacing="0" cellpadding="3" rules="all">
                                            <tr style="background-color: #336699; color: White;">
                                                <th runat="server">
                                                    Indeks</th>
                                                <th runat="server">
                                                    Półprodukt</th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" 
                                    style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="20">
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
                            <tr style="background-color:#FFCC33;">
                                <td>
                                    <asp:Label ID="IndeksPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("IndeksPolproduktu") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaPolproduktuLabel" runat="server" 
                                        Text='<%# Eval("NazwaPolproduktu") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    <asp:ListView ID="ListViewSurowce" runat="server" DataKeyNames="IndeksSurowca" 
                        DataSourceID="AccessDataSource2" InsertItemPosition="LastItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color:#CCFFFF;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                        Text="Usuń" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksSurowcaLabel" runat="server" 
                                        Text='<%# Eval("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaSurowcaLabel" runat="server" 
                                        Text='<%# Eval("NazwaSurowca") %>' />
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
                                    <asp:Label ID="IndeksSurowcaLabel1" runat="server" 
                                        Text='<%# Eval("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NazwaSurowcaTextBox" runat="server" 
                                        Text='<%# Bind("NazwaSurowca") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" 
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
                                    <asp:TextBox ID="IndeksSurowcaTextBox" runat="server" 
                                        Text='<%# Bind("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NazwaSurowcaTextBox" runat="server" 
                                        Text='<%# Bind("NazwaSurowca") %>' />
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
                                    <asp:Label ID="IndeksSurowcaLabel" runat="server" 
                                        Text='<%# Eval("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaSurowcaLabel" runat="server" 
                                        Text='<%# Eval("NazwaSurowca") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table ID="itemPlaceholderContainer" runat="server" style="border: solid 2px #336699;"
                                        cellspacing="0" cellpadding="3" rules="all">
                                            <tr style="background-color: #336699; color: White;">
                                                <th runat="server">
                                                </th>
                                                <th runat="server">
                                                    Indeks</th>
                                                <th runat="server">
                                                    Surowiec</th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" 
                                        style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server">
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
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                        Text="Usuń" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edytuj" />
                                </td>
                                <td>
                                    <asp:Label ID="IndeksSurowcaLabel" runat="server" 
                                        Text='<%# Eval("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="NazwaSurowcaLabel" runat="server" 
                                        Text='<%# Eval("NazwaSurowca") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                        DataFile="~/App_Data/BazaHLOB.mdb" 
                        DeleteCommand="DELETE FROM [NazwySurowcow] WHERE [IndeksSurowca] = ?" 
                        InsertCommand="INSERT INTO [NazwySurowcow] ([IndeksSurowca], [NazwaSurowca]) VALUES (?, ?)" 
                        SelectCommand="SELECT [IndeksSurowca], [NazwaSurowca] FROM [NazwySurowcow]" 
                        UpdateCommand="UPDATE [NazwySurowcow] SET [NazwaSurowca] = ? WHERE [IndeksSurowca] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                            <asp:Parameter Name="NazwaSurowca" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NazwaSurowca" Type="String" />
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/BazaHLOB.mdb" 
                        DeleteCommand="DELETE FROM [NazwyPolproduktow] WHERE [IndeksPolproduktu] = ?" 
                        InsertCommand="INSERT INTO [NazwyPolproduktow] ([IndeksPolproduktu], [NazwaPolproduktu]) VALUES (?, ?)" 
                        SelectCommand="SELECT [IndeksPolproduktu], [NazwaPolproduktu] FROM [NazwyPolproduktow] ORDER BY [NazwaPolproduktu]" 
                        UpdateCommand="UPDATE [NazwyPolproduktow] SET [NazwaPolproduktu] = ? WHERE [IndeksPolproduktu] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                            <asp:Parameter Name="NazwaPolproduktu" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NazwaPolproduktu" Type="String" />
                            <asp:Parameter Name="IndeksPolproduktu" Type="String" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>
