<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductGroupView.aspx.cs" Inherits="ProductGroupView" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Product Group View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="Table1" border="0" cellpadding="2" cellspacing="0" class="entryBox">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="4">
                            Product Group Details</td>
                    </tr>
                    <tr>
                        <td style="width: 134px">
                        </td>
                        <td align="left" style="width: 575px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 134px; height: 6px">
                            Product Group ID</td>
                        <td align="left" style="width: 575px; height: 6px">
                            <asp:Label ID="lblProductGroupID" runat="server" Width="130px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 134px; height: 1px">
                            Product Group Name</td>
                        <td align="left" style="font-weight: bold; width: 575px; height: 1px">
                            <asp:Label ID="lblProductGroupName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 134px">
                        </td>
                        <td style="width: 575px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4" style="height: 25px">
                            <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: -8px;
                                position: relative; top: 0px" Text="Print" Width="53px" /><input id="btnBack" class="button" onclick="document.location.href='ProductGroup.aspx'"
                                style="position: relative" type="button" value="Back" />&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


