<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="OpeningStockView.aspx.cs" Inherits="Masters_OpeningStockView" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
<table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Opening Stock View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="width: 740px; height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="2" align="center" class="entryBoxHeader">
                            Opening Stock Details</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Opening Stock ID</td>
                        <td style="width: 500px" align="left">
                            <asp:Label ID="lblOpeningStockD" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr >
                        <td style=" font-weight: bold; height: 9px;" nowrap  align="left">
                            GRN No.</td>
                        <td style="width: 500px; height: 9px;" align="left">
                            <asp:Label ID="lblGRNNo" runat="server" Style="position: relative; left: 0px; top: 0px;"></asp:Label></td>
                    </tr>                    
                    <tr>
                        <td align="left" nowrap="nowrap" style="font-weight: bold">
                            GRN Date</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblGRNDate" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" nowrap="nowrap" style="font-weight: bold">
                            Effective Date</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblEffectiveDate" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" nowrap="nowrap" style="font-weight: bold">
                            Product</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblProduct" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" nowrap="nowrap" style="font-weight: bold">
                            Stock Point</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblStockPoint" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" nowrap="nowrap" style="font-weight: bold">
                            Opening Qty.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblOpeningQty" runat="server" Style="position: relative"></asp:Label></td>
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
                            <asp:Button ID="btnPrint" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Print"  CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='OpeningStock.aspx'" value="Back" class="button" />
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>