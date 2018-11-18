<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ErrMsg.aspx.cs" Inherits="ErrMsg" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="width: 740px; height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="1" align="center" class="entryBoxHeader">
                            Error Details</td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 500px" align="left"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr >
                        <td  align="center">
                            <asp:Label ID="lblMsg" runat="server" Style="position: relative" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 500px" align="left">
                            <Spc:SpacerImage ID="SpacerImage4" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="1" align="right" class="entryBoxFooter">
                            <input id="btnBack" style="position: relative" type="button" onclick="history.back()" value="Back" class="button" />
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

