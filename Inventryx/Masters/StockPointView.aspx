<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StockPointView.aspx.cs" Inherits="StockPointView" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Stock Point View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="width: 740px; height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="2" align="center" class="entryBoxHeader">Stock Point Details</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Stock Point ID</td>
                        <td style="width: 500px" align="left">
                            <asp:Label ID="lblStockPointID" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Stock Point Name&nbsp;</td>
                        <td style="width: 500px;" align="left">
                            &nbsp;<asp:Label ID="lblStockPointName" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Stock Point Type&nbsp;</td>
                        <td style="width: 500px" align="left">
                            &nbsp;<asp:Label ID="lblStockPointType" runat="server" Font-Bold="False" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold">
                        </td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnBack" runat="server" CssClass="button" Style="position: relative; left: 56px; top: 1px;"
                                Text="Back" OnClick="btnBack_Click" />
                            <asp:Button ID="Button1" runat="server" Style="position: relative; left: -42px; top: 1px;" Text="Print"  CssClass="button" Width="53px" OnClick="btnPrint_Click" />
                            &nbsp;
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

