<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/WydzialAdiustacji.Master" AutoEventWireup="true" CodeBehind="Wszystkie.aspx.cs" Inherits="HLOB2.Views.WydzialAdustacji.Zlecenia.Wszystkie" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style5
        {
            vertical-align: top;
            width: 618px;
        }
        .style6
        {            
            text-align: left; 
            vertical-align: middle;                    
        }
        .style7
        {
            text-align: left;
        }
        .style55
        {
            vertical-align: top;
            width: 618px;
            height: 20px;
            text-align: center;
        }
        .CustomValidatorCalloutStyle div, 
        .CustomValidatorCalloutStyle td { 
        border:solid 1px blue; background-color: #ADD8E6; 
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <table class="style1">
        <tr>
            <td>
                <strong>ZLECENIA:</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style6">

                <asp:ScriptManager ID="ScriptManager1" runat="server" 
                    EnableScriptLocalization="true" EnableScriptGlobalization="true" >
                </asp:ScriptManager>
                
                <div class="style7">
                
                <asp:Label ID="Label3" runat="server" Text="Półprodukt"></asp:Label>

                <asp:DropDownList ID="DropDownListPolprodukty" runat="server" Width="435px" BackColor="#FFFFCC" 
                    DataSourceID="AccessDataSourcePolprodukty" DataTextField="polprodukt" Font-Size="12px"
                    DataValueField="polproduktId" style="margin-top: 0px" AutoPostBack="True"
                    AppendDataBoundItems="True" 
                        onselectedindexchanged="DropDownListPolprodukty_SelectedIndexChanged">
                        <asp:ListItem Value="-1" Text=""></asp:ListItem>
                </asp:DropDownList>

                <asp:ImageButton ID="ImageButtonDelPp" runat="server" CausesValidation="False" 
                    ImageUrl="~/Images/delete.gif" onclick="ImageButtonDelPp_Click" />

                    &nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
                
                <asp:DropDownList ID="DropDownListStatus" runat="server" BackColor="#FFFFCC" 
                    DataSourceID="AccessDataSourceStatusy" DataTextField="nazwa" Font-Size="12px"
                    DataValueField="statusId" Width="150px" AutoPostBack="True"
                    AppendDataBoundItems="True"
                    onselectedindexchanged="DropDownListStatus_SelectedIndexChanged">
                        <asp:ListItem Value="-1" Text=""></asp:ListItem>
                </asp:DropDownList>

                <asp:ImageButton ID="ImageButtonDelSt" runat="server" CausesValidation="False" 
                    ImageUrl="~/Images/delete.gif" onclick="ImageButtonDelSt_Click" />

                    &nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBoxGeneratorSerii" Text="Włącz generator serii" 
                        runat="server" Checked="True" AutoPostBack="true" 
                        oncheckedchanged="CheckBoxGeneratorSerii_CheckedChanged" />
                </div>
                
            </td>
        </tr>
        <tr>
            <td class="style55">
                
                <asp:Label ID="LabelError" runat="server" BackColor="White" Font-Bold="True" 
                    Font-Size="12px" ForeColor="#CC3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" 
                    DataKeyNames="zlecenieId, polproduktId" AllowPaging="True" 
                    AllowSorting="True" CellPadding="1" ShowFooter="True"
                    ForeColor="#333333" PageSize="24" 
                    onrowdatabound="GridView1_RowDataBound" RowStyle-Height="10px"
                    BorderColor="#0066CC" BorderStyle="Solid" 
                    Font-Size="12px" BorderWidth="1px" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onrowcommand="GridView1_RowCommand"
                    ondatabound="GridView1_DataBound"  >
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
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete"/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                    ImageUrl="~/Images/delete.gif" CommandName="Delete" Visible="false"/>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Numer" SortExpression="numer" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <%# Eval("numer") + "/219"%>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxNumer" runat="server" Text="" BackColor="#FFFFCC" MaxLength="5"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="numerValid" runat="server"
                                    TargetControlID="TextBoxNumer"         
                                    FilterType="Custom, Numbers" /> 
                            </FooterTemplate>
                            <EditItemTemplate>                  
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxNumer2" runat="server" Text='<%# Eval("numer") %>' BackColor="#FFFFCC" MaxLength="5"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="numer2Valid" runat="server"
                                    TargetControlID="TextBoxNumer2"         
                                    FilterType="Custom, Numbers" /> 
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Indeks" SortExpression="indeks" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("indeks") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label Font-Size="12px" ID="LabelIndeks" runat="server" ></asp:Label>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:Label Width="65px" Font-Size="12px" ID="LabelIndeks2" runat="server" Text='<%# Eval("indeks") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Półprodukt" SortExpression="polprodukt" 
                            ItemStyle-Width="360px" >
                            <ItemTemplate>
                                 <asp:Label ID="LabelPolprodukt" Text='<%# Eval("polprodukt") %>' runat="server" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList Width="355px" ID="DropDownListPolprodukt" runat="server" DataSourceID="AccessDataSourcePolprodukty2" 
                                DataTextField="nazwa" DataValueField="polproduktId" BackColor="#FFFFCC" OnSelectedIndexChanged="DropDownListFooterChanged" Font-Size="12px" 
                                 AutoPostBack="True" AppendDataBoundItems="True" >
                                 <asp:ListItem Value="-1" Text=""></asp:ListItem>
                                 </asp:DropDownList>
                                 <cc1:ListSearchExtender runat="server" ID="LSE" TargetControlID="DropDownListPolprodukt"
                                    PromptText="" PromptPosition="Bottom"/>
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList Width="355px" ID="DropDownListPolprodukt2" DataSourceID="AccessDataSourcePolprodukty2" runat="server" 
                                DataTextField="nazwa" DataValueField="polproduktId" BackColor="#FFFFCC" OnSelectedIndexChanged="DropDownListEditChanged" Font-Size="12px"
                                 AutoPostBack="True" AppendDataBoundItems="True" SelectedValue='<%# Bind("polproduktId") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Seria" SortExpression="seria" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="65px" >
                            <ItemTemplate>
                                 <%# Eval("seria") %>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="60px" Font-Size="12px" ID="TextBoxSeria" runat="server" BackColor="#FFFFCC" MaxLength="8" AutoPostBack="True"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="seriaValid" runat="server"
                                    TargetControlID="TextBoxSeria"         
                                    FilterType="Custom, Numbers" /> 
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox Width="60px" Font-Size="12px" ID="TextBoxSeria2" Text='<%# Eval("seria") %>' runat="server" BackColor="#FFFFCC" MaxLength="8"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="seria2Valid" runat="server"
                                    TargetControlID="TextBoxSeria2"         
                                    FilterType="Custom, Numbers" />   
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="U" SortExpression="uzdatnianie" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="10px" >
                            <ItemTemplate>
                                 <asp:CheckBox ID="CheckBoxU0" runat="server" Enabled="false" Checked='<%# Eval("uzdatnianie") %>' />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:CheckBox ID="CheckBoxU" runat="server" />
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBoxU2" runat="server" Checked='<%# Bind("uzdatnianie") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Surowiec [kg]" SortExpression="wagaSurowca" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <%# Eval("wagaSurowca", "{0:f}")%>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxWagaSur" runat="server" Text="" BackColor="#FFFFCC"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="surValid" runat="server"
                                    TargetControlID="TextBoxWagaSur"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />
                            </FooterTemplate>
                            <EditItemTemplate>
                                <asp:TextBox Width="55px" Font-Size="12px" ID="TextBoxWagaSur2" Text='<%# Eval("wagaSurowca") %>' runat="server" BackColor="#FFFFCC"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="sur2Valid" runat="server"
                                    TargetControlID="TextBoxWagaSur2"         
                                    FilterType="Custom, Numbers"
                                    ValidChars="," />                                
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Półprodukt [kg]" SortExpression="wagaPolproduktu" ItemStyle-HorizontalAlign="Right"
                            ItemStyle-Width="70px" >
                            <ItemTemplate>
                                 <%# Eval("wagaPolproduktu", "{0:f}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="status"
                            ItemStyle-Width="80px" >
                            <ItemTemplate>
                                 <%# Eval("status") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" SortExpression=""
                            ItemStyle-Width="60px" >
                            <ItemTemplate>
                                 <asp:LinkButton runat="server" Text="Edytuj" CommandName="Edit"
                                 Enabled='<%# Eval("numer").ToString() != "04018" %>'></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton runat="server" Text="OK" CommandName="Update"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Anuluj" CommandName="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    Text="Dodaj linię" CommandName="InsertNew" />
                            </FooterTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" ForeColor="White" 
                        BorderStyle="Solid" Width="40px" Font-Size="12px" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" 
                        BackColor="#284775" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" ForeColor="Black" Font-Bold="True" />
                    <SortedAscendingHeaderStyle />
                    <SortedDescendingHeaderStyle />
                </asp:GridView>
                <asp:AccessDataSource ID="AccessDataSourceZlecenia" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Zlecenia] WHERE [zlecenieId] = ?" 
                    InsertCommand="INSERT INTO [Zlecenia] ([numer], [polprodukt], [seria], 
                        [wagaSurowca], [status], [dataZalozenia], [zalozyl], [uwagi], [uzdatnianie]) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT z.zlecenieId, z.numer, p.nazwa As polprodukt, p.polproduktId As polproduktId,
                        p.indeks As indeks, z.seria, 
                        z.wagaSurowca, z.wagaPolproduktu, z.uwagi, sz.nazwa As status, z.dataZalozenia, z.uzdatnianie 
                        FROM Zlecenia z, Polprodukty p, StatusyZlecen sz WHERE 
                        p.polproduktId=z.polprodukt AND sz.statusId=z.status
                        ORDER BY z.numer"
                    UpdateCommand="UPDATE Zlecenia SET numer=@numer, polprodukt=@polprodukt, seria=@ser2ia, wagaSurowca=@wagaSurowca, 
                        dataEdycji=@dataEdycji, edytowal=@edytowal, uwagi=@uwagi, uzdatnianie=@uzdatnianie">
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="status" Type="Int32" />
                        <asp:Parameter Name="dataZalozenia" Type="DateTime" />
                        <asp:Parameter Name="zalozyl" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="uzdatnianie" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="dataEdycji" Type="DateTime" />
                        <asp:Parameter Name="edytowal" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="uzdatnianie" Type="Boolean" />
                    </UpdateParameters>
                </asp:AccessDataSource>

                <asp:AccessDataSource ID="AccessDataSourceZleceniaFiltrPp" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Zlecenia] WHERE [zlecenieId] = ?" 
                    InsertCommand="INSERT INTO [Zlecenia] ([numer], [polprodukt], [seria], 
                        [wagaSurowca], [status], [dataZalozenia], [zalozyl], [uwagi]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT z.zlecenieId, z.numer, p.nazwa As polprodukt, p.polproduktId As polproduktId,
                        p.indeks As indeks, z.seria, 
                        z.wagaSurowca, z.wagaPolproduktu, z.uwagi, sz.nazwa As status, z.dataZalozenia 
                        FROM Zlecenia z, Polprodukty p, StatusyZlecen sz WHERE 
                        p.polproduktId=z.polprodukt AND sz.statusId=z.status AND polproduktId=?
                        ORDER BY z.numer"
                    UpdateCommand="UPDATE Zlecenia SET numer=@numer, polprodukt=@polprodukt, seria=@seria, wagaSurowca=@wagaSurowca, 
                        dataEdycji=@dataEdycji, edytowal=@edytowal, uwagi=@uwagi">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListPolprodukty" DefaultValue="*" Name="polproduktId" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="status" Type="Int32" />
                        <asp:Parameter Name="dataZalozenia" Type="DateTime" />
                        <asp:Parameter Name="zalozyl" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="dataEdycji" Type="DateTime" />
                        <asp:Parameter Name="edytowal" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </UpdateParameters>
                </asp:AccessDataSource>

                <asp:AccessDataSource ID="AccessDataSourceZleceniaFiltrSt" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [Zlecenia] WHERE [zlecenieId] = ?" 
                    InsertCommand="INSERT INTO [Zlecenia] ([numer], [polprodukt], [seria], 
                        [wagaSurowca], [status], [dataZalozenia], [zalozyl], [uwagi]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT z.zlecenieId, z.numer, p.nazwa As polprodukt, p.polproduktId As polproduktId,
                        p.indeks As indeks, z.seria, 
                        z.wagaSurowca, z.wagaPolproduktu, z.uwagi, sz.nazwa As status, z.dataZalozenia 
                        FROM Zlecenia z, Polprodukty p, StatusyZlecen sz WHERE
                        p.polproduktId=z.polprodukt AND sz.statusId=z.status AND status=?
                        ORDER BY z.numer"
                    UpdateCommand="UPDATE Zlecenia SET numer=@numer, polprodukt=@polprodukt, seria=@seria, wagaSurowca=@wagaSurowca, 
                        dataEdycji=@dataEdycji, edytowal=@edytowal, uwagi=@uwagi">
                    <DeleteParameters>
                        <asp:Parameter Name="zlecenieId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="status" Type="Int32" />
                        <asp:Parameter Name="dataZalozenia" Type="DateTime" />
                        <asp:Parameter Name="zalozyl" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numer" Type="String" />
                        <asp:Parameter Name="polprodukt" Type="Int32" />
                        <asp:Parameter Name="seria" Type="String" />
                        <asp:Parameter Name="wagaSurowca" Type="Double" />
                        <asp:Parameter Name="dataEdycji" Type="DateTime" />
                        <asp:Parameter Name="edytowal" Type="Int32" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSourceStatusy" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [statusId], [nazwa] FROM [StatusyZlecen]">
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSourcePolprodukty2" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [polproduktId], [nazwa] FROM [Polprodukty] ORDER BY nazwa">
                </asp:AccessDataSource>
                
                <asp:AccessDataSource ID="AccessDataSourcePolprodukty" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    SelectCommand="SELECT [polproduktId], indeks + ' ' + nazwa As polprodukt FROM [Polprodukty] ORDER BY nazwa">
                </asp:AccessDataSource>
                
            </td>
        </tr>
        <tr>
            <td class="style5">
                
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
