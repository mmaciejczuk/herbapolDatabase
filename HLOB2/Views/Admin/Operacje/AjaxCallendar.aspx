<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Admin.Master" AutoEventWireup="true" CodeBehind="AjaxCallendar.aspx.cs" Inherits="HLOB2.Views.Admin.Operacje.AjaxCallendar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 444px;
        }
        
        .cpHeader
        {
            color: white;
            background-color: #719DDB;
            font: bold 11px auto "Trebuchet MS", Verdana;
            font-size: 13px;
            cursor: pointer;
            width:450px;
            height:18px;
            padding: 4px;            
        }
        .cpBody
        {
            background-color: #DCE4F9;
            font: normal 13px auto Verdana, Arial;
            border: 1px gray;                
            width:450px;            
            padding: 4px;
            padding-top: 2px;
            height:0px;
            overflow: hidden; 
        }
    </style>

    <script type="text/javascript" language="javascript">
        function fnClick() 
        {
            alert("Sum of three values should be 100");
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
    <script type="text/javascript">

        function pageLoad(sender, args) {
            smoothAnimation();
        }


        function smoothAnimation() {
            var collPanel = $find("CollapsiblePanelExtender1");
            collPanel._animation._fps = 45;
            collPanel._animation._duration = 0.90;
        }
 
    </script> 

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td>
                <strong>DETAILSVIEW EXAMPLES</strong></td>
        </tr>
        <tr>
            <td>
                <hr /></td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td class="style2">
                
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pHeader" runat="server" CssClass="cpHeader">
                <asp:Label ID="lblText" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pBody" runat="server" CssClass="cpBody" >
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna 
            aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
            </asp:Panel>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pBody" CollapseControlID="pHeader" ExpandControlID="pHeader"
        Collapsed="true" TextLabelID="lblText" CollapsedText="Click to Show Content.." ExpandedText="Click to Hide Content.." 
        CollapsedSize="0">
            </cc1:CollapsiblePanelExtender>            
           
            <asp:Panel ID="pHeaderTwo" runat="server" CssClass="cpHeader">
                <asp:Label ID="lblTextTwo" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pBodyTwo" runat="server" CssClass="cpBody" >
            Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna 
            aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
            </asp:Panel>
            
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" TargetControlID="pBodyTwo" CollapseControlID="pHeaderTwo" ExpandControlID="pHeaderTwo"
        Collapsed="true" TextLabelID="lblTextTwo" CollapsedText="Click to Show Content.." ExpandedText="Click to Hide Content.." 
        CollapsedSize="0">
            </cc1:CollapsiblePanelExtender>

        </ContentTemplate>
        </asp:UpdatePanel>

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
                
                <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
                    DataFile="~/App_Data/BazaHLOB.mdb" 
                    DeleteCommand="DELETE FROM [SurowceAnalizy] WHERE [id] = ?" 
                    InsertCommand="INSERT INTO [SurowceAnalizy] ([id], [numerAnalizy], [rodzaj], [brakIndeksu], [surowiec], [surowiecId], [aliasId], [oddzial], [punktSkupowy], [dostawca], [ilosc], [dataPobraniaProby], [pobral], [numerSpecyfikacji], [tytul], [przeznaczenie], [specZDnia], [dataDodania], [dataWykonania], [wykonujacy], [orzekajacy], [stanowisko], [zwolniony], [zwolnionyWarunkowo], [niezwolniony], [orzeczenie], [cecha1], [wymagania1], [parametr1], [cecha2], [wymagania2], [parametr2], [cecha3], [wymagania3], [parametr3], [cecha4], [wymagania4], [parametr4], [cecha5], [wymagania5], [parametr5], [cecha6], [wymagania6], [parametr6], [cecha7], [wymagania7], [parametr7], [cecha8], [wymagania8], [parametr8], [cecha9], [wymagania9], [parametr9], [cecha10], [wymagania10], [parametr10], [cecha11], [wymagania11], [parametr11], [cecha12], [wymagania12], [parametr12], [cecha13], [wymagania13], [parametr13], [cecha14], [wymagania14], [parametr14], [cecha15], [wymagania15], [parametr15], [cecha16], [wymagania16], [parametr16], [cecha17], [wymagania17], [parametr17], [cecha18], [wymagania18], [parametr18], [cecha19], [wymagania19], [parametr19], [cecha20], [wymagania20], [parametr20], [uwagi]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                    SelectCommand="SELECT * FROM [SurowceAnalizy]" 
                    UpdateCommand="UPDATE [SurowceAnalizy] SET [numerAnalizy] = ?, [rodzaj] = ?, [brakIndeksu] = ?, 
                    [surowiec] = ?, [surowiecId] = ?, [aliasId] = ?, [oddzial] = ?, [punktSkupowy] = ?, [dostawca] = ?, 
                    [ilosc] = ?, [dataPobraniaProby] = ?, [pobral] = ?, [numerSpecyfikacji] = ?, [tytul] = ?, [przeznaczenie] = ?, 
                    [specZDnia] = ?, [dataDodania] = ?, [dataWykonania] = ?, [wykonujacy] = ?, [orzekajacy] = ?, [stanowisko] = ?, 
                    [zwolniony] = ?, [zwolnionyWarunkowo] = ?, [niezwolniony] = ?, [orzeczenie] = ?, [cecha1] = ?, [wymagania1] = ?, 
                    [parametr1] = ?, [cecha2] = ?, [wymagania2] = ?, [parametr2] = ?, [cecha3] = ?, [wymagania3] = ?, [parametr3] = ?, 
                    [cecha4] = ?, [wymagania4] = ?, [parametr4] = ?, [cecha5] = ?, [wymagania5] = ?, [parametr5] = ?, [cecha6] = ?, 
                    [wymagania6] = ?, [parametr6] = ?, [cecha7] = ?, [wymagania7] = ?, [parametr7] = ?, [cecha8] = ?, [wymagania8] = ?, 
                    [parametr8] = ?, [cecha9] = ?, [wymagania9] = ?, [parametr9] = ?, [cecha10] = ?, [wymagania10] = ?, [parametr10] = ?, 
                    [cecha11] = ?, [wymagania11] = ?, [parametr11] = ?, [cecha12] = ?, [wymagania12] = ?, [parametr12] = ?, [cecha13] = ?, 
                    [wymagania13] = ?, [parametr13] = ?, [cecha14] = ?, [wymagania14] = ?, [parametr14] = ?, [cecha15] = ?, [wymagania15] = ?, 
                    [parametr15] = ?, [cecha16] = ?, [wymagania16] = ?, [parametr16] = ?, [cecha17] = ?, [wymagania17] = ?, [parametr17] = ?, 
                    [cecha18] = ?, [wymagania18] = ?, [parametr18] = ?, [cecha19] = ?, [wymagania19] = ?, [parametr19] = ?, [cecha20] = ?, 
                    [wymagania20] = ?, [parametr20] = ?, [uwagi] = ? WHERE [id] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                        <asp:Parameter Name="numerAnalizy" Type="String" />
                        <asp:Parameter Name="rodzaj" Type="Int32" />
                        <asp:Parameter Name="brakIndeksu" Type="Boolean" />
                        <asp:Parameter Name="surowiec" Type="String" />
                        <asp:Parameter Name="surowiecId" Type="Int32" />
                        <asp:Parameter Name="aliasId" Type="Int32" />
                        <asp:Parameter Name="oddzial" Type="Int32" />
                        <asp:Parameter Name="punktSkupowy" Type="Int32" />
                        <asp:Parameter Name="dostawca" Type="String" />
                        <asp:Parameter Name="ilosc" Type="String" />
                        <asp:Parameter Name="dataPobraniaProby" Type="DateTime" />
                        <asp:Parameter Name="pobral" Type="Int32" />
                        <asp:Parameter Name="numerSpecyfikacji" Type="String" />
                        <asp:Parameter Name="tytul" Type="String" />
                        <asp:Parameter Name="przeznaczenie" Type="String" />
                        <asp:Parameter Name="specZDnia" Type="DateTime" />
                        <asp:Parameter Name="dataDodania" Type="DateTime" />
                        <asp:Parameter Name="dataWykonania" Type="DateTime" />
                        <asp:Parameter Name="wykonujacy" Type="Int32" />
                        <asp:Parameter Name="orzekajacy" Type="String" />
                        <asp:Parameter Name="stanowisko" Type="String" />
                        <asp:Parameter Name="zwolniony" Type="Boolean" />
                        <asp:Parameter Name="zwolnionyWarunkowo" Type="Boolean" />
                        <asp:Parameter Name="niezwolniony" Type="Boolean" />
                        <asp:Parameter Name="orzeczenie" Type="String" />
                        <asp:Parameter Name="cecha1" Type="String" />
                        <asp:Parameter Name="wymagania1" Type="String" />
                        <asp:Parameter Name="parametr1" Type="String" />
                        <asp:Parameter Name="cecha2" Type="String" />
                        <asp:Parameter Name="wymagania2" Type="String" />
                        <asp:Parameter Name="parametr2" Type="String" />
                        <asp:Parameter Name="cecha3" Type="String" />
                        <asp:Parameter Name="wymagania3" Type="String" />
                        <asp:Parameter Name="parametr3" Type="String" />
                        <asp:Parameter Name="cecha4" Type="String" />
                        <asp:Parameter Name="wymagania4" Type="String" />
                        <asp:Parameter Name="parametr4" Type="String" />
                        <asp:Parameter Name="cecha5" Type="String" />
                        <asp:Parameter Name="wymagania5" Type="String" />
                        <asp:Parameter Name="parametr5" Type="String" />
                        <asp:Parameter Name="cecha6" Type="String" />
                        <asp:Parameter Name="wymagania6" Type="String" />
                        <asp:Parameter Name="parametr6" Type="String" />
                        <asp:Parameter Name="cecha7" Type="String" />
                        <asp:Parameter Name="wymagania7" Type="String" />
                        <asp:Parameter Name="parametr7" Type="String" />
                        <asp:Parameter Name="cecha8" Type="String" />
                        <asp:Parameter Name="wymagania8" Type="String" />
                        <asp:Parameter Name="parametr8" Type="String" />
                        <asp:Parameter Name="cecha9" Type="String" />
                        <asp:Parameter Name="wymagania9" Type="String" />
                        <asp:Parameter Name="parametr9" Type="String" />
                        <asp:Parameter Name="cecha10" Type="String" />
                        <asp:Parameter Name="wymagania10" Type="String" />
                        <asp:Parameter Name="parametr10" Type="String" />
                        <asp:Parameter Name="cecha11" Type="String" />
                        <asp:Parameter Name="wymagania11" Type="String" />
                        <asp:Parameter Name="parametr11" Type="String" />
                        <asp:Parameter Name="cecha12" Type="String" />
                        <asp:Parameter Name="wymagania12" Type="String" />
                        <asp:Parameter Name="parametr12" Type="String" />
                        <asp:Parameter Name="cecha13" Type="String" />
                        <asp:Parameter Name="wymagania13" Type="String" />
                        <asp:Parameter Name="parametr13" Type="String" />
                        <asp:Parameter Name="cecha14" Type="String" />
                        <asp:Parameter Name="wymagania14" Type="String" />
                        <asp:Parameter Name="parametr14" Type="String" />
                        <asp:Parameter Name="cecha15" Type="String" />
                        <asp:Parameter Name="wymagania15" Type="String" />
                        <asp:Parameter Name="parametr15" Type="String" />
                        <asp:Parameter Name="cecha16" Type="String" />
                        <asp:Parameter Name="wymagania16" Type="String" />
                        <asp:Parameter Name="parametr16" Type="String" />
                        <asp:Parameter Name="cecha17" Type="String" />
                        <asp:Parameter Name="wymagania17" Type="String" />
                        <asp:Parameter Name="parametr17" Type="String" />
                        <asp:Parameter Name="cecha18" Type="String" />
                        <asp:Parameter Name="wymagania18" Type="String" />
                        <asp:Parameter Name="parametr18" Type="String" />
                        <asp:Parameter Name="cecha19" Type="String" />
                        <asp:Parameter Name="wymagania19" Type="String" />
                        <asp:Parameter Name="parametr19" Type="String" />
                        <asp:Parameter Name="cecha20" Type="String" />
                        <asp:Parameter Name="wymagania20" Type="String" />
                        <asp:Parameter Name="parametr20" Type="String" />
                        <asp:Parameter Name="uwagi" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="numerAnalizy" Type="String" />
                        <asp:Parameter Name="rodzaj" Type="Int32" />
                        <asp:Parameter Name="brakIndeksu" Type="Boolean" />
                        <asp:Parameter Name="surowiec" Type="String" />
                        <asp:Parameter Name="surowiecId" Type="Int32" />
                        <asp:Parameter Name="aliasId" Type="Int32" />
                        <asp:Parameter Name="oddzial" Type="Int32" />
                        <asp:Parameter Name="punktSkupowy" Type="Int32" />
                        <asp:Parameter Name="dostawca" Type="String" />
                        <asp:Parameter Name="ilosc" Type="String" />
                        <asp:Parameter Name="dataPobraniaProby" Type="DateTime" />
                        <asp:Parameter Name="pobral" Type="Int32" />
                        <asp:Parameter Name="numerSpecyfikacji" Type="String" />
                        <asp:Parameter Name="tytul" Type="String" />
                        <asp:Parameter Name="przeznaczenie" Type="String" />
                        <asp:Parameter Name="specZDnia" Type="DateTime" />
                        <asp:Parameter Name="dataDodania" Type="DateTime" />
                        <asp:Parameter Name="dataWykonania" Type="DateTime" />
                        <asp:Parameter Name="wykonujacy" Type="Int32" />
                        <asp:Parameter Name="orzekajacy" Type="String" />
                        <asp:Parameter Name="stanowisko" Type="String" />
                        <asp:Parameter Name="zwolniony" Type="Boolean" />
                        <asp:Parameter Name="zwolnionyWarunkowo" Type="Boolean" />
                        <asp:Parameter Name="niezwolniony" Type="Boolean" />
                        <asp:Parameter Name="orzeczenie" Type="String" />
                        <asp:Parameter Name="cecha1" Type="String" />
                        <asp:Parameter Name="wymagania1" Type="String" />
                        <asp:Parameter Name="parametr1" Type="String" />
                        <asp:Parameter Name="cecha2" Type="String" />
                        <asp:Parameter Name="wymagania2" Type="String" />
                        <asp:Parameter Name="parametr2" Type="String" />
                        <asp:Parameter Name="cecha3" Type="String" />
                        <asp:Parameter Name="wymagania3" Type="String" />
                        <asp:Parameter Name="parametr3" Type="String" />
                        <asp:Parameter Name="cecha4" Type="String" />
                        <asp:Parameter Name="wymagania4" Type="String" />
                        <asp:Parameter Name="parametr4" Type="String" />
                        <asp:Parameter Name="cecha5" Type="String" />
                        <asp:Parameter Name="wymagania5" Type="String" />
                        <asp:Parameter Name="parametr5" Type="String" />
                        <asp:Parameter Name="cecha6" Type="String" />
                        <asp:Parameter Name="wymagania6" Type="String" />
                        <asp:Parameter Name="parametr6" Type="String" />
                        <asp:Parameter Name="cecha7" Type="String" />
                        <asp:Parameter Name="wymagania7" Type="String" />
                        <asp:Parameter Name="parametr7" Type="String" />
                        <asp:Parameter Name="cecha8" Type="String" />
                        <asp:Parameter Name="wymagania8" Type="String" />
                        <asp:Parameter Name="parametr8" Type="String" />
                        <asp:Parameter Name="cecha9" Type="String" />
                        <asp:Parameter Name="wymagania9" Type="String" />
                        <asp:Parameter Name="parametr9" Type="String" />
                        <asp:Parameter Name="cecha10" Type="String" />
                        <asp:Parameter Name="wymagania10" Type="String" />
                        <asp:Parameter Name="parametr10" Type="String" />
                        <asp:Parameter Name="cecha11" Type="String" />
                        <asp:Parameter Name="wymagania11" Type="String" />
                        <asp:Parameter Name="parametr11" Type="String" />
                        <asp:Parameter Name="cecha12" Type="String" />
                        <asp:Parameter Name="wymagania12" Type="String" />
                        <asp:Parameter Name="parametr12" Type="String" />
                        <asp:Parameter Name="cecha13" Type="String" />
                        <asp:Parameter Name="wymagania13" Type="String" />
                        <asp:Parameter Name="parametr13" Type="String" />
                        <asp:Parameter Name="cecha14" Type="String" />
                        <asp:Parameter Name="wymagania14" Type="String" />
                        <asp:Parameter Name="parametr14" Type="String" />
                        <asp:Parameter Name="cecha15" Type="String" />
                        <asp:Parameter Name="wymagania15" Type="String" />
                        <asp:Parameter Name="parametr15" Type="String" />
                        <asp:Parameter Name="cecha16" Type="String" />
                        <asp:Parameter Name="wymagania16" Type="String" />
                        <asp:Parameter Name="parametr16" Type="String" />
                        <asp:Parameter Name="cecha17" Type="String" />
                        <asp:Parameter Name="wymagania17" Type="String" />
                        <asp:Parameter Name="parametr17" Type="String" />
                        <asp:Parameter Name="cecha18" Type="String" />
                        <asp:Parameter Name="wymagania18" Type="String" />
                        <asp:Parameter Name="parametr18" Type="String" />
                        <asp:Parameter Name="cecha19" Type="String" />
                        <asp:Parameter Name="wymagania19" Type="String" />
                        <asp:Parameter Name="parametr19" Type="String" />
                        <asp:Parameter Name="cecha20" Type="String" />
                        <asp:Parameter Name="wymagania20" Type="String" />
                        <asp:Parameter Name="parametr20" Type="String" />
                        <asp:Parameter Name="uwagi" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
            <td>
                
                &nbsp;</td>
        </tr>

    </table>
    </asp:Content>
