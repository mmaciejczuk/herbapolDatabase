<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Zlecenie.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Zlecenia.Zlecenie" %>
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="zlecenieId" 
                    DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF; color: #284775;">
                            <td>
                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                                    Text="Wybierz" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" 
                                    Text="Edytuj" />
                            </td>
                            <td>
                                <asp:Label ID="nrZleceniaLabel" runat="server" 
                                    Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="polproduktLabel" runat="server" 
                                    Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nrSeriiLabel" runat="server" 
                                    Text='<%# Eval("seria") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaSurowcaLabel" runat="server" 
                                    Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                    Text='<%# Eval("wagaPolproduktu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="liczbaWorkowLabel" runat="server" 
                                    Text='<%# Eval("worki") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                    Text='<%# Eval("wagaOdpadu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="aktualnyStatusLabel" runat="server" 
                                    Text='<%# Eval("status") %>' />
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
                                <asp:TextBox ID="nrZleceniaTextBox" runat="server" 
                                    Text='<%# Bind("numer") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="polproduktTextBox" runat="server" 
                                    Text='<%# Bind("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nrSeriiTextBox" runat="server" 
                                    Text='<%# Bind("seria") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaSurowcaTextBox" runat="server" 
                                    Text='<%# Bind("wagaSurowca") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                    Text='<%# Bind("wagaPolproduktu") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="liczbaWorkowTextBox" runat="server" 
                                    Text='<%# Bind("worki") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                    Text='<%# Bind("wagaOdpadu") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="aktualnyStatusTextBox" runat="server" 
                                    Text='<%# Bind("status") %>' />
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
                                    Text="Wstaw" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Wyczyść" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:TextBox ID="polproduktTextBox" runat="server" 
                                    Text='<%# Bind("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="nrSeriiTextBox" runat="server" 
                                    Text='<%# Bind("seria") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaSurowcaTextBox" runat="server" 
                                    Text='<%# Bind("wagaSurowca") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                    Text='<%# Bind("wagaPolproduktu") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="liczbaWorkowTextBox" runat="server" 
                                    Text='<%# Bind("worki") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                    Text='<%# Bind("wagaOdpadu") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="aktualnyStatusTextBox" runat="server" 
                                    Text='<%# Bind("status") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF; color: #333333;">
                            <td>
                                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                                    Text="Wybierz" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" 
                                    Text="Edytuj" />
                            </td>
                            <td>
                                <asp:Label ID="nrZleceniaLabel" runat="server" 
                                    Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="polproduktLabel" runat="server" 
                                    Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nrSeriiLabel" runat="server" 
                                    Text='<%# Eval("seria") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaSurowcaLabel" runat="server" 
                                    Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                    Text='<%# Eval("wagaPolproduktu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="liczbaWorkowLabel" runat="server" 
                                    Text='<%# Eval("worki") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                    Text='<%# Eval("wagaOdpadu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="aktualnyStatusLabel" runat="server" 
                                    Text='<%# Eval("status") %>' />
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
                                                </th>
                                            <th runat="server">
                                                Zlecenie</th>
                                            <th runat="server">
                                                Polprodukt</th>
                                            <th runat="server">
                                                Seria</th>
                                            <th runat="server">
                                                Surowiec[kg]</th>
                                            <th runat="server">
                                                Polprodukt[kg]</th>
                                            <th runat="server">
                                                Worki[szt]</th>
                                            <th runat="server">
                                                Odpad[kg]</th>
                                            <th runat="server">
                                                Status</th>
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
                                <asp:Label ID="nrZleceniaLabel" runat="server" 
                                    Text='<%# Eval("numer") %>' />
                            </td>
                            <td>
                                <asp:Label ID="polproduktLabel" runat="server" 
                                    Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="nrSeriiLabel" runat="server" 
                                    Text='<%# Eval("seria") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaSurowcaLabel" runat="server" 
                                    Text='<%# Eval("wagaSurowca") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                    Text='<%# Eval("wagaPolproduktu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="liczbaWorkowLabel" runat="server" 
                                    Text='<%# Eval("worki") %>' />
                            </td>
                            <td>
                                <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                    Text='<%# Eval("wagaOdpadu") %>' />
                            </td>
                            <td>
                                <asp:Label ID="aktualnyStatusLabel" runat="server" 
                                    Text='<%# Eval("status") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:hlobConnectionString %>" 
                    SelectCommand="SELECT * FROM [Zlecenia]"
                    DeleteCommand="DELETE FROM [Zlecenia] WHERE [zlecenieId] = @zlecenieId" 
                    InsertCommand="INSERT INTO [Zlecenia] ([numer], [polprodukt], [seria], [wagaSurowca], [wagaPolproduktu],
                        [worki], [wagaOdpadu], [status]) 
                        VALUES (@numer, @polprodukt, @seria, @wagaSurowca, @wagaPolproduktu, @worki, @wagaOdpadu, @status)" 
                    UpdateCommand="UPDATE [Zlecenia] SET [numer] = @numer, [polprodukt] = @polprodukt, [seria] = @seria, 
                        [wagaSurowca] = @wagaSurowca, [wagaPolproduktu] = @wagaPolproduktu, [worki] = @worki, 
                        [wagaOdpadu] = @wagaOdpadu, [status] = @status WHERE [zlecenieId] = @zlecenieId">
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="wagaPolproduktu" Type="Double" />
                        <asp:Parameter Name="worki" Type="Int32" />
                        <asp:Parameter Name="wagaOdpadu" Type="Double" />
                        <asp:Parameter Name="status" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="wagaPolproduktu" Type="Double" />
                        <asp:Parameter Name="worki" Type="Int32" />
                        <asp:Parameter Name="wagaOdpadu" Type="Double" />
                        <asp:Parameter Name="status" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
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
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
