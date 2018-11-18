<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="ProductView" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Product View</asp:Label>
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
                            Product Details</td>
                    </tr>
                    <tr>
                        <td style="width: 121px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 121px; font-weight: bold; height: 17px;"  align="left">
                            Product ID</td>
                        <td style="width: 500px; height: 17px;" align="left">
                            <asp:Label ID="lblProductID" runat="server" Style="position: relative" Width="79px"></asp:Label></td>
                    </tr>
                    <tr >
                        <td style="width: 121px; font-weight: bold"  align="left">
                            Product Name&nbsp;</td>
                        <td style="width: 500px;" align="left">
                            <asp:Label ID="lblProductName" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 121px; font-weight: bold; height: 17px;"  align="left">
                            Product Specification</td>
                        <td style="width: 500px; height: 17px;" align="left">
                            <asp:Label ID="lblProductSpec" runat="server" Font-Bold="False" Style="position: relative" Width="80px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 121px; height: 17px">
                            Product Group</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblProductGroup" runat="server" Font-Bold="False" Style="position: relative" Width="81px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 121px; height: 17px">
                            Manufacturer</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblManufacturer" runat="server" Font-Bold="False" Style="position: relative"
                                Width="81px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 121px">
                            Unit Of Measurement</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblProductUOM" runat="server" Font-Bold="False" Style="position: relative" Width="80px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 121px">
                            ReOrder Level</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblReOrderLevel" runat="server" Font-Bold="False" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 121px; font-weight: bold; height: 14px;">
                        </td>
                        <td style="width: 500px; height: 14px;">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnPrint" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Print"  CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='Product.aspx'" value="Back" class="button" />
                       </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>



