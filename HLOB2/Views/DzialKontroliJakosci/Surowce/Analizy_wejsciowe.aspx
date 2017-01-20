<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Analizy_wejsciowe.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Analizy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 331px;
        }
        .style5
        {
            width: 331px;
            font-weight: bold;
            color: #996600;
        }
        .style6
        {
            color: #996600;
            font-weight: bold;
        }
        .style7
        {
            width: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="LabelError" runat="server" ForeColor="#CC3300" 
                    Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:DropDownList ID="DropDownListSurowce" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="nazwa" DataValueField="surowiecId" 
                    Height="28px" Width="210px" 
                    onselectedindexchanged="DropDownListSurowce_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:ListView ID="ListView1" runat="server">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                                    Text="Wybierz" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" 
                                    Text="Edytuj" />
                            </td>
                            <td>
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="rodzajLabel" runat="server" Text='<%# Eval("rodzaj") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("wykonal") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dataWykonaniaLabel" runat="server" 
                                    Text='<%# Eval("dataWykonania") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Aktualizuj" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Anuluj" />
                            </td>
                            <td>
                                <asp:TextBox ID="numerTextBox" runat="server" Text='<%# Bind("numer") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="rodzajTextBox" runat="server" Text='<%# Bind("rodzaj") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wykonalTextBox" runat="server" Text='<%# Bind("wykonal") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="dataWykonaniaTextBox" runat="server" 
                                    Text='<%# Bind("dataWykonania") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>
                                    Nie zwrócono żadnych wartości.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                    Text="Wstaw" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Wyczyść" />
                            </td>
                            <td>
                                <asp:TextBox ID="numerTextBox" runat="server" Text='<%# Bind("numer") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="rodzajTextBox" runat="server" Text='<%# Bind("rodzaj") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wykonalTextBox" runat="server" Text='<%# Bind("wykonal") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="dataWykonaniaTextBox" runat="server" 
                                    Text='<%# Bind("dataWykonania") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                                    Text="Wybierz" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" 
                                    Text="Edytuj" />
                            </td>
                            <td>
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="rodzajLabel" runat="server" Text='<%# Eval("rodzaj") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("wykonal") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dataWykonaniaLabel" runat="server" 
                                    Text='<%# Eval("dataWykonania") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table  ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #336699;">
                                        <tr style="background-color: #336699; color: White;">
                                            <th id="Th1" runat="server">
                                                </th>
                                            <th runat="server">
                                                Numer</th>
                                            <th runat="server">
                                                Analiza</th>
                                            <th runat="server">
                                                Wykonał</th>
                                            <th runat="server">
                                                Data</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                                    Text="Wybierz" Font-Italic="False" Enabled="False" />
                            </td>
                            <td>
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="rodzajLabel" runat="server" Text='<%# Eval("rodzaj") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("wykonal") %>' />
                            </td>
                            <td>
                                <asp:Label ID="dataWykonaniaLabel" runat="server" 
                                    Text='<%# Eval("dataWykonania") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

        <table class="style1">
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                Wzorzec (farmacja):</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                Wyniki badania:</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Button ID="ButtonUkryjFarm" runat="server" Text="Ukryj" Width="80px" 
                    onclick="ButtonUkryjFarm_Click" />
            </td>
            <td class="style3">
                <asp:ListView ID="ListViewSpecyfikacjaFarm" runat="server" 
                    DataKeyNames="parametrId" DataSourceID="SqlDataSource4">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="parametrIdLabel" runat="server" 
                                    Text='<%# Eval("parametrId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscLabel" runat="server" Text='<%# Eval("wartosc") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wymaganiaLabel" runat="server" Text='<%# Eval("wymagania") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscWymaganaLabel" runat="server" 
                                    Text='<%# Eval("wartoscWymagana") %>' />
                            </td>
                            <td>
                                <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="parametrIdLabel1" runat="server" 
                                    Text='<%# Eval("parametrId") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nazwaTextBox" runat="server" Text='<%# Bind("nazwa") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wartoscTextBox" runat="server" Text='<%# Bind("wartosc") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wymaganiaTextBox" runat="server" 
                                    Text='<%# Bind("wymagania") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wartoscWymaganaTextBox" runat="server" 
                                    Text='<%# Bind("wartoscWymagana") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
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
                                    Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Clear" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="nazwaTextBox" runat="server" Text='<%# Bind("nazwa") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wartoscTextBox" runat="server" Text='<%# Bind("wartosc") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wymaganiaTextBox" runat="server" 
                                    Text='<%# Bind("wymagania") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wartoscWymaganaTextBox" runat="server" 
                                    Text='<%# Bind("wartoscWymagana") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="parametrIdLabel" runat="server" 
                                    Text='<%# Eval("parametrId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscLabel" runat="server" Text='<%# Eval("wartosc") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wymaganiaLabel" runat="server" Text='<%# Eval("wymagania") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscWymaganaLabel" runat="server" 
                                    Text='<%# Eval("wartoscWymagana") %>' />
                            </td>
                            <td>
                                <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">
                                                parametrId</th>
                                            <th runat="server">
                                                nazwa</th>
                                            <th runat="server">
                                                wartosc</th>
                                            <th runat="server">
                                                wymagania</th>
                                            <th runat="server">
                                                wartoscWymagana</th>
                                            <th runat="server">
                                                uwagi</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="parametrIdLabel" runat="server" 
                                    Text='<%# Eval("parametrId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscLabel" runat="server" Text='<%# Eval("wartosc") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wymaganiaLabel" runat="server" Text='<%# Eval("wymagania") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wartoscWymaganaLabel" runat="server" 
                                    Text='<%# Eval("wartoscWymagana") %>' />
                            </td>
                            <td>
                                <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:ListView ID="ListViewWynikiFarm" runat="server">
                </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                Wzorzec (spożywka):</td>
            <td>
                &nbsp;</td>
            <td class="style6">
                Wyniki badania:</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Button ID="ButtonUkryjSpoz" runat="server" Text="Ukryj" Width="80px" />
            </td>
            <td class="style3">
                <asp:ListView ID="ListViewSpecyfikacjaSpoz" runat="server">
                </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:ListView ID="ListViewWynikiSpoz" runat="server">
                </asp:ListView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT [surowiecId], [nazwa] FROM [Surowce]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT [numer], [rodzaj], [wykonal], [dataWykonania] FROM [SurowceAnalizy]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT * FROM [ParametrySurowcow]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT ps.parametrId, ps.nazwa, ps.wartosc, ps.wymagania, ps.wartoscWymagana, ps.uwagi FROM ParametrySurowcow ps, SurowceParametry sp WHERE sp.surowiecId LIKE '6' AND sp.parametrId=ps.parametrId">
                </asp:SqlDataSource>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
