<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="Bright.WebControls" Namespace="Bright.WebControls" TagPrefix="bri" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ThumbViewer Demo</title>
    <link href='styles.css' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">
        <div id="outer">
            <h2>ThumbViewer Demo</h2>
            
            <div style="clear:both;">
                <h4>Setting both the ImageUrl and ThumbUrl</h4>
                <p>If you already have thumbnail images, setting both the ImageUrl and ThumbUrl is the most efficient option.</p>
            </div>
            <div style="clear:both;">
                <div style="float:left;">
                    <ul>                
                        <li>ImageUrl: ~/images/Scissors.jpg</li>
                        <li>ThumbUrl: ~/thumbs/Scissors.jpg</li>
                        <li>ModalDisplayMode: Stretch</li>
                        <li>ModalImagePadding: 40px</li>
                    </ul>
                </div>
                <div style="float:right;padding-right:16px;">
                     <bri:ThumbViewer ID="ThumbViewer2" runat="server" ImageUrl="~/images/Scissors.jpg"
                        Title="Tailors Scissors" ThumbUrl="~/thumbs/Scissors.jpg" Height="75px" Width="90px" ModalImagePadding="40px" />
                </div>
            </div>                       
            
            <br />
            
            <div style="clear:both;">
                <h4>Setting the ImageUrl Only</h4>
                <p>By only setting the ImageUrl only, the thumbnail image is generate at runtime. This is less efficient but you do not need to have separate thumbnail images.</p>
            </div>
            <div style="clear:both;">
                <div style="float:left;">
                <ul>                
                <li>ImageUrl: ~/images/GoodluckdearLiza.gif</li>
                <li>ThumbUrl: </li>
                <li>ModalDisplayMode: Stretch</li>
                <li>ModalImagePadding: 200px</li>
            </ul>
                </div>
                <div style="float:right;padding-right:16px;">
                    <bri:ThumbViewer ID="ThumbViewer1" runat="server" ImageUrl="~/images/GoodluckdearLiza.gif"
                        Title="Good Luck Dear Liza" Height="75px" Width="90px" ModalImagePadding="200px" />
                </div>
            </div>            
            
            <br />
            
            <div style="clear:both;">
                <h4>Setting the ThumbUrl Only</h4>
                <p>By setting the ThumbUrl only and using the ModalDisplayMode of Fixed you can display a larger version of a smaller image.</p>
            </div>
            <div style="clear:both;">
                <div style="float:left;">
                    <ul>                
                        <li>ImageUrl: </li>
                        <li>ThumbUrl: ~/thumbs/Scissors.jpg</li>
                        <li>ModalDisplayMode: Fixed</li>
                        <li>ModalFixedWidth: 200px</li>
                        <li>ModalFixedHeight: 160px</li>
                    </ul>
                </div>
                <div style="float:right;padding-right:16px;">
                    <bri:ThumbViewer ID="ThumbViewer3" runat="server" ImageUrl="" Title="Tailors Scissors (small)" 
                        ThumbUrl="~/thumbs/Scissors.jpg" ModalDisplayMode="Fixed" ModalFixedHeight="160px" />
                </div>
            </div>

            <br />
            
            <div style="clear:both;">
                <h4>Using ThumbViewer with the Repeater Control</h4>
                <p>The ThumbViewer control can be placed in the ItemTemplate of a Repeater control to display a collection of images.</p>
            </div>
            <div style="clear:both;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <span style="padding:2px 10px 2px 10px">
                            <bri:ThumbViewer runat="server" ImageUrl='<%# Eval("Name", "images/{0}") %>' Height="75" />
                        </span>
                    </ItemTemplate>
                </asp:Repeater>  
            </div>    
            
            <br />
            <p><i>Images courtesy of <a href="http://www.clivebright.com">Clive Bright</a></i></p>       
                 
        </div>
    </form>
</body>
</html>
