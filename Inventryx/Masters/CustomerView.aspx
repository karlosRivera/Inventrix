<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CustomerView.aspx.cs" Inherits="CustomerView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Customer View</asp:Label>
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
                            Customer Details</td>
                    </tr>
                    <tr>
                        <td style="width: 293px">
                        </td>
                        <td align="left" style="width: 234px">
                        </td>
                        <td align="left" style="width: 535px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px; height: 8px;">
                            Customer ID</td>
                        <td align="left" style="width: 234px; height: 8px;">
                            <asp:Label ID="lblCustomerID" runat="server" Width="130px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 535px; height: 8px;">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 8px;">
                            <asp:Label ID="lblContactPerson" runat="server" Font-Bold="False" Width="228px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px; height: 17px">
                            Customer Name </td>
                        <td align="left" style="font-weight: bold; width: 234px; height: 17px">
                            <asp:Label ID="lblCustomerName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 535px; height: 17px">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:Label ID="lblPersonDesignation" runat="server" Font-Bold="False" Width="228px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px; height: 67px" valign="top">
                            Billing Address</td>
                        <td align="left" style="width: 234px; height: 67px">
                            <asp:Label ID="lblBillingAddress" runat="server" Height="63px" Width="197px"></asp:Label></td>

                        <td align="left" style="font-weight: bold; width: 535px; height: 67px;" valign="top">
                            Shipping Address<br /><br />
                            </td>
                        <td align="left" style="width: 500px; height: 67px">
                            <asp:Label ID="lblShippingAddress" runat="server" Height="63px" Width="197px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px">
                            Billing City</td>
                        <td align="left" style="width: 234px; height: 17px">
                            <asp:Label ID="lblBillingCity" runat="server" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 535px; height: 17px">
                            Shipping City</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblShippingCity" runat="server" Width="228px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px">
                            Billing Pin</td>
                        <td align="left" style="width: 234px; height: 17px">
                            <asp:Label ID="lblBillingPin" runat="server" Width="187px"></asp:Label></td>                                
                        <td align="left" style="font-weight: bold; width: 535px">
                            Shipping Pin</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblShippingPin" runat="server" Width="228px"></asp:Label></td>
                    </tr>
                    
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px; height: 17px">Phone No.</td>
                        <td align="left" style="width: 234px; height: 17px">
                            <asp:Label ID="lblPhoneNo" runat="server" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 535px">
                            PAN No.</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPANNo" runat="server" Width="228px"></asp:Label></td>
                            
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px; height: 17px">
                            Mobile No.</td>
                        <td align="left" style="width: 234px; height: 17px">
                            <asp:Label ID="lblMobileNo" runat="server" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 535px" rowspan="4" valign="top">Comments</td>
                        <td align="left" style="width: 500px" rowspan="4">
                            <asp:Label ID="lblComments" runat="server" Height="71px" Width="197px"></asp:Label></td>
                                
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px">
                            Fax No.</td>
                        <td align="left" style="width: 234px">
                            <asp:Label ID="lblFaxNo" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 293px">
                        URL</td>
                        <td align="left" style="width: 234px">
                            <asp:Label ID="lblURL" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 293px; height: 1px;">
                        Email</td>
                        <td style="width: 234px; height: 1px;">
                            <asp:Label ID="lblEmail" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 293px">
                        </td>
                        <td style="width: 234px">
                        </td>
                        <td style="width: 535px">
                        </td>
                        <td style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="entryBoxFooter" colspan="4">
                            &nbsp;<asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: 0px;
                                position: relative; top: 0px" Text="Print" Width="53px" />
                            <input id="btnBack" class="button" onclick="document.location.href='Customer.aspx'"
                                style="position: relative" type="button" value="Back" />&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
