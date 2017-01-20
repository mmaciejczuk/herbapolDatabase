<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DzialKontroliJakosci.Master" AutoEventWireup="true" CodeBehind="Analizy_surowcow.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Analizy_surowcow" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 130px;
            height: 47px;
        }
        .style5
        {
            width: 1677px;
            height: 47px;
            text-align: left;
        }
        .style9
        {
            width: 74px;
            height: 47px;
            text-align: left;
        }
        .style10
        {
            width: 166px;
            height: 47px;
            color: #996600;
            text-align: right;
            vertical-align:middle;
        }
        .style15
        {
            width: 425px;
            height: 47px;
        }
        .style16
        {
            height: 47px;
            width: 5px;
        }
        .style17
        {
            width: 2312px;
            text-align: center;
            height: 47px;
            vertical-align:middle;
        }
        .style18
        {
            width: 576px;
            height: 47px;
        }
        .style19
        {
            color: #996600;
            vertical-align:middle;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>ANALIZY SUROWCOWE</strong><asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
        </table>

    <table class="style1">
        <tr>
            <td class="style4">
                
                <asp:Button ID="ButtonSzczegoly" runat="server" BackColor="Silver" ForeColor="#333333" 
                    Height="27px" Text="Przegląd" Width="70px" 
                    onclick="ButtonSzczegoly_Click" 
                    style="text-align: center; font-style: italic;" Font-Size="10pt" />
                
                </td>
            <td class="style16">
                
                </td>
            <td class="style9">
                
                <asp:Button ID="ButtonEdytuj" runat="server" BackColor="Silver" Font-Bold="False" 
                    ForeColor="#333333" Height="27px" Text="Edycja" Width="70px" 
                    onclick="ButtonEdytuj_Click" 
                    style="text-align: center; font-style: italic;" Font-Size="10pt" />
                
            </td>
            <td class="style18">
                
            </td>
            <td class="style10">
                
                Surowiec:<strong>&nbsp; </strong></td>
            <td class="style15">
<%--              <asp:UpdatePanel ID="UpdatePanel1" runat="server">  
                  <ContentTemplate>--%>
                        <asp:DropDownList ID="DropDownListAliasy" runat="server" BackColor="White" 
                            DataTextField="nazwa" DataSourceID="AccessDataSourceAliasy"
                            DataValueField="aliasId" style="margin-left: 0px; margin-right: 0px" 
                            Width="250px" AutoPostBack="True" 
                            onselectedindexchanged="DropDownListAliasy_SelectedIndexChanged" AppendDataBoundItems="True">
                                <asp:ListItem Value="-1" Text=""></asp:ListItem>
                        </asp:DropDownList>
                        <ajaxToolkit:ListSearchExtender runat="server" ID="LSE" TargetControlID="DropDownListAliasy"
                             PromptText="Wpisz aby wyszukać" PromptPosition="Top"/>
<%--                    </ContentTemplate>
              </asp:UpdatePanel>--%>
            </td>
            <td class="style17">
                       &nbsp;<asp:DropDownList 
                           ID="DropDownListRodzajeAnaliz" runat="server" style="vertical-align:middle" 
                           DataSourceID="AccessDataSource1" DataTextField="nazwa" 
                           DataValueField="analizaId" Width="175px" BackColor="White" 
                           AutoPostBack="True" 
                           onselectedindexchanged="DropDownListRodzajeAnaliz_SelectedIndexChanged" AppendDataBoundItems="True" Visible="False">
                            <asp:ListItem Value="-1" Text=""></asp:ListItem>
                       </asp:DropDownList>
            </td>
            <td class="style5">
                        &nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;
                        </td>
        </tr>
        </table>

    <table class="style1">
        <tr>
            <td style="">
                <asp:GridView ID="GridViewAnalizy" runat="server" 
                    DataSourceID="AnalizySurowcowAccessDataSource" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" CellPadding="1"
                    ForeColor="#333333" PageSize="25" 
                    onrowdatabound="GridViewAnalizy_RowDataBound" RowStyle-Height="10px"
                    BorderColor="#0066CC" BorderStyle="Solid" DataKeyNames="id" 
                    Font-Size="13px" BorderWidth="1px" 
                    onselectedindexchanged="GridViewAnalizy_SelectedIndexChanged" 
                    onrowcommand="GridViewAnalizy_RowCommand" 
                    onrowdeleting="GridViewAnalizy_RowDeleting" 
                    ondatabinding="GridViewAnalizy_DataBinding">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Image" 
                            ItemStyle-HorizontalAlign="Center"
                            SelectImageUrl="~/Images/select.gif" SelectText="Wybierz"
                            ItemStyle-Width="20px">
                        </asp:CommandField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete"
                                    ItemStyle-BackColor="White" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="numerAnalizy" HeaderText="Numer" 
                            SortExpression="numerAnalizy" ItemStyle-Width="85px" >  
                        </asp:BoundField>
                        <asp:BoundField DataField="surowiec" HeaderText="Surowiec" 
                            SortExpression="surowiec" ItemStyle-Width="265px" >
                        </asp:BoundField>
                        <asp:BoundField DataField="oddzial" HeaderText="Oddział" 
                            SortExpression="oddzial" ItemStyle-Width="85px" >
                        </asp:BoundField>
                        <asp:BoundField DataField="ilosc" HeaderText="Waga" 
                            SortExpression="ilosc" ItemStyle-Width="50px" >
                        </asp:BoundField>
                        <asp:BoundField DataField="nazwa" HeaderText="Typ" 
                            SortExpression="nazwa" ItemStyle-Width="155px" >
                        </asp:BoundField>
                        <asp:BoundField DataField="przeznaczenie" HeaderText="Cel" 
                            SortExpression="przeznaczenie" ItemStyle-Width="40px" >
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="ZW" SortExpression="zwolniony" ItemStyle-Width="30px" 
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox2" runat="server" 
                                    Checked='<%# Bind("zwolniony") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="WAR" SortExpression="zwolnionyWarunkowo" ItemStyle-Width="30px" 
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    Checked='<%# Bind("zwolnionyWarunkowo") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="NZW" SortExpression="niezwolniony" ItemStyle-Width="30px" 
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox3" runat="server" 
                                    Checked='<%# Bind("niezwolniony") %>' Enabled="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dataWykonania" HeaderText="Wykonano" 
                            SortExpression="dataWykonania" ItemStyle-Width="70px" DataFormatString="{0:dd/MM/yyyy}" 
                            ItemStyle-HorizontalAlign="Center">
                        </asp:BoundField>
<%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel ID="PanelPopUp" runat="server" BackColor="Yellow" style="display:none;">
                                    <asp:LinkButton ID="BtnPrzeglad" runat="server" Text="Przegląd" CommandName="Przeglad">
                                    </asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="BtnEdycja" runat="server" Text="Edycja" CommandName="Edycja">
                                    </asp:LinkButton>
                                </asp:Panel>
                                <ajaxToolkit:HoverMenuExtender ID="hme" runat="server" TargetControlID="GridViewAnalizy"
                                PopupControlID="PanelPopUp" />   
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderStyle="None" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        BorderStyle="None" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" 
                        BackColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="Black" Font-Bold="True" />
                    <SortedAscendingHeaderStyle />
                    <SortedDescendingHeaderStyle />

                </asp:GridView>
                
            </td>
            <%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Panel ID="PanelPopUp" runat="server" BackColor="Yellow" style="display:none;">
                                    <asp:LinkButton ID="BtnPrzeglad" runat="server" Text="Przegląd" CommandName="Przeglad">
                                    </asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="BtnEdycja" runat="server" Text="Edycja" CommandName="Edycja">
                                    </asp:LinkButton>
                                </asp:Panel>
                                <ajaxToolkit:HoverMenuExtender ID="hme" runat="server" TargetControlID="GridViewAnalizy"
                                PopupControlID="PanelPopUp" />   
                            </ItemTemplate>
                        </asp:TemplateField>--%>
        </tr>
        </table>

        <asp:AccessDataSource ID="AnalizySurowcowAccessDataSource" runat="server" 
            DataFile="~/App_Data/BazaHLOB.mdb" 
            SelectCommand="SELECT sa.id As id, sa.numerAnalizy, sa.aliasId As aljas, 
            ra.nazwa, sa.przeznaczenie, sa.surowiec, o.nazwa As oddzial, sa.ilosc,
            sa.zwolniony, sa.zwolnionyWarunkowo, sa.niezwolniony,
            sa.dataWykonania FROM RodzajeAnaliz ra, SurowceAnalizy sa, Oddzialy o WHERE
            sa.rodzaj = ra.analizaId AND sa.oddzial = o.oddzialId
            AND ([sa.aliasId] = ?) ORDER BY sa.dataDodania DESC"
            DeleteCommand="DELETE FROM [SurowceAnalizy] WHERE [id] = ?" >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListAliasy" Name="aliasId" PropertyName="SelectedValue" Type="Int32"
                 DefaultValue="0" />
        </SelectParameters>
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="AnalizySurowcowAccessDataSourceNone" runat="server" 
            DataFile="~/App_Data/BazaHLOB.mdb" 
            SelectCommand="SELECT sa.id As id, sa.numerAnalizy, sa.aliasId, 
            ra.nazwa, sa.przeznaczenie, sa.surowiec, o.nazwa As oddzial, sa.ilosc,
            sa.zwolniony, sa.zwolnionyWarunkowo, sa.niezwolniony,
            sa.dataWykonania FROM RodzajeAnaliz ra, SurowceAnalizy sa, Oddzialy o WHERE
            sa.rodzaj = ra.analizaId AND sa.oddzial = o.oddzialId ORDER BY sa.dataDodania DESC"
            DeleteCommand="DELETE FROM [SurowceAnalizy] WHERE [id] = ?" >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
        </asp:AccessDataSource>

        <asp:AccessDataSource ID="FiltrAccessDataSource" runat="server" 
            DataFile="~/App_Data/BazaHLOB.mdb" 
            SelectCommand="SELECT sa.id As id, sa.numerAnalizy, sa.aliasId, 
            ra.nazwa, sa.przeznaczenie, sa.surowiec, o.nazwa As oddzial, sa.ilosc,
            sa.zwolniony, sa.zwolnionyWarunkowo, sa.niezwolniony,
            sa.dataWykonania FROM RodzajeAnaliz ra, SurowceAnalizy sa, Oddzialy o WHERE
            sa.rodzaj = ra.analizaId AND sa.oddzial = o.oddzialId
            AND ([aliasId] = ?) ORDER BY sa.dataDodania DESC"
            DeleteCommand="DELETE FROM [SurowceAnalizy] WHERE [id] = ?" >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListAliasy" Name="aliasId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:AccessDataSource>

    <asp:AccessDataSource ID="AccessDataSourceAliasy" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT [aliasId], [nazwa] FROM [SurowceAliasy] ORDER BY nazwa">
    </asp:AccessDataSource>
        
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/BazaHLOB.mdb" 
        SelectCommand="SELECT * FROM [RodzajeAnaliz] ORDER BY nazwa"></asp:AccessDataSource>
               
</asp:Content>
