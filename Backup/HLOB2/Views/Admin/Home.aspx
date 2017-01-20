<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HLOB2.Views.Admin.Startowa" %>
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
                <strong>WITAJ!!!</strong></td>
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
                <br />
            </br>
            </br>
                </td>
        </tr>
    </table>
</asp:Content>
