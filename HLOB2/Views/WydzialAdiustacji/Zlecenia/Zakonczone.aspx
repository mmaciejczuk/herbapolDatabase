<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Zakonczone.aspx.cs" Inherits="HLOB2.Views.WydzialAdustacji.Zlecenia.Zakonczone" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style5
        {
            vertical-align: top;
            width: 618px;
        }
        .style6
        {            
            text-align: center; 
            vertical-align: middle;                    
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <table class="style1">
        <tr>
            <td>
                <strong>ZLECENIA ZAKOŃCZONE</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style6">
                
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="AccessDataSource2" DataTextField="nazwa" 
                    DataValueField="statusId" Width="234px">
                </asp:DropDownList>
                
            </td>
        </tr>
        <tr>
            <td class="style5">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5">
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" 
                    DataKeyNames="zlecenieId" DataSourceID="AccessDataSource1" AllowPaging="True" 
                    AllowSorting="True" CellPadding="1" ShowFooter="True"
                    ForeColor="#333333" PageSize="25" 
                    onrowdatabound="GridView1_RowDataBound" RowStyle-Height="10px"
                    BorderColor="#0066CC" BorderStyle="Solid" 
                    Font-Size="13px" BorderWidth="1px" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                            ItemStyle-HorizontalAlign="Center"
                            SelectImageUrl="~/Images/select.gif" SelectText="Wybierz"
                            ItemStyle-Width="20px">
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete"
                                    ItemStyle-BackColor="White" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numer" SortExpression="numer" ItemStyle-HorizontalAlign="Center" >
                            <ItemTemplate>
                                 <%# Eval("numer") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="70px" ID="TextBoxNumer" runat="server" Text="test"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Indeks" SortExpression="indeks" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("indeks") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="70px" ID="TextBoxIndeks" runat="server" Text="test"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Półprodukt" SortExpression="polprodukt" 
                            ItemStyle-Width="400px" >
                            <ItemTemplate>
                                 <%# Eval("polprodukt") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList Width="350px" ID="DropDownListPolprodukt" DataSourceID="AccessDataSource3" runat="server" 
                                DataTextField="nazwa" DataValueField="polproduktId" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seria" SortExpression="seria" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <%# Eval("seria") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="57px" ID="TextBoxSeria" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sur. [kg]" SortExpression="wagaSurowca" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="40px" >
                            <ItemTemplate>
                                 <%# Eval("wagaSurowca") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="37px" ID="TextBoxWagaSur" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Polpr. [kg]" SortExpression="wagaPolproduktu" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="40px" >
                            <ItemTemplate>
                                 <%# Eval("wagaPolproduktu")%>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="37px" ID="TextBoxWagaPolpr" runat="server" Text=""></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rozpoczęto" SortExpression="data_rozp" ItemStyle-HorizontalAlign="Center"  >
                            <ItemTemplate>
                                 <%# Eval("data_rozp", "{0:dd/MM/yyyy}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zakończono" SortExpression="data_zak" ItemStyle-HorizontalAlign="Center"  >
                            <ItemTemplate>
                                 <%# Eval("data_zak", "{0:dd/MM/yyyy}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="status"
                            ItemStyle-Width="110px" >
                            <ItemTemplate>
                                 <%# Eval("status") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button runat="server" ID="Insert" Text="Wstaw" CommandName="InsertNew" />
                                <asp:Button runat="server" ID="Cancel" Text="Anuluj" CommandName="CancelNew" />
                            </FooterTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderStyle="Solid" Width="40px" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" 
                        BackColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="Black" Font-Bold="True" />
                    <SortedAscendingHeaderStyle />
                    <SortedDescendingHeaderStyle />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Zlecenia] WHERE [zlecenieId] = ?" 
                    InsertCommand="INSERT INTO [Zlecenia] ([zlecenieId], [numer], [polprodukt], [seria], [wagaSurowca], 
                        [wagaPolproduktu], [uwagi], [data_rozp], [data_zak], [status], [zakonczone], [rozpoczete], 
                        [nierozpoczete]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT [zlecenieId], [numer], p.nazwa As polprodukt, p.indeks As indeks, [seria], 
                        [wagaSurowca], [wagaPolproduktu], z.uwagi, [data_rozp], [data_zak], [status], [zakonczone], 
                        [rozpoczete], [nierozpoczete] FROM [Zlecenia] z, Polprodukty p WHERE p.polproduktId=z.zlecenieId 
                        ORDER BY numer" 
                    UpdateCommand="UPDATE [Zlecenia] SET [numer] = ?, [polprodukt] = ?, [seria] = ?, [wagaSurowca] = ?, 
                        [wagaPolproduktu] = ?, [uwagi] = ?, [data_rozp] = ?, [data_zak] = ?, [status] = ?, [zakonczone] = ?, 
                        [rozpoczete] = ?, [nierozpoczete] = ? WHERE [zlecenieId] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="data_rozp" Type="DateTime" />
                        <asp:Parameter Name="data_zak" Type="DateTime" />
                        <asp:Parameter Name="zakonczone" Type="Boolean" />
                        <asp:Parameter Name="rozpoczete" Type="Boolean" />
                        <asp:Parameter Name="nierozpoczete" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="data_rozp" Type="DateTime" />
                        <asp:Parameter Name="data_zak" Type="DateTime" />
                        <asp:Parameter Name="zakonczone" Type="Boolean" />
                        <asp:Parameter Name="rozpoczete" Type="Boolean" />
                        <asp:Parameter Name="nierozpoczete" Type="Boolean" />
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [statusId], [nazwa] FROM [StatusyZlecen]">
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty]">
                </asp:AccessDataSource>
                
            </td>
        </tr>
        <tr>
            <td class="style5">
                
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
