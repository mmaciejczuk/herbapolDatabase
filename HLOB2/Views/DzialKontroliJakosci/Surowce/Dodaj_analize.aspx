<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Dodaj_analize.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Dodaj_analize" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            vertical-align:bottom
        }
        .style3
        {
            vertical-align:top;
        }
        .style7
        {
            width: 434px;
        }
        .style10
        {
            color: #996600;
            height: 10px;
        }
        .style14
        {            text-align: center;
        }
        .style16
        {
            width: 1240px;
            color: #333300;
        }
        .style17
        {
            width: 4px;
        }
        .style23
        {
            width: 377px;
        }
        .style28
        {
            width: 1541px;
        }
        .style29
        {
            width: 1541px;
            color: #996600;
            height: 10px;
        }
        .CalendarCSS  
        {  
            background-color:#99ccff;  
            color:Black;  
            }  
        
        .style35
        {
            height: 21px;
        }

        .style36
        {
            height: 89px;
        }

        .text
        {
            font-family:Tahoma;
            font-weight:bold;
            text-align:center;
            vertical-align:middle;           
        }
        .style37
        {
            color: #996600;
            text-align: center;
        }
        .style38
        {
            width: 1240px;
            color: #996600;
            height: 10px;
        }
        .style39
        {
            width: 377px;
            color: #996600;
            height: 10px;
        }
        .style40
        {
            width: 4px;
            font-weight: bold;
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
    </style>

    <script type="text/javascript" language="javascript">
        function checkbox_Checked(checkBox) {
            if (document.getElementById(checkBox).checked) {

                var e = document.getElementById('<%=DropDownListSpecyfikacje.ClientID%>');
                var specyfikacja = e.options[e.selectedIndex].value;

                if (checkBox == 'MainContent_ListViewPodsumowanie_zwolnionyCheckBox_0') {
                    document.getElementById('MainContent_ListViewPodsumowanie_TextBoxOrzeczenie_0').value =
                    'Badana próba odpowiada specyfikacji ' + specyfikacja + ' w zakresie badanych parametrów.';
                    document.getElementById('<%=LabelOrzeczenie.ClientID%>').innerHTML = 'ZWALNIAM ' + '&#8722;';
                    // innerText, value, ...
                }
                else if (checkBox == 'MainContent_ListViewPodsumowanie_zwolnionyWarunkowoCheckBox_0') {
                    document.getElementById('MainContent_ListViewPodsumowanie_TextBoxOrzeczenie_0').value =
                    'Badana próba nie odpowiada specyfikacji ' + specyfikacja + ' w zakresie badanych parametrów.';
                    document.getElementById('<%=LabelOrzeczenie.ClientID%>').innerHTML = 'ZWALNIAM WARUNKOWO ' + '&#8722;';
                }
                else if (checkBox == 'MainContent_ListViewPodsumowanie_NiezwolnionyCheckBox_0') {
                    document.getElementById('MainContent_ListViewPodsumowanie_TextBoxOrzeczenie_0').value =
                    'Badana próba nie odpowiada specyfikacji ' + specyfikacja + ' w zakresie badanych parametrów.';
                    document.getElementById('<%=LabelOrzeczenie.ClientID%>').innerHTML = 'NIE ZWALNIAM ' + '&#8722;';
                }
            }
            else {
                document.getElementById('MainContent_ListViewPodsumowanie_TextBoxOrzeczenie_0').value = '';
                document.getElementById('<%=LabelOrzeczenie.ClientID%>').innerHTML = '';
            }
        }     
    </script>

    <script type="text/javascript">

        function ExpandCollapse() {
            var collPanel = $find("CollapsiblePanelExtender1");
            if (collPanel.get_Collapsed())
                collPanel.set_Collapsed(false);
            else
                collPanel.set_Collapsed(true);
        }       
 
    </script>
     <script type="text/javascript">

         function pageLoad(sender, args) {
             for (num = 1; num < 3; num++) {
                 $find("CollapsiblePanelExtender" + num).add_expandComplete(coll_ExpandedComplete);
             }
         }

         function coll_ExpandedComplete(sender, arg) {
             for (num = 1; num < 3; num++) {
                 var CollapsiblePanel = $find("CollapsiblePanelExtender" + num);
                 if (sender._expandControlID != CollapsiblePanel._expandControlID)
                     CollapsiblePanel.collapsePanel(CollapsiblePanel._expandControlID);
             }
         }                
        
    </script>  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style35">
                <strong>DODAWANIE ANALIZY SUROWCA</strong></td>
            </tr>
            <tr>
            <td>
                <hr /></td>
        </tr>
        </table>
    <table>
            <tr>
            <td class="style37" colspan="4">
                
                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
                <asp:Label ID="LabelError" style="text-align:left;"
                    runat="server" ForeColor="Red"></asp:Label>

                </td>
        </tr>
        <tr>
            <td class="style38">
                
                <strong>&nbsp; </strong>Rodzaj analizy</td>
            <td class="style39">
                
                </td>
            <td class="style29">
                
                </td>
            <td class="style10">
                
                Specyfikacja<strong>
                </strong>
                <asp:Label ID="LabelCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style16">
            &nbsp;
                <asp:DropDownList ID="DropDownListRodzajAnalizy" runat="server" 
                   Height="23px" Width="180px" AutoPostBack="True" 
                    BackColor="White" DataSourceID="AccessDataSourceRodzajeAnaliz" 
                    DataTextField="nazwa" DataValueField="analizaId" 
                    onselectedindexchanged="DropDownListRodzajAnalizy_SelectedIndexChanged"
                    AppendDataBoundItems="True" >
                       <asp:ListItem Value="-1" Text=""></asp:ListItem>
                </asp:DropDownList>
             </td>
            <td class="style23">
                <asp:DropDownList ID="DropDownListSurowce" runat="server" 
                    DataSourceID="AccessDataSourceIndeksy" DataTextField="nazwa" DataValueField="surowiec" 
                    Height="23px" Width="378px" style="font-size: small" 
                    onselectedindexchanged="DropDownListSurowce_SelectedIndexChanged" 
                    BackColor="White" AutoPostBack="True" Enabled="False">
                </asp:DropDownList>
                <cc1:ListSearchExtender runat="server" ID="LSE" TargetControlID="DropDownListSurowce"
                             PromptText="Wpisz aby wyszukać surowiec" PromptPosition="Top"/>
                </td>
            <td class="style28">
                <asp:CheckBox ID="CheckBoxBrakIndeksu" runat="server" ForeColor="Black" 
                    Text="brak indeksu" AutoPostBack="True" 
                    oncheckedchanged="CheckBoxBrakIndeksu_CheckedChanged" Enabled="False" 
                    Font-Size="10pt" />
                </td>
            <td class="style7">
                <asp:DropDownList ID="DropDownListSpecyfikacje" runat="server" 
                   Height="23px" Width="89px" AutoPostBack="True" Enabled="False" 
                    BackColor="#FFFFCC" 
                    onselectedindexchanged="DropDownListSpecyfikacje_SelectedIndexChanged">
                </asp:DropDownList>
                </td>
        </tr>

        <tr>
            <td class="style14" colspan="4">
                
    <table class="style1">
        <tr>
        <td class="style36">
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               <asp:ListView ID="ListViewNaglowek" runat="server"
                DataSourceID="AccessDataSourceNaglowek" DataKeyNames="numerAnalizy" 
                    style="text-align: left" >
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td style="text-align:center; height:30px" >
                            <asp:TextBox ID="numerAnalizyLabel" runat="server" Width="80" />
                        </td>
                        <td style="text-align:center; height:30px" >
                            <asp:TextBox ID="numerSeriiLabel" runat="server" Width="100" />
                        </td>
                        <td style="text-align:right; height:30px" >
                            <asp:DropDownList ID="DropDownListOddzial" runat="server" 
                            DataSourceID="AccessDataSourceOddzialy" DataTextField="nazwa" 
                            DataValueField="oddzialId" Width="110" 
                            AppendDataBoundItems="True" >
                                <asp:ListItem Value="-1" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:right; height:30px" >
                            <asp:DropDownList ID="DropDownListPunktSkupu" runat="server" Width="145"
                            DataSourceID="AccessDataSourcePunktySkupu" DataTextField="nazwa" 
                            DataValueField="punktId" 
                            AppendDataBoundItems="True" >
                                <asp:ListItem Value="-1" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:right; height:30px" >
                            <asp:TextBox runat="server" ID="TextBoxDostawca" Width="110" MaxLength="45" />
                        </td>
                        <td style="text-align:right; height:30px" >
                            <asp:TextBox runat="server" ID="TextBoxWaga" Width="50" MaxLength="8" />
                            <cc1:FilteredTextBoxExtender ID="ftbe" runat="server"
                            TargetControlID="TextBoxWaga"         
                            FilterType="Custom, Numbers"
                            ValidChars="," />
                        </td>
                        <td style="text-align:right; height:30px" >
                            <asp:DropDownList ID="DropDownListPobral" runat="server" 
                            DataSourceID="AccessDataSourcePobral" Width="155" 
                            DataTextField="imieNazwisko" DataValueField="pracownikId"
                                AppendDataBoundItems="True" >
                            <asp:ListItem Value="-1" Text=""></asp:ListItem>                            
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:center; height:30px" >
                            <asp:TextBox ID="dataPobraniaProbyLabel" runat="server" Width="90"
                            Text='<%# System.DateTime.Now.ToString("dd-MM-yyyy") %>' />
                            <cc1:CalendarExtender Format="dd-MM-yyyy"
                                ID="CalendarExtender1"  
                                runat="server"  
                                TargetControlID="dataPobraniaProbyLabel"    
                                CssClass="CalendarCSS" 
                                >  
                            </cc1:CalendarExtender>  
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table1" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0"
                                    style="border: solid 2px #666666; font-size:13px;">
                                        <tr id="Tr2" runat="server" style="background-color: #669966; color: #ffffff;">
                                        <th id="Th1" runat="server">
                                            Nr analizy</th>
                                        <th id="Th13" runat="server">
                                            Nr serii</th>
                                        <th id="Th2" runat="server">
                                            Oddział</th>
                                        <th id="Th3" runat="server">
                                            Punkt skupu</th>
                                        <th id="Th4" runat="server">
                                            Dostawca</th>
                                        <th id="Th5" runat="server">
                                            Waga</th>
                                        <th id="Th6" runat="server">
                                            Pobrał</th>
                                        <th id="Th7" runat="server">
                                            Pobrano dnia</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td id="Td2" runat="server" style="">
                            </td>
                        </tr>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="1" Visible="False">
                    </asp:DataPager>
                </LayoutTemplate>
            </asp:ListView>
<%--            <asp:Label ID="LabelInfo" runat="server"></asp:Label>
            <cc1:CascadingDropDown ID="CDD1" runat="server"></cc1:CascadingDropDown>
            <cc1:CascadingDropDown ID="CDD2" runat="server"></cc1:CascadingDropDown>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
        </td>

        </tr>
        
        </table>

                </td>
        </tr>
        </table>


    <table class="style1">
        <tr>
            <td class="style3" colspan="3">
            
            <asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="False">
                <ContentTemplate>
                    <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader">
                        <asp:Label ID="lblText" runat="server" />
                    </asp:Panel>
                    <asp:Panel ID="pBody" runat="server" CssClass="cpBody" >
                       <asp:Label ID="LabelNazwaSubstancji" runat="server"
                            style="font-weight: 700; color: Green;"></asp:Label>
                            <br />
                        <asp:Label ID="LabelOpisSubstancji1Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji1" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji2Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji2" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji3Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji3" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji4Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji4" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji5Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji5" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji6Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji6" runat="server"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji7Tytul" runat="server" 
                            style="font-weight: 700"></asp:Label>
                        <asp:Label ID="LabelOpisSubstancji7" runat="server"></asp:Label>
                    </asp:Panel>
                <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pBody" 
                CollapseControlID="pHeader" ExpandControlID="pHeader" Collapsed="true" TextLabelID="lblText" 
                CollapsedText="Opis substancji roślinnej do badań morfologicznych i anatomicznych (Rozwiń...)" 
                ExpandedText="Opis substancji roślinnej do badań morfologicznych i anatomicznych (Zwiń...)" 
                CollapsedSize="0">
                    </cc1:CollapsiblePanelExtender>            

                </ContentTemplate>
            </asp:UpdatePanel>
                
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                
                &nbsp;</td>
            <td class="style40">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                
                <asp:Label ID="LabelWymaganiaJakosciowe" runat="server" 
                    Text="Wymagania jakościowe" Visible="False" 
                    style="color: #808080; " CssClass="bold"></asp:Label>
            </td>
            <td class="style40">
                &nbsp;</td>
            <td>
                <asp:Label ID="LabelWynikiBadania" runat="server" Text="Wyniki badania" 
                    Visible="False" 
                    style="color: #996600; " CssClass="bold"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:DetailsView ID="DetailsViewSpecyfikacja" runat="server" Height="50px" Width="445px" 
                    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="False"
                    FieldHeaderStyle-Width="80px" >
                    <AlternatingRowStyle ForeColor="#333333" BackColor="#DCDCDC" Font-Bold="True" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxTytul" runat="server" Width="350" Height="30px" 
                                MaxLength="100" Text='<%# Eval("tytul") %>' Font-Names="Tahoma"
                                Enabled="false" BorderStyle="None" BackColor="#EEEEEE" 
                                Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Height="0px">
                            <ItemTemplate>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="numer" HeaderText="Nr spec." SortExpression="numer" />
                        <asp:BoundField DataField="przeznaczenie" HeaderText="Cel" SortExpression="przeznaczenie" />
                        <asp:BoundField DataField="dataAktualizacji" HeaderText="Akt. od" 
                            SortExpression="dataAktualizacji" DataFormatString="{0:d}"/>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha1") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania1") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha2" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha2") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania2") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha3" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha3") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>   
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania3") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha4" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha4") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>   
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania4") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha5" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha5") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania5") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha6" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha6") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania6") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha7" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha7") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania7") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha8" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha8") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania8") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha9" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha9") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania9") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha10" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha10") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania10") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha11" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha11") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania11") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha12" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha12") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania12") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha13" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha13") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania13") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha14" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha14") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania14") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha15" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha15") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania15") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha16" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha16") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania16") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha17" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha17") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania17") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha18" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha18") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania18") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha19" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha19") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania19") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha20" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha20") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania20") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha21" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha21") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania21") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha22" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha22") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#DCDCDC" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True" ForeColor="#333333"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("wymagania22") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#EEEEEE" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="#333333"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
            </td>
            <td class="style17">
                &nbsp;</td>
