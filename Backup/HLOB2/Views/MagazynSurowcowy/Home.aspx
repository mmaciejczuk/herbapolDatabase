<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MagazynSurowcowy.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HLOB2.Views.DzialSurowcowy.DzialSurowcowy" %>
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
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table class="style1">
        <tr>
            <td>
                <strong>HOME</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
   <table class="style1">
        <tr>
            <td>
                <asp:Label ID="LabelLog" runat="server"></asp:Label>
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
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp; <span class="style3">&nbsp;</span><span class="style2"><strong><span 
                    class="style3">Aktualności:</span></strong></span></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:ListView ID="ListView1" runat="server" DataSourceID="AccessDataSource1">
                    <AlternatingItemTemplate>
                        <li style="background-color: #FAFAD2;color: #284775;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataDodania") %>' />
                            <br>
                            </br> 
                            <asp:Label ID="trescLabel" runat="server" Text='<%# Eval("tresc") %>' />
                            <br />
                            <br />
                        </li>
                    </AlternatingItemTemplate>                   
                    <ItemSeparatorTemplate>
                    <br />
                    </ItemSeparatorTemplate>
                    <ItemTemplate>
                        <li style="background-color: #FFFBD6;color: #333333;">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("dataDodania") %>' />
                            <br>
                            </br> 
                            <asp:Label ID="trescLabel" runat="server" Text='<%# Eval("tresc") %>' />
                            <br />
                            <br />
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul ID="itemPlaceholderContainer" runat="server" 
                            style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                        <div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT tresc, dataDodania FROM Aktualności WHERE dzial=3">
                </asp:AccessDataSource>
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
    </table>
</asp:Content>
