<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Analizy_surowcowe.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Analizy_surowcowe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size:13px;
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
            width: 434px;
        }
        .style10
        {
            color: #996600;
        }
        .style11
        {
            width: 38px;
        }
        .style12
        {
        }
        .style13
        {
            color: #996600;
        }
        .style14
        {
            font-size: 13px;
            width: 97px;
        }
        .style15
        {
            width: 379px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>ANALIZY SUROWCOWE</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
    <table class="style1">
        <tr>
            <td class="style15">
                <strong><span class="style10">Surowiec</span></strong></td>
            <td class="style13" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style15">
                <asp:DropDownList ID="DropDownListSurowce" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="nazwa" DataValueField="aliasId" 
                    Height="22px" Width="210px" 
                    onselectedindexchanged="DropDownListSurowce_SelectedIndexChanged" 
                    AutoPostBack="True" style="font-size: small" BackColor="#FFFFCC">
                </asp:DropDownList>
                </td>
            <td class="style14">
                <asp:TextBox ID="TextBoxWyszukajAnalize" runat="server" BackColor="#FFFFCC" 
                    Height="22px" Width="74px"></asp:TextBox>
            </td>
            <td class="style2">
                <asp:Button ID="ButtonWyszukaj" runat="server"
                    Text="Wyszukaj analizę" Width="117px" onclick="ButtonWyszukaj_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12" colspan="6">
                <asp:Label ID="LabelError" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
        </tr>
    </table>

    <table class="style1">
        <tr>
            <td>
            
                &nbsp;</td>
        </tr>
    </table>

    <table>
        <tr>
            <td class="style2" colspan="5">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id, numerSpec" 
                    OnItemCommand="ListView1_ItemCommand" 
                    OnSelectedIndexChanging="ListView1_SelectedIndexChanging" 
                    OnSorting="ListView1_OnSorting" ondatabound="ListView1_DataBound" 
                    onselectedindexchanged="ListView1_SelectedIndexChanged" >
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td style="width:30px; text-align:center" >
                                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" 
                                    Text=">>" />
                            </td>
                            <td style="width:335px" >
                                <asp:Label ID="LabelSurowiec" runat="server" Text='<%# Eval("surowiec") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("numerAnalizy") %>' />
                            </td>
                            <td style="width:85px">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("rodzajAnalizy") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numerSpec") %>' />
                            </td>
                            <td  style="width:60px; text-align:right">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td style="width:80px; text-align:right">
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("dataWykonania", "{0:yyyy/MM/dd}") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>
                                    Brak analiz dla wybranego surowca.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td style="width:30px; text-align:center"  >
                                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" 
                                    Text=">>" />
                            </td>
                            <td style="width:335px" >
                                <asp:Label ID="LabelSurowiec" runat="server" Text='<%# Eval("surowiec") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("numerAnalizy") %>' />
                            </td>
                            <td style="width:85px">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("rodzajAnalizy") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numerSpec") %>' />
                            </td>
                            <td  style="width:60px; text-align:right">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td style="width:80px; text-align:right">
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("dataWykonania", "{0:yyyy/MM/dd}") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table2" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr id="Tr2" runat="server" style="background-color: #666666; color: White;">
                                            <th runat="server">
                                                </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortBySurowiec" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Surowiec" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortBYNrAnalizy" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Numer analizy" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortByRodzAnalizy" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Rodzaj analizy" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortByNrSpec" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Numer specyfikacji" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortByWaga" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Waga Partii" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                            <th runat="server">
                                                <asp:LinkButton runat="server" ID="SortByDataPobrania" CommandName="Sort"
                                                CommandArgument="surowiec" Text="Data dodania" ForeColor="White"></asp:LinkButton>    
                                            </th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style="">
                                </td>
                            </tr>
                        </table>
                        <asp:DataPager runat="server" ID="EmployeesDataPager" PageSize="20">
                          <Fields>
                            <asp:TemplatePagerField>
                              <PagerTemplate>
                                &nbsp;
                                <asp:TextBox ID="CurrentRowTextBox" runat="server"
                                     AutoPostBack="true"
                                     Text="<%# Container.StartRowIndex + 1%>" 
                                     Columns="1" 
                                     style="text-align:right" 
                                     OnTextChanged="CurrentRowTextBox_OnTextChanged" />
                                do
                                <asp:Label ID="PageSizeLabel" runat="server" Font-Bold="true"
                                     Text="<%# Container.StartRowIndex + Container.PageSize > Container.TotalRowCount ? Container.TotalRowCount : Container.StartRowIndex + Container.PageSize %>" />
                                z
                                <asp:Label ID="TotalRowsLabel" runat="server" Font-Bold="true"
                                     Text="<%# Container.TotalRowCount %>" />
                              </PagerTemplate>
                            </asp:TemplatePagerField>
                            <asp:NextPreviousPagerField 
                                 ShowFirstPageButton="true" ShowLastPageButton="true"
                                 FirstPageText="|<< " LastPageText=" >>|"
                                 NextPageText=" > " PreviousPageText=" < " />
                          </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #66cc33; color: Black;">
                            <td style="width:30px; text-align:center" >
                                <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" 
                                    Text=">>" ForeColor="Navy" Enabled="false" />
                            </td>
                            <td style="width:335px" >
                                <asp:Label ID="LabelSurowiec" runat="server" Text='<%# Eval("surowiec") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("numerAnalizy") %>' />
                            </td>
                            <td style="width:85px">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("rodzajAnalizy") %>' />
                            </td>
                            <td style="width:85px; text-align:center">
                                <asp:Label ID="numerLabel" runat="server" Text='<%# Eval("numerSpec") %>' />
                            </td>
                            <td  style="width:60px; text-align:right">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td style="width:80px; text-align:right">
                                <asp:Label ID="wykonalLabel" runat="server" Text='<%# Eval("dataWykonania", "{0:yyyy/MM/dd}") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
        </tr>
        </table>

        <table class="style1">
        <tr>
            <td class="style5">
                <asp:Label ID="LabelWymaganiaJakosciowe" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td class="style6">
                <asp:Label ID="LabelWynikiBadania" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="450px" 
                    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" FieldHeaderStyle-Width="50px" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="#DCDCDC" Font-Bold="true" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="tytul" HeaderText="Surowiec" SortExpression="tytul" />
                        <asp:BoundField DataField="numer" HeaderText="Numer specyfikacji" SortExpression="numer" />
                        <asp:BoundField DataField="dataAktualizacji" HeaderText="Obowiązuje od" 
                            SortExpression="dataAktualizacji" DataFormatString="{0:d}"/>
                        <asp:BoundField DataField="cecha1" HeaderText="" 
                            SortExpression="cecha1" />
                        <asp:BoundField DataField="wymagania1" HeaderText="" 
                            SortExpression="wymagania1" />
                        <asp:BoundField DataField="cecha2" HeaderText="" 
                            SortExpression="cecha2" />
                        <asp:BoundField DataField="wymagania2" HeaderText="" 
                            SortExpression="wymagania2" />
                        <asp:BoundField DataField="cecha3" HeaderText="" 
                            SortExpression="cecha3" />
                        <asp:BoundField DataField="wymagania3" HeaderText="" 
                            SortExpression="wymagania3" />
                        <asp:BoundField DataField="cecha4" HeaderText="" 
                            SortExpression="cecha4" />
                        <asp:BoundField DataField="wymagania4" HeaderText="" 
                            SortExpression="wymagania4" />
                        <asp:BoundField DataField="cecha5" HeaderText="" 
                            SortExpression="cecha5" />
                        <asp:BoundField DataField="wymagania5" HeaderText="" 
                            SortExpression="wymagania5" />
                        <asp:BoundField DataField="cecha6" HeaderText="" 
                            SortExpression="cecha6" />
                        <asp:BoundField DataField="wymagania6" HeaderText="" 
                            SortExpression="wymagania6" />
                        <asp:BoundField DataField="cecha7" HeaderText="" 
                            SortExpression="cecha7" />
                        <asp:BoundField DataField="wymagania7" HeaderText="" 
                            SortExpression="wymagania7" />
                        <asp:BoundField DataField="cecha8" HeaderText="" 
                            SortExpression="cecha8" />
                        <asp:BoundField DataField="wymagania8" HeaderText="" 
                            SortExpression="wymagania8" />
                        <asp:BoundField DataField="cecha9" HeaderText="" 
                            SortExpression="cecha9" />
                        <asp:BoundField DataField="wymagania9" HeaderText="" 
                            SortExpression="wymagania9" />
                        <asp:BoundField DataField="cecha10" HeaderText="" 
                            SortExpression="cecha10" />
                        <asp:BoundField DataField="wymagania10" HeaderText="" 
                            SortExpression="wymagania10" />
                        <asp:BoundField DataField="cecha11" HeaderText="" 
                            SortExpression="cecha11" />
                        <asp:BoundField DataField="wymagania11" HeaderText="" 
                            SortExpression="wymagania11" />
                        <asp:BoundField DataField="cecha12" HeaderText="" 
                            SortExpression="cecha12" />
                        <asp:BoundField DataField="wymagania12" HeaderText="" 
                            SortExpression="wymagania12" />
                        <asp:BoundField DataField="cecha13" HeaderText="" 
                            SortExpression="cecha13" />
                        <asp:BoundField DataField="wymagania13" HeaderText="" 
                            SortExpression="wymagania13" />
                        <asp:BoundField DataField="cecha14" HeaderText="" 
                            SortExpression="cecha14" />
                        <asp:BoundField DataField="wymagania14" HeaderText="" 
                            SortExpression="wymagania14" />
                        <asp:BoundField DataField="cecha15" HeaderText="" 
                            SortExpression="cecha15" />
                        <asp:BoundField DataField="wymagania15" HeaderText="" 
                            SortExpression="wymagania15" />
                        <asp:BoundField DataField="cecha16" HeaderText="" 
                            SortExpression="cecha16" />
                        <asp:BoundField DataField="wymagania16" HeaderText="" 
                            SortExpression="wymagania16" />
                        <asp:BoundField DataField="cecha17" HeaderText="" 
                            SortExpression="cecha17" />
                        <asp:BoundField DataField="wymagania17" HeaderText="" 
                            SortExpression="wymagania17" />
                        <asp:BoundField DataField="cecha18" HeaderText="" 
                            SortExpression="cecha18" />
                        <asp:BoundField DataField="wymagania18" HeaderText="" 
                            SortExpression="wymagania18" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="450px" 
                    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" FieldHeaderStyle-Width="50px" 
                    BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    AllowPaging="True">
                    <AlternatingRowStyle BackColor="#DCDCDC" Font-Bold="true" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="numerAnalizy" HeaderText="numerAnalizy" 
                            SortExpression="numerAnalizy" />
                        <asp:BoundField DataField="rodzaj" HeaderText="Rodzaj" 
                            SortExpression="rodzaj" />
                        <asp:BoundField DataField="surowiec" HeaderText="Surowiec" 
                            SortExpression="surowiec" />
                        <asp:BoundField DataField="ilosc" HeaderText="ilosc" SortExpression="ilosc" />
                        <asp:BoundField DataField="dataPobraniaProby" HeaderText="dataPobraniaProby" 
                            SortExpression="dataPobraniaProby" />
                        <asp:BoundField DataField="pobral" HeaderText="pobral" 
                            SortExpression="pobral" />
                        <asp:BoundField DataField="cecha1" HeaderText="" 
                            SortExpression="cecha1" />
                        <asp:BoundField DataField="parametr1" HeaderText="" 
                            SortExpression="parametr1" />
                        <asp:BoundField DataField="cecha2" HeaderText="" 
                            SortExpression="cecha2" />
                        <asp:BoundField DataField="parametr2" HeaderText="" 
                            SortExpression="parametr2" />
                        <asp:BoundField DataField="cecha3" HeaderText="" 
                            SortExpression="cecha3" />
                        <asp:BoundField DataField="parametr3" HeaderText="" 
                            SortExpression="parametr3" />
                        <asp:BoundField DataField="cecha4" HeaderText="" 
                            SortExpression="cecha4" />
                        <asp:BoundField DataField="parametr4" HeaderText="" 
                            SortExpression="parametr4" />
                        <asp:BoundField DataField="cecha5" HeaderText="" 
                            SortExpression="cecha5" />
                        <asp:BoundField DataField="parametr5" HeaderText="" 
                            SortExpression="parametr5" />
                        <asp:BoundField DataField="cecha6" HeaderText="" 
                            SortExpression="cecha6" />
                        <asp:BoundField DataField="parametr6" HeaderText="" 
                            SortExpression="parametr6" />
                        <asp:BoundField DataField="cecha7" HeaderText="" 
                            SortExpression="cecha7" />
                        <asp:BoundField DataField="parametr7" HeaderText="" 
                            SortExpression="parametr7" />
                        <asp:BoundField DataField="cecha8" HeaderText="" 
                            SortExpression="cecha8" />
                        <asp:BoundField DataField="parametr8" HeaderText="" 
                            SortExpression="parametr8" />
                        <asp:BoundField DataField="cecha9" HeaderText="" 
                            SortExpression="cecha9" />
                        <asp:BoundField DataField="parametr9" HeaderText="" 
                            SortExpression="parametr9" />
                        <asp:BoundField DataField="cecha10" HeaderText="" 
                            SortExpression="cecha10" />
                        <asp:BoundField DataField="parametr10" HeaderText="" 
                            SortExpression="parametr10" />
                        <asp:BoundField DataField="cecha11" HeaderText="" 
                            SortExpression="cecha11" />
                        <asp:BoundField DataField="parametr11" HeaderText="" 
                            SortExpression="parametr11" />
                        <asp:BoundField DataField="cecha12" HeaderText="" 
                            SortExpression="cecha12" />
                        <asp:BoundField DataField="parametr12" HeaderText="" 
                            SortExpression="parametr12" />
                        <asp:BoundField DataField="cecha13" HeaderText="" 
                            SortExpression="cecha13" />
                        <asp:BoundField DataField="parametr13" HeaderText="" 
                            SortExpression="parametr13" />
                        <asp:BoundField DataField="cecha14" HeaderText="" 
                            SortExpression="cecha14" />
                        <asp:BoundField DataField="parametr14" HeaderText="" 
                            SortExpression="parametr14" />
                        <asp:BoundField DataField="cecha15" HeaderText="" 
                            SortExpression="cecha15" />
                        <asp:BoundField DataField="parametr15" HeaderText="" 
                            SortExpression="parametr15" />
                        <asp:BoundField DataField="cecha16" HeaderText="" 
                            SortExpression="cecha16" />
                        <asp:BoundField DataField="parametr16" HeaderText="" 
                            SortExpression="parametr16" />
                        <asp:BoundField DataField="cecha17" HeaderText="" 
                            SortExpression="cecha17" />
                        <asp:BoundField DataField="parametr17" HeaderText="" 
                            SortExpression="parametr17" />
                        <asp:CheckBoxField DataField="zwolnionyWarunkowo" 
                            HeaderText="zwolnionyWarunkowo" SortExpression="zwolnionyWarunkowo" />
                        <asp:CheckBoxField DataField="zwolniony" HeaderText="zwolniony" 
                            SortExpression="zwolniony" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
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
            <td class="style3">
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT * FROM [SurowceAliasy] ORDER BY nazwa"></asp:AccessDataSource>
                                <br />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
