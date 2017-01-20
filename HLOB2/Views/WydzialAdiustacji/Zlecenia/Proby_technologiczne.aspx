<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Proby_technologiczne.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Zlecenia.Proby_technologiczne" %>
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
                <strong>PRÓBY TECHNOLOGICZNE:</strong></td>
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
                    Font-Size="12px" BorderWidth="1px" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onrowcommand="GridView1_RowCommand" onprerender="GridView1_PreRender">
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
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete" Visible="false"/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numer" SortExpression="numer" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <%# Eval("numer") + "/219"%>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxNumer" runat="server" Text="" BackColor="#FFFFCC" MaxLength="5"></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxNumer2" runat="server" Text='<%# Eval("numer") %>' BackColor="#FFFFCC" MaxLength="5"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Indeks" SortExpression="indeks" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("indeks") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Półprodukt" SortExpression="polprodukt" 
                            ItemStyle-Width="370px" >
                            <ItemTemplate>
                                 <%# Eval("polprodukt") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList Width="365px" ID="DropDownListPolprodukt" DataSourceID="AccessDataSource3" runat="server" 
                                DataTextField="nazwa" DataValueField="polproduktId" BackColor="#FFFFCC" OnTextChanged="DropDownListChanged" Font-Size="12px" />
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList Width="365px" ID="DropDownListPolprodukt2" DataSourceID="AccessDataSource3" runat="server" 
                                DataTextField="nazwa" DataValueField="polproduktId" BackColor="#FFFFCC" OnTextChanged="DropDownListChanged" Font-Size="12px" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seria" SortExpression="seria" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="65px" >
                            <ItemTemplate>
                                 <%# Eval("seria") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="60px" Font-Size="12px" ID="TextBoxSeria" runat="server" Text="" BackColor="#FFFFCC" MaxLength="8"></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox Width="60px" Font-Size="12px" ID="TextBoxSeria2" Text='<%# Eval("seria") %>' runat="server" BackColor="#FFFFCC" MaxLength="8"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Surowiec [kg]" SortExpression="wagaSurowca" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <%# Eval("wagaSurowca", "{0:f}")%>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxWagaSur" runat="server" Text="" BackColor="#FFFFCC"></asp:TextBox>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxWagaSur2" Text='<%# Eval("wagaSurowca") %>' runat="server" BackColor="#FFFFCC"></asp:TextBox>                                
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Półprodukt [kg]" SortExpression="wagaPolproduktu" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("wagaPolproduktu", "{0:f}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="status"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("status") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                    ImageUrl="~/Images/ok.gif" CommandName="InsertNew" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" SortExpression=""
                            ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" Text="Edytuj" CommandName="Edit"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" Text="OK" CommandName="Update"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Anuluj" CommandName="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
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
                    InsertCommand="INSERT INTO [Zlecenia] ([zlecenieId], [numer], [polprodukt], [seria], [wagaSurowca]) VALUES (?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT [zlecenieId], [numer], p.nazwa As polprodukt, p.indeks As indeks, [seria], 
                        [wagaSurowca], [wagaPolproduktu], z.uwagi, [data_rozp], [data_zak], [status] 
                        FROM [Zlecenia] z, Polprodukty p WHERE p.polproduktId=z.zlecenieId 
                        ORDER BY numer"
                    UpdateCommand="UPDATE Zlecenia SET numer=@numer, polprodukt=@polprodukt, seria=@seria, wagaSurowca=@wagaSurowca">
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="status" Type="String" />
                    </InsertParameters>
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [statusId], [nazwa] FROM [StatusyZlecen]">
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSource3" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty] ORDER BY nazwa">
                </asp:AccessDataSource>
                
            </td>
        </tr>
        <tr>
            <td class="style5">
                
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
