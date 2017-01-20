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
    }
    else {
        document.getElementById('DetailsViewPodsumowanie_TextBoxSuma').style.backgroundColor = 'White';
        wyczysc();
    }
}
var I;
var M;
var O;
var OEE;
function wyliczOEE(przestoje, przerwy, regulacje, braki, czaspm) {
    var A = 480; var B = przestoje + przerwy; var C = A - B; var D = regulacje + braki; var H = C - D;
    I = (H / C) * 100;
    var J = parseInt(document.getElementById('<%=LabelPp.ClientID%>').innerHTML) +
            parseInt(document.getElementById('<%=LabelO.ClientID%>').innerHTML);
    var K = 15;   // 0,2 - Alpine 0,35 - Krajarka 0,18 - Apex
    var L = (H * 60) / J;
    M = parseFloat((J * K) / (H * 60) * 100).toFixed(2);
    var N = parseInt(document.getElementById('<%=LabelO.ClientID%>').innerHTML);
    O = parseFloat(((J - N) / J) * 100).toFixed(2);
    OEE = parseFloat((I / 100 * M / 100 * O / 100) * 100).toFixed(2);
    alert(I.toString() + " " + M.toString() + " " + O.toString() + " " + OEE.toString());

    var interval = 0.01;

    var maxprogress = I - 1;   // total to reach
    var actualprogress = 0;  // current value
    setInterval(function () {
        if (actualprogress >= maxprogress) {
            clearInterval();
            return;
        }
        var progressnum = document.getElementById("progressnum1");
        var indicator = document.getElementById("indicator1");
        actualprogress += 1;
        indicator.style.width = actualprogress + "px";
        progressnum.innerHTML = actualprogress;
        if (actualprogress == maxprogress) clearInterval();
    }, interval);

    var maxprogress2 = M - 1;   // total to reach
    var actualprogress2 = 0;  // current value
    setInterval(function () {
        if (actualprogress2 >= maxprogress2) {
            clearInterval();
            return;
        }
        var progressnum2 = document.getElementById("progressnum2");
        var indicator2 = document.getElementById("indicator2");
        actualprogress2 += 1;
        indicator2.style.width = actualprogress2 + "px";
        progressnum2.innerHTML = actualprogress2;
        if (actualprogress2 == maxprogress2) clearInterval();
    }, interval);

    var maxprogress3 = O - 1;   // total to reach
    var actualprogress3 = 0;  // current value
    setInterval(function () {
        if (actualprogress3 >= maxprogress3) {
            clearInterval();
            return;
        }
        var progressnum3 = document.getElementById("progressnum3");
        var indicator3 = document.getElementById("indicator3");
        actualprogress3 += 1;
        indicator3.style.width = actualprogress3 + "px";
        progressnum3.innerHTML = actualprogress3;
        if (actualprogress3 == maxprogress3) clearInterval();
    }, interval);

    var maxprogress4 = OEE - 1;   // total to reach
    var actualprogress4 = 0;  // current value
    setInterval(function () {
        if (actualprogress4 >= maxprogress4) {
            clearInterval();
            return;
        }
        var progressnum4 = document.getElementById("progressnum4");
        var indicator4 = document.getElementById("indicator4");
        actualprogress4 += 1;
        indicator4.style.width = actualprogress4 + "px";
        progressnum4.innerHTML = actualprogress4;
        if (actualprogress4 == maxprogress4) clearInterval();
    }, interval);
}

window.onload = sumuj;