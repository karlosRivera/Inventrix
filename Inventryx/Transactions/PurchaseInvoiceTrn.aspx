<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="PurchaseInvoiceTrn.aspx.cs" Inherits="Transactions_PurchaseInvoiceTrn" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc"%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/PurchaseInvoice.js"></script>

    <table border="0" style="width: 100%">
        <tr>
            <td align="left" style="width: 792px">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Purchase Invoice Details</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>  
            <td align= "left" valign="top" style="height: 481px; width: 792px;">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader">
                        Purchase Invoice Details</td>
                </tr>

                <tr>
                    <td colspan="2" style="height: 17px">
                        <Spc:SpacerImage ID="SpacerImage1741" runat="server" Style="position: relative" Height="10px" Width="5px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" cellspacing="0" style="width: 100%; position: relative; height: 100%">
                            <tr>
                                <td style="width: 19%; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Purchase Inv. No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                    </td>
                                <td style="width: 191px; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtPurchaseInvNo" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td style="width: 17%; height: 21px;" valign="top">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Supplier Inv. No."></asp:Label></td>
                                <td style="width: 279px; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtSupInvNo" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                        Style="position: relative; left: 0px;" TabIndex="9" Width="256px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 19%; height: 21px" valign="top">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Purchase Order No."></asp:Label></td>
                                <td align="left" valign="top" style="width: 191px">
                                    <asp:DropDownList ID="ddPurchaseOrder" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="ddPurchaseOrder_SelectedIndexChanged">
                                    </asp:DropDownList></td>
                                <td style="width: 17%; height: 21px" valign="top">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="List of GRN"></asp:Label></td>
                                <td rowspan="4" style="width: 279px" valign="top">
                                    <asp:CheckBoxList ID="lstchkGRN" runat="server" CssClass="INPUTblack" Height="3px"
                                        Width="261px">
                                    </asp:CheckBoxList></td>
                            </tr>
                            <tr>
                                <td style="width: 19%; height: 3px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Purchase Inv. Date" Font-Bold="True" style="position: relative" Width="109px"></asp:Label>
                                    &nbsp;
                                    &nbsp; <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td valign="top" style="height: 3px; width: 191px;"><cc1:GMDatePicker ID="txtPurchaseInvDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" Width="185px" >
                                    <CalendarFont Names="Arial" />
                                    <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                    <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                    <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                    <CalendarDayStyle Font-Size="9pt" />
                                </cc1:GMDatePicker>
                                    </td>
                                <td style="width: 17%; height: 3px;" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 19%; height: 2px;" valign="top">
                                    <asp:Label ID="Label6" runat="server"  Text="Supplier" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 191px; height: 2px;" valign="top"><asp:DropDownList ID="ddSupplier" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                    <asp:ListItem Value="V">Van</asp:ListItem>
                                </asp:DropDownList>
                                    </td>
                                <td style="width: 17%; height: 2px;" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 19%; height: 16px;" valign="top">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Supplier Inv. Date"></asp:Label></td>
                                <td style="width: 191px; height: 16px;" valign="top">
                                    <cc1:GMDatePicker ID="txtSupInvDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" Width="185px" ><CalendarFont Names="Arial" />
                                        <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                        <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                        <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                        <CalendarDayStyle Font-Size="9pt" />
                                    </cc1:GMDatePicker>
                                </td>
                                <td style="width: 17%; height: 16px;" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 19%; height: 41px;" valign="top">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%; height: 41px;" colspan="3" valign="top">
                                    <asp:TextBox ID="txtRemarks" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="200" Style="position: relative; top: 2px;" Rows="10" TextMode="MultiLine" Width="75%" Height="58px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 19%" valign="top">
                            </td>
                                <td colspan="3" style="width: 25%" valign="top">
                                </td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="left" class="entryBoxHeader">
                        </td>
                    <td align="right" class="entryBoxHeader">
                        <asp:Button ID="btnPopulateProduct" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Populate Products" CssClass="button" Width="156px" OnClick="btnPopulateProduct_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server"  AutoGenerateColumns="False"
                            CellPadding="3" GridLines="Horizontal" Width="100%"
                            CssClass="gridMain" Visible="False" OnItemDataBound="dgList_ItemDataBound">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle  CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />                                                            
                            <Columns>
                                <asp:BoundColumn DataField="ProductID" HeaderText="Product ID" Visible="False"></asp:BoundColumn>
                            
                                <asp:BoundColumn HeaderText="Sl No">
                                    <ItemStyle Width="5%" Wrap="False" Font-Bold="True" HorizontalAlign="Center" />
                                    <HeaderStyle Font-Bold="True" Wrap="False" Width="5%" HorizontalAlign="Center" />
                                </asp:BoundColumn>                        
                                <asp:BoundColumn DataField="Product" HeaderText="Product">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Unit" HeaderText="Unit">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Center" />
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Center" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="PORate" HeaderText="P.O. Rate">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="S. Inv. Rate">
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtInvRate" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                        Style="position: relative" TextAlign="Right" Text='<%# DataBinder.Eval(Container, "DataItem.PORate") %>'></ew:NumericBox>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="GRNQty" HeaderText="GRN Qty">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" />
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:BoundColumn>
                                <asp:TemplateColumn HeaderText="S. Inv. Qty">
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right"/>
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtInvQty" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right" Text='<%# DataBinder.Eval(Container, "DataItem.GRNQty") %>'></ew:NumericBox>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Amt">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtAmount" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right" Text='<%# DataBinder.Eval(Container, "DataItem.ProductAmt") %>'></ew:NumericBox>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" />
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative">
                            <tr>
                                <td style="width: 76px">
                                        <asp:Label ID="Label10" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                Vat Rate&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtVatRate" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 100px">
                                                <asp:Label ID="Label11" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtVatAmt" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 73px">
                                                    <asp:Label ID="Label9" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtSubTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 47px">
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative" Text="Inv. Total" Width="57px"></asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtInvTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            </td>
                    </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px; top: 1px;" Text="Save" CssClass="button" OnClick="btnSave_Click" />
                    <input id="btnBack" class="button" onclick="document.location.href='PurchaseInvoice.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
                <input id="hdnTotalRow" type="hidden" style="width: 4px; height: 1px" runat=server /></td>
        </tr>
    </table>
</asp:Content>