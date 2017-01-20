<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Pracownicy.aspx.cs" Inherits="HLOB2.Views.Admin.Pracownicy.Pracownicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #666699;
            text-decoration: underline;
        }
        .style3
        {
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <strong>PRACOWNICY</strong></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#336666" BorderWidth="3px" CellPadding="4" 
                    DataKeyNames="IdPracownika" DataSourceID="SqlDataSource1" Width="909px" CssClass="Gridview" 
                    onrowupdated="GridView1_RowUpdated" onrowdeleted="GridView1_RowDeleted" 
                    BorderStyle="Double" onrowdatabound="GridView1_RowDataBound" 
                    GridLines="Horizontal" >
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="IdPracownika" HeaderText="Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IdPracownika" 
                            Visible="False" />

                        <asp:BoundField DataField="Dzial" HeaderText="Dzial" SortExpression="Dzial" />
                        <asp:BoundField DataField="Imie" HeaderText="Imie" 
                            SortExpression="Imie" />
                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                            SortExpression="Nazwisko" />
                        <asp:BoundField DataField="Stanowisko" HeaderText="Stanowisko" 
                            SortExpression="Stanowisko" />
                        <asp:CheckBoxField DataField="Aktywny" HeaderText="Aktywny" 
                            SortExpression="Aktywny" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Position="TopAndBottom"
                        FirstPageText="Pierwsza strona"
                        LastPageText="Ostatnia strona" />
                    <PagerStyle HorizontalAlign="Center" BackColor="PaleGoldenrod" 
                        ForeColor="DarkSlateBlue" />
                    <RowStyle ForeColor="#333333" BackColor="White" />
                    <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT * FROM [Pracownicy]"                     
                    
                    UpdateCommand="UPDATE [Pracownicy] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, 
                    [Dzial] = @Dzial, [Stanowisko] = @Stanowisko, [Aktywny] = @Aktywny WHERE [IdPracownika] = @IdPracownika" 
                    
                    
                    DeleteCommand="DELETE FROM [Pracownicy] WHERE [IdPracownika] = @IdPracownika" 
                    ondeleted="SqlDataSource_Deleted" 
                    InsertCommand="INSERT INTO [Pracownicy] ([IdPracownika], [Dzial], [Imie], [Nazwisko], 
                    [Stanowisko], [Aktywny]) VALUES (@IdPracownika, @Dzial, @Nazwisko, @Stanowisko, @Aktywny)">
                    <DeleteParameters>
                        <asp:Parameter Name="IdPracownika" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IdPracownika" />
                        <asp:Parameter Name="Imie" />
                        <asp:Parameter Name="Dzial" />
                        <asp:Parameter Name="Nazwisko" />
                        <asp:Parameter Name="Stanowisko" />
                        <asp:Parameter Name="Aktywny" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Type="String" Name="Imie" />
                        <asp:Parameter Type="String" Name="Nazwisko" />
                        <asp:Parameter Type="String" Name="Dzial" />
                        <asp:Parameter Type="String" Name="Stanowisko" />
                        <asp:Parameter Type="Int32" Name="IdPracownika" />
                        <asp:Parameter Type="Boolean" Name="Aktywny" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT [Numer], [Nazwa] FROM [Magazyny]">
                </asp:SqlDataSource>

                
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT * FROM [Pracownicy]"
                    FilterExpression="IdPracownika='{0}'" 
                    InsertCommand="INSERT INTO [Pracownicy] ([IdPracownika], 
                        [Dzial], [Imie], [Nazwisko], [Stanowisko], [Aktywny])
                        VALUES (@IdPracownika, @Dzial, @Imie, @Nazwisko, @Stanowisko, @Aktywny)">
                        <FilterParameters>
                            <asp:ControlParameter Name="IdPracownika"
                            ControlID="GridView1"
                            PropertyName="SelectedValue" />
                        </FilterParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IdPracownika" />
                            <asp:Parameter Name="Dzial" />
                            <asp:Parameter Name="Imie" />
                            <asp:Parameter Name="Nazwisko" />
                            <asp:Parameter Name="Stanowisko" />
                            <asp:Parameter Name="Aktywny" />
                        </InsertParameters>
                </asp:SqlDataSource>

                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>

                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataKeyNames="IdPracownika" DataSourceID="SqlDataSource3" 
                    GridLines="Horizontal" Height="50px" Width="125px">
                    <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="IdPracownika" HeaderText="IdPracownika" 
                            InsertVisible="False" ReadOnly="True" SortExpression="IdPracownika" />
                        <asp:BoundField DataField="Dzial" HeaderText="Dzial" SortExpression="Dzial" />
                        <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
                        <asp:BoundField DataField="Nazwisko" HeaderText="Nazwisko" 
                            SortExpression="Nazwisko" />
                        <asp:BoundField DataField="Stanowisko" HeaderText="Stanowisko" 
                            SortExpression="Stanowisko" />
                        <asp:CheckBoxField DataField="Aktywny" HeaderText="Aktywny" 
                            SortExpression="Aktywny" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                </asp:DetailsView>

                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>
