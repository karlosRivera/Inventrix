<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CompanyAdmin.aspx.cs" Inherits="CompanyAdmin" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Company Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="tblEntry" border="0" cellpadding="2" cellspacing="0" class="entryBox">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="4">
                            Company Details</td>
                    </tr>
                    <tr>
                        <td style="width: 604px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                        <td align="left" style="width: 927px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px; height: 2px;">
                            Company ID</td>
                        <td align="left" style="width: 500px; height: 2px;">
                <asp:TextBox ID="txtCompanyID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px; height: 2px;">
                            Serv. Tax Reg. No.</td>
                        <td align="left" style="width: 500px; height: 2px;">
                <asp:TextBox ID="txtServTaxRegNo" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="position: relative; top: 0px" Width="228px" TabIndex="10"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px; height: 17px">
                            Company Name <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtCompanyName" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="left: 0px; position: relative; top: 0px" Width="228px" TabIndex="1"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px; height: 17px">
                            Serv. Tax Code</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtServTaxCode" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" Width="228px" TabIndex="11"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="font-weight: bold; height: 17px">
                            <font color=blue>--------------------
                            Head Office Details ------------------------</font>
                            </td>
                        <td align="left" style="font-weight: bold; width: 927px; height: 17px">
                            Prof. Tax ECN</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtProfTaxECN" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" Width="228px" TabIndex="12"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td rowspan="3" align="left" style="font-weight: bold; width: 604px; height: 17px" valign="top">
                            Address</td>
                        <td rowspan="3" align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px; top: 0px;" TextMode="MultiLine" Height="57px" Width="228px" TabIndex="2"></asp:TextBox></td>

                        <td align="left" style="font-weight: bold; width: 927px">
                            Prof. Tax RCN</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtProfTaxRCN" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="left: 1px; position: relative" Width="228px" TabIndex="13"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 927px">
                            IT Tan No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtITTanNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px;" Width="228px" TabIndex="14"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 927px">
                            VAT No.</td>
                        <td align="left" style="width: 500px;">
                            <asp:TextBox ID="txtVATNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" TabIndex="15" Width="228px"></asp:TextBox></td>                                
                    </tr>
                    <tr>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 604px; height: 17px"
                            valign="top">
                            City</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" TabIndex="3" Width="135px"></asp:TextBox></td>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 927px">
                            Reg. No.</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtRegNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="16" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 604px; height: 17px"
                            valign="top">
                            Pin</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" TabIndex="4" Width="135px"></asp:TextBox></td>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 927px">
                            PF No.</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPFNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="17" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px; height: 17px">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtContactPerson" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="228px" TabIndex="5"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px">
                            ESI No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtESINo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="18" Width="228px"></asp:TextBox></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px; height: 17px">
                            Person Designation</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPersonDesignation" runat="server" Columns="50" CssClass="INPUTblack"
                                MaxLength="50" Style="left: 1px; position: relative" TabIndex="6" Width="228px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px">
                            PAN No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPANNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="19" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px">Phone No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtPhoneNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                             Style="left: 0px; position: relative" Width="135px" TabIndex="7"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px">
                            CST No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtCSTNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="20" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 604px">Fax No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtFaxNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; top: 0px" Width="135px" TabIndex="8"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 927px">
                            LST No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtLSTNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="21" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 604px;">
                        Email</td>
                        <td style="width: 500px;">
                            <asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px;" Width="228px" TabIndex="9"></asp:TextBox></td>
                        <td style="font-weight: bold; width: 927px">
                            URL</td>
                        <td style="width: 500px">
                            <asp:TextBox ID="txtURL" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 0px; position: relative" TabIndex="22" Width="228px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 604px">
                        </td>
                        <td style="width: 500px">
                        </td>
                        <td style="width: 927px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: -5px; position: relative" Text="Save" Width="53px" TabIndex="23" />
                            <input id="btnBack" class="button" onclick="document.location.href='Company.aspx'"
                                style="position: relative" type="button" value="Back" tabindex="24" />
                            <input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="25" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>