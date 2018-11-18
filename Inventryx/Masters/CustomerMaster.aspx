<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CustomerMaster.aspx.cs" Inherits="CustomerMaster" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/Customer.js"></script>

    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Customer Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        
            <td align="left" colspan="2" style="width: 740px; height: 56px" valign="top">
                <table id="tblEntry" border="0" cellpadding="2" cellspacing="0" class="entryBox" tabindex="-1">
                    <tr>
                        <td align="center" class="entryBoxHeader" colspan="4">
                            Customer Details</td>
                    </tr>
                    <tr>
                        <td style="width: 488px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                        <td align="left" style="width: 330px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 23px;">
                            Customer ID</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtCustomerID" runat="server" Columns="8" CssClass="INPUTblack"
                    Enabled="False" MaxLength="10" Style="left: 1px; position: relative; top: 0px;" Width="90px"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 330px; height: 23px;">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 23px;">
                <asp:TextBox ID="txtContactPerson" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="position: relative; top: 0px" Width="220px" TabIndex="10"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 17px">
                            Customer Name <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtCustomerName" runat="server" Columns="50" CssClass="INPUTblack"
                    MaxLength="50" Style="left: 0px; position: relative; top: 0px" Width="220px" TabIndex="1"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 330px; height: 17px">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:TextBox ID="txtPersonDesignation" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative" Width="220px" TabIndex="11"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 67px" valign="top">
                            Billing Address <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 500px; height: 67px">
                            <asp:TextBox ID="txtBillingAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 1px; top: 0px;" TextMode="MultiLine" Height="57px" Width="220px" TabIndex="2"></asp:TextBox></td>

                        <td align="left" style="font-weight: bold; width: 330px; height: 67px;" valign="top">
                            Shipping Address<br /><br />
                            <asp:CheckBox ID="chkCopyBillAddr" runat="server" Text="Copy Bill. Addr." Width="106px" Font-Bold="False" TabIndex="-1"/></td>
                        <td align="left" style="width: 500px; height: 67px">
                            <asp:TextBox ID="txtShippingAddress" runat="server" Columns="50" CssClass="INPUTblack" Height="57px"
                                MaxLength="50" Style="left: 1px; position: relative; top: 0px" TextMode="MultiLine"
                                Width="220px" TabIndex="12"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 724px">
                            Billing City</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtBillingCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="146px" TabIndex="3"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 330px; height: 17px">
                            Shipping City</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtShippingCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="148px" TabIndex="13"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 724px">
                            Billing Pin</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtBillingPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="147px" TabIndex="4"></asp:TextBox></td>                                
                        <td align="left" style="font-weight: bold; width: 330px">
                            Shipping Pin</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtShippingPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="left: 1px; position: relative" Width="147px" TabIndex="14"></asp:TextBox></td>
                    </tr>
                    
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 17px">Phone No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtPhoneNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                             Style="left: 0px; position: relative" Width="147px" TabIndex="5"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 330px">
                            PAN No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtPANNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative" Width="220px" TabIndex="15"></asp:TextBox></td>
                            
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px; height: 17px">
                            Mobile No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:TextBox ID="txtMobileNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; top: 0px" Width="147px" TabIndex="6"></asp:TextBox></td>
                        <td align="left" style="font-weight: bold; width: 330px" rowspan="4" valign="top">Comments</td>
                        <td align="left" style="width: 500px" rowspan="4">
                            <asp:TextBox ID="txtRemarks" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; top: -9px;" TextMode="MultiLine" Height="65px" Width="219px" TabIndex="16"></asp:TextBox></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px">
                            Fax No.</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtFaxNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative; top: 0px" Width="147px" TabIndex="7"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px">
                        URL</td>
                        <td align="left" style="width: 500px">
                            <asp:TextBox ID="txtURL" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="position: relative; left: 0px; top: 0px;" Width="220px" TabIndex="8"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 488px; height: 1px;">
                        Email</td>
                        <td style="width: 500px; height: 1px;">
                            <asp:TextBox ID="txtEmail" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                            Style="left: 1px; position: relative; top: 0px;" Width="220px" TabIndex="9"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 488px">
                        </td>
                        <td style="width: 500px">
                        </td>
                        <td style="width: 330px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            <asp:Button ID="btnSave" runat="server" CssClass="button" OnClick="btnSave_Click"
                                Style="left: -2px; position: relative" Text="Save" Width="53px" TabIndex="17" />
                            <input id="btnBack" class="button" onclick="document.location.href='Customer.aspx'"
                                style="position: relative" type="button" value="Back" tabindex="18" />
                            <input id="Reset1"
                                    class="button" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" tabindex="19" />&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

