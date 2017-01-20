<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wydruk.aspx.cs" Inherits="HLOB2.Views.DzialKontroliJakosci.Surowce.Wydruk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table class="style1">
            <tr>
                <td>
                    <asp:ListView ID="ListView1" runat="server">
                    </asp:ListView>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
                    </asp:DetailsView>
                    
                </td>
                <td>
                    
                    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
                    </asp:DetailsView>
                    
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    
                    <asp:ListView ID="ListView2" runat="server">
                    </asp:ListView>
                    
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
