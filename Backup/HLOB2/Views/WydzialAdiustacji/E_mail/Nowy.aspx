<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Nowy.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.E_mail.Nowy" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="HTMLEditor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .CustomEditorStyle .ajax__htmleditor_editor_toptoolbar {
        background-color:#F0F0F0; padding: 0px 0px 2px 2px;
        }
        .style2
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table class="style1">
    <tr>
        <td>
            <strong>NOWY E-MAIL:</strong></td>
    </tr>
    <tr>
        <td>
            <hr /></td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td class="style2">
            
                &nbsp;</td>
        <td>
            
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
        </td>
    </tr>
    <tr>
        <td class="style2">
                <asp:Label ID="Temat0" runat="server" Text="Nadawca:"></asp:Label>
                
        </td>
        <td style="height:20px;">
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBoxNadawca" runat="server" Width="200px" 
                    BackColor="#FFFFCC"></asp:TextBox>
                
        </td>
    </tr>
    <tr>
        <td class="style2">
            
                <asp:Label ID="Temat" runat="server" Text="Temat: "></asp:Label>
                
        </td>
        <td>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBoxTemat" runat="server" Width="400px" BackColor="#FFFFCC"></asp:TextBox>
                
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Propozycje"></asp:Label>
                :&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownListTematy" runat="server" AutoPostBack="True" 
                    BackColor="#FFFFCC" onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    Width="180px">
                </asp:DropDownList>
                
        </td>
    </tr>
    <tr>
        <td colspan="2">

        </td>
    </tr>
    <tr>
        <td colspan="2">           
          <HTMLEditor:Editor ID="Editor1" runat="server"
              Height="300px" 
              Width="100%"
              AutoFocus="true" />
        </td>
    </tr>
    <tr>
        <td style="text-align: right" colspan="2">
               
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: right" colspan="2">
               
            <asp:Button ID="Button1" runat="server" Text="Wyczyść" Width="100px" 
                BackColor="#99CCFF" Font-Bold="False" ForeColor="Black" Height="25px" 
                onclick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:Button ID="ButtonWyslij" runat="server" style="margin-left: 0px" Text="Wyślij" 
                Width="100px" onclick="ButtonWyslij_Click" BackColor="#99CCFF" 
                Font-Bold="False" ForeColor="Black" Height="25px" /> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
               
        </td>
    </tr>
    <tr>
        <td style="text-align: right" colspan="2">
               
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [gniazdoId], [nazwa] FROM [Gniazda]">
            </asp:AccessDataSource>
               
        </td>
    </tr>
</table>

</asp:Content>
