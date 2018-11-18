<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="ServiceInvoiceView.aspx.cs" Inherits="Transactions_ServiceInvoiceView" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/PurchaseOrder.js"></script>


    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Service Invoice View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>  
            <td align= "left" valign="top">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader">
                        Service Invoice Details</td>
                </tr>

                <tr>
                    <td colspan="2">
                        <Spc:SpacerImage ID="SpacerImage1741" runat="server" Style="position: relative" Height="10px" Width="5px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" cellspacing="0" style="width: 100%; position: relative; height: 100%">
                            <tr>
                                <td style="width: 16%; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Service Inv. No." Font-Bold="True" Width="88px"></asp:Label></td>
                                <td style="width: 19%; height: 21px;" valign="top">
                                    <asp:Label ID="lblServiceInvNo" runat="server" Style="position: relative; top: 2px;"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Job No." Width="88px"></asp:Label></td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:Label ID="lblJobNo" runat="server" Style="position: relative; top: 2px" Width="188px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%" valign="top">
                                    <asp:Label ID="Label2" runat="server"  Text="Inv. Date" Font-Bold="True"></asp:Label></td>
                                <td style="width: 19%" valign="top">
                                    <asp:Label ID="lblInvDate" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    </td>
                                <td style="width: 45%" valign="top">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 5px;" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="Customer" Font-Bold="True"></asp:Label></td>
                                <td style="width: 19%; height: 5px;" valign="top">
                                    <asp:Label ID="lblCustomer" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 5px;" valign="top">
                                    </td>
                                <td style="width: 45%; height: 5px;" valign="baseline">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 5px" valign="top">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Billing Address" Width="83px"></asp:Label></td>
                                <td style="width: 19%; height: 5px" valign="top">
                                    <asp:Label ID="lblBillingAddress" runat="server" Height="44px" Style="position: relative"
                                        Width="363px"></asp:Label></td>
                                <td style="width: 15%; height: 5px" valign="top">
                                </td>
                                <td style="width: 45%; height: 5px" valign="baseline">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 5px" valign="top">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Billing City" Width="59px"></asp:Label></td>
                                <td style="width: 19%; height: 5px" valign="top">
                                    <asp:Label ID="lblBillingCity" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 5px" valign="top">
                                </td>
                                <td style="width: 45%; height: 5px" valign="baseline">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 5px" valign="top">
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Billing Pin" Width="54px"></asp:Label></td>
                                <td style="width: 19%; height: 5px" valign="top">
                                    <asp:Label ID="lblBillingPin" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 5px" valign="top">
                                </td>
                                <td style="width: 45%; height: 5px" valign="baseline">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 46px;" valign="top">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%; height: 46px;" colspan="3" valign="top">
                                    <asp:Label ID="lblRemarks" runat="server" Style="position: relative" Height="44px" Width="486px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 6px" valign="top">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Date"></asp:Label></td>
                                <td colspan="3" style="width: 25%; height: 6px" valign="top">
                                    <asp:Label ID="lblCancelDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 54px" valign="top">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Reason"></asp:Label></td>
                                <td colspan="3" style="width: 25%; height: 54px" valign="top">
                                    <asp:Label ID="lblCancelReason" runat="server" Height="52px" Width="457px"></asp:Label></td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="3" CssClass="gridMain" GridLines="Horizontal"
                            Style="position: relative" Width="100%">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" />
                            <HeaderStyle BorderWidth="1px" CssClass="gridHeader" Font-Bold="True" Wrap="False" />
                            <Columns>
                                <asp:BoundColumn DataField="ServiceItemName" HeaderText="Service Item" SortExpression="ServiceItemName">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Particulars" HeaderText="Particulars" SortExpression="Particulars">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Rate" HeaderText="Rate" SortExpression="Rate">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="InvoiceQty" HeaderText="Invoice Qty." SortExpression="InvoiceQty">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="ServiceAmt" HeaderText="Service Amt." SortExpression="ServiceAmt">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundColumn>
                                
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative; left: 0px; top: 0px;">
                            <tr>
                                <td style="width: 59px">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                Vat Rate&nbsp;</asp:Label></td>
                                <td style="width: 61px">
                                    <asp:Label ID="lblVatRate" runat="server" Style="position: relative; top: 0px;"></asp:Label></td>
                                <td style="width: 94px">
                                                <asp:Label ID="Label11" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                <td style="width: 119px">
                                    <asp:Label ID="lblVatAmt" runat="server" Style="position: relative; left: 2px; top: 0px;"></asp:Label></td>
                                <td style="width: 125px">
                                                    <asp:Label ID="Label9" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                <td style="width: 107px" align="left">
                                    <asp:Label ID="lblSubTotal" runat="server" Style="position: relative; left: 0px; top: 0px;"></asp:Label></td>
                                <td style="width: 135px" align="right">
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative" Text="Inv. Total"></asp:Label></td>
                                <td style="width: 100px" align="right">
                                    <asp:Label ID="lblInvTotal" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    <tr>
                        <td colspan="2" style="height: 15px; text-align: left">
                            <asp:Panel ID="pnlInvCancel" runat="server" Visible="False">
                <table id="tblSearch2" class="searchBox" align="center" border="0" cellpadding="2" cellspacing="0" style="height: 1px" >
                    <tr style="font-weight: bold; color: #000000">
                        <td style="height: 15px" class="entryBoxHeader" colspan="2">
                            Service Invoice Cancellation</td>
                    </tr>
                    <tr style="font-weight: bold; color: #000000">
                        <td style="height: 10px; width: 101px;">
                                    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Date"></asp:Label>&nbsp; <strong><span style="color: #ff3300">*</span></strong></td>
                        <td style="font-weight: bold; height: 10px">
                                    <cc1:GMDatePicker ID="txtCancelDate" runat="server" CalendarFont-Names="Arial" CalendarTheme="Blue"
                                        CssClass="INPUTblack" TabIndex="3">
                                        <CalendarFont Names="Arial" />
                                        <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                        <CalendarTodayDayStyle BorderColor="DarkRed" BorderWidth="1px" Font-Bold="True" />
                                        <CalendarTitleStyle BackColor="#E0E0E0" Font-Names="Arial" Font-Size="9pt" />
                                        <CalendarDayStyle Font-Size="9pt" />
                                    </cc1:GMDatePicker>
                        </td>
                    </tr>
                    <tr style="font-weight: bold; color: #000000">
                        <td style="height: 28px; width: 101px;" valign="top">
                                    <asp:Label ID="lblReason" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Reason"></asp:Label>&nbsp; <strong><span style="color: #ff3300">*</span></strong></td>
                        <td style="font-weight: bold; height: 28px">
                                    <asp:TextBox ID="txtCancelReason" runat="server" Columns="50" CssClass="INPUTblack"
                                        Height="58px" MaxLength="200" Rows="10" Style="position: relative; top: 2px"
                                        TextMode="MultiLine" Width="75%"></asp:TextBox></td>
                    </tr>
                </table>
               </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                        </td>
                    </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" Style="left: -6px; position: relative; top: 0px" Text="Cancel" Visible="False" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="position: relative; left: -2px; top: 0px;"
                        Text="Print" OnClick="btnPrint_Click" />
                    <input id="btnBack" class="button" onclick="document.location.href='ServiceInvoice.aspx'"  style="position: relative" type="button" value="Back" />&nbsp;</td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>