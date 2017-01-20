<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Specyfikacje.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Specyfikacje" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }        
        .style2
        {
            color: #996600;
        }
        .style3
        {
            color: #996600;
            width: 538px;
        }
        .style4
        {
            width: 538px;
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
      case "tytul":
        sortImage1.Visible = true;
        sortImage1.ImageUrl = imgUrl;
        sortImage2.Visible = false;
        sortImage3.Visible = false;
        break;
      case "numer":
        sortImage1.Visible = false;
        sortImage2.Visible = true;
        sortImage2.ImageUrl = imgUrl;
        sortImage3.Visible = false;
        break;
      case "dataAktualizacji":
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
                <strong>SPECYFIKACJE SUROWCÓW</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
</table>
<table class="style1">
    <tr>
        <td class="style3">
            
            <strong>Specyfikacje</strong></td>
        <td>
            
            &nbsp;</td>
        <td class="style2">
            
            <strong>Szczegóły</strong></td>
    </tr>
    <tr>
        <td style="vertical-align: top;" class="style4">
            
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="specyfikacjaId"
                DataSourceID="AccessDataSourceSpecyfikacje" OnSorting="ContactsListView_Sorting">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                         <td style="width:30px">
                                <asp:LinkButton ID="LinkButton2" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:80px; text-align:left" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("tytul") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td style="width:200px; text-align:center" >
                                <asp:Label ID="Expr1Label" runat="server" 
                                Text='<%# Eval("dataAktualizacji", "{0:yyyy/MM/dd}") %>' />
                            </td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                            <td style="width:30px">
                                <asp:LinkButton ID="LinkButton2" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:80px; text-align:left" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("tytul") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td style="width:200px; text-align:center" >
                                <asp:Label ID="Expr1Label" runat="server" 
                                Text='<%# Eval("dataAktualizacji", "{0:yyyy/MM/dd}") %>' />
                            </td>
                        </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr runat="server" style="background-color: #666666; color: White; height: 40px">
                                         <td>
                                            <asp:Label runat="server" ID="Label1"
                                              Text="" 
                                              CommandArgument="tytul"/>
                                          </td>
                                        <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByIndeksButton"
                                              CommandName="Sort" Text="Tytuł" Width="240px" 
                                              CommandArgument="tytul" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage1" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
                                          <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByNazwaButton"
                                              CommandName="Sort" Text="Numer" Width="80px"
                                              CommandArgument="numer" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage2" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
                                          <td style="text-align:center;">
                                            <asp:LinkButton runat="server" ID="SortByExpr1Button"
                                              CommandName="Sort" Text="Zaktualizowano" Width="100px"
                                              CommandArgument="dataAktualizacji" ForeColor="White" />
                                            <asp:Image runat="server" ID="SortImage3" 
                                              ImageUrl="~/Images/asc.gif" Visible="false" />
                                          </td>
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
                    <asp:DataPager runat="server" ID="SpecyfikacjeDataPager" PageSize="28">
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
                                <asp:LinkButton ID="LinkButton2" runat="server"
                                CommandName="Select">>></asp:LinkButton>
                            </td>
                            <td style="width:80px; text-align:left" >
                                <asp:Label ID="indeksLabel" runat="server" Text='<%# Eval("tytul") %>' />
                            </td>
                            <td style="width:150px; text-align:left" >
                                <asp:Label ID="nazwaLabel" runat="server" Text='<%# Eval("numer") %>' />
                            </td>
                            <td style="width:200px; text-align:center" >
                                <asp:Label ID="Expr1Label" runat="server" 
                                Text='<%# Eval("dataAktualizacji", "{0:yyyy/MM/dd}") %>' />
                            </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
        </td>
        <td>
            
            &nbsp;</td>
        <td>
            
            <asp:DetailsView ID="DetailsViewSzczegoly" runat="server" AutoGenerateRows="False" 
                BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                CellPadding="3" DataSourceID="AccessDataSourceSpecyfikacjeSzczegoly" 
                ForeColor="Black" GridLines="None" Height="50px" Width="370px" 
                DataKeyNames="specyfikacjaId" >
                <RowStyle BackColor="#CCCCCC" Font-Size="13px" />
                <AlternatingRowStyle BackColor="#ffffff" Font-Size="13px" />
                <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <Fields>
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
                    <asp:BoundField DataField="cecha19" HeaderText="" 
                        SortExpression="cecha19" />
                    <asp:BoundField DataField="wymagania19" HeaderText="" 
                        SortExpression="wymagania19" />
                    <asp:BoundField DataField="cecha20" HeaderText="" 
                        SortExpression="cecha20" />
                    <asp:BoundField DataField="wymagania20" HeaderText="" 
                        SortExpression="wymagania20" />
                    <asp:BoundField DataField="cecha21" HeaderText="" 
                        SortExpression="cecha21" />
                    <asp:BoundField DataField="wymagania21" HeaderText="" 
                        SortExpression="wymagania21" />
                    <asp:BoundField DataField="cecha22" HeaderText="" 
                        SortExpression="cecha22" />
                    <asp:BoundField DataField="wymagania22" HeaderText="" 
                        SortExpression="wymagania22" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            </asp:DetailsView>           
        </td>
    </tr>
</table>
            <asp:AccessDataSource ID="AccessDataSourceSpecyfikacje" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [specyfikacjaId], [tytul], [numer], [dataAktualizacji]
                    FROM [SpecyfikacjeSurowcow] ORDER BY tytul">
             </asp:AccessDataSource>

            <asp:AccessDataSource ID="AccessDataSourceSpecyfikacjeSzczegoly" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [specyfikacjaId], [cecha1], [wymagania1], [cecha2], [wymagania2], [cecha3], 
                [wymagania3], [cecha4], [wymagania4], [cecha5], [wymagania5], [cecha6], [wymagania6], 
                [cecha7], [wymagania7], [cecha8], [wymagania8], [cecha9], [wymagania9], [cecha10], 
                [wymagania10], [cecha11], [wymagania11], [cecha12], [wymagania12], [cecha13], 
                [wymagania13], [cecha14], [wymagania14], [cecha15], [wymagania15], [cecha16], 
                [wymagania16], [cecha17], [wymagania17], [cecha18], [wymagania18], [cecha19], 
                [wymagania19], [cecha20], [wymagania20], [cecha21], [wymagania21], [cecha22], [wymagania22] 
                FROM [SpecyfikacjeSurowcow]
                WHERE specyfikacjaId=?">
                <SelectParameters>
                      <asp:ControlParameter ControlID="ListView1"
                       Name="specyfikacjaId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>

</asp:Content>
