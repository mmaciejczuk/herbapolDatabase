<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Select.aspx.cs" Inherits="HLOB2.Test.ListView.Select" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ContactsListView" runat="server" DataKeyNames="ContactID" 
                    DataSourceID="AccessDataSource1"
                    OnDataBound="ContactsListView_DataBound"
                    OnSelectedIndexChanged="ContactsListView_SelectedIndexChanged"  
                    OnPagePropertiesChanged="ContactsListView_PagePropertiesChanged"
                    OnSorting="ContactsListView_Sorting">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailAddressLabel" runat="server" 
                                    Text='<%# Eval("EmailAddress") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
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
                                <asp:TextBox ID="FirstNameTextBox" runat="server" 
                                    Text='<%# Bind("FirstName") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LastNameTextBox" runat="server" 
                                    Text='<%# Bind("LastName") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="EmailAddressTextBox" runat="server" 
                                    Text='<%# Bind("EmailAddress") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="background-color:#DCDCDC;color: #000000;">
                            <td>
                                <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailAddressLabel" runat="server" 
                                    Text='<%# Eval("EmailAddress") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                          <asp:Button runat="server" ID="SortButton" 
                                CommandArgument="LastName" CommandName="Sort" Text="Sort" />
                          <asp:Button runat="server" ID="ClearButton" 
                                OnClick="ClearButton_Click" Text="Clear Selection" /><br />
                          <table cellpadding="2" border="1" runat="server" id="tblContacts" width="640px">
                                <tr runat="server" id="itemPlaceholder" />
                          </table>
                          <asp:DataPager runat="server" ID="PeopleDataPager" PageSize="20">
                            <Fields>
                              <asp:NextPreviousPagerField 
                                ShowFirstPageButton="true" ShowLastPageButton="true"
                                FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                                NextPageText=" &gt; " PreviousPageText=" &lt; " />
                            </Fields>
                          </asp:DataPager>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("ContactID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                            <td>
                                <asp:Label ID="EmailAddressLabel" runat="server" 
                                    Text='<%# Eval("EmailAddress") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/test.accdb" 
                    SelectCommand="SELECT [ContactID], [FirstName], [LastName], [EmailAddress] FROM [PersonContact]">
                </asp:AccessDataSource>
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
    </table>


</asp:Content>
