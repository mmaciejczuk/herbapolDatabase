<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Surowce.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Surowce" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 670px;
        }
        .style3
        {
            color: #996600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>SUROWCE</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style2">
                
            </td>
            <td>
                
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                
                <asp:ListView ID="ListView1" runat="server" DataSourceID="AccessDataSource1"
                DataKeyNames="Expr1">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td style="width:30px">
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:50px; text-align:center" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("indeks") %>' />
                            </td>
                            <td style="width:350px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td style="width:200px; text-align:left" >
                                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td style="width:30px">
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:50px; text-align:center" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("indeks") %>' />
                            </td>
                            <td style="width:350px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td style="width:200px; text-align:left" >
                                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr id="Tr2" runat="server" style="background-color: #666666; color: White;">
                                            <th id="Th1" runat="server">
                                                </th>
                                            <th runat="server">
                                                Indeks</th>
                                            <th runat="server">
                                                Nazwa surowca</th>
                                            <th runat="server">
                                                Alias</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="40">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:ListView>
                
            </td>
            <td>
                
                <br />
                <span class="style3"><strong>Specyfikacje:</strong></span><asp:DetailsView 
                    ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                    CellPadding="3" CellSpacing="1" DataSourceID="AccessDataSource2" 
                    GridLines="None" Height="250px" Width="186px">
                    <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
                        <asp:BoundField DataField="numer" HeaderText="Numer" SortExpression="numer" />
                        <asp:BoundField DataField="dataAktualizacji" HeaderText="Data aktualizacji" 
                             DataFormatString="{0:d}" SortExpression="dataAktualizacji" />
                    </Fields>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                </asp:DetailsView>
                
            </td>
        </tr>
        <tr>
            <td class="style2">
                
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    
                    SelectCommand="SELECT Surowce.indeks, Surowce.nazwa, SurowceAliasy.nazwa AS Expr1 
                    FROM (Surowce INNER JOIN SurowceAliasy ON Surowce.alias = SurowceAliasy.aliasId) ORDER BY Surowce.nazwa">
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT ss.tytul, ss.numer, ss.dataAktualizacji FROM SpecyfikacjeSurowcow ss,
                     SurowceAliasy sa, AliasySpecyfikacje asp WHERE sa.aliasId=asp.aliasId AND 
                     asp.specyfikacjaId=ss.specyfikacjaId AND sa.nazwa=?" >
                <SelectParameters>
                        <asp:ControlParameter ControlID="ListView1" DefaultValue="1" 
                            Name="Expr1" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td>
                
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
