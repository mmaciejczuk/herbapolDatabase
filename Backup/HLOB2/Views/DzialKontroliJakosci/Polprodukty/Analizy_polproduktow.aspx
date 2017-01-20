<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Analizy_polproduktow.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Polprodukty.Analizy_polproduktow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table class="style1">
        <tr>
            <td>
                <strong>ANALIZY POLPRODUKTOW</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
</table>
    <table class="style1">
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" Height="142px" Width="411px" 
                    AllowPaging="True" AutoGenerateRows="False" BackColor="#DEBA84" 
                    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    CellSpacing="2" DataKeyNames="surowiecId" DataSourceID="AccessDataSource1">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="surowiecId" HeaderText="surowiecId" 
                            InsertVisible="False" ReadOnly="True" SortExpression="surowiecId" />
                        <asp:BoundField DataField="indeks" HeaderText="indeks" 
                            SortExpression="indeks" />
                        <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                        <asp:BoundField DataField="alias" HeaderText="alias" SortExpression="alias" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                </asp:DetailsView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Surowce] WHERE [surowiecId] = ?" 
                    InsertCommand="INSERT INTO [Surowce] ([surowiecId], [indeks], [nazwa], [alias]) VALUES (?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [Surowce]" 
                    UpdateCommand="UPDATE [Surowce] SET [indeks] = ?, [nazwa] = ?, [alias] = ? WHERE [surowiecId] = ?">
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