<%-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>
            <td class="style3">
                <asp:DetailsView ID="DetailsViewFormularz2" runat="server" Height="50px" Width="445px" 
                    AutoGenerateRows="False" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical"
                    FieldHeaderStyle-Width="80px" >
                    <AlternatingRowStyle BackColor="#cccc99" Font-Bold="true" />
                    <Fields>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxTytul" runat="server" Width="350" Height="32px" 
                                MaxLength="100" Text='<%# Eval("tytul") %>' Font-Names="Tahoma"
                                Enabled="false" BorderStyle="None" BackColor="#ffffcc"
                                Font-Size="13px" Font-Bold="True" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="" HeaderText="" SortExpression="" />
                        <asp:BoundField DataField="numer" HeaderText="Nr spec." SortExpression="numer" />
                        <asp:BoundField DataField="przeznaczenie" HeaderText="Cel" SortExpression="przeznaczenie" />
                        <asp:BoundField DataField="dataAktualizacji" HeaderText="Akt. od" 
                            SortExpression="dataAktualizacji" DataFormatString="{0:d}"/>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha1") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania1" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha2" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha2") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania2" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha3" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha3") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania3" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha4" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha4") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania4" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha5" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha5") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania5" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha6" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha6") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania6" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha7" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha7") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania7" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha8" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha8") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania8" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha9" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha9") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania9" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha10" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha10") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania10" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha11" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha11") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania11" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha12" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha12") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania12" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha13" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha13") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania13" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"   
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha14" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha14") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania14" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"   
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha15" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha15") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania15" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha16" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha16") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" >
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania16" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha17" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha17") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania17" runat="server" Width="350" Height="32px" 
                                MaxLength="45" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha18" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha18") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania18" runat="server" Width="350" Height="32px" 
                                MaxLength="45" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha19" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha19") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania19" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha20" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha20") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania20" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha21" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha21") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania21" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxcecha22" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Text='<%# Eval("cecha22") %>' Font-Names="Tahoma"
                                Enabled="false" BackColor="#cccc99" ForeColor="#000000" BorderStyle="None" 
                                TextMode="MultiLine" Font-Size="13px" Font-Bold="True"></asp:TextBox>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox style="max-height:120px; min-height:32px; max-width:350px; min-width:350px;" 
                                ID="TextBoxWymagania22" runat="server" Width="350" Height="32px" 
                                MaxLength="250" Font-Names="Tahoma" BorderStyle="None"  
                                TextMode="MultiLine" Font-Size="13px" ForeColor="Black"></asp:TextBox>        
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#ffffcc" ForeColor="Black"/>
                </asp:DetailsView>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <table class="style1">
        <tr>
        <td>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:ListView ID="ListViewPodsumowanie" runat="server" 
                DataSourceID="AccessDataSourceOrzeczenie" Visible="False" 
                onitemdatabound="ListViewPodsumowanie_ItemDataBound">
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td style="text-align:left; vertical-align:top;">
                            <asp:DropDownList ID="DropDownListAnalizeWykonal" DataSourceID="AccessDataSourceAnalizeWykonal" 
                            runat="server" DataTextField="imieNazwisko" DataValueField="pracownikId" Width="150px"
                                AppendDataBoundItems="True" >
                            <asp:ListItem Value="-1" Text=""></asp:ListItem>  
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:center; vertical-align:top; height:30px; width:100px;">
                            <asp:TextBox ID="dataWykonaniaBadania" runat="server" Width="90" 
                            Text='<%# System.DateTime.Now.ToString("dd-MM-yyyy") %>' ></asp:TextBox>
                            <cc1:CalendarExtender Format="dd-MM-yyyy"  
                                ID="CalendarExtender1"  
                                runat="server"  
                                TargetControlID="dataWykonaniaBadania"    
                                CssClass="CalendarCSS"  
                                >  
                            </cc1:CalendarExtender>  
                        </td>
                        <td style="width:60px; text-align:center; vertical-align:top; background-color:#ccff66;">
                            <asp:CheckBox ID="zwolnionyCheckBox" runat="server" Enabled="true" AutoPostBack="False" />
                            <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender3" runat="server" 
                                TargetControlID="zwolnionyCheckBox" Key="k" />
                        </td>
                        <td style="width:60px; text-align:center; vertical-align:top; background-color:#ffff66;">
                            <asp:CheckBox ID="zwolnionyWarunkowoCheckBox" runat="server" Enabled="true" AutoPostBack="False" />
                            <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender2" runat="server" 
                                TargetControlID="zwolnionyWarunkowoCheckBox" Key="k" />
                        </td>
                        <td style="width:60px; text-align:center; vertical-align:top; background-color:#FF6666;">
                            <asp:CheckBox ID="NiezwolnionyCheckBox" runat="server" Enabled="true" AutoPostBack="False" />
                            <cc1:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1" runat="server" 
                                TargetControlID="NiezwolnionyCheckBox" Key="k" />
                        </td>
                        <td style="text-align:left">
                            <asp:TextBox style="resize:none" ID="TextBoxOrzeczenie" runat="server" Width="240px" 
                            Height="55" TextMode="MultiLine"
                            MaxLength="250" />
                        </td>
                        <td style="text-align:left">
                            <asp:TextBox style="resize:none" ID="TextBoxUwagi" runat="server" Width="190px" 
                            Height="55" TextMode="MultiLine"
                             MaxLength="250"  />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="itemPlaceholderContainer" runat="server" border="0" style="border: solid 2px #666666;">
                                      <tr id="Tr2" runat="server" style="background-color: #669966; color: #ffffff;">
                                        <th id="Th10" runat="server">
                                            Analizę wykonał</th>
                                        <th runat="server">
                                            Data wykonania</th>
                                        <th id="Th9" runat="server">
                                            ZW</th>
                                        <th id="Th11" runat="server">
                                            ZWAR</th>
                                        <th runat="server">
                                            NZW</th>
                                        <th id="Th12" runat="server">
                                            Orzeczenie</th>
                                        <th id="Th8" runat="server">
                                            Uwagi</th>
                                    </tr>
                                    <tr ID="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                            </td>
                        </tr>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="1" Visible="False">
                    </asp:DataPager>
                </LayoutTemplate>
            </asp:ListView>
        </ContentTemplate>
        </asp:UpdatePanel>
        </td>
        </tr>
        <tr>
        <td>
                
                &nbsp;</td>
            </tr>
        <tr>
        <td style="text-align: right">
                
                <asp:Button ID="ButtonZapisz" runat="server" Text="Zapisz analizę" 
                    BackColor="Silver" BorderColor="#666666" BorderStyle="Solid" Height="30px" 
                    style="text-align: center; margin-left: 0px" Width="130px" 
                    onclick="ButtonZapisz_Click" Visible="False" />
                    &nbsp;&nbsp; &nbsp;&nbsp;
        </td>
            </tr>
        <tr>
        <td style="text-align: center">
            <asp:Label ID="LabelOrzeczenie" runat="server" style="color: #000066; text-align: center;"></asp:Label>
                <asp:Label ID="LabelWykonawca" runat="server" style="color: #000066; text-align: center;" 
                    Visible="False"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            </td>
            </tr>
        <tr>
            <td>

            </td>
        </tr>
    </table>
     <asp:AccessDataSource ID="AccessDataSourceIndeksy" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb"                 
        SelectCommand="SELECT nazwa As surowiec, indeks + ' ' + nazwa As nazwa FROM Surowce
        ORDER BY nazwa"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceAliasy" runat="server"
        DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="Select aliasId, nazwa From SurowceAliasy ORDER BY nazwa">
     </asp:AccessDataSource>
     <asp:AccessDataSource ID="AccessDataSourceOrzeczenie" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        
        SelectCommand="SELECT [wykonujacy], [dataWykonania], [zwolniony], [zwolnionyWarunkowo],
        [niezwolniony], [orzeczenie], [uwagi] FROM [SurowceAnalizy]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceNaglowek" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT [numerAnalizy], [rodzaj], [surowiec], [dostawca], 
        [ilosc], [dataPobraniaProby], [pobral], [numerSpecyfikacji], [specZDnia] FROM [SurowceAnalizy]">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="SpecyfikacjaPoSurowcu" runat="server"
        DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="SELECT ss.numer FROM SpecyfikacjeSurowcow ss,
                        AliasySpecyfikacje asp, SurowceAliasy sa, Surowce s
                        WHERE surowiecId=? AND s.alias=sa.aliasId 
                        AND sa.aliasId=asp.aliasId 
                        AND asp.specyfikacjaId=ss.specyfikacjaId">
        <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListSurowce" DefaultValue="1" 
                        Name="surowiecId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceRodzajeAnaliz" runat="server" DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="Select analizaId, nazwa From RodzajeAnaliz"></asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourcePobral" runat="server" DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="Select imieNazwisko, pracownikId, grupowanie From Pracownicy Where grupowanie=2
        Order By imieNazwisko">
        </asp:AccessDataSource>
     <asp:AccessDataSource ID="AccessDataSourceOddzialy" runat="server" DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="Select oddzialId, nazwa From Oddzialy Order By nazwa">
        </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourcePunktySkupu" runat="server" DataFile="~/App_Data/BazaHLOB.mdb"
        SelectCommand="Select punktId, nazwa From PunktySkupowe Order By nazwa">
        </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourcePochodzenieProbki" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT [id], (nrMagazynu + ' ' + nazwa) As nazwa2 FROM [PochodzenieProbki] ORDER BY nazwa">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSourceAnalizeWykonal" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT pracownikId, imieNazwisko, grupowanie FROM [Pracownicy] WHERE grupowanie=1 ORDER BY imieNazwisko">
    </asp:AccessDataSource>
</asp:Content>
