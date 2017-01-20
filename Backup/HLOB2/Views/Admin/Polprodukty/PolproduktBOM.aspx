<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="PolproduktBOM.aspx.cs" Inherits="HLOB2.Views.WydzialAdustacji.BOM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourcePolprodukty" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT NazwyPolproduktow.* FROM NazwyPolproduktow" 
                    DeleteCommand="DELETE FROM [NazwyPolproduktow] WHERE [IndeksPolproduktu] = @IndeksPolproduktu" 
                    InsertCommand="INSERT INTO [NazwyPolproduktow] ([IndeksPolproduktu], [NazwaPolproduktu], 
                        [Worki], [WagaPalety], [Uwagi]) 
                        VALUES (@IndeksPolproduktu, @NazwaPolproduktu, @Worki, @WagaPalety, @Uwagi)" 
                    UpdateCommand="UPDATE [NazwyPolproduktow] SET [IndeksPolproduktu] = @IndeksPolproduktu, 
                        [NazwaPolproduktu] = @NazwaPolproduktu, 
                        [Worki] = @Worki, [WagaPalety] = @WagaPalety, [Uwagi] = @Uwagi WHERE [IndeksPolproduktu] = @IndeksPolproduktu">
                    <DeleteParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                        <asp:Parameter Name="NazwaPolproduktu" />
                        <asp:Parameter Name="Worki" />
                        <asp:Parameter Name="WagaPalety" />
                        <asp:Parameter Name="Uwagi" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                        <asp:Parameter Name="NazwaPolproduktu" />
                        <asp:Parameter Name="Worki" />
                        <asp:Parameter Name="WagaPalety" />
                        <asp:Parameter Name="Uwagi" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceSurowce" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT NazwySurowcow.* FROM NazwySurowcow" 
                    DeleteCommand="DELETE FROM [NazwySurowcow] WHERE [IndeksSurowca] = @IndeksSurowca" 
                    InsertCommand="INSERT INTO [NazwySurowcow] ([IndeksSurowca], [NazwaSurowca], [Alias])
                        VALUES (@IndeksSurowca, @NazwaSurowca, @Alias)" UpdateCommand="UPDATE [NazwySurowcow] SET [IndeksSurowca] = @IndeksSurowca, 
                        [NazwaSurowca] = @NazwaSurowca, 
                        [Alias] = @Alias 
                        WHERE [IndeksSurowca] = @IndeksSurowca">
                    <DeleteParameters>
                        <asp:Parameter Name="IndeksSurowca" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IndeksSurowca" />
                        <asp:Parameter Name="NazwaSurowca" />
                        <asp:Parameter Name="Alias" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IndeksSurowca" />
                        <asp:Parameter Name="NazwaSurowca" />
                        <asp:Parameter Name="Alias" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourcePolproduktySurowce" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT PolproduktSurowiec.* FROM PolproduktSurowiec" DeleteCommand="DELETE FROM [PolproduktSurowiec] WHERE [IndeksPolproduktu] = @IndeksPolproduktu
                        AND [IndeksSurowca] = @IndeksSurowca" InsertCommand="INSERT INTO [PolproduktSurowiec] ([IndeksPolproduktu], [IndeksSurowca])
                        VALUES (@IndeksPolproduktu, @IndeksSurowca)" UpdateCommand="UPDATE [PolproduktySurowce] SET [IndeksPolproduktu], [IndeksSurowca] 
                        WHERE [IndeksPolproduktu] = @IndeksPolproduktu AND [IndeksSurowca] = @IndeksSurowca"
                    FilterExpression="IndeksPolproduktu='{0}'" >
                    <FilterParameters>
                        <asp:ControlParameter Name="IndeksPolproduktu"
                         ControlID="GridViewPolprodukty"
                         PropertyName="SelectedValue" />
                    </FilterParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                        <asp:Parameter Name="IndeksSurowca" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                        <asp:Parameter Name="IndeksSurowca" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IndeksPolproduktu" />
                        <asp:Parameter Name="IndeksSurowca" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewPolprodukty" runat="server" 
                    DataSourceID="SqlDataSourcePolprodukty" AutoGenerateColumns="False" 
                    DataKeyNames="IndeksPolproduktu" AllowPaging="True" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    onrowdeleting="GridViewPolprodukty_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" />
                        <asp:BoundField DataField="IndeksPolproduktu" HeaderText="IndeksPolproduktu" 
                            ReadOnly="True" SortExpression="IndeksPolproduktu" />
                        <asp:BoundField DataField="NazwaPolproduktu" HeaderText="NazwaPolproduktu" 
                            SortExpression="NazwaPolproduktu" />
                        <asp:BoundField DataField="Worki" HeaderText="Worki" SortExpression="Worki" />
                        <asp:BoundField DataField="WagaPalety" HeaderText="WagaPalety" 
                            SortExpression="WagaPalety" />
                        <asp:BoundField DataField="Uwagi" HeaderText="Uwagi" SortExpression="Uwagi" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsViewPolprodukty" runat="server" 
                    DataSourceID="SqlDataSourcePolprodukty" Height="50px" Width="125px" 
                    AutoGenerateRows="False" DataKeyNames="IndeksPolproduktu" 
                    AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="IndeksPolproduktu" HeaderText="IndeksPolproduktu" 
                            ReadOnly="True" SortExpression="IndeksPolproduktu" />
                        <asp:BoundField DataField="NazwaPolproduktu" HeaderText="NazwaPolproduktu" 
                            SortExpression="NazwaPolproduktu" />
                        <asp:BoundField DataField="Worki" HeaderText="Worki" SortExpression="Worki" />
                        <asp:BoundField DataField="WagaPalety" HeaderText="WagaPalety" 
                            SortExpression="WagaPalety" />
                        <asp:BoundField DataField="Uwagi" HeaderText="Uwagi" SortExpression="Uwagi" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewPolproduktySurowce" runat="server" 
                    DataSourceID="SqlDataSourcePolproduktySurowce" AutoGenerateColumns="False" 
                    DataKeyNames="IndeksPolproduktu,IndeksSurowca" AllowPaging="True" 
                    AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowSelectButton="True" />
                        <asp:BoundField DataField="IndeksPolproduktu" HeaderText="IndeksPolproduktu" 
                            ReadOnly="True" SortExpression="IndeksPolproduktu" Visible="False" />
                        <asp:TemplateField HeaderText="IndeksSurowca" SortExpression="IndeksSurowca">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("IndeksSurowca") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" 
                                    DataSourceID="SqlDataSourceSurowce" DataTextField="NazwaSurowca" 
                                    DataValueField="IndeksSurowca">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsViewPolproduktySurowce" runat="server" 
                    DataSourceID="SqlDataSourcePolproduktySurowce" Height="50px" Width="125px" 
                    AutoGenerateRows="False" DataKeyNames="IndeksPolproduktu,IndeksSurowca" 
                    AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                    <EditRowStyle BackColor="#999999" />
                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="IndeksPolproduktu" HeaderText="IndeksPolproduktu" 
                            ReadOnly="True" SortExpression="IndeksPolproduktu" Visible="False" />
                        <asp:BoundField DataField="IndeksSurowca" HeaderText="IndeksSurowca" 
                            ReadOnly="True" SortExpression="IndeksSurowca" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
