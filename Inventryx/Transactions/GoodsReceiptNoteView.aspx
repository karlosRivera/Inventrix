<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GoodsReceiptNoteView.aspx.cs" Inherits="Transactions_GoodsReceiptNoteView" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/PurchaseOrder.js"></script>


    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Goods Receipt Note View</asp:Label>
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
                        Goods Receipt Note Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="GRN No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    &nbsp;<asp:Label ID="lblGrnNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="GRN Date" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    &nbsp;<asp:Label ID="lblGrnDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label2" runat="server"  Text="P.O. No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%" valign="top">
                                    &nbsp;<asp:Label ID="lblPoNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Supplier" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:Label ID="lblSupplier" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="P.O. Date."></asp:Label></td>
                                <td style="width: 25%" valign="top">
                                    &nbsp;<asp:Label ID="lblPodate" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Stock Point"></asp:Label>
                                    &nbsp; &nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:Label ID="lblStockPoint" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 15px;" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="Sup. D/N No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 15px;" valign="top">
                                    <asp:Label ID="lblSupDnno" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 15px;" valign="top">
                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Sup. D/N Date"></asp:Label>
                                    &nbsp; &nbsp;
                                </td>
                                <td style="width: 45%; height: 15px;" valign="baseline">
                                    &nbsp;<asp:Label ID="lblSupDnDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label7" runat="server"  Text="Delivered By" Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblDeliveredBy" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Vehicle No"></asp:Label>&nbsp;&nbsp; &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    &nbsp;<asp:Label ID="lblVehicleNo" runat="server" Style="position: relative"></asp:Label></td>
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
                    <td align="left" class="entryBoxHeader">
                        Product Details</td>
                    <td align="right" class="entryBoxHeader">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server" AutoGenerateColumns="False" CellPadding="3"
                            CssClass="gridMain" GridLines="Horizontal" Style="position: relative" Width="100%">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="Product">
                                    <HeaderStyle Font-Bold="True" Width="35%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductID") %>'
                                            Visible="false"></asp:Label>
                                        <asp:Label ID="lblProductName" runat="server" 
                                            Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>' Width="100%"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Unit">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnit" runat="server"   Style="position: relative"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.Unit") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Rate">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblRate" runat="server"   Style="position: relative"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Balance Qty">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="10%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblQty" runat="server"   Style="position: relative"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.Qty") %>'></asp:Label>
                                            
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Receive Qty">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblRcptQty" runat="server"   Style="position: relative"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.RcptQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            <Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                           <asp:Panel ID="pnlCancel" runat="server" Height="50px" 
                           Style="left:0px;position: relative;top: 0px" Width="100%">
                                <table style="width: 100%; position: relative; height: 100%">
                                    <tr>
                                        <td style="width: 20%" valign="top">
                                            <asp:Label ID="Label10" runat="server" Font-Bold="True" Style="position: relative"
                                                Text="Cancel Date"></asp:Label></td>
                                        <td style="width: 80%" valign="top">
                                            <asp:Label ID="lblCancelDate" runat="server" Style="position: relative"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; height: 66px" valign="top">
                                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Style="position: relative"
                                                Text="Cancel Reason"></asp:Label></td>
                                        <td style="width: 80%; height: 66px" valign="top">
                                            <asp:Label ID="lblCancelReason" runat="server" Style="position: relative"></asp:Label></td>
                                    </tr>
                                </table>
                            </asp:Panel>                        
                        </td>
                    </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left"><Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnPrint" runat="server" CssClass="button" OnClick="btnPrint_Click"
                        Style="position: relative" Text="Print" />
                    &nbsp;<input id="btnBack" class="button" onclick="document.location.href='GoodsReceiptNoList.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    </td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>





