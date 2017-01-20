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
         margin-right:30px;
         margin-top:10px;
         margin-bottom:10px;
         margin-left:5px;
         }
        .section2{
         float:left;
         margin-top:30px;
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
            background-color: #a35c5c;
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
            border: 1px gray;                
            width:900px;            
            padding: 4px;
            padding-top: 2px;
            height:0px;
            overflow: hidden; 
        }
        .naglowkiClass {
            font-style:italic;
            font: 12px auto "Trebuchet MS", Verdana;
        }
        .naglowkiClass2 {
            color: black;
            font: bold 12px auto Verdana, Arial;
        }
        .labeleRaportyClass {
            font-style:italic;
            color: black;
            font: bold 13px auto "Trebuchet MS", Verdana;
        }
        #progressbar1
        {
            margin-bottom: 1px;
            margin-top: 1px;           
            width:150px;
            padding:1px;
            background-color:white;
            border:1px solid black;
            height:14px;  
            float:left;
            vertical-align:top;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
            border-style: solid;
        }
        #indicator1
        {
          background-image:url("/Images/OEE_paski/shaded-green2-half.png");
        }
        .CalendarCSS  
        {  
            background-color:#892626;  
            color:#dcddc0;  
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
    <tr>
        <td class="style3">
            
            &nbsp;</td>
    </tr>
</table>
<table class="style1">
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanelAdiustacja" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader">
                        <asp:Label ID="lblText" runat="server" ForeColor="White" Font-Bold="True" />
                    </asp:Panel>
                    <asp:Panel ID="pBody" runat="server" CssClass="cpBody" >
            <asp:Label ID="LabelRaporty" class="labeleRaportyClass" runat="server" Text="&nbsp;Raport serii"></asp:Label>
            <asp:ListView ID="ListViewWydzialAdiustacji" runat="server" DataKeyNames="formularzId,zlecenie" 
                OnSelectedIndexChanged="ListViewWydzialAdiustacji_SelectedIndexChanged">

                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                Brak danych.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="background-color:#FFF8DC;">

                        <td style="width:60px">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Zapisz" />
                        </td>
                        <td style="width:90px">
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" Width="85px" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                                        <cc1:CalendarExtender Format="yyyy-MM-dd"
                                            ID="CalendarExtender1"  
                                            runat="server"  
                                            TargetControlID="dataRozpoczeciaTextBox"    
                                            CssClass="CalendarCSS" 
                                            >  
                                        </cc1:CalendarExtender> 
                        </td>
                        <td style="width:90px">
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" Width="85px" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                                        <cc1:CalendarExtender Format="yyyy-MM-dd"
                                            ID="CalendarExtender2"  
                                            runat="server"  
                                            TargetControlID="dataZakonczeniaTextBox"    
                                            CssClass="CalendarCSS" 
                                            >  
                                        </cc1:CalendarExtender> 
                        </td>
                        <td style="width:80px">
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" Width="75px"
                                Text='<%# Bind("wagaPolproduktu") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                    TargetControlID="wagaPolproduktuTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:40px">
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' Width="35px" />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    TargetControlID="workiPpTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:40px">
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' Width="35px" />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    TargetControlID="paletyTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                    TargetControlID="wagaOdpaduTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="workiOdpTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("workiOdp") %>' />
                                <cc1:FilteredTextBoxExtender ID="numer2Valid" runat="server"
                                    TargetControlID="workiOdpTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" Width="45px"
                                Text='<%# Bind("roboczogodziny") %>' />
                                <cc1:FilteredTextBoxExtender ID="surValid" runat="server"
                                    TargetControlID="roboczogodzinyTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("maszynogodziny") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server"
                                    TargetControlID="maszynogodzinyTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:230px">
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' Width="225px" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 1px #666666;">
                                        <tr id="Tr3" runat="server" style="background-color:#276767 ; color: White; height: 40px">
                                        <th id="Th19" class="naglowkiClass"  runat="server">
                                            </th>
                                        <th id="Th1" class="naglowkiClass"  runat="server">
                                            Rozpoczęcie</th>
                                        <th id="Th2" class="naglowkiClass"  runat="server">
                                            Zakończenie</th>
                                        <th id="Th3" class="naglowkiClass"  runat="server">
                                            Półprodukt [kg]</th>
                                        <th id="Th4" class="naglowkiClass"  runat="server">
                                            Worki [szt]</th>
                                        <th id="Th5" class="naglowkiClass"  runat="server">
                                            Palety [szt]</th>
                                        <th id="Th6" class="naglowkiClass"  runat="server">
                                            Odpad<br />[kg]</th>
                                        <th id="Th7" class="naglowkiClass"  runat="server">
                                            Worki [szt]</th>
                                        <th id="Th8" class="naglowkiClass"  runat="server">
                                            Rg.</th>
                                        <th id="Th9" class="naglowkiClass"  runat="server">
                                            Mg.</th>
                                        <th id="Th10" class="naglowkiClass"  runat="server">
                                            Uwagi do serii</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>

            </asp:ListView>
                <div class="section">
                    <asp:Label ID="LabelRaportZZ" class="labeleRaportyClass" runat="server" Text="Raporty ze zmiany"></asp:Label>
                        <asp:DetailsView ID="DetailsViewRealizacjaWA" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" CssClass="DetailsViewClass" 
                            DataKeyNames="realizacjaId, formularzId" DataSourceID="AccessDataSourcePodgladWA" 
                            Height="50px" Width="210px">
                            <Fields>
                                <asp:TemplateField HeaderText="Data produkcji">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        Text='<%# Eval("dataWykonania") %>' Font-Names="Tahoma"
                                        ID="TextBoxDataWykonania" runat="server" Width="160" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:CalendarExtender Format="yyyy-MM-dd"
                                            ID="CalendarExtender1"  
                                            runat="server"  
                                            TargetControlID="TextBoxDataWykonania"    
                                            CssClass="CalendarCSS" >  
                                        </cc1:CalendarExtender>  
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gniazdo">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListGnazdaWA" runat="server"
                                            DataSourceID="AccessDataSourceGniazda"
                                            Font-Names="Tahoma"  Width="160px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="gniazdoId" AppendDataBoundItems="True" >
                                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operacja">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListOperacjeWA" runat="server"
                                            DataSourceID="AccessDataSourceOperacjeWA"
                                            Font-Names="Tahoma"  Width="160px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="operacjaId" AppendDataBoundItems="True" >
                                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zmiana">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListZmiana" Font-Names="Tahoma"
                                        Height="20px" Width="160px" Font-Size="13px" runat="server"
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
                                        ID="TextBoxwagaPolproduktu" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server"
                                            TargetControlID="TextBoxwagaPolproduktu"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />         
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Odpad[kg]">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaOdpadu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaOdpadu" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server"
                                            TargetControlID="TextBoxwagaOdpadu"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("roboczogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxRoboczogodzinyWA" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server"
                                            TargetControlID="TextBoxRoboczogodzinyWA"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("maszynogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxMaszynogodzinyWA" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>    
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server"
                                            TargetControlID="TextBoxMaszynogodzinyWA"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />    
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



                    <div class="section2">
                           
                        <asp:ListView ID="ListViewPodgladWA" runat="server"
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSourcePodgladWA">
                            <EmptyDataTemplate>
                                <table id="Table3" runat="server" style="">
                                    <tr>
                                        <td>
                                            Brak danych.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="font-size:12px;">
                        <td style="width:25px; text-align:center;">
                            <asp:Image runat="server" ID="imagePoint" ImageUrl="~/Images/raport.png" />
                        </td>
                        <td style="width:30px; text-align:center">
                            <asp:Label ID="zmianaLabel" runat="server" Text='<%# Eval("zmiana") %>' />
                        </td>
                        <td style="width:150px; text-align:left">
                            <asp:Label ID="operacjaLabel" runat="server" Text='<%# Eval("operacja") %>' />
                        </td>
                        <td style="width:50px; text-align:right">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px; text-align:right">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:30px; text-align:right">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:30px; text-align:right"">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td style="width:150px;">
                            <div id="progressbar1">
                                <div id="indicator1"></div>
                                </div>
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
                                        <th id="Th12" class="naglowkiClass2" runat="server">
                                            zmiana</th>
                                        <th id="Th13" class="naglowkiClass2" runat="server">
                                            operacja</th>
                                        <th id="Th14" class="naglowkiClass2" runat="server">
                                            półprodukt<br />[kg]</th>
                                        <th id="Th15" class="naglowkiClass2" runat="server">
                                            odpad<br />[kg]</th>
                                        <th id="Th16" class="naglowkiClass2" runat="server">
                                            rb.</th>
                                        <th id="Th17" class="naglowkiClass2" runat="server">
                                            mg.</th>
                                        <th id="Th18" class="naglowkiClass2">Progress bar</th>
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

    <tr>
        <td>
            &nbsp;</td>
   </tr>

</table>
<table class="style1">
    <tr>
        <td>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pHeader2" runat="server" CssClass="cpHeader">
                        <asp:Label ID="Label1" runat="server" ForeColor="White" Font-Bold="True" />
                    </asp:Panel>
                    <asp:Panel ID="pBody2" runat="server" CssClass="cpBody" >
                    <asp:Label ID="Label2" class="labeleRaportyClass" runat="server" Text="&nbsp;Raport serii"></asp:Label>
            <asp:ListView ID="ListViewDzialMagazynow" runat="server" DataKeyNames="formularzId,zlecenie"  >

                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                Brak danych.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="background-color:#FFF8DC;">

                        <td style="width:60px">
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Zapisz" />
                        </td>
                        <td style="width:90px">
                            <asp:TextBox ID="dataRozpoczeciaTextBox" runat="server" Width="85px" 
                                Text='<%# Bind("dataRozpoczecia", "{0:yyyy/MM/dd}") %>' />
                                        <cc1:CalendarExtender Format="yyyy-MM-dd"
                                            ID="CalendarExtender1"  
                                            runat="server"  
                                            TargetControlID="dataRozpoczeciaTextBox"    
                                            CssClass="CalendarCSS" 
                                            >  
                                        </cc1:CalendarExtender> 
                        </td>
                        <td style="width:90px">
                            <asp:TextBox ID="dataZakonczeniaTextBox" runat="server" Width="85px" 
                                Text='<%# Bind("dataZakonczenia", "{0:yyyy/MM/dd}") %>' />
                                        <cc1:CalendarExtender Format="yyyy-MM-dd"
                                            ID="CalendarExtender2"  
                                            runat="server"  
                                            TargetControlID="dataZakonczeniaTextBox"    
                                            CssClass="CalendarCSS" 
                                            >  
                                        </cc1:CalendarExtender> 
                        </td>
                        <td style="width:80px">
                            <asp:TextBox ID="wagaPolproduktuTextBox" runat="server" Width="75px"
                                Text='<%# Bind("wagaPolproduktu") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                    TargetControlID="wagaPolproduktuTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:40px">
                            <asp:TextBox ID="workiPpTextBox" runat="server" Text='<%# Bind("workiPp") %>' Width="35px" />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    TargetControlID="workiPpTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:40px">
                            <asp:TextBox ID="paletyTextBox" runat="server" Text='<%# Bind("palety") %>' Width="35px" />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                    TargetControlID="paletyTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="wagaOdpaduTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("wagaOdpadu") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                    TargetControlID="wagaOdpaduTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="workiOdpTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("workiOdp") %>' />
                                <cc1:FilteredTextBoxExtender ID="numer2Valid" runat="server"
                                    TargetControlID="workiOdpTextBox"         
                                    FilterType="Custom, Numbers" /> 
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="roboczogodzinyTextBox" runat="server" Width="45px"
                                Text='<%# Bind("roboczogodziny") %>' />
                                <cc1:FilteredTextBoxExtender ID="surValid" runat="server"
                                    TargetControlID="roboczogodzinyTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:50px">
                            <asp:TextBox ID="maszynogodzinyTextBox" runat="server" Width="45px" 
                                Text='<%# Bind("maszynogodziny") %>' />
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender31" runat="server"
                                    TargetControlID="maszynogodzinyTextBox"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                        </td>
                        <td style="width:230px">
                            <asp:TextBox ID="uwagiTextBox" runat="server" Text='<%# Bind("uwagi") %>' Width="225px" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 1px #666666;">
                                        <tr id="Tr3" runat="server" style="background-color:#3c3c63 ; color: White; height: 40px">
                                        <th id="Th19" class="naglowkiClass"  runat="server">
                                            </th>
                                        <th id="Th1" class="naglowkiClass"  runat="server">
                                            Rozpoczęcie</th>
                                        <th id="Th2" class="naglowkiClass"  runat="server">
                                            Zakończenie</th>
                                        <th id="Th3" class="naglowkiClass"  runat="server">
                                            Półprodukt [kg]</th>
                                        <th id="Th4" class="naglowkiClass"  runat="server">
                                            Worki [szt]</th>
                                        <th id="Th5" class="naglowkiClass"  runat="server">
                                            Palety [szt]</th>
                                        <th id="Th6" class="naglowkiClass"  runat="server">
                                            Odpad<br />[kg]</th>
                                        <th id="Th7" class="naglowkiClass"  runat="server">
                                            Worki [szt]</th>
                                        <th id="Th8" class="naglowkiClass"  runat="server">
                                            Rg.</th>
                                        <th id="Th9" class="naglowkiClass"  runat="server">
                                            Mg.</th>
                                        <th id="Th10" class="naglowkiClass"  runat="server">
                                            Uwagi do serii</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
              <div id="wrapperDM">
                <div class="section">
                        <asp:Label ID="Label3" class="labeleRaportyClass" runat="server" Text="Raporty ze zmiany"></asp:Label>
                        <asp:DetailsView ID="DetailsViewRealizacjaDM" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" CellPadding="4" CssClass="DetailsViewClass" 
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSourcePodgladWA" 
                            Height="50px" Width="190px">
                            <Fields>
                                <asp:TemplateField HeaderText="Data produkcji">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        Text='<%# Eval("dataWykonania") %>' Font-Names="Tahoma"
                                        ID="TextBoxDataWykonania" runat="server" Width="160" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:CalendarExtender Format="dd-MM-yyyy"
                                            ID="CalendarExtender1"  
                                            runat="server"  
                                            TargetControlID="TextBoxDataWykonania"    
                                            CssClass="CalendarCSS" >  
                                        </cc1:CalendarExtender>  
                                    </ItemTemplate> 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Gniazdo">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListGnazdaWA" runat="server"
                                            DataSourceID="AccessDataSourceGniazda"
                                            Font-Names="Tahoma"  Width="160px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="gniazdoId" AppendDataBoundItems="True" >
                                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Operacja">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListOperacjeWA" runat="server"
                                            DataSourceID="AccessDataSourceOperacjeWA"
                                            Font-Names="Tahoma"  Width="160px" Height="20px" Font-Size="13px"
                                            DataTextField="nazwa" DataValueField="operacjaId" AppendDataBoundItems="True" >
                                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Zmiana">
                                    <ItemTemplate>   
                                        <asp:DropDownList ID="DropDownListZmiana" Font-Names="Tahoma"
                                        Height="20px" Width="160px" Font-Size="13px" runat="server"
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
                                        ID="TextBoxwagaPolproduktu" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender32" runat="server"
                                            TargetControlID="TextBoxwagaPolproduktu"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />         
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Odpad[kg]">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("wagaOdpadu") %>' Font-Names="Tahoma"
                                        ID="TextBoxwagaOdpadu" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender33" runat="server"
                                            TargetControlID="TextBoxwagaOdpadu"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Rg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("roboczogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxRoboczogodzinyWA" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox> 
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender34" runat="server"
                                            TargetControlID="TextBoxRoboczogodzinyWA"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mg.">
                                    <ItemTemplate>
                                        <asp:TextBox
                                        MaxLength="5" Text='<%# Eval("maszynogodziny") %>' Font-Names="Tahoma"
                                        ID="TextBoxMaszynogodzinyWA" runat="server" Width="160px" Height="20px" 
                                        Font-Size="13px" ForeColor="Black"></asp:TextBox>    
                                        <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender35" runat="server"
                                            TargetControlID="TextBoxMaszynogodzinyWA"         
                                            FilterType="Custom, Numbers"
                                            ValidChars="," />    
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
                    <div class="section2">
                           
                        <asp:ListView ID="ListViewDzialMagazynowSzczegoly" runat="server"
                            DataKeyNames="realizacjaId,formularzId" DataSourceID="AccessDataSourcePodgladWA">
                            <EmptyDataTemplate>
                                <table id="Table3" runat="server" style="">
                                    <tr>
                                        <td>
                                            Brak danych.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                <ItemTemplate>
                    <tr style="font-size:12px;">
                        <td style="width:25px; text-align:center;">
                            <asp:Image runat="server" ID="imagePoint" ImageUrl="~/Images/raport2.png" />
                        </td>
                        <td style="width:30px; text-align:center">
                            <asp:Label ID="zmianaLabel" runat="server" Text='<%# Eval("zmiana") %>' />
                        </td>
                        <td style="width:150px; text-align:left">
                            <asp:Label ID="operacjaLabel" runat="server" Text='<%# Eval("operacja") %>' />
                        </td>
                        <td style="width:50px; text-align:right">
                            <asp:Label ID="wagaPolproduktuLabel" runat="server" 
                                Text='<%# Eval("wagaPolproduktu") %>' />
                        </td>
                        <td style="width:50px; text-align:right">
                            <asp:Label ID="wagaOdpaduLabel" runat="server" 
                                Text='<%# Eval("wagaOdpadu") %>' />
                        </td>
                        <td style="width:30px; text-align:right">
                            <asp:Label ID="roboczogodzinyLabel" runat="server" 
                                Text='<%# Eval("roboczogodziny") %>' />
                        </td>
                        <td style="width:30px; text-align:right"">
                            <asp:Label ID="maszynogodzinyLabel" runat="server" 
                                Text='<%# Eval("maszynogodziny") %>' />
                        </td>
                        <td style="width:150px;">
                            <div id="progressbar1">
                                <div id="indicator1"></div>
                                </div>
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
                                        <th id="Th12" class="naglowkiClass2" runat="server">
                                            zmiana</th>
                                        <th id="Th13" class="naglowkiClass2" runat="server">
                                            operacja</th>
                                        <th id="Th14" class="naglowkiClass2" runat="server">
                                            półprodukt<br />[kg]</th>
                                        <th id="Th15" class="naglowkiClass2" runat="server">
                                            odpad<br />[kg]</th>
                                        <th id="Th16" class="naglowkiClass2" runat="server">
                                            rb.</th>
                                        <th id="Th17" class="naglowkiClass2" runat="server">
                                            mg.</th>
                                        <th id="Th18" class="naglowkiClass2">Progress bar</th>
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
            <asp:AccessDataSource ID="AccessDataSourcePodgladWA" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [realizacjaId], [formularzId], rd.dzialId, [gniazdo], o.nazwa As operacja, [dataWykonania], 
                [zmiana], [wagaPolproduktu], [workiPp], [wagaOdpadu], [workiOdp], [roboczogodziny], 
                [maszynogodziny] FROM RealizacjeDzienne rd, Operacje o WHERE rd.operacja=o.operacjaId">
            </asp:AccessDataSource>
                        <asp:AccessDataSource ID="AccessDataSource2" runat="server" 
                            DataFile="~/App_Data/BazaHLOB.mdb" 
                            SelectCommand="SELECT [realizacjaId], [id_oee], [odprawa], [zmiana_asort], [rozp_prod], 
                            [zak_prod], [czyszczenie], [brak_zlecenia], [szkolenie], [proby_techn], [przeglad_masz], 
                            [modern_masz], [remont_masz], [awaria_mech], [zmiania_ust], [wymiana_noz], [czyszczenie_sit], 
                            [czyszczenie_filtrow], [czyszczenie_rotopl], [brak_mechanika], [brak_surowca], [brak_obsady_wc], 
                            [brak_zwolnienia_dkj], [inne2], [czas_pracy_masz], [uwagi], [waga_pp] FROM [OEE]">
                        </asp:AccessDataSource>
            <asp:AccessDataSource ID="AccessDataSourceOperacjeWA" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [operacjaId], [nazwa], [dzialId] FROM [Operacje] WHERE dzialId=1">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="AccessDataSourceGniazda" runat="server" 
                DataFile="~/App_Data/BazaHLOB.mdb" 
                SelectCommand="SELECT [gniazdoId], [nazwa], [dzial] FROM [Gniazda] WHERE dzial=1">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>

</asp:Content>
