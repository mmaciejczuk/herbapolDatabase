<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="GeneratorSerii.aspx.cs" Inherits="HLOB2.Views.Admin.Operacje.GeneratorSerii" %>
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
                <strong>GENERATOR NUMERÓW SERII</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>

    <table class="style1">
        <tr>
            <td style="font-weight: 700">
                
                <asp:DropDownList ID="DropDownListPp" runat="server" AutoPostBack="True" 
                    DataSourceID="AccessDataSourcePp" DataTextField="nazwa" 
                    DataValueField="polproduktId" Height="28px" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="420px">
                </asp:DropDownList>
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBoxSeria2" runat="server" Height="25px" Width="176px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="zlecenieId" 
                    DataSourceID="AccessDataSourceSerie" InsertItemPosition="LastItem">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("zlecenieId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="seriaLabel" runat="server" Text='<%# Eval("seria") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <tr style="background-color:#008A8C;color: #FFFFFF;">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Cancel" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("zlecenieId") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="surowiecTextBox" runat="server" 
                                    Text='<%# Bind("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="seriaTextBox" runat="server" Text='<%# Bind("seria") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                                <asp:DropDownList ID="DropDownList1" DataSourceID="AccessDataSourcePolprodukty" 
                                OnSelectedIndexChanged="DropDownList_SelectedIndexChanged"
                                DataValueField="polproduktId" DataTextField="nazwa" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="seriaTextBox" runat="server" Text='<%# Bind("seria") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("zlecenieId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="seriaLabel" runat="server" Text='<%# Eval("seria") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server">
                                            </th>
                                            <th runat="server">
                                                zlecenie</th>
                                            <th runat="server">
                                                nazwa</th>
                                            <th runat="server">
                                                seria</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" 
                                    style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                                    Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("zlecenieId") %>' />
                            </td>
                            <td>
                                <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("polprodukt") %>' />
                            </td>
                            <td>
                                <asp:Label ID="seriaLabel" runat="server" Text='<%# Eval("seria") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                

                
            </td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                
                <asp:Button ID="ButtonWypelnij" runat="server" oncommand="ButtonWypelnij_Click" 
                    Text="Wypełnij pola" />
&nbsp; Dzień:
                <asp:TextBox ID="TextBoxDzien" runat="server" Height="25px"></asp:TextBox>
                &nbsp; Miesiąc:
                <asp:TextBox ID="TextBoxMiesiac" runat="server" Height="25px"></asp:TextBox>
&nbsp;Rok:
                <asp:TextBox ID="TextBoxRok" runat="server" Height="25px"></asp:TextBox>
&nbsp;
                
            </td>
        </tr>
        <tr>
            <td>
                
                &nbsp;</td>
        </tr>
        <tr>
            <td style="font-weight: 700">
                
                <asp:Button ID="ButtonSeria" runat="server" oncommand="ButtonSeria_Click" 
                    Text="Generuj serię" />
&nbsp; Seria:
                <asp:TextBox ID="TextBoxSeria" runat="server" BackColor="#CCFFCC" Height="25px"></asp:TextBox>
            </td>
        </tr>
    </table>

                <asp:AccessDataSource ID="AccessDataSourceSerie" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    
                    SelectCommand="SELECT z.zlecenieId As zlecenieId, p.nazwa As polprodukt, z.seria As seria 
                    FROM Zlecenia z, Polprodukty p WHERE z.polprodukt=p.polproduktId ORDER BY polprodukt"
                    InsertCommand="INSERT INTO [Zlecenia] ([polprodukt], [seria]) VALUES (?, ?)">
                    <InsertParameters>
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                    </InsertParameters>
                </asp:AccessDataSource>
                <asp:Accessdatasource ID="AccessDataSourcePolprodukty" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    
        SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty]">
                </asp:Accessdatasource>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        DeleteCommand="DELETE FROM [Dzialy] WHERE [dzialId] = ?" 
        InsertCommand="INSERT INTO [Dzialy] ([nazwa], [numer]) VALUES (?, ?)" 
        SelectCommand="SELECT * FROM [Dzialy]" 
        UpdateCommand="UPDATE [Dzialy] SET [nazwa] = ?, [numer] = ? WHERE [dzialId] = ?">
        <InsertParameters>
            <asp:Parameter Name="nazwa" Type="String" />
            <asp:Parameter Name="numer" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="dzialId" Type="Int32" />
            <asp:Parameter Name="nazwa" Type="String" />
            <asp:Parameter Name="numer" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="dzialId" Type="Int32" />
            <asp:Parameter Name="nazwa" Type="String" />
            <asp:Parameter Name="numer" Type="String" />
        </UpdateParameters>
    </asp:AccessDataSource>
                

                
                <asp:AccessDataSource ID="AccessDataSourcePp" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty] ORDER BY nazwa">
    </asp:AccessDataSource>
                

                
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True"
                    DataSourceID="AccessDataSource1" Height="50px" Width="125px" DataKeyNames="dzialId">
                    <Fields>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                            ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                

                
            </asp:Content>




