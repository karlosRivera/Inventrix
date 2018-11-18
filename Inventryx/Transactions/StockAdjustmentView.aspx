<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="StockAdjustmentView.aspx.cs" Inherits="Transactions_StockAdjustmentView" %>

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
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Stock Adjustment View</asp:Label>
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
                        Stock Adjustment Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="Stock Adjustment No ." Font-Bold="True" Width="126px"></asp:Label></td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:Label ID="lblStockAdjustmentNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 21%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Stock Adjustment Date" Font-Bold="True" style="position: relative"></asp:Label></td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:Label ID="lblStockAdDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 1px" valign="top">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Stock Point"></asp:Label></td>
                                <td style="width: 25%; height: 1px" valign="top">
                                    <asp:Label ID="lblStockAdjustmentDate" runat="server" Style="position: relative; left: 0px;"></asp:Label></td>
                                <td style="width: 21%; height: 1px" valign="top">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Product"></asp:Label></td>
                                <td style="width: 45%; height: 1px" valign="top">
                                <asp:Label ID="lblProduct" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%; height: 56px;" valign="top" rowspan="3">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td style="height: 56px;" valign="top" colspan="3" rowspan="3">
                                    <asp:Label ID="lblRemarks" runat="server" Style="position: relative" Height="78px" Width="427px"></asp:Label></td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td rowspan="1" style="width: 16%" valign="top">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Date"></asp:Label></td>
                                <td colspan="3" rowspan="1" valign="top">
                                    <asp:Label ID="lblCancelDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 16%;" valign="top" rowspan="2">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Reason"></asp:Label></td>
                                <td colspan="3" style="width: 25%;" valign="top" rowspan="2">
                                    <asp:Label ID="lblCancelReason" runat="server" Height="52px" Width="457px"></asp:Label></td>
                            </tr>
                            <tr>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:DataGrid ID="dgList" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="3" CssClass="gridMain" GridLines="Horizontal" Style="position: relative"
                            Width="100%">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" />
                            <HeaderStyle BorderWidth="1px" CssClass="gridHeader" Font-Bold="True" Wrap="False" />
                            <Columns>
                                <asp:BoundColumn DataField="StockInDtlID" HeaderText="StockInDtl ID">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="InDocType" HeaderText="Doc Type">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="InDocNo" HeaderText="Doc No">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="InDocDate" HeaderText="Doc Date">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="BookStockQty" HeaderText="Book Stock">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="PhysicalStockQty" HeaderText="Physical Stock">
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
                                <td style="width: 59px; height: 15px;">
                                        </td>
                                <td style="width: 61px; height: 15px;">
                                    </td>
                                <td style="width: 94px; height: 15px;">
                                                </td>
                                <td style="width: 119px; height: 15px;">
                                    </td>
                                <td style="width: 125px; height: 15px;">
                                                    <asp:Label ID="Label9" Font-Bold="True" runat="server" Style="position: relative" Text="Book Stock"></asp:Label></td>
                                <td style="width: 107px; height: 15px;" align="left">
                                    <asp:Label ID="lblBookStock" runat="server" Style="position: relative; left: 0px; top: 0px;"></asp:Label></td>
                                <td style="width: 135px; height: 15px;" align="right">
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative" Text="Physical Stock"></asp:Label></td>
                                <td style="width: 100px; height: 15px;" align="right">
                                    <asp:Label ID="lblPhysicalStock" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    <tr>
                        <td colspan="2" style="height: 15px; text-align: left">
                            <asp:Panel ID="pnlInvCancel" runat="server" Visible="False">
                <table id="tblSearch2" class="searchBox" align="center" border="0" cellpadding="2" cellspacing="0" style="height: 1px" >
                    <tr style="font-weight: bold; color: #000000">
                        <td style="height: 17px" class="entryBoxHeader" colspan="2">
                            Stock Adjustment Cancellation</td>
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
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" Style="left: -6px; position: relative; top: 0px" Text="Cancel" Visible="False" OnClick="btnCancel_Click"/>
                    <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="position: relative; left: -2px; top: 0px;"
                        Text="Print"/>
                    <input id="btnBack" class="button" onclick="document.location.href='StockAdjustment.aspx'"  style="position: relative" type="button" value="Back" />&nbsp;</td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>