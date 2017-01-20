<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Lista indeksów.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Lista_indeksów" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #663300;
        }
        .style3
        {
            color: #996633;
        }
        </style>

<script runat="server">
  void ContactsListView_Sorting(Object sender, ListViewSortEventArgs e)
  {
    // Check the sort direction to set the image URL accordingly.
    string imgUrl;
    if (e.SortDirection == SortDirection.Ascending)
      imgUrl = "~/Images/asc.gif";
    else
        imgUrl = "~/Images/desc.gif";

    // Check which field is being sorted
    // to set the visibility of the image controls.
    Image sortImage1 = (Image)ListView1.FindControl("SortImage1");
    Image sortImage2 = (Image)ListView1.FindControl("SortImage2");
    Image sortImage3 = (Image)ListView1.FindControl("SortImage3");
    switch (e.SortExpression)
    {
      case "indeks":
        sortImage1.Visible = true;
        sortImage1.ImageUrl = imgUrl;
        sortImage2.Visible = false;
        sortImage3.Visible = false;
        break;
      case "nazwa":
        sortImage1.Visible = false;
        sortImage2.Visible = true;
        sortImage2.ImageUrl = imgUrl;
        sortImage3.Visible = false;
        break;
      case "Expr1":
        sortImage1.Visible = false;
        sortImage2.Visible = false;
        sortImage3.Visible = true;
        sortImage3.ImageUrl = imgUrl;
        break;
    }
  }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>SUROWCE - LISTA INDEKSÓW</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style3">
                
                <strong>Indeksy:</strong></td>
            <td>
                
                <span class="style3"><strong style="color: #996600">Specyfikacje:</strong></span></td>
        </tr>
        <tr>
            <td class="style2">
                
                <asp:ListView ID="ListView1" runat="server" DataSourceID="AccessDataSource1"
                DataKeyNames="Expr1" OnSorting="ContactsListView_Sorting">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td style="width:30px">
                                <asp:LinkButton ID="LinkButton1" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:50px; text-align:left" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("indeks") %>' />
                            </td>
                            <td style="width:250px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
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
                            <td style="width:50px; text-align:left" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("indeks") %>' />
                            </td>
                            <td style="width:250px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
                                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr id="Tr2" runat="server" style="background-color: #666666; color: White; height: 40px">
                                         <td>
                                            <asp:Label runat="server" ID="Label1"
                                              Text="" 
                                              CommandArgument="indeks"/>
                                          </td>
                                        <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByIndeksButton"
                                              CommandName="Sort" Text="Indeks"
                                              CommandArgument="indeks" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage1" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
                                          <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByNazwaButton"
                                              CommandName="Sort" Text="Surowiec"
                                              CommandArgument="nazwa" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage2" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
                                          <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByExpr1Button"
                                              CommandName="Sort" Text="Alias"
                                              CommandArgument="Expr1" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage3" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:DataPager runat="server" ID="EmployeesDataPager" PageSize="28">
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
                            <td style="width:30px">
                                <asp:LinkButton ID="LinkButton1" Enabled="false" runat="server"
                                CommandName="Select" >>></asp:LinkButton>
                            </td>
                            <td style="width:50px; text-align:center" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("indeks") %>' />
                            </td>
                            <td style="width:250px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("nazwa") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
                                <asp:Label ID="Expr1Label" runat="server" Text='<%# Eval("Expr1") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                
            </td>
            <td style="vertical-align: top;">
                
                <asp:DetailsView 
                    ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    CellPadding="4" DataSourceID="AccessDataSource2" 
                    GridLines="None" Height="250px" Width="186px" AllowPaging="True" 
                    ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="tytul" HeaderText="Tytuł" SortExpression="tytul" />
                        <asp:BoundField DataField="numer" HeaderText="Numer" SortExpression="numer" />
                        <asp:BoundField DataField="dataAktualizacji" HeaderText="Data aktualizacji" 
                             DataFormatString="{0:d}" SortExpression="dataAktualizacji" />
                    </Fields>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                </asp:DetailsView>
                
                <br />
                
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
