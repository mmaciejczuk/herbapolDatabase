<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Realizacja.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Zlecenia.Realizacja" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .CalendarCSS  
        {  
            background-color:#99ccff;  
            color:Black;  
            }  
            
        .section{
         float:left;
         margin-right:50px;
         margin-top:10px;
         margin-bottom:10px;
         margin-left:5px;
         }
         
         #wrapper{
         }
         
        .DetailsViewClass
        {
            font-family: verdana,arial,sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
            border-style: solid;
        }
        .Header
        {
            background: #b5cfd2;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #999999;
        }
        .Foter
        {
            background: #dcddc0;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #999999;
        }
        .btn
        {
            background: #ffffff;
            border-width: 1px;
            padding: 2px;
            border-style: solid;
            border-color: #999999;
            font-family: verdana,arial,sans-serif;
            font-size: 11px;
        }
        .textbox
        {
            border-width: 1px;
            padding: 1px;
            border-style: solid;
            border-color: #999999;
            font-family: verdana,arial,sans-serif;
            font-size: 11px;
            width: 100px;
        }
        .style1
        {
            width: 100%;
        }
        .style3
        {
            font-size: small;
            color: #003300;
        }
        .cpHeader
        {
            color: black;
            background-color: #cccc99;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 12px;
            cursor: pointer;
            width:900px;
            height:15px;
            padding: 4px;            
        }
        .cpBody
        {
            background-color: #EEEEEE;
            font: normal 14px auto Verdana, Arial;
            font-style:italic;
            border: 1px gray;                
            width:900px;            
            padding: 4px;
            padding-top: 2px;
            height:0px;
            overflow: hidden; 
        }
        .cpHeaderOEE
        {
            color: black;
            background-color: #cccc99;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 12px;
            cursor: pointer;
            width:600px;
            height:15px;
            padding: 4px;   
            margin-top:20px;         
        }
        .cpBodyOEE
        {
            background-color: #EEEEEE;
            font: normal 14px auto Verdana, Arial;
            font-style:italic;
            border: 1px gray;                
            width:600px;            
            padding: 4px;
            padding-top: 2px;
            height:0px;
            overflow: hidden; 
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<table class="style1">
    <tr>
        <td>
            <strong>REALIZACJA:<asp:ScriptManager ID="ScriptManager1" runat="server" 
                EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
                </strong></td>
    </tr>
    <tr>
        <td>
            <hr /></td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td class="style3">
            
            <asp:Label ID="LabelInfo2" runat="server" BackColor="White" 
                ForeColor="#003366" Font-Bold="True" style="font-family: Verdana"></asp:Label>
        </td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanelAdiustacja" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader">
                        <asp:Label ID="lblText" runat="server" ForeColor="#006600" Font-Bold="True" />
                    </asp:Panel>
                    <asp:Panel ID="pBody" runat="server" CssClass="cpBody" >

            <asp:ListView ID="ListViewWydzialAdiustacji" runat="server" DataKeyNames="formularzId,zlecenie">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                Text='<%# Bind("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiOdpTextBox" runat="server" 
                                Text='<%# Bind("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" 
                                Text='<%# Bind("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" 
                                Text='<%# Bind("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
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
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                Text='<%# Bind("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiOdpTextBox" runat="server" 
                                Text='<%# Bind("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" 
                                Text='<%# Bind("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" 
                                Text='<%# Bind("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:LinkButton ID="LabelZlecenie" runat="server" Text="Select" CommandName="Select">
                            </asp:LinkButton>
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="dataRozpoczeciaLabel" runat="server" 
                                Text='<%# Eval("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="dataZakonczeniaLabel" runat="server" 
                                Text='<%# Eval("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="workiPpLabel" runat="server" Text='<%# Eval("workiPp") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="paletyLabel" runat="server" Text='<%# Eval("palety") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="workiOdpLabel" runat="server" Text='<%# Eval("workiOdp") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td style="width:200px">
                            <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr id="Tr3" runat="server" style="background-color: #b5cfd2; color: White; height: 40px">
                                        <th id="Th0" runat="server">
                                            Zlecenie</th>
                                        <th id="Th1" runat="server">
                                            Rozpoczęcie</th>
                                        <th id="Th2" runat="server">
                                            Zakończenie</th>
                                        <th id="Th3" runat="server">
                                            Półprodukt [kg]</th>
                                        <th id="Th4" runat="server">
                                            Worki [szt]</th>
                                        <th id="Th5" runat="server">
                                            Palety [szt]</th>
                                        <th id="Th6" runat="server">
                                            Odpad [kg]</th>
                                        <th id="Th7" runat="server">
                                            Worki [szt]</th>
                                        <th id="Th8" runat="server">
                                            Rg.</th>
                                        <th id="Th9" runat="server">
                                            Mg.</th>
                                        <th id="Th10" runat="server">
                                            Uwagi do serii</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                   <tr style="background-color: #66cc33; color: Black;">
                        <td>
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="dataRozpoczeciaLabel" runat="server" 
                                Text='<%# Eval("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dataZakonczeniaLabel" runat="server" 
                                Text='<%# Eval("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:Label ID="workiPpLabel" runat="server" Text='<%# Eval("workiPp") %>' />
                        </td>
                        <td>
                            <asp:Label ID="paletyLabel" runat="server" Text='<%# Eval("palety") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:Label ID="workiOdpLabel" runat="server" Text='<%# Eval("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

                <div class="section">
                        <asp:DetailsView ID="DetailsViewRealizacjaWA" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" CssClass="DetailsViewClass" 
                            DataKeyNames="realizacjaId, formularzId" DataSourceID="AccessDataSource1" 
                            Height="50px" Width="190px">
                            <Fields>
                                <asp:TemplateField HeaderText="Data produkcji">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        Text='<%# Eval("dataWykonania") %>' Font-Names="Tahoma"
                                        ID="TextBoxDataWykonania" runat="server" Width="100" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gniazdo">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListGnazdaWA" runat="server"
                                            DataSourceID="AccessDataSourceGniazda"
                                            Font-Names="Tahoma"  Width="100px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="gniazdoId">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operacja">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListOperacjeWA" runat="server"
                                            DataSourceID="AccessDataSourceOperacje"
                                            Font-Names="Tahoma"  Width="100px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="operacjaId">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zmiana">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListZmiana" Font-Names="Tahoma"
                                        Height="20px" Width="100px" Font-Size="13px" runat="server"
                                        SelectedItem='<%# Eval("zmiana") %>' >
                                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                            <asp:ListItem Value="0" Text="I"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="II"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="III"></asp:ListItem>
                                        </asp:DropDownList>   
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Polprodukt[kg]">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaPolproduktu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaPolproduktu" runat="server" Width="100" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Odpad[kg]">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaOdpadu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaOdpadu" runat="server" Width="100" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("roboczogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxRoboczogodzinyDM" runat="server" Width="100" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("maszynogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxMaszynogodzinyDM" runat="server" Width="100" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OEE">
                                    <ItemTemplate>
                                        <asp:Button
                                        Text="Wyświetl" Font-Names="Tahoma" OnClick="button_Click"
                                        ID="ButtonOEE" runat="server" Width="100" Height="28px" 
                                        Font-Size="13px" ForeColor="Black"></asp:Button>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <PagerStyle CssClass="Foter" />
                            <FieldHeaderStyle CssClass="Header" Width="80px" />
                            <FooterStyle Width="100px" />
                        </asp:DetailsView>

                    </div>



                    <div class="section">
                           
                        <asp:ListView ID="ListView1" runat="server"
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSource1">
                            <EmptyDataTemplate>
                                <table id="Table3" runat="server" style="">
                                    <tr>
                                        <td>
                                            No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="font-size:14px;">
                        <td style="width:40px; text-align:center;">
                            <asp:Image runat="server" ID="imagePoint" ImageUrl="~/Images/bullet-point.gif" />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="operacjaLabel" runat="server" Text='<%# Eval("operacja") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="zmianaLabel" runat="server" Text='<%# Eval("zmiana") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table3" runat="server">
                        <tr id="Tr2" runat="server">
                            <td id="Td2" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr4" runat="server" style="font-size:14px;">
                                        <th id="Th11" runat="server">
                                            </th>
                                        <th id="Th12" runat="server">
                                            operacja</th>
                                        <th id="Th13" runat="server">
                                            zmiana</th>
                                        <th id="Th14" runat="server">
                                            wagaPp</th>
                                        <th id="Th15" runat="server">
                                            wagaOdp</th>
                                        <th id="Th16" runat="server">
                                            Rb.</th>
                                        <th id="Th17" runat="server">
                                            Mg.</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr5" runat="server">
                            <td id="Td3" runat="server" style="">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
               </asp:ListView>

            </div>


           </asp:Panel>
           <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pBody" 
               CollapseControlID="pHeader" ExpandControlID="pHeader" TextLabelID="lblText" 
               CollapsedText="Wydział Adustacji (Rozwiń...)" 
               ExpandedText="Wydział Adustacji (Zwiń...)" 
               CollapsedSize="0"
               ExpandedImage="~/Images/asc.gif"
               CollapsedImage="~/Images/desc.gif">
            </cc1:CollapsiblePanelExtender>            

           </ContentTemplate>
           </asp:UpdatePanel>
      </td>
   </tr>

</table>
<table class="style1">
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pHeader2" runat="server" CssClass="cpHeader">
                        <asp:Label ID="Label1" runat="server" ForeColor="#663300" Font-Bold="True" />
                    </asp:Panel>
                    <asp:Panel ID="pBody2" runat="server" CssClass="cpBody" >

            <asp:ListView ID="ListViewDzialMagazynow" runat="server" DataKeyNames="formularzId,zlecenie"  >

                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                Text='<%# Bind("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiOdpTextBox" runat="server" 
                                Text='<%# Bind("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" 
                                Text='<%# Bind("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" 
                                Text='<%# Bind("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
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
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" 
                                Text='<%# Bind("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="workiOdpTextBox" runat="server" 
                                Text='<%# Bind("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" 
                                Text='<%# Bind("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" 
                                Text='<%# Bind("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:LinkButton ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:LinkButton>
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="dataRozpoczeciaLabel" runat="server" 
                                Text='<%# Eval("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="dataZakonczeniaLabel" runat="server" 
                                Text='<%# Eval("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="workiPpLabel" runat="server" Text='<%# Eval("workiPp") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="paletyLabel" runat="server" Text='<%# Eval("palety") %>' />
                        </td>
                        <td style="width:80px">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="workiOdpLabel" runat="server" Text='<%# Eval("workiOdp") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:50px">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td style="width:200px">
                            <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                        <tr id="Tr3" runat="server" style="background-color: #666666; color: White; height: 40px">
                                        <th id="Th0" runat="server">
                                            Zlecenie</th>
                                        <th id="Th1" runat="server">
                                            Rozpoczęcie</th>
                                        <th id="Th2" runat="server">
                                            Zakończenie</th>
                                        <th id="Th3" runat="server">
                                            Półprodukt [kg]</th>
                                        <th id="Th4" runat="server">
                                            Worki [szt]</th>
                                        <th id="Th5" runat="server">
                                            Palety [szt]</th>
                                        <th id="Th6" runat="server">
                                            Odpad [kg]</th>
                                        <th id="Th7" runat="server">
                                            Worki [szt]</th>
                                        <th id="Th8" runat="server">
                                            Rg.</th>
                                        <th id="Th9" runat="server">
                                            Mg.</th>
                                        <th id="Th10" runat="server">
                                            Uwagi do serii</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                   <tr style="background-color: #66cc33; color: Black;">
                        <td>
                            <asp:Label ID="LabelZlecenie" runat="server" Text='<%# Eval("zlecenie") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="dataRozpoczeciaLabel" runat="server" 
                                Text='<%# Eval("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="dataZakonczeniaLabel" runat="server" 
                                Text='<%# Eval("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td>
                            <asp:Label ID="workiPpLabel" runat="server" Text='<%# Eval("workiPp") %>' />
                        </td>
                        <td>
                            <asp:Label ID="paletyLabel" runat="server" Text='<%# Eval("palety") %>' />
                        </td>
                        <td>
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td>
                            <asp:Label ID="workiOdpLabel" runat="server" Text='<%# Eval("workiOdp") %>' />
                        </td>
                        <td>
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td>
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td>
                            <asp:Label ID="uwagiLabel" runat="server" Text='<%# Eval("uwagi") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
              <div id="wrapperDM">
                <div class="section">
                        <asp:DetailsView ID="DetailsViewRealizacjaWA0" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" CssClass="DetailsViewClass" 
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSource1" 
                            Height="50px" Width="190px">
                            <Fields>
                                <asp:TemplateField HeaderText="Data produkcji">
                                    <ItemTemplate>   
                                        <asp:TextBox ID="TextBoxDataWykonania0" runat="server" Font-Names="Tahoma" 
                                            Font-Size="13px" ForeColor="Black" Height="25px" MaxLength="5" 
                                            Text='<%# Eval("dataWykonania") %>' Width="100"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operacja">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("operacja") %>' Font-Names="Tahoma"
                                        ID="TextBoxOperacja0" runat="server" Width="100" Height="25px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zmiana">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Polprodukt[kg]">
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Odpad[kg]">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownListZmiana0" runat="server" Font-Names="Tahoma" 
                                            Font-Size="13px" Height="25px" SelectedItem='<%# Eval("zmiana") %>' 
                                            Width="100px">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="I" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="II" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="III" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaPolproduktu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaPolproduktu0" runat="server" Width="100" Height="25px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxRoboczogodzinyDM0" runat="server" Font-Names="Tahoma" 
                                            Font-Size="13px" ForeColor="Black" Height="25px" MaxLength="5" 
                                            Text='<%# Eval("roboczogodziny") %>' Width="100"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaOdpadu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaOdpadu0" runat="server" Width="100" Height="25px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                                    </ItemTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBoxMaszynogodzinyDM0" runat="server" Font-Names="Tahoma" 
                                            Font-Size="13px" ForeColor="Black" Height="25px" MaxLength="5" 
                                            Text='<%# Eval("maszynogodziny") %>' Width="100"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <PagerStyle CssClass="Foter" />
                            <FieldHeaderStyle CssClass="Header" Width="80px" />
                            <FooterStyle Width="100px" />
                        </asp:DetailsView>


                    </div>
                    <div class="section">
                           
                        <asp:ListView ID="ListViewDzialMagazynowSzczegoly" runat="server"
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSource1">
                            <EmptyDataTemplate>
                                <table id="Table3" runat="server" style="">
                                    <tr>
                                        <td>
                                            No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="">
                        <td style="width:40px; text-align:center;">
                            <asp:Image runat="server" ID="imagePoint" ImageUrl="~/Images/bullet-point.gif" />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="operacjaLabel" runat="server" Text='<%# Eval("operacja") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="zmianaLabel" runat="server" Text='<%# Eval("zmiana") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:50px;">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table3" runat="server">
                        <tr id="Tr2" runat="server">
                            <td id="Td2" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="Tr4" runat="server" style="">
                                        <th id="Th11" runat="server">
                                            </th>
                                        <th id="Th12" runat="server">
                                            operacja</th>
                                        <th id="Th13" runat="server">
                                            zmiana</th>
                                        <th id="Th14" runat="server">
                                            wagaPp</th>
                                        <th id="Th15" runat="server">
                                            wagaOdp</th>
                                        <th id="Th16" runat="server">
                                            Rb.</th>
                                        <th id="Th17" runat="server">
                                            Mg.</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr5" runat="server">
                            <td id="Td3" runat="server" style="">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
               </asp:ListView>
                    </div>
                   </div>                  
           </asp:Panel>
           <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" TargetControlID="pBody2" 
               CollapseControlID="pHeader2" ExpandControlID="pHeader2" TextLabelID="Label1" 
               CollapsedText="Dział Magazynów i Transportu (Rozwiń...)" 
               ExpandedText="Dział Magazynów i Transportu (Zwiń...)" 
               CollapsedSize="0"
               ExpandedImage="~/Images/asc.gif"
               CollapsedImage="~/Images/desc.gif">
            </cc1:CollapsiblePanelExtender>            

           </ContentTemplate>
           </asp:UpdatePanel>
           
      </td>
   </tr>

</table>
<table class="style1">
    <tr>
        <td>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [realizacjaId], [formularzId], [dzialId], [gniazdo], [operacja], [dataWykonania], 
                [zmiana], [wagaPolproduktu], [workiPp], [wagaOdpadu], [workiOdp], [roboczogodziny], 
                [maszynogodziny] FROM [RealizacjeDzienne]">
            </asp:AccessDataSource>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                            DataFile="~/App_Data/BazaHLOB.mdb" 
                            SelectCommand="SELECT [realizacjaId], [id_oee], [odprawa], [zmiana_asort], [rozp_prod], 
                            [zak_prod], [czyszczenie], [brak_zlecenia], [szkolenie], [proby_techn], [przeglad_masz], 
                            [modern_masz], [remont_masz], [awaria_mech], [zmiania_ust], [wymiana_noz], [czyszczenie_sit], 
                            [czyszczenie_filtrow], [czyszczenie_rotopl], [brak_mechanika], [brak_surowca], [brak_obsady_wc], 
                            [brak_zwolnienia_dkj], [inne2], [czas_pracy_masz], [uwagi], [waga_pp] FROM [OEE]">
                        </asp:AccessDataSource>
            <asp:AccessDataSource ID="AccessDataSourceOperacje" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [operacjaId], [nazwa], [dzialId] FROM [Operacje] WHERE dzialId=1">
                <SelectParameters>
                    <asp:SessionParameter Name="dzialId" SessionField="dzial" Type="String" />
                </SelectParameters> 
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="AccessDataSourceGniazda" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [gniazdoId], [nazwa], [dzial] FROM [Gniazda]">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>

</asp:Content>
