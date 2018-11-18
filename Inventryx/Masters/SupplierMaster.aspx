<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="SupplierMaster.aspx.cs" Inherits="SupplierMaster" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Supplier Entry</asp:Label>
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
                            Supplier Details</td>
                    </tr>
                    <tr>
                        <td style="width: 488px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 23px;">
                Supplier ID</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtSupplierID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 110px; height: 23px;">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtContactPerson" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="position: relative; top: 0px" Width="220px" TabIndex="8"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 17px">
                Supplier Name <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtSupplierName" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="left: 0px; position: relative; top: 0px" Width="228px" TabIndex="1"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtPersonDesignation" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" Width="220px" TabIndex="9"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td rowspan="3" align="left" style="font-weight: bold; width: 488px; height: 17px">Address</td>
                        <td rowspan="3" align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px; top: 0px;" TextMode="MultiLine" Height="57px" Width="228px" TabIndex="2"></asp:TextBox></td>

                        <td align="left" style="font-weight: bold; width: 110px">Mobile No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtMobileNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" Width="220px" TabIndex="10"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">Email</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="left: 1px; position: relative" Width="220px" TabIndex="11"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">VAT Reg. No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtVATRegNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative" Width="220px" TabIndex="12"></asp:TextBox></td>                                
                    </tr>
                    
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 2px">City</td>
                        <td align="left" style="width: 500px; height: 2px" valign="top">
                            <asp:TextBox ID="txtCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="left: 1px; position: relative" Width="224px" TabIndex="3"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 110px; height: 2px;">
                            VAT Reg. Date</td>
                        <td align="left" style="width: 500px; height: 2px;">
                            <cc1:GMDatePicker ID="txtVATRegDate" runat="server" 
                            CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack">
                            <CalendarDayStyle Font-Size="9pt" />
                            <CalendarTodayDayStyle BorderWidth="1px" 
                            BorderColor="DarkRed" Font-Bold="True" />
                            <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                            <CalendarTitleStyle BackColor="#E0E0E0" 
                            Font-Names="Arial" Font-Size="9pt" />
                            <CalendarFont Names="Arial" />
                            </cc1:GMDatePicker>
                        </td>
                            
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 17px">
                            Pin</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="147px" TabIndex="4"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 110px">PAN No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtPANNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative" Width="220px" TabIndex="14"></asp:TextBox></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px">Phone No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtPhoneNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                             Style="left: 0px; position: relative" Width="147px" TabIndex="5"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 110px" rowspan="3">Comments</td>
                        <td align="left" style="width: 500px" rowspan="3">
                            <asp:TextBox ID="txtComments" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; top: -2px;" TextMode="MultiLine" Height="57px" TabIndex="15"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px">Fax No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtFaxNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; top: 0px" Width="147px" TabIndex="6"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 488px; height: 23px;">
                        URL</td>
                        <td style="width: 500px; height: 23px;">
                            <asp:TextBox ID="txtURL" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px;" Width="228px" TabIndex="7"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 488px">
                        </td>
                        <td style="width: 500px">
                        </td>
                        <td style="width: 500px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: 1px; position: relative" Text="Save" Width="53px" TabIndex="16" />
                            <input id="btnBack" class="button" onclick="document.location.href='Supplier.aspx'"
                                style="position: relative; left: 1px;" type="button" value="Back" tabindex="17" />
                            <input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="18" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

