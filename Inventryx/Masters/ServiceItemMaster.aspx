<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ServiceItemMaster.aspx.cs" Inherits="ServiceItemMaster" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace = "PeterBlum.SpacerControl" TagPrefix = "Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Service Item Entry</asp:Label>
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
                            Service Item Detail</td>
                    </tr>
                    <tr>
                        <td style="width: 127px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 127px; font-weight: bold"  align="left">
                            Service Item ID</td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtServiceItemID" runat="server" Columns="8" Enabled="False" MaxLength="8"
                                Style="position: relative" CssClass="INPUTblack"></asp:TextBox></td>
                    </tr>
                    <tr >
                        <td style="width: 127px; font-weight: bold"  align="left">
                            Service Item Name&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <asp:TextBox ID="txtServiceItemName" runat="server" Columns="50" MaxLength="50" Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            </td>
                    </tr>
                    
                    <tr>
                        <td style="width: 127px; font-weight: bold">
                        </td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='ServiceItem.aspx'" value="back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

