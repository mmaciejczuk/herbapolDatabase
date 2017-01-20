<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Surowce.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Edycja.Surowce" %>
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
                <strong>SUROWCE - EDYCJA</strong></td>
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
                
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="IndeksSurowca" 
                        DataSourceID="AccessDataSource1" InsertItemPosition="LastItem">
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
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" 
                                        Text='<%# Eval("Alias") %>' />
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
                                <td>
                                    <asp:TextBox ID="AliasTextBox" runat="server" 
                                        Text='<%# Bind("Alias") %>' />
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
                                    <asp:TextBox ID="IndeksSurowcaTextBox" runat="server" 
                                        Text='<%# Bind("IndeksSurowca") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="NazwaSurowcaTextBox" runat="server" 
                                        Text='<%# Bind("NazwaSurowca") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="AliasTextBox" runat="server" 
                                        Text='<%# Bind("Alias") %>' />
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
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" 
                                        Text='<%# Eval("Alias") %>' />
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
                                                    Nazwa</th>
                                                <th runat="server">
                                                    Alias</th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" 
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
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" 
                                        Text='<%# Eval("Alias") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/BazaHLOB.mdb" 
                        DeleteCommand="DELETE FROM [NazwySurowcow] WHERE (([IndeksSurowca] = ?) OR ([IndeksSurowca] IS NULL AND ? IS NULL))" 
                        InsertCommand="INSERT INTO [NazwySurowcow] ([IndeksSurowca], [NazwaSurowca], [Alias]) VALUES (?, ?, ?)" 
                        SelectCommand="SELECT * FROM [NazwySurowcow]" 
                        
                        UpdateCommand="UPDATE [NazwySurowcow] SET [NazwaSurowca] = ?, [Alias] = ? WHERE (([IndeksSurowca] = ?) OR ([IndeksSurowca] IS NULL AND ? IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                            <asp:Parameter Name="NazwaSurowca" Type="String" />
                            <asp:Parameter Name="Alias" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NazwaSurowca" Type="String" />
                            <asp:Parameter Name="Alias" Type="String" />
                            <asp:Parameter Name="IndeksSurowca" Type="String" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                
                </td>
            </tr>
        </table>
</asp:Content>
