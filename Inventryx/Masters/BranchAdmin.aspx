<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="BranchAdmin.aspx.cs" Inherits="BranchAdmin" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 24px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading" tabindex="-1" style="height: 23px">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Branch Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="Table1" border="0" cellpadding="2" cellspacing="0" class="entryBox">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="4">Branch Details</td>
                    </tr>
                    <tr>
                        <td style="width: 562px">
                        </td>
                        <td align="left" style="width: 575px">
                        </td>
                        <td align="left" style="width: 513px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 6px">
                            Branch ID</td>
                        <td align="left" style="width: 575px; height: 6px">
                <asp:TextBox ID="txtBranchID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px" TabIndex="-1"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 6px">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 6px">
                <asp:TextBox ID="txtContactPerson" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="position: relative; top: 0px" Width="220px" TabIndex="5"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 1px">
                            Branch Name &nbsp; &nbsp; &nbsp; <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 575px; height: 1px">
                            <asp:TextBox ID="txtBranchName" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="left: 0px; position: relative; top: 0px" Width="220px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 1px">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 1px">
                            <asp:TextBox ID="txtPersonDesignation" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative; top: 0px" TabIndex="6" Width="220px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            Company Name&nbsp; <span style="color: #ff3300">*</span></td>
                        <td align="left" style="font-weight: bold; width: 575px; height: 17px">
                            <asp:DropDownList ID="ddCompany" runat="server" CssClass="INPUTblack" Style="position: relative"
                                TabIndex="1" Width="224px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 17px">
                            Mobile No.</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtMobileNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="7" Width="147px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="3" style="font-weight: bold; width: 562px; height: 17px">
                            Address</td>
                        <td align="left" rowspan="3" style="width: 575px; height: 17px">
                            <asp:TextBox ID="txtBranchAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 1px; top: 0px;" TextMode="MultiLine" Height="57px" Width="220px" TabIndex="2"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 513px">
                            Phone No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPhoneNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                             Style="left: 0px; position: relative" Width="147px" TabIndex="8"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 513px">
                            Fax No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtFaxNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative; top: 0px" Width="147px" TabIndex="9"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 513px">
                        Email</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="left: 1px; position: relative; top: 0px;" Width="220px" TabIndex="10"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            City</td>
                        <td align="left" style="width: 575px; height: 17px">
                            <asp:TextBox ID="txtCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="3" Width="147px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 513px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            Pin</td>
                        <td align="left" style="width: 575px; height: 17px">
                            <asp:TextBox ID="txtPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="4" Width="147px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 513px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 562px">
                        </td>
                        <td style="width: 575px">
                        </td>
                        <td style="width: 513px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: -9px; position: relative; top: 0px;" Text="Save" Width="53px" TabIndex="11" /><input id="btnBack" class="button" onclick="document.location.href='Branch.aspx'"
                                style="position: relative; left: -3px; top: 0px;" type="button" value="Back" tabindex="12" /><input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="13" />&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
