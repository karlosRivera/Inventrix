<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CompanyView.aspx.cs" Inherits="CompanyView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Company View</asp:Label>
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
                        <td style="width: 592px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                        <td align="left" style="width: 988px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px; height: 5px;">
                            Company ID</td>
                        <td align="left" style="width: 500px; height: 5px;">
                            <asp:Label ID="lblCompanyID" runat="server" Width="112px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px; height: 5px;">
                            Serv. Tax Reg. No.</td>
                        <td align="left" style="width: 500px; height: 5px;">
                            <asp:Label ID="lblServTaxRegNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px;">
                            Company Name</td>
                        <td align="left" style="font-weight: bold; width: 500px;">
                            <asp:Label ID="lblCompanyName" runat="server" Font-Bold="False" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px;">
                            Serv. Tax Code</td>
                        <td align="left" style="font-weight: bold; width: 500px;">
                            <asp:Label ID="lblServTaxCode" runat="server" Font-Bold="False" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" style="font-weight: bold">
                            <font color=blue>&nbsp;&nbsp; ---------------- Head Office Details ---------------------------</font></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            Prof. Tax ECN</td>
                        <td align="left" style="font-weight: bold; width: 500px">
                            <asp:Label ID="lblProfTaxECN" runat="server" Width="208px" Font-Bold="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top" rowspan="3" align="left" style="font-weight: bold; width: 592px; height: 17px">
                            Branch Address</td>
                        <td rowspan="3" align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblAddress" runat="server" Height="54px" Width="227px"></asp:Label></td>

                        <td align="left" style="font-weight: bold; width: 988px">
                            Prof. Tax RCN</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblProfTaxRCN" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 988px">
                            VAT No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblVATNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 988px">
                            IT Tan No.</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblITTanNo" runat="server" Width="208px"></asp:Label></td>                                
                    </tr>
                    <tr>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 592px; height: 17px"
                            valign="top">
                            City</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:Label ID="lblCity" runat="server" Width="121px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            PAN No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPANNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="1" style="font-weight: bold; width: 592px; height: 17px"
                            valign="top">
                            Pin</td>
                        <td align="left" rowspan="1" style="width: 500px; height: 17px">
                            <asp:Label ID="lblPin" runat="server" Width="121px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            Reg. No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblRegNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px;">
                Contact Person</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblContactPerson" runat="server" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            PF No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPFNo" runat="server" Width="208px"></asp:Label></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px">
                            Person Designation</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPersonDesignation" runat="server" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            ESI No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblESINo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px">Phone No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPhoneNo" runat="server" Width="121px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            CST No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblCSTNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 592px;">Fax No.</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblFaxNo" runat="server" Width="121px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 988px">
                            LST No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblLSTNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 592px;">
                        Email</td>
                        <td style="width: 500px;">
                            <asp:Label ID="lblEmail" runat="server" Width="208px"></asp:Label></td>
                        <td style="font-weight: bold; width: 988px">
                        URL</td>
                        <td style="width: 500px">
                            <asp:Label ID="lblURL" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 592px">
                        </td>
                        <td style="width: 500px">
                        </td>
                        <td style="width: 988px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            &nbsp;<asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: 0px; position: relative; top: 0px" Text="Print" Width="53px" />
                            <input id="btnBack" class="button" onclick="document.location.href='Company.aspx'"
                                style="position: relative" type="button" value="Back" />
                            &nbsp;&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>