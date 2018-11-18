<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="BranchView.aspx.cs" Inherits="BranchView" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mainContent">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" border="0" cellpadding="2" cellspacing="0" class="topHeading">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="1.1em" ForeColor="White" Style="position: relative">Branch View</asp:Label>
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
                            <asp:Label ID="lblBranchID" runat="server" Width="130px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 6px">
                Contact Person</td>
                        <td align="left" style="width: 500px; height: 6px">
                            <asp:Label ID="lblContactPerson" runat="server" Font-Bold="False" Width="228px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 1px">
                            Branch Name</td>
                        <td align="left" style="font-weight: bold; width: 575px; height: 1px">
                            <asp:Label ID="lblBranchName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 1px">
                            Person Designation</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 1px">
                            <asp:Label ID="lblPersonDesignation" runat="server" Font-Bold="False" Width="228px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            Company Name</td>
                        <td align="left" style="font-weight: bold; width: 575px; height: 17px">
                            <asp:Label ID="lblCompanyName" runat="server" Font-Bold="False" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 513px; height: 17px">
                            Mobile No.</td>
                        <td align="left" style="font-weight: bold; width: 500px; height: 17px">
                            <asp:Label ID="lblMobileNo" runat="server" Width="187px" Font-Bold="False"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" rowspan="3" style="font-weight: bold; width: 562px; height: 17px"
                            valign="top">
                            Address</td>
                        <td align="left" rowspan="3" style="width: 575px; height: 17px">
                            <asp:Label ID="lblBranchAddress" runat="server" Height="63px" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 513px">
                            Phone No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblPhoneNo" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 513px">
                            Fax No.</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblFaxNo" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 513px">
                        Email</td>
                        <td align="left" style="width: 500px; height: 17px">
                            <asp:Label ID="lblEmail" runat="server" Width="187px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            City</td>
                        <td align="left" style="width: 575px; height: 17px">
                            <asp:Label ID="lblCity" runat="server" Width="187px"></asp:Label></td>
                        <td align="left" style="font-weight: bold; width: 513px">
                        </td>
                        <td align="left" style="width: 500px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 562px; height: 17px">
                            Pin</td>
                        <td align="left" style="width: 575px; height: 17px">
                            <asp:Label ID="lblPin" runat="server" Width="187px"></asp:Label></td>
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
                            <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="left: -8px;
                                position: relative; top: 0px" Text="Print" Width="53px" /><input id="btnBack" class="button" onclick="document.location.href='Branch.aspx'"
                                style="position: relative" type="button" value="Back" />&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


