<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OEE.aspx.cs" Inherits="HLOB2.Views.WydzialAdiustacji.Zlecenia.OEE" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Overall Equipment Effectiveness</title>

<link href="~/Styles/WydzialAdiustacji/OEE.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" >

    function checkBoxList1OnCheck(listControlRef) {
        var inputItemArray = listControlRef.getElementsByTagName('input');

        for (var i = 0; i < inputItemArray.length; i++) {
            var inputItem = inputItemArray[i];

            if (inputItem.checked) {
                inputItem.parentElement.style.backgroundColor = '#99cc99';
            }
            else {
                inputItem.parentElement.style.backgroundColor = '#dcddc0';
            }
        }
    }

    function sumuj() {
        var grid1 = document.getElementById('<%=DetailsViewOEE_Przestoje.ClientID %>');
        var inputs1 = grid1.getElementsByTagName("input");
        var sum = 0;
        var sumLocal1 = 0;      //Przestoje

        for (var i = 0; i < inputs1.length; i++) {
            if (inputs1[i].type == "text" && inputs1[i].value != "" && inputs1[i].value != null) {
                sumLocal1 += parseInt(inputs1[i].value);
                document.getElementById('<%=LabelPrzest1.ClientID%>').innerHTML = sumLocal1.toString();
                document.getElementById('<%=LabelPrzest2.ClientID%>').innerHTML = "min";
            }
            else if (sumLocal1 == 0) {
                document.getElementById('<%=LabelPrzest1.ClientID%>').innerHTML = "";
                document.getElementById('<%=LabelPrzest2.ClientID%>').innerHTML = "";
            }
        }

        var grid2 = document.getElementById('<%=DetailsView_Przerwy.ClientID %>');
        var inputs2 = grid2.getElementsByTagName("input");
        var sumLocal2 = 0;      //Przerwy

        for (var i = 0; i < inputs2.length; i++) {
            if (inputs2[i].type == "text" && inputs2[i].value != "" && inputs2[i].value != null) {
                sumLocal2 += parseInt(inputs2[i].value);
                document.getElementById('<%=LabelPrzerwy1.ClientID%>').innerHTML = sumLocal2.toString();
                document.getElementById('<%=LabelPrzerwy2.ClientID%>').innerHTML = "min";
            }
            else if (sumLocal2 == 0) {
                document.getElementById('<%=LabelPrzerwy1.ClientID%>').innerHTML = "";
                document.getElementById('<%=LabelPrzerwy2.ClientID%>').innerHTML = "";
            }
        }

        var grid3 = document.getElementById('<%=DetailsViewOEE_RegulacjeAwarie.ClientID %>');
        var inputs3 = grid3.getElementsByTagName("input");
        var sumLocal3 = 0;      //Regulacje i Awarie

        for (var i = 0; i < inputs3.length; i++) {
            if (inputs3[i].type == "text" && inputs3[i].value != "" && inputs3[i].value != null) {
                sumLocal3 += parseInt(inputs3[i].value);
                document.getElementById('<%=LblR1.ClientID%>').innerHTML = sumLocal3.toString();
                document.getElementById('<%=LblR2.ClientID%>').innerHTML = "min";
            }
            else if (sumLocal3 == 0) {
                document.getElementById('<%=LblR1.ClientID%>').innerHTML = "";
                document.getElementById('<%=LblR2.ClientID%>').innerHTML = "";
            }
        }

        var grid4 = document.getElementById('<%=DetailsViewOEE_Braki.ClientID %>');
        var inputs4 = grid4.getElementsByTagName("input");
        var sumLocal4 = 0;      //Braki

        for (var i = 0; i < inputs4.length; i++) {
            if (inputs4[i].type == "text" && inputs4[i].value != "" && inputs4[i].value != null) {
                sumLocal4 += parseInt(inputs4[i].value);
                document.getElementById('<%=LabelBraki1.ClientID%>').innerHTML = sumLocal4.toString();
                document.getElementById('<%=LabelBraki2.ClientID%>').innerHTML = "min";
            }
            else if (sumLocal4 == 0) {
                document.getElementById('<%=LabelBraki1.ClientID%>').innerHTML = "";
                document.getElementById('<%=LabelBraki2.ClientID%>').innerHTML = "";
            }
        }

        var sumLocal5 = 0;      //Czas pracy maszyny
        if (document.getElementById('DetailsViewPodsumowanie_TextBoxInneCzasPracyM').value != "") {
            sumLocal5 = parseInt(document.getElementById('DetailsViewPodsumowanie_TextBoxInneCzasPracyM').value);
            sum = sumLocal1 + sumLocal2 + sumLocal3 + sumLocal4 + sumLocal5;
        }
        else {
            sum = sumLocal1 + sumLocal2 + sumLocal3 + sumLocal4;
        }
        document.getElementById('DetailsViewPodsumowanie_TextBoxSuma').value = sum.toString();

        if (sum == 480 && document.getElementById('DetailsViewPodsumowanie_TextBoxInneCzasPracyM').value != "") {
            document.getElementById('DetailsViewPodsumowanie_TextBoxSuma').style.backgroundColor = '#99cc99';
            wyliczOEE(sumLocal1, sumLocal2, sumLocal3, sumLocal4, sumLocal5);
            document.getElementById('ButtonZapisz2').style.visibility = "visible";
        }
        else {
            document.getElementById('DetailsViewPodsumowanie_TextBoxSuma').style.backgroundColor = 'White';
            setInterval(wyczyscPasek1, 5);
            document.getElementById('ButtonZapisz2').style.visibility = "visible";
        }
    }

    function wyliczOEE(przestoje, przerwy, regulacje, braki, czaspm) {
        var A = 480;
        var B = przestoje + przerwy;
        var C = A - B;
        var D = regulacje + braki;
        var H = C - D;
        var I = parseFloat(((H / C) * 100).toFixed(2));
        var J = parseInt(document.getElementById('<%=LabelPp.ClientID%>').innerHTML) +
            parseInt(document.getElementById('<%=LabelO.ClientID%>').innerHTML);
        var K = 15;   // 0,2 - Alpine 0,35 - Krajarka 0,18 - Apex
        var L = (H * 60) / J;
        var M = parseFloat((J * K) / (H * 60) * 100).toFixed(2);
        var N = parseInt(document.getElementById('<%=LabelO.ClientID%>').innerHTML);
        var O = parseFloat(((J - N) / J) * 100).toFixed(2);
        var OEE = parseFloat((I / 100 * M / 100 * O / 100) * 100).toFixed(2);

        document.getElementById("<%= varA.ClientID %>").value = A;
        document.getElementById("<%= varB.ClientID %>").value = B;
        document.getElementById("<%= varC.ClientID %>").value = C;
        document.getElementById("<%= varD.ClientID %>").value = D;
        document.getElementById("<%= varI.ClientID %>").value = I;
        document.getElementById("<%= varM.ClientID %>").value = M;
        document.getElementById("<%= varO.ClientID %>").value = O;
        document.getElementById("<%= varOEE.ClientID %>").value = OEE;

        var actualprogress1=0; var actualprogress2=0; var actualprogress3=0; var actualprogress4=0;
        setInterval(pasek1, 7);
        setInterval(pasek2, 7);
        setInterval(pasek3, 7);
        setInterval(pasek4, 7);

        //****************************************************************************************  1
        function pasek1() {
            if (actualprogress1 >= I) {
                clearInterval();
                return;
            }
            var progressnum = document.getElementById("progressnum1");
            var indicator = document.getElementById("indicator1");
            actualprogress1 += 1;
            indicator.style.width = actualprogress1 + "px";
            progressnum.innerHTML = actualprogress1;
            if (actualprogress1 == I) clearInterval();
        }
        //***************************************************************************************   2  
        function pasek2() {
            if (actualprogress2 >= M) {
                clearInterval();
                return;
            }
            var progressnum2 = document.getElementById("progressnum2");
            var indicator2 = document.getElementById("indicator2");
            actualprogress2 += 1;
            indicator2.style.width = actualprogress2 + "px";
            progressnum2.innerHTML = actualprogress2;
            if (actualprogress2 == M-1) clearInterval();
        }
        //***************************************************************************************   3
        function pasek3() {
            if (actualprogress3 >= O) {
                clearInterval();
                return;
            }
            var progressnum3 = document.getElementById("progressnum3");
            var indicator3 = document.getElementById("indicator3");
            actualprogress3 += 1;
            indicator3.style.width = actualprogress3 + "px";
            progressnum3.innerHTML = actualprogress3;
            if (actualprogress3 == O-1) clearInterval();
        }
        //***************************************************************************************   4
        function pasek4() {
            if (actualprogress4 >= OEE) {
                clearInterval();
                return;
            }
            var progressnum4 = document.getElementById("<%= LabelProgressNumOEE.ClientID %>");
            var indicator4 = document.getElementById("indicator4");
            actualprogress4 += 1;
            indicator4.style.width = actualprogress4 + "px";
            progressnum4.innerHTML = parseFloat(actualprogress4.toFixed(2));
            if (actualprogress4 == OEE-1) clearInterval();
        }
    }

    function wyczyscPasek1() {
//        var progressnum1 = document.getElementById("progressnum1");
 //       var actualprogress1 = progressnum1.innerHTML;
//        if (actualprogress1 == 0) {
 //           clearInterval();
 //           return;
//        }
///        var indicator1 = document.getElementById("indicator1");
 //       actualprogress1 -= 1;
  //      indicator1.style.width = actualprogress1 + "px";
 //       document.getElementById("progressnum1").innerHTML = actualprogress1.toString();
 //       if (actualprogress1 == 0) clearInterval();
    }

    window.onload = sumuj;
