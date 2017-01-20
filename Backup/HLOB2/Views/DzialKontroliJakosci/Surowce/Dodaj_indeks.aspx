<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Dodaj_indeks.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Dodaj_indeks" %>
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
                <strong>SUROWCE - DODAWANIE INDEKSU</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>

    <table class="style1">
        <tr>
            <td class="style3">
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="surowiecId" DataSourceID="AccessDataSource1" 
                    BackColor="White" AsllowPaging="True" 
                    AllowSorting="True" CellPadding="1"
                    ForeColor="#333333" PageSize="25" RowStyle-Height="10px"
                    BorderColor="#0066CC" BorderStyle="Solid" 
                    Font-Size="13px" BorderWidth="1px" Width="880px" AllowPaging="True"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True"
                            ItemStyle-Width="70px" CancelText="Anuluj" DeleteText="Usuń" 
                            EditText="Edytuj" InsertText="Wstaw" NewText="Nowy" SelectText="Zaznacz" 
                            UpdateText="Aktualizuj" >
                            <ItemStyle Width="120px"></ItemStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="indeks" HeaderText="Indeks" 
                            SortExpression="indeks" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="100px" ControlStyle-Width="70px" >
                            <ControlStyle Width="70px"></ControlStyle>
                            <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa"
                            ItemStyle-Width="300px" ControlStyle-Width="270px"  >
                            <ControlStyle Width="270px"></ControlStyle>
                            <ItemStyle Width="300px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="alias" HeaderText="Alias" SortExpression="alias"
                            ItemStyle-Width="170px" ControlStyle-Width="140px" > 
                            <ControlStyle Width="140px"></ControlStyle>
                            <ItemStyle Width="170px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="uwagi" HeaderText="Uwagi" SortExpression="uwagi"
                            ItemStyle-Width="280px" ControlStyle-Width="250px"   >
                            <ControlStyle Width="250px"></ControlStyle>
                            <ItemStyle Width="280px"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderStyle="None" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderStyle="None" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" 
                        BackColor="#5D7B9D" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="Black" Font-Bold="True" />
                    <SortedAscendingHeaderStyle />
                    <SortedDescendingHeaderStyle />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Surowce] WHERE [surowiecId] = ?" 
                    InsertCommand="INSERT INTO [Surowce] ([surowiecId], [indeks], [nazwa], [alias], [uwagi]) VALUES (?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Surowce]" 
                    UpdateCommand="UPDATE [Surowce] SET [indeks] = ?, [nazwa] = ?, [alias] = ?, [uwagi] = ? WHERE [surowiecId] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="surowiecId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="surowiecId" Type="Int32" />
                        <asp:Parameter Name="indeks" Type="String" />
                        <asp:Parameter Name="nazwa" Type="String" />
                        <asp:Parameter Name="alias" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="indeks" Type="String" />
                        <asp:Parameter Name="nazwa" Type="String" />
                        <asp:Parameter Name="alias" Type="Int32" />
                        <asp:Parameter Name="surowiecId" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
