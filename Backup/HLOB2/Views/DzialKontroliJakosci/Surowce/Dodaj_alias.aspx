<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Dodaj_alias.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Dodaj_alias" %>
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
                <strong>SUROWCE - DODAWANIE ALIASU</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>

    <table class="style1">
        <tr>
            <td>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="aliasId" DataSourceID="AccessDataSource1" 
                    BackColor="White" AllowPaging="True" 
                    AllowSorting="True" CellPadding="1"
                    ForeColor="#333333" PageSize="25" RowStyle-Height="10px"
                    BorderColor="#0066CC" BorderStyle="Solid" 
                    Font-Size="13px" BorderWidth="1px" Width="880px" 
                    onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing"  >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ShowDeleteButton="True" 
                            ShowEditButton="True" CancelText="Anuluj" DeleteText="Usuń" 
                            EditText="Edytuj" InsertText="Wstaw" NewText="Nowy" SelectText="Zaznacz" 
                            UpdateText="Aktualizuj" ItemStyle-Width="50px"/>
                        <asp:BoundField DataField="aliasId" HeaderText="Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="aliasId" ItemStyle-Width="50px" ControlStyle-Width="40px" />
                        <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa"
                         ItemStyle-Width="200px" ControlStyle-Width="170px"  />
                        <asp:BoundField DataField="uwagi" HeaderText="Uwagi" SortExpression="uwagi"
                         ItemStyle-Width="380px" ControlStyle-Width="350px"  />
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
                    SelectCommand="SELECT * FROM [SurowceAliasy]"
                    DeleteCommand="DELETE FROM [SurowceAliasy] WHERE [aliasId] = ?" 
                    InsertCommand="INSERT INTO [SurowceAliasy] ([aliasId], [nazwa], [uwagi]) VALUES (?, ?, ?)" 
                    UpdateCommand="UPDATE [SurowceAliasy] SET [nazwa] = ?, [uwagi] = ? WHERE [aliasId] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="aliasId" Type="Int32" />
                </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="aliasId" Type="Int32" />
                        <asp:Parameter Name="nazwa" Type="String" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="nazwa" Type="String" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="aliasId" Type="Int32" />
                    </UpdateParameters>
                    </asp:AccessDataSource>
                
            </td>
        </tr>
        <tr>
            <td>
                
                <asp:Label ID="LabelRowIndex" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
