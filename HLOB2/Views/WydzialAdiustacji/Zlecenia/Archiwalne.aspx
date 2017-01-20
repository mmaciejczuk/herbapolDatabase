<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Archiwalne.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Zlecenia.Archiwalne" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
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
                <strong>ZLECENIA:</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style6">
                
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
                </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:BulletedList ID="BulletedList1" runat="server" 
                    DataSourceID="AccessDataSource1" DataTextField="nazwa" 
                    DataValueField="polproduktId">
                </asp:BulletedList>
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty]">
                </asp:AccessDataSource>
                <cc1:PagingBulletedListExtender ID="PBLE1" runat="server"
                    TargetControlID="BulletedList1" 
                    ClientSort="true"
                    IndexSize="1"
                    Separator=" - "
                    SelectIndexCssClass="selectIndex"
                    UnselectIndexCssClass="unSelectIndex" />    
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:BulletedList ID="BulletedList2" 
                    runat="server" 
                    DisplayMode="LinkButton" 
                    OnClick="BulletedList1_Click">
                    <asp:ListItem Value="1">Alpina I</asp:ListItem>
                    <asp:ListItem Value="2">Alpina II</asp:ListItem>
                    <asp:ListItem Value="3">Alpina III</asp:ListItem>
                    <asp:ListItem Value="4">Alpina IV</asp:ListItem>
                    <asp:ListItem Value="5">Krajarka I</asp:ListItem>
                </asp:BulletedList>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="None" Font-Bold="True" 
                    Height="22px" Width="425px">Wybierz półprodukt, aby wyszukać...</asp:TextBox>
            <cc1:dropdownextender runat="server" ID="DDE"
                TargetControlID="TextBox1" DropDownControlID="ListBox1">
                </cc1:dropdownextender>
            </td>
        </tr>
        <tr>
            <td class="style5">
                </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="AccessDataSource1" 
                    DataTextField="nazwa" DataValueField="polproduktId" Width="422px" 
                    Height="279px"></asp:ListBox>
            </td>
        </tr>
        </table>

</asp:Content>
