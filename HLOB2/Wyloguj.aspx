<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wyloguj.aspx.cs" Inherits="HLOB2.Wyloguj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
Zostałeś wylogowany.</br>
Aby zalogować się ponownie przejdź do 
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Home.aspx">strony startowej</asp:LinkButton>
    <br />
&nbsp;
</asp:Content>
