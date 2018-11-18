<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="SupplierRateMaster.aspx.cs" Inherits="SupplierRateMaster" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative; height: 255px;" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading" style="width: 726px">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Supplier Rate</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="tblEntry" border="0" cellpadding="2" cellspacing="0" class="entryBox" tabindex="-1" style="width: 731px; height: 82px">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="2">
                            Supplier Rate Details</td>
                    </tr>
                    <tr>
                        <td style="width: 136px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 136px; height: 23px;">
                            Supplier Rate ID</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtSupplierRateID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 136px; height: 17px">
                            Supplier Name <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:DropDownList ID="ddSupplier" runat="server" CssClass="INPUTblack" Style="position: relative"
                                Width="175px" TabIndex="1">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 136px; height: 5px" valign="top">
                            Product Name&nbsp; <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 500px; height: 5px">
                            <asp:DropDownList ID="ddProduct" runat="server" CssClass="INPUTblack" Style="position: relative"
                                Width="175px" TabIndex="2">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 136px; height: 6px;">
                            Effective Date&nbsp; <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 500px; height: 6px">
                            <cc1:gmdatepicker id="txtEffectiveDate" runat="server" calendarfont-names="Arial" calendartheme="Blue"
                                cssclass="INPUTblack" TabIndex="3">
                            <CalendarDayStyle Font-Size="9pt"  />
                            <CalendarTodayDayStyle BorderWidth="1px" 
                            BorderColor="DarkRed" Font-Bold="True"  />
                            <CalendarOtherMonthDayStyle BackColor="WhiteSmoke"  />
                            <CalendarTitleStyle BackColor="#E0E0E0" 
                            Font-Names="Arial" Font-Size="9pt"  />
                            <CalendarFont Names="Arial"  />
                            </cc1:gmdatepicker>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 136px">
                            Supplier Rate &nbsp; <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtSupplierRate" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="175px" TabIndex="4"></asp:TextBox></td>                                
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 136px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="2">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: 1px; position: relative" Text="Save" Width="53px" TabIndex="5" />
                            <input id="btnBack" class="button" onclick="document.location.href='SupplierRate.aspx'"
                                style="position: relative; left: 1px;" type="button" value="Back" tabindex="6" />
                            <input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="7" />&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
