<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SalesReturnView.aspx.cs" Inherits="Transactions_SalesReturnView" Title="Untitled Page" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/SalesReturn.js"></script>
    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Sales Return View</asp:Label>
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
                        Sales Return Details</td>
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
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Sales Return No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:Label ID="lblGrnNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Sales Return Date" Font-Bold="True" style="position: relative; top: 0px;"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:Label ID="lblGrnDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label2" runat="server"  Text="Invoice No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblInvNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Invoice Date" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:Label ID="lblInvDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td nowrap valign="top">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Delivery Note No"></asp:Label>&nbsp;
                                    </td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblDeliveryNoteNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td  valign="top" nowrap>
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Delivery Note Date"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:Label ID="lblDeliveryNoteDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Stock Point"></asp:Label>&nbsp; 
                                </td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblStockPoint" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Customer"></asp:Label>
                                    &nbsp; &nbsp; &nbsp;
                                </td>
                                <td style="width: 45%" valign="baseline">
                                    <asp:Label ID="lblCustomer" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 15px;" valign="top">
                                    <asp:Label ID="Label7" runat="server"  Text="Delivered By" Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 15px;" valign="top">
                                    <asp:Label ID="lbldeliveredBy" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 15px;" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Vehicle No"></asp:Label>&nbsp;&nbsp; &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 15px;" valign="top">
                                    <asp:Label ID="lblVehicleNo" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                </td>
                                <td style="width: 25%" valign="top">
                                    </td>
                                <td style="width: 15%" valign="top">
                                </td>
                                <td style="width: 45%" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 41px;" valign="top">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%; height: 41px;" colspan="3" valign="top">
                                    <asp:Label ID="lblRemarks" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:Panel ID="PnlDetail" runat="server" Style="position: relative" Width="100%">
                            <table border="0" width="100%">
                                <tr>
                                    <td align="left" class="entryBoxHeader">
                                        Product Details</td>
                                    <td align="right" class="entryBoxHeader">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                                        <!-- grid -->
                                        <asp:DataGrid ID="dgList" runat="server" AutoGenerateColumns="False" CellPadding="3"
                                            CssClass="gridMain" GridLines="Horizontal"
                                            Style="position: relative" Width="100%">
                                            <SelectedItemStyle CssClass="gridSelectedRow" />
                                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="Product">
                                                    <HeaderStyle Font-Bold="True" Width="35%" Wrap="False" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblProductID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductID") %>'
                                                            Visible="false"></asp:Label>
                                                        <asp:Label ID="lblProductName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Unit">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Wrap="False" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUnit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Unit") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Rate">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Invoice Qty">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGRNQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InvoiceQty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Return Qty">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRetQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.RetQty") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="Amount">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                                    <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Amount") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid><!-- grid --></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                                        &nbsp;<table border="0" cellpadding="1" style="width: 100%; position: relative">
                                            <tr>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="Label10" runat="server" Font-Bold="true" Style="position: relative"
                                                        Text="Label">
                                                Vat Rate&nbsp;</asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="lblVatRate" runat="server" Style="position: relative"></asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="Label11" runat="server" Font-Bold="true" Style="position: relative"
                                                        Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="lblVatAmt" runat="server" Style="position: relative"></asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="Label18" runat="server" Font-Bold="true" Style="position: relative"
                                                        Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="lblSubTotal" runat="server" Style="position: relative"></asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="Label17" runat="server" Font-Bold="True" Style="position: relative"
                                                        Text="Inv. Total"></asp:Label></td>
                                                <td style="width: 100px; height: 21px">
                                                    <asp:Label ID="lblInvTotal" runat="server" Style="position: relative"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
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
                    <asp:Button ID="btnPrint" runat="server" Style="position: relative; left: 3px;" Text="Print"  CssClass="button" OnClick="btnPrint_Click1" />
                    <input id="btnBack" class="button" onclick="document.location.href='SalesReturnList.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    </td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>
