<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Analiza_podglad.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Analiza_podglad" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            vertical-align:top;
            width: 715px;
            height: 80px;
        }
        .style4
        {
            vertical-align:top;
            height: 2px;
        }
        .style5
        {
            vertical-align: bottom;
            padding: 10px;
            text-align: center;
            height: 45px;
            }
        .style9
        {
            width: 187px;
            vertical-align: top;
            text-align: right;
        }
        .style11
        {
            vertical-align: bottom;
            font-size: small;
        }
        .style12
        {
            font-size: small;
        }
        .style13
        {
            vertical-align: top;
            height: 2px;
            }
        .style14
        {
            vertical-align: top;
            width: 458px;
            height: 30px;
        }
        .style15
        {
            width: 157px;
        }
        .style16
        {
            width: 116px;
        }
        .style17
        {
            vertical-align: top;
            height: 2px;
        }
        .style18
        {
            vertical-align: top;
            font-size: small;
            width: 28px;
        }
        .style19
        {
            vertical-align: top;
            height: 2px;
            width: 28px;
        }
        .DetailsViewBorder
        {
            border-color: Gray;

        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td class="style15" >
                    <asp:Image ID="Image1" runat="server" Height="64px" 
                        ImageUrl="~/Images/Logo.gif" Width="90px" />
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsViewNaglowek1" runat="server" Height="50px" Width="280px"
                        BackColor="White" BorderStyle="None" 
                        CellPadding="3" ForeColor="Black" GridLines="None"
                        AutoGenerateRows="false" style="margin-right: 0px; margin-left: 4px;">
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <Fields>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Label
                                ID="Label12" runat="server" Font-Names="Tahoma" Font-Bold="true" Font-Size="15px"
                                Text="ANALIZA NR " Width="100" 
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="100" Font-Names="Tahoma" Font-Bold="true" Font-Size="15px"
                                Text='<%# Eval("numerAnalizy") %>'
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="style9">
                    <asp:Label ID="Label667" runat="server" Font-Size="Small" 
                        Text="Zał. Nr 3/ I-KJ-43 Wyd. G"></asp:Label>
                    <br />
                </td>
            </tr>
            </table>
        <table class="style1">
            <tr>
                <td style="vertical-align:middle;">
                    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="365px"
                        Font-Size="12px"  Font-Names="Tahoma"
                        CellPadding="3" ForeColor="Black" GridLines="Horizontal" BorderStyle="None"
                        AutoGenerateRows="false" RowStyle-BorderColor="#666666">
                        <Fields>
                        <asp:TemplateField HeaderText="Nazwa_substancji_roślinnej:" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:Label Width="200"  
                                ID="TextBox2" runat="server" Font-Size="14px" Font-Italic="false" 
                                Text='<%# Eval("surowiec") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>     
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numer serii:">
                            <ItemTemplate>
                                <asp:Label 
                                ID="TextBox55" runat="server" Font-Italic="false"
                                Text='<%# Eval("seria") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Pobrał / Data pobrania:">
                            <ItemTemplate>
                                <asp:Label 
                                ID="TextBox25" runat="server" Font-Italic="false"
                                Text='<%# Eval("pobral") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label 
                                ID="Label1" runat="server"
                                Text="  / " Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label 
                                ID="TextBox55" runat="server" Font-Italic="false"
                                Text='<%# Eval("data", "{0:dd/MM/yyyy}") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td >
                    <asp:DetailsView ID="DetailsView3" runat="server" Height="50px"
                        Font-Size="12px" Font-Names="Tahoma"
                        CellPadding="3" ForeColor="Black" GridLines="Horizontal" BorderStyle="None"
                        AutoGenerateRows="false" style="margin-left: 0px" Width="340px" RowStyle-BorderColor="#666666">
                        <Fields>
                        <asp:TemplateField HeaderText="Ilość:">
                            <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Font-Italic="false" Font-Size="14px" 
                                MaxLength="100" Text='<%# Eval("ilosc") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label
                                ID="Label12" runat="server" Font-Size="14px" 
                                Text=" kg" 
                                ForeColor="#000000"></asp:Label>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Oddział / Punkt skupowy:">
                            <ItemTemplate>
                                <asp:Label 
                                ID="TextBox25" runat="server" Font-Italic="false"
                                MaxLength="100" Text='<%# Eval("nazwaOddzialu") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label 
                                ID="Label1" runat="server"
                                Text=" / " Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label 
                                ID="TextBox55" runat="server" Font-Italic="false"
                                MaxLength="100" Text='<%# Eval("nazwaPunktu") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dostawca:">
                            <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Font-Italic="false"
                                MaxLength="100" Text='<%# Eval("dostawca") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
            </table>
                <table class="style1">
            <tr>
                <td class="style5">
                    <asp:Label 
                        ID="Label668" runat="server" Font-Bold="True" Font-Size="15px" Font-Names="Tahoma" 
                        Text="WYNIKI BADAŃ"></asp:Label>
                </td>
            </tr>
            <tr>
               <td class="style4">
                    <asp:DetailsView ID="DetailsView4a" runat="server" RowStyle-BorderColor="#666666"
                        Height="50px" Width="710px" BorderStyle="None" BorderWidth="1px" Font-Size="12px" 
                        CellPadding="3" ForeColor="Black" GridLines="Horizontal"
                        AutoGenerateRows="false" ondatabound="DetailsView4a_DataBound" 
                        onprerender="DetailsView4a_PreRender" >
                        <Fields>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:TextBox Width="340px" 
                                ID="Label666" runat="server" Text="Parametr" Font-Bold="true" Font-Italic="true" BorderStyle="None" />
                                 
                                <asp:TextBox Width="130px" style="vertical-align:bottom"
                                ID="Label7" runat="server" Text="Wynik" BorderStyle="None" Font-Bold="True" Font-Italic="true" /> 

                                <asp:TextBox Width="200px" style="vertical-align:bottom"
                                ID="TextBox1" runat="server" Text="Norma " BorderStyle="None" Font-Bold="True" Font-Italic="true" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="Label111" runat="server" Width="340" 
                                Text='<%# Eval("cecha1") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania1a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania1") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha2") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania2a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania2") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha3") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania3a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania3") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha4") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania4a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania4") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha5") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania5a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania5") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha6") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania6a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania6") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha7") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania7a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania7") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha8") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania8a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania8") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha9") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania9a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania9") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha10") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania10a") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania10") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha11") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania11a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania11") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha12") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania12a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania12") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha13") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania13a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania13") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha14") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania14a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania14") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha15") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania15a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania15") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha16") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania16a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania16") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha17") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania17a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania17") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha18") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania18a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania18") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha19") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania19a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania19") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha20") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania20a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania20") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha21") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania21a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania21") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                                <asp:Label 
                                ID="TextBox2" runat="server" Width="340" 
                                Text='<%# Eval("cecha22") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>
                                <asp:Label 
                                ID="TextBox3" runat="server" Width="130"  
                                Text='<%# Eval("wymagania22a") %>' Font-Names="Tahoma" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label 
                                ID="Label5" runat="server" Width="200" 
                                Text='<%# Eval("wymagania22") %>' Font-Names="Tahoma"
                                ForeColor="#000000"></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td colspan="3" class="style13">
                    </td>
            </tr>
            <tr>
                <td class="style4" colspan="3">
                    
                    <asp:DetailsView ID="DetailsView6" runat="server" Height="16px" 
                        BackColor="White" BorderColor="#999999"
                        BorderWidth="1px" Font-Size="12px" BorderStyle="None"
                        CellPadding="3" ForeColor="Black" GridLines="None" 
                        AutoGenerateRows="false" Width="693px">
                        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <Fields>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Label Font-Names="Tahoma" Width="100"
                                ID="TextBox2" runat="server" 
                                MaxLength="100" Text="Orzeczenie:"
                                ForeColor="#000000"></asp:Label> 
                                <asp:Label Font-Names="Tahoma" Width="500"
                                ID="Label11" runat="server" 
                                MaxLength="100" Text='<%# Eval("orzeczenie") %>' 
                                ForeColor="#000000"></asp:Label>       
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                            <asp:Label
                                ID="Label12" runat="server" Font-Names="Tahoma" 
                                MaxLength="100" Text="Analizę wykonał:" Width="100" 
                                ForeColor="#000000"></asp:Label>  
                                <asp:Label
                                ID="TextBox2" runat="server" Font-Names="Tahoma"  
                                MaxLength="100" Text='<%# Eval("wykonal") %>'
                                ForeColor="#000000"></asp:Label>      
                            </ItemTemplate>
                        </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td class="style13" colspan="3">
                 </td>
            </tr>
            <tr>
                <td class="style11">
                    <span class="style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OSOBA UPRAWNIONA</span><br class="style12" />
                </td>
                <td class="style18">
                    &nbsp;</td>
                <td class="style11">
                    ZWALNIAM DO PRODUKCJI</td>
            </tr>
            <tr>
                <td class="style14">
                    &nbsp;</td>
                <td class="style19">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style17">
                    &nbsp;&nbsp; Data ...........................................</td>
                <td class="style17" colspan="2">
                    Data ..................................................</td>
            </tr>
        </table>
        <table style="vertical-align:top; width: 715px; height: 40px;">
            <tr>
                <td style="text-align: center; vertical-align: bottom; height: 30px">
                    
                    <asp:Label ID="LabelOrzeczenie" runat="server" 
                        style="font-weight: 700; text-align: center;"></asp:Label>
                    
                </td>
            </tr>
        </table>  
    </div>
    </form>
    </body>
</html>
