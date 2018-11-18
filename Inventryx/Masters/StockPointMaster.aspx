<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StockPointMaster.aspx.cs" Inherits="StockPointMaster" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Stock Point Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="width: 740px; height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="2" align="left" class="entryBoxHeader">
                            Stock Point Detail</td>
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
                            <asp:TextBox ID="txtStockPointID" runat="server" Columns="10" Enabled="False" MaxLength="10"
                                Style="position: relative" CssClass="INPUTblack"></asp:TextBox></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Stock Point Name&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <asp:TextBox ID="txtStockPointName" runat="server" Columns="50" MaxLength="50" Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Stock Point Type&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:DropDownList ID="ddlStockPointType" runat="server" Style="position: relative" CssClass="INPUTblack">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList>
                            </td>
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
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='StockPoint.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

