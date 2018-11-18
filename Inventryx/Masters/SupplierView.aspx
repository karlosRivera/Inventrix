<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="SupplierView.aspx.cs" Inherits="SupplierView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Supplier View</asp:Label>
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
                        <td align="left" style="font-weight: bold; width: 488px; height: 5px;">
                Supplier ID</td>
                        <td align="left" style="width: 500px; height: 5px;">
                            <asp:Label ID="lblSupplierID" runat="server" Width="112px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 110px; height: 5px;">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 5px;">
                            <asp:Label ID="lblContactPerson" runat="server" Width="231px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px;">
                Supplier Name</td>
                        <td align="left" style="font-weight: bold; width: 500px;">
                            <asp:Label ID="lblSupplierName" runat="server" Font-Bold="False" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 500px;">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px;">
                            <asp:Label ID="lblPersonDesignation" runat="server" Font-Bold="False" Width="231px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top" rowspan="3" align="left" style="font-weight: bold; width: 488px; height: 17px">Address</td>
                        <td rowspan="3" align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblAddress" runat="server" Height="54px" Width="227px"></asp:Label></td>

                        <td align="left" style="font-weight: bold; width: 110px">Mobile No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblMobileNo" runat="server" Width="231px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">Email</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblEmail" runat="server" Width="231px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">VAT Reg. No.</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblVATRegNo" runat="server" Width="231px"></asp:Label></td>                                
                    </tr>
                    
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px;">City</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblCity" runat="server" Text="Label" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 110px">
                            VAT Reg. Date</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblVATRegDate" runat="server" Width="147px"></asp:Label></td>
                            
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px;">
                            Pin</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblPin" runat="server" Width="208px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 110px">PAN No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPANNo" runat="server" Width="231px"></asp:Label></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px">Phone No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPhoneNo" runat="server" Width="208px"></asp:Label></td>
                        <td valign="top" align="left" style="font-weight: bold; width: 110px" rowspan="3">Comments</td>
                        <td align="left" style="width: 500px" rowspan="3">
                            <asp:Label ID="lblComments" runat="server" Height="54px" Width="227px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 488px;">Fax No.</td>
                        <td align="left" style="width: 500px;">
                            <asp:Label ID="lblFaxNo" runat="server" Width="208px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 488px;">
                        URL</td>
                        <td style="width: 500px;">
                            <asp:Label ID="lblURL" runat="server" Width="208px"></asp:Label></td>
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
                            &nbsp;<asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: 0px; position: relative; top: 0px" Text="Print" Width="53px" />
                            <input id="btnBack" class="button" onclick="document.location.href='Supplier.aspx'"
                                style="position: relative" type="button" value="Back" />
                            &nbsp;&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>