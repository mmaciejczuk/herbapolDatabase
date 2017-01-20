<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="DetailsViewExamples.aspx.cs" Inherits="HLOB2.Views.Admin.Operacje.DetailsViewExamples" %>
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
                <strong>DETAILSVIEW EXAMPLES</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
                
                </td>
            </tr>
            <tr>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                
                    <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                        AutoGenerateRows="False" CellPadding="4" DataKeyNames="surowiecId" 
                        DataSourceID="AccessDataSource1" ForeColor="#333333" GridLines="None" 
                        Height="228px" Width="404px"  OnDataBound="DetailsView2_DataBound">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="surowiecId" HeaderText="surowiecId" 
                                InsertVisible="False" ReadOnly="True" SortExpression="surowiecId" />
                            <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                        DataFile="~/App_Data/Test.mdb" 
                        DeleteCommand="DELETE FROM [Surowce] WHERE [surowiecId] = ?" 
                        InsertCommand="INSERT INTO [Surowce] ([surowiecId], [nazwa]) VALUES (?, ?)" 
                        SelectCommand="SELECT * FROM [Surowce]" 
                        UpdateCommand="UPDATE [Surowce] SET [nazwa] = ? WHERE [surowiecId] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="surowiecId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="surowiecId" Type="Int32" />
                            <asp:Parameter Name="nazwa" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nazwa" Type="String" />
                            <asp:Parameter Name="surowiecId" Type="Int32" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" 
                        DataSourceID="AccessDataSource2">
                        <AlternatingItemTemplate>
                            <tr style="background-color:#FFF8DC;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("surowiec") %>' />
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
                                    <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="surowiecTextBox" runat="server" 
                                        Text='<%# Bind("surowiec") %>' />
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
                                    <asp:TextBox ID="surowiecTextBox" runat="server" 
                                        Text='<%# Bind("surowiec") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="seriaTextBox" runat="server" Text='<%# Bind("seria") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="background-color:#DCDCDC;color: #000000;">
                                <td>
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("surowiec") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="seriaLabel" runat="server" Text='<%# Eval("seria", "{0:C}") %>' />
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
                                                    id</th>
                                                <th runat="server">
                                                    surowiec</th>
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
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="surowiecLabel" runat="server" Text='<%# Eval("surowiec") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="seriaLabel" runat="server" Text='<%# Eval("seria") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                        DataFile="~/App_Data/Test.mdb" 
                        SelectCommand="SELECT [id], [surowiec], [seria] FROM [Serie]">
                    </asp:AccessDataSource>
                
                </td>
            </tr>
        </table>
</asp:Content>
