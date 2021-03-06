<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LabourCategoryMaster.aspx.cs" Inherits="LabourCategoryMaster" Title="Untitled Page" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative; height: 163px;" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading" style="width: 726px">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Labour Category</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        
            <td align="left" colspan="2" style="width: 740px; height: 36px" valign="top">
                <table id="tblEntry" border="0" cellpadding="2" cellspacing="0" class="entryBox" tabindex="-1" style="width: 731px; height: 82px">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="2">
                            Labour Category Details</td>
                    </tr>
                    <tr>
                        <td style="width: 176px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 176px; height: 23px;">
                            Labour Category ID</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtLabourCategoryID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 176px; height: 17px">
                            Labour Category Name&nbsp; <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtLabourCategoryName" runat="server" Columns="50" CssClass="INPUTblack"
                                MaxLength="50" Style="left: 0px; position: relative; top: 0px" TabIndex="1" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 176px">
                            Hourly Rate <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px">
                            <asp:TextBox ID="txtHourlyRate" runat="server" Columns="50" CssClass="INPUTblack"
                                MaxLength="50" Style="left: 0px; position: relative; top: 0px" TabIndex="1" Width="88px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 176px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="2">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: 1px; position: relative" Text="Save" Width="53px" TabIndex="5" />
                            <input id="btnBack" class="button" onclick="document.location.href='LabourCategory.aspx'"
                                style="position: relative; left: 1px;" type="button" value="Back" tabindex="6" />
                            <input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="7" />&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>