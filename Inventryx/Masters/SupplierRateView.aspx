<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="SupplierRateView.aspx.cs" Inherits="SupplierRateView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Supplier Rate View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="tblEntry" border="0" cellpadding="2" cellspacing="0" class="entryBox">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="2" style="width: 20%; height: 28px;">
                            Supplier Rate Details</td>
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 28px; font-weight: bold;">
                        </td>
                        <td align="left" style="width: 80%; font-weight: bold; height: 17px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 28px; width: 20%; font-weight: bold;">
                            Supplier Rate ID</td>
                        <td align="left">
                            <asp:Label ID="lbSupplierRateID" runat="server" Width="130px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%; height: 28px; font-weight: bold;">
                            Supplier Name </td>
                        <td align="left" style="font-weight: bold; width: 80%; height: 17px">
                            <asp:Label ID="lblSupplierName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%; height: 28px; font-weight: bold;" valign="top">
                            Product Name</td>
                        <td align="left" style="width: 80%; font-weight: bold; height: 17px;">
                            <asp:Label ID="lblProductName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%; height: 28px; font-weight: bold;">
                            Effective Date</td>
                        <td align="left">
                            <asp:Label ID="lblEffectiveDate" runat="server" Width="119px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%; height: 28px; font-weight: bold;">
                            Supplier Rate</td>
                        <td align="left">
                            <asp:Label ID="lblSupplierRate" runat="server" Width="119px"></asp:Label></td>                                
                    </tr>
                    <tr>
                        <td style="width: 20%; height: 28px; font-weight: bold;">
                        </td>
                        <td style="width: 80%; font-weight: bold; height: 17px;">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="2" style="height: 28px; width: 20%; font-weight: bold;">
                            &nbsp;<asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: 0px;
                                position: relative; top: 0px" Text="Print" Width="53px" />
                            <input id="btnBack" class="button" onclick="document.location.href='SupplierRate.aspx'"
                                style="position: relative" type="button" value="Back" />&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
