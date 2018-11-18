<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PurchaseOrderView.aspx.cs" Inherits="PurchaseOrderView" Title="Untitled Page" %>
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
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Purchase Order View</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>  
            <td align= "left" valign="top">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader">Purchase Order Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="P.O. No." Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:Label ID="lblPoNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    </td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label2" runat="server"  Text="Supplier" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblSupplier" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="P.O. Date" Font-Bold="True" style="position: relative"></asp:Label></td>
                                <td style="width: 45%" valign="top">
                                    &nbsp;<asp:Label ID="lblPoDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="Product Group" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblProductGroup" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Date of Delivery" Font-Bold="True" style="position: relative"></asp:Label></td>
                                <td style="width: 45%" valign="baseline">
                                    &nbsp;<asp:Label ID="lbldateofdelivery" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label7" runat="server"  Text="Department" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%" valign="top">
                                    <asp:Label ID="lblDepartment" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Payment Terms"></asp:Label></td>
                                <td style="width: 45%" valign="top">
                                    <asp:Label ID="lblPaymentterms" runat="server" Style="position: relative"></asp:Label></td>
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
                        <asp:DataGrid ID="dgList" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            CellPadding="3" CssClass="gridMain" GridLines="Horizontal"
                            Style="position: relative" Width="100%">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" />
                            <HeaderStyle BorderWidth="1px" CssClass="gridHeader" Font-Bold="True" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="Product ID">
                                    <HeaderStyle Font-Bold="True" Width="10%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductID") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Product Name">
                                    <HeaderStyle Font-Bold="True" Width="5%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblProductName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="Unit">
                                    <HeaderStyle Font-Bold="True" Width="5%" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductUOM") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="Rate">
                                    <HeaderStyle Font-Bold="True" Width="5%" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblRate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductRate") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="Qty">
                                    <HeaderStyle Font-Bold="True" Width="5%" Wrap="False" HorizontalAlign="Right"/>
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductQty") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="Amount">
                                    <HeaderStyle Font-Bold="True" Width="5%" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmt" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductAmt") %>'>
											</asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative">
                            <tr>
                                <td style="width: 100px">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                Vat Rate&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="lblVatRate" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 100px">
                                                <asp:Label ID="Label11" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="lblVatAmt" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 100px">
                                                    <asp:Label ID="Label9" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                    <asp:Label ID="lblSubTotal" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 100px">
                                                <asp:Label ID="Label12" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                P.O. Total&nbsp;</asp:Label></td>
                                <td style="width: 100px" align="right">
                                    <asp:Label ID="lblPoTotal" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            <asp:Panel ID="pnlCancel" runat="server" Height="50px" Style="left: 0px; position: relative;
                                top: 0px" Width="100%">
                                &nbsp;<table style="width: 100%; position: relative; height: 100%">
                                    <tr>
                                        <td style="width: 20%" valign="top">
                                            <asp:Label ID="Label13" runat="server" Font-Bold="True" Style="position: relative"
                                                Text="Cancel Date"></asp:Label></td>
                                        <td style="width: 80%" valign="top">
                                            <asp:Label ID="lblCancelDate" runat="server" Style="position: relative"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; height: 66px" valign="top">
                                            <asp:Label ID="Label14" runat="server" Font-Bold="True" Style="position: relative"
                                                Text="Cancel Reason"></asp:Label></td>
                                        <td style="width: 80%; height: 66px" valign="top">
                                            <asp:Label ID="lblCancelReason" runat="server" Style="position: relative"></asp:Label></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="position: relative"
                        Text="Print" OnClick="btnPrint_Click" />
                    <input id="btnBack" class="button" onclick="document.location.href='PurchaseOrder.aspx'"  style="position: relative" type="button" value="Back" />&nbsp;</td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>




