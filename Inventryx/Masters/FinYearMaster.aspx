<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FinYearMaster.aspx.cs" Inherits="FinYearMaster" Title="Untitled Page" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Financial Year Entry</asp:Label>
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
                            Financial Year Entry</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Fin Year ID <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtFinYearID" runat="server" Columns="8" MaxLength="4"
                                Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtFinYearID"
                                Display="Dynamic" ErrorMessage="Required" Font-Bold="True" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Start Date&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <cc1:GMDatePicker ID="txtStartDate" runat="server" CalendarFont-Names="Arial" CalendarTheme="Blue"
                                CssClass="INPUTblack" Style="position: relative">
                                <CalendarFont Names="Arial" />
                                <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                <CalendarTodayDayStyle BorderColor="DarkRed" BorderWidth="1px" Font-Bold="True" />
                                <CalendarTitleStyle BackColor="#E0E0E0" Font-Names="Arial" Font-Size="9pt" />
                                <CalendarDayStyle Font-Size="9pt" />
                            </cc1:GMDatePicker>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStartDate"
                                Display="Dynamic" ErrorMessage="Required" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            End Date <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px">
                            <cc1:GMDatePicker ID="txtEndDate" runat="server" CalendarFont-Names="Arial" CalendarTheme="Blue"
                                CssClass="INPUTblack" Style="position: relative">
                                <CalendarFont Names="Arial" />
                                <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                <CalendarTodayDayStyle BorderColor="DarkRed" BorderWidth="1px" Font-Bold="True" />
                                <CalendarTitleStyle BackColor="#E0E0E0" Font-Names="Arial" Font-Size="9pt" />
                                <CalendarDayStyle Font-Size="9pt" />
                            </cc1:GMDatePicker>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEndDate"
                                Display="Dynamic" ErrorMessage="Required" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='FinYearList.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