</script>

    <style type="text/css">
        .style7
        {
            width: 36px;
            height: 38px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="styleDiv">
            <table class="styleTable">
                <tr>
                    <td colspan="2">
                        
                        <asp:Label ID="LabelAsortyment" runat="server" 
                            style="font-family: Verdana; font-size: small; font-weight: 700;"></asp:Label>
                            &nbsp;
                            (
                            <asp:Label ID="LabelPp" runat="server" 
                            style="font-family: Verdana; font-size: small; font-weight: 700;"></asp:Label>
                            <asp:Label ID="Label11" runat="server" 
                            style="font-family: Verdana; font-size: small; font-weight: 700;"></asp:Label>
                            <asp:Label ID="LabelO" runat="server" 
                            style="font-family: Verdana; font-size: small; font-weight: 700;"></asp:Label>
                            )
                    <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>                
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 11px;">
                            
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelZmiana" Text="Obsada zmiany" 
                            Font-Names="Courier New" 
                            CssClass="style1"></asp:Label>
                        </td>
                    <td>
                        <div class="labelFormularz">
                            <asp:Label runat="server" ID="LabelOEE" Text="Overall Equipment Effectiveness (OEE)"   
                                Font-Names="Courier New" 
                                CssClass="style1"></asp:Label>
                            </div>
                            </td>
                </tr>
                <tr>
                    <td>
                            <asp:CheckBoxList ID="CheckBoxListPracownicy" runat="server" class="chkbox"
                                DataSourceID="AccessDataSourcePracownicy" DataTextField="imieNazwisko" 
                                DataValueField="pracownikId" RepeatColumns="1"
                                onclick="checkBoxList1OnCheck(this);" >
                            </asp:CheckBoxList>
                    </td>
                    <td>
                        <div class="section">
                        <asp:Label ID="LabelPrzestoje" runat="server" Text="Przestoje" class="labelOpisTabel"></asp:Label>
                        &nbsp;<asp:Label ID="LabelPrzest1" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                        <asp:Label ID="LabelPrzest2" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                        <asp:DetailsView ID="DetailsViewOEE_Przestoje" runat="server"
                            AutoGenerateRows="False" DataSourceID="AccessDataSourceOEE_1"
                            AllowPaging="False"
                            CellPadding="4" CssClass="DetailsViewClass" 
                                ondatabound="DetailsViewOEE_Przestoje_DataBound" >
                            <Fields>
                                <asp:TemplateField HeaderText="odprawa">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxOdprawa" class="textBoxDL" 
                                        Text='<%# Eval("odprawa") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid1" runat="server"
                                        TargetControlID="TextBoxOdprawa"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="zmiana asortymentu">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxZmianaAsort" class="textBoxDL" 
                                        Text='<%# Eval("zmiana_asort") %>' MaxLength="3" TabIndex="1"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid2" runat="server"
                                        TargetControlID="TextBoxZmianaAsort"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="rozpoczęcie produkcji">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxRozpProd" class="textBoxDL" 
                                        Text='<%# Eval("rozp_prod") %>' MaxLength="3" TabIndex="2"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid3" runat="server"
                                        TargetControlID="TextBoxRozpProd"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="zakończenie produkcji">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxZakProd" class="textBoxDL" 
                                        Text='<%# Eval("zak_prod") %>' MaxLength="3" TabIndex="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid4" runat="server"
                                        TargetControlID="TextBoxZakProd"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="czyszczenie">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxCzyszczenie" class="textBoxDL" 
                                        Text='<%# Eval("czyszczenie") %>' MaxLength="3" TabIndex="4"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid5" runat="server"
                                        TargetControlID="TextBoxCzyszczenie"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="prace zlecone">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxPraceZlecone" class="textBoxDL" 
                                        Text='<%# Eval("prace_zlecone") %>' MaxLength="3" TabIndex="5"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid6" runat="server"
                                        TargetControlID="TextBoxPraceZlecone"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="szkolenie">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxSzkolenie" class="textBoxDL" 
                                        Text='<%# Eval("szkolenie") %>' MaxLength="3" TabIndex="6"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid7" runat="server"
                                        TargetControlID="TextBoxSzkolenie"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <FieldHeaderStyle CssClass="Header"/>
                            <FooterStyle Width="50px" />
                        </asp:DetailsView>
                        </div>

                        <div class="section">
                        <asp:Label ID="LabelRegAwarie" runat="server" Text="Regulacje i awarie" class="labelOpisTabel"></asp:Label>
                        &nbsp;<asp:Label ID="LblR1" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                        <asp:Label ID="LblR2" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                        <asp:DetailsView ID="DetailsViewOEE_RegulacjeAwarie" runat="server"
                            AutoGenerateRows="False" DataSourceID="AccessDataSourceOEE_2"
                            AllowPaging="False"
                            CellPadding="4" CssClass="DetailsViewClass" TabIndex="2" 
                                ondatabound="DetailsViewOEE_RegulacjeAwarie_DataBound" >
                            <Fields>
                                <asp:TemplateField HeaderText="awaria zszywarki">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxAwariaZszyw" class="textBoxDL" 
                                        Text='<%# Eval("awaria_zszyw") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid8" runat="server"
                                        TargetControlID="TextBoxAwariaZszyw"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="blokada noży">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxBlokadaNoz" class="textBoxDL" 
                                        Text='<%# Eval("blokada_nozy") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid9" runat="server"
                                        TargetControlID="TextBoxBlokadaNoz"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="awaria elementów elektrycznych">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxAwariaElektr" class="textBoxDL" 
                                        Text='<%# Eval("awaria_elektr") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid10" runat="server"
                                        TargetControlID="TextBoxAwariaElektr"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="awaria elementów mechanicznych">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxAwariaMech" class="textBoxDL" 
                                        Text='<%# Eval("awaria_mech") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid11" runat="server"
                                        TargetControlID="TextBoxAwariaMech"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="zmiana ustawień">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxZmianaUst" class="textBoxDL" 
                                        Text='<%# Eval("zmiania_ust") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid12" runat="server"
                                        TargetControlID="TextBoxZmianaUst"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="wymiana noży">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxWymianaNoz" class="textBoxDL" 
                                        Text='<%# Eval("wymiana_noz") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid13" runat="server"
                                        TargetControlID="TextBoxWymianaNoz"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="czyszczenie sit">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxCzyszczenieSit" class="textBoxDL" 
                                        Text='<%# Eval("czyszczenie_sit") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid14" runat="server"
                                        TargetControlID="TextBoxCzyszczenieSit"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="czyszczenie filtrów">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxCzyszczenieFiltrow" class="textBoxDL" 
                                        Text='<%# Eval("czyszczenie_filtrow") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid15" runat="server"
                                        TargetControlID="TextBoxCzyszczenieFiltrow"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="czyszczenie rotopleksu">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="TextBoxCzyszczenieRot" class="textBoxDL" 
                                        Text='<%# Eval("czyszczenie_rotopl") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid16" runat="server"
                                        TargetControlID="TextBoxCzyszczenieRot"         
                                        FilterType="Custom, Numbers" /> 
                                    </ItemTemplate>
                                </asp:TemplateField>                             
                            </Fields>
                            <FieldHeaderStyle CssClass="Header" />
                            <FooterStyle Width="50px" />
                        </asp:DetailsView>

                            </div>

                        <div class="section">
                            <asp:Label ID="LabelPrzerwy" runat="server" Text="Przerwy" class="labelOpisTabel"></asp:Label>
                            &nbsp;<asp:Label ID="LabelPrzerwy1" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                            <asp:Label ID="LabelPrzerwy2" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                            <asp:DetailsView ID="DetailsView_Przerwy" runat="server"
                                AutoGenerateRows="False" DataSourceID="AccessDataSourceOEE_1"
                                AllowPaging="False"
                                CellPadding="4" CssClass="DetailsViewClass" TabIndex="1" 
                                ondatabound="DetailsView_Przerwy_DataBound" >
                                <Fields>
                                    <asp:TemplateField HeaderText="próby technologiczne">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxProbyTechn" class="textBoxDL" 
                                            Text='<%# Eval("proby_techn") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid17" runat="server"
                                        TargetControlID="TextBoxProbyTechn"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="przegląd maszyny">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxPrzegladMasz" class="textBoxDL" 
                                            Text='<%# Eval("przeglad_masz") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid18" runat="server"
                                        TargetControlID="TextBoxPrzegladMasz"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="modernizacja maszyny">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxModernMasz" class="textBoxDL" 
                                            Text='<%# Eval("modern_masz") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid19" runat="server"
                                        TargetControlID="TextBoxModernMasz"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="remont maszyny">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxRemontMasz" class="textBoxDL" 
                                            Text='<%# Eval("remont_masz") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid20" runat="server"
                                        TargetControlID="TextBoxRemontMasz"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="konserwacja maszyny">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxKonserwMasz" class="textBoxDL" 
                                            Text='<%# Eval("konserw_masz") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid21" runat="server"
                                        TargetControlID="TextBoxKonserwMasz"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="weryfikacja półproduktu">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxWeryfikacjaPp" class="textBoxDL" 
                                            Text='<%# Eval("weryfikacja_pp") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid22" runat="server"
                                        TargetControlID="TextBoxWeryfikacjaPp"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="przerwa śniadaniowa">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxPrzerwaSniad" class="textBoxDL" 
                                            Text='<%# Eval("przerwa_sniad") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid23" runat="server"
                                        TargetControlID="TextBoxPrzerwaSniad"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="inne przerwy">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxInne" class="textBoxDL" 
                                            Text='<%# Eval("inne_1") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid24" runat="server"
                                        TargetControlID="TextBoxInne"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>                             
                                </Fields>
                            <FieldHeaderStyle CssClass="Header" />
                            <FooterStyle Width="50px" />
                        </asp:DetailsView>

                        </div>

                        <div class="section">
                            <asp:Label ID="LabelBraki" runat="server" Text="Braki" class="labelOpisTabel"></asp:Label>
                            &nbsp;<asp:Label ID="LabelBraki1" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                            <asp:Label ID="LabelBraki2" runat="server" Text="" class="labelOpisTabel"></asp:Label>
                            <asp:DetailsView ID="DetailsViewOEE_Braki" runat="server"
                                AutoGenerateRows="False" DataSourceID="AccessDataSourceOEE_2"
                                AllowPaging="False"
                                CellPadding="4" CssClass="DetailsViewClass" TabIndex="3" 
                                ondatabound="DetailsViewOEE_Braki_DataBound" >
                                <Fields>
                                    <asp:TemplateField HeaderText="brak mechanika">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxBrakMechanika" class="textBoxDL" 
                                            Text='<%# Eval("brak_mechanika") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid25" runat="server"
                                        TargetControlID="TextBoxBrakMechanika"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="brak surowca">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxBrakSur" class="textBoxDL" 
                                            Text='<%# Eval("brak_surowca") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid26" runat="server"
                                        TargetControlID="TextBoxBrakSur"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="brak obsady / wyjście do WC">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxBrakObsady" class="textBoxDL" 
                                            Text='<%# Eval("brak_obsady_wc") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid27" runat="server"
                                        TargetControlID="TextBoxBrakObsady"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="brak zwolnienia DKJ">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxBrakZwolnienia" class="textBoxDL" 
                                            Text='<%# Eval("brak_zwolnienia_dkj") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid28" runat="server"
                                        TargetControlID="TextBoxBrakZwolnienia"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="inne awarie">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" ID="TextBoxInne2" class="textBoxDL" 
                                            Text='<%# Eval("inne2") %>' MaxLength="3"></asp:TextBox>
                                        <cc1:FilteredTextBoxExtender ID="numerValid29" runat="server"
                                        TargetControlID="TextBoxInne2"         
                                        FilterType="Custom, Numbers" /> 
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                </Fields>
                            <FieldHeaderStyle CssClass="Header" />
                            <FooterStyle Width="50px" />
                        </asp:DetailsView>                        

                        <asp:DetailsView ID="DetailsViewPodsumowanie" runat="server"
                                AutoGenerateRows="False" DataSourceID="AccessDataSourceOEE_2"
                                AllowPaging="False"
                                CellPadding="4" CssClass="DetailsViewClass" 
                                ondatabound="DetailsViewPodsumowanie_DataBound" TabIndex="4" >
                            <Fields>
                                <asp:TemplateField HeaderText="Czas pracy maszyny">
                                         <ItemTemplate>
                                             <asp:TextBox runat="server" ID="TextBoxInneCzasPracyM" class="textBoxDL" 
                                              MaxLength="3" Text='<%# Eval("czas_pracy_masz") %>'></asp:TextBox>
                                            <cc1:FilteredTextBoxExtender ID="numerValid30" runat="server"
                                            TargetControlID="TextBoxInneCzasPracyM"         
                                            FilterType="Custom, Numbers" /> 
                                         </ItemTemplate>
                                </asp:TemplateField> 
                               <asp:TemplateField HeaderText="Suma">
                                         <ItemTemplate>
                                             <asp:TextBox runat="server" ID="TextBoxSuma" class="textBoxDL" 
                                             Enabled="False" Width="38" ForeColor="#003300" Height="19"></asp:TextBox>
                                         </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Czas pracy zmiany">
                                         <ItemTemplate>
                                             <asp:TextBox runat="server" ID="TextBoxInneCzasPracyZ" class="textBoxDL" 
                                             Enabled="False" Text="480" Font-Bold="False" Width="38" ForeColor="Black" 
                                             Height="19"></asp:TextBox>
                                         </ItemTemplate>
                                </asp:TemplateField>   
                            </Fields>
                            <FieldHeaderStyle CssClass="Header2" />
                            <FooterStyle Width="50px" />
                        </asp:DetailsView>
                        </div>


                        <div class="section">
                        <br />
                        <div class="labels"><asp:Label runat="server" ID="LabelDostepnosc">Dostępność&nbsp;(I)</asp:Label></div>
                            <div id="progressbar1">
                                <div id="indicator1"></div>
                                </div>
                            <div id="progressnum1">0
                                </div>
                            <br />

                            <div class="labels"><asp:Label runat="server" ID="LabelWydajnosc">Wydajność&nbsp;(M)</asp:Label></div>
                            <div id="progressbar2">
                                <div id="indicator2"></div>
                                </div>
                            <div id="progressnum2">0
                                </div>
                            <br />

                            <div class="labels"><asp:Label runat="server" ID="LabelJakosc">Jakość&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(O)</asp:Label></div>
                            <div id="progressbar3">
                                <div id="indicator3"></div>
                                </div>
                            <div id="progressnum3">0
                                </div>
                            <br />

                            <div class="labels"><asp:Label runat="server" ID="LabelOEEFin">OEE&nbsp;&nbsp;&nbsp;(IxMxO)</asp:Label></div>
                            <div id="progressbar4">
                                <div id="indicator4"></div>
                                </div>
                            <div id="progressnum4"><asp:Label ID="LabelProgressNumOEE" runat="server"></asp:Label>
                                </div>
                            <input id="varA" type="hidden" runat="server" />  
                            <input id="varB" type="hidden" runat="server" />  
                            <input id="varC" type="hidden" runat="server" />  
                            <input id="varD" type="hidden" runat="server" />   
                            <input id="varI" type="hidden" runat="server" /> 
                            <input id="varM" type="hidden" runat="server" />  
                            <input id="varO" type="hidden" runat="server" />  
                            <input id="varOEE" type="hidden" runat="server" />   
                        </div>  
                        <div class="section2">
                            <asp:Button ID="ButtonZapisz2" Text="Zapisz" runat="server" 
                                class="buttonZapisz" TabIndex="5" onclick="ButtonZapisz2_Click" 
                                Width="90px"/> 
                                <br />
                            <asp:Label runat="server" ID="LabelTest"></asp:Label>
                        </div>
                     
                </td>
            </tr>
                <tr>
                    <td colspan="2">
                        <asp:AccessDataSource ID="AccessDataSourceOEE_1" runat="server" 
                            DataFile="~/App_Data/BazaHLOB.mdb" 
                            SelectCommand="SELECT [odprawa], [zmiana_asort], [rozp_prod], [zak_prod], [czyszczenie], 
                            [prace_zlecone], [szkolenie], [proby_techn], [przeglad_masz], [modern_masz], [remont_masz], 
                            [konserw_masz], [weryfikacja_pp], [przerwa_sniad], [inne_1] FROM [OEE]">
                        </asp:AccessDataSource>

                        <asp:AccessDataSource ID="AccessDataSourcePracownicy" runat="server" 
                            DataFile="~/App_Data/BazaHLOB.mdb" 
                            SelectCommand="SELECT [pracownikId], [imieNazwisko], [dzial], [grupowanie] 
                            FROM [Pracownicy] WHERE ([grupowanie] = ?) ORDER BY imieNazwisko">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="5" Name="grupowanie2" Type="Int32" />
                            </SelectParameters>
                        </asp:AccessDataSource>

                        <asp:AccessDataSource ID="AccessDataSourceOEE_2" runat="server" 
                            DataFile="~/App_Data/BazaHLOB.mdb" 
                            SelectCommand="SELECT [awaria_zszyw], [blokada_nozy], [awaria_elektr], 
                            [awaria_mech], [zmiania_ust], [wymiana_noz], [czyszczenie_sit], [czyszczenie_filtrow], 
                            [czyszczenie_rotopl], [brak_mechanika], [brak_surowca], [brak_obsady_wc], [brak_zwolnienia_dkj], 
                            [inne2], [czas_pracy_masz] FROM [OEE]">
                        </asp:AccessDataSource>

                    </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
