<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="HLOB2.Logowanie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 357px;
        }
        .style3
        {
            width: 357px;
            color: #003300;
        }
        .style4
        {
            color: #003300;
        }
        .style5
        {
            width: 357px;
            height: 21px;
        }
        .style6
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>LOGOWANIE</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
        <table class="style1">
            <tr>
                <td class="style2">
                
                </td>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    <asp:Label ID="LabelError" runat="server" ForeColor="#CC3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3" style="text-align: right">
                
                    Login:
                
                </td>
                <td>
                
                    <asp:TextBox ID="TextBoxLogin" runat="server" Width="146px" BackColor="#FFFFCC"></asp:TextBox>
                &nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorLogin" runat="server" 
                        ControlToValidate="TextBoxLogin" ErrorMessage="Wprowadź login" 
                        ForeColor="#CC3300"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" style="text-align: right">
                
                    <span class="style4">Hasło</span>:
                
                </td>
                <td>
                
                    <asp:TextBox ID="TextBoxHaslo" runat="server" Width="146px" BackColor="#FFFFCC"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorHaslo" runat="server" 
                        ControlToValidate="TextBoxHaslo" ErrorMessage="Wprowadź hasło" 
                        ForeColor="#CC3300"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Zapamiętaj moje dane" 
                        oncheckedchanged="CheckBox1_CheckedChanged" style="color: #003300" />
                </td>
            </tr>
            <tr>
                <td class="style5">
                
                    </td>
                <td class="style6">
                
                    </td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                    &nbsp;
                    <asp:Button ID="ButtonZaloguj" runat="server" Text="Zaloguj" Width="127px" 
                        BackColor="Silver" />
                
                </td>
            </tr>
            <tr>
                <td class="style2">
                
                    &nbsp;</td>
                <td>
                
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>
