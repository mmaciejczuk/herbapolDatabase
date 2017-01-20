<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="HLOB2._Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="Bright.WebControls" namespace="Bright.WebControls" tagprefix="bri" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 279px;
        }
        .style5
        {
            width: 266px;
        }
    .style6
    {
            width: 220px;
        }
        .style7
        {
            width: 266px;
            height: 58px;
        }
        .style9
        {
            height: 58px;
        }
        .style16
        {
            width: 92px;
        }
        .style19
        {
            width: 220px;
            height: 197px;
        }
        .style20
        {
            width: 279px;
            height: 197px;
        }
    </style>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <table class="style1">
        <tr>
            <td class="style5">

                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
                </td>
            <td class="style6">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style9" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LabelError" runat="server" ForeColor="Red" 
                    Visible="False"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style5" rowspan="4">
                &nbsp;</td>
            <td class="style19">
                
                <asp:Panel ID="Panel1" runat="server" Height="200px" Width="400px" 
                    BackColor="#999966">
                    <table>
                        <tr>
                            <td style="text-align:right" class="style16">
                                &nbsp;</td>
                            <td style="width:350px; text-align:center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16" style="text-align:right">
                                <asp:Label runat="server" Text="Login:" ForeColor="#FFFF99"></asp:Label>
                                &nbsp;
                            </td>
                            <td style="width:350px; text-align:center">
                                <asp:TextBox ID="TextBoxLogin" runat="server" BackColor="#FFFFCC" 
                                    Width="146px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLogin" runat="server" 
                                    ControlToValidate="TextBoxLogin" ErrorMessage="Wprowadź login" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right" class="style16">
                                <asp:Label ID="Label1" runat="server" Text="Hasło:" ForeColor="#FFFF99"></asp:Label>
                                &nbsp;
                                </td>
                            <td style="width:350px; text-align:center">
                                <asp:TextBox ID="TextBoxHaslo" runat="server" BackColor="#FFFFCC" 
                                    TextMode="Password" Width="146px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorHaslo" runat="server" 
                                    ControlToValidate="TextBoxHaslo" ErrorMessage="Wprowadź hasło" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:center" class="style16">
                                &nbsp;</td>
                            <td style="width:350px; height:8px; text-align:left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style16" style="text-align:center">
                                &nbsp;</td>
                            <td style="width:350px; text-align:left">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:CheckBox ID="CheckBox1" runat="server" ForeColor="#FFFF99" 
                                    style="color: #003300" Text="Zapamiętaj moje dane" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style16" style="text-align:center">
                                &nbsp;</td>
                            <td style="width:350px; text-align:center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width:350px; text-align:center" colspan="2">
                                <asp:Button ID="ButtonZaloguj" runat="server" BackColor="Silver" Height="30px" 
                                    onclick="ButtonZaloguj_Click" style="margin-bottom: 0px" Text="Zaloguj" 
                                    Width="146px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width:350px; text-align:center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <cc1:DropShadowExtender ID="dse" runat="server"
                    TargetControlID="Panel1" 
                    Opacity=".8" 
                    Rounded="true"
                    TrackPosition="true" />
                
            </td>
            <td class="style20">
                </td>
        </tr>
        <tr>
            <td class="style6">
                
                    </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                
                    &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                
                    &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>
