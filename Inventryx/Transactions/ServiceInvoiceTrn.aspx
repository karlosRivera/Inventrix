
<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="ServiceInvoiceTrn.aspx.cs" Inherits="Transactions_ServiceInvoiceTrn" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
<script language=javascript type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/ServiceInvoice.js"></script>

<table border="0" style="width: 100%">
        <tr>
            <td align="left" style="width: 812px">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" 
                            Style="position: relative" ForeColor="White" Font-Size="1.1em">Service Invoice</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>  
            <td align= "left" valign="top" style="width: 812px">
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
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Invoice No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                    </td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtInvNo" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td style="height: 21px; width: 88px;" nowrap valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Invoice Date" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                <cc1:GMDatePicker ID="txtInvDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" style="position: relative" >
                                    <CalendarDayStyle Font-Size="9pt" />
                                    <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                    <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                    <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                    <CalendarFont Names="Arial" />
                                </cc1:GMDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td nowrap valign="top" style="height: 21px">
                                    <asp:Label ID="Label2" runat="server"  Text="Job No." Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:DropDownList ID="ddJobNo" runat="server" CssClass="INPUTblack" Style="position: relative" Width="227px" AutoPostBack="True" OnSelectedIndexChanged="ddJobNo_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    </td>
                                <td style="width: 88px; height: 21px;" valign="top"><span style="color: #ff3300"></span>
                                </td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td  valign="top" nowrap>
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Billing Address"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                </td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtBillingAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="200" Style="position: relative" Width="227px" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                                <td nowrap valign="top" style="width: 88px">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Customer" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%" valign="top">
                                    <asp:TextBox ID="txtCustomer" runat="server" CssClass="INPUTblack" MaxLength="100"
                                        Style="position: relative" Columns="50" Enabled="False" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top" align="left">
                                    <asp:Label ID="Label5" runat="server"  Text="City" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                </td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtCity" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="50" Style="position: relative" Width="227px"></asp:TextBox></td>
                                <td  valign="top" align="left" style="width: 88px">
                                    &nbsp;</td>
                                <td style="width: 45%" valign="baseline">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Pin"></asp:Label>
                                        &nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                 </td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="15"
                                        Style="position: relative" Width="227px"></asp:TextBox></td>
                                <td style="width: 88px" valign="top">
                                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 18px;" valign="top"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                <td style="width: 25%; height: 18px;" valign="top">
                                    </td>
                                <td style="width: 88px; height: 18px;" valign="top">
                                </td>
                                <td style="width: 45%; height: 18px;" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 41px;" valign="top">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td style="width: 25%; height: 41px;" colspan="3" valign="top">
                                    <asp:TextBox ID="txtRemarks" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="200" Style="position: relative; top: 2px;" Rows="10" TextMode="MultiLine" Width="75%" Height="58px"></asp:TextBox></td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            <asp:Panel ID="PnlDetail" runat="server" Style="position: relative" Width="100%">
                <table border=0 width="100%">
                <tr>
                    <td align="left" class="entryBoxHeader" style="width: 120px; height: 18px;">
                        Service Item Details</td>
                    <td align="right" class="entryBoxHeader" style="height: 18px">
                        <asp:Button ID="btnAddNewRow" runat="server" CssClass="button"
                            Style="left: 4px; position: relative; top: 1px;" Text="Add New Row" OnClick="btnAddNewRow_Click" />&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                    <!-- grid -->
                        <asp:DataGrid ID="dgList" runat="server" AutoGenerateColumns="False" CellPadding="3"
                            CssClass="gridMain" GridLines="Horizontal" Style="position: relative; top: 0px;"
                            Width="100%" OnItemDataBound="dgList_ItemDataBound" OnItemCommand="dgList_ItemCommand">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
                            <Columns>
                                <asp:TemplateColumn HeaderText="Select">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Width="6%" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Service Item">
                                    <HeaderStyle Font-Bold="True" Width="25%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddServiceItem" runat="server" CssClass="INPUTblack"
                                            Width="118px">
                                            <asp:ListItem Value="-1">---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="lblServiceItem" runat="server" Width="106px" Text='<%# DataBinder.Eval(Container, "DataItem.ServiceItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Particulars">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Width="20%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtParticulars" Text='<%# DataBinder.Eval(Container, "DataItem.Particulars") %>' runat="server" CssClass="INPUTblack" Width="218px"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Rate">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtRate" runat="server" Columns="10" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'
                                            TextAlign="Right"></ew:NumericBox>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Inv. Qty">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                        &nbsp;<ew:NumericBox ID="txtQty" runat="server" Columns="10" CssClass="INPUTblack"
                                            PositiveNumber="True" Style="position: relative" Text='<%# DataBinder.Eval(Container, "DataItem.InvQty") %>'
                                            TextAlign="Right"></ew:NumericBox>

                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Service Amt.">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtAmount" Columns="10" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" Text='<%# DataBinder.Eval(Container, "DataItem.ServiceAmt") %>'
                                            TextAlign="Right" onFocus="this.blur();"></ew:NumericBox>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Remove">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDel" runat="server" CommandName="Del" ImageUrl="~/images/Delete.gif"
                                            title="Delete this record" ToolTip="Delete this record" />
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Center" Width="5%" Wrap="False" />
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid><!-- grid --></td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            &nbsp;<table border="0" cellpadding="1" style="width: 100%; position: relative">
                                <tr>
                                    <td style="width: 100px; height: 21px">
                                        <asp:Label ID="Label6" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                Vat Rate&nbsp;</asp:Label></td>
                                    <td style="width: 100px; height: 21px">
                                        <ew:NumericBox ID="txtVatRate" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                    <td style="width: 100px; height: 21px">
                                        <asp:Label ID="Label11" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                    <td style="width: 100px; height: 21px">
                                        <ew:NumericBox ID="txtVatAmt" onFocus="this.blur();" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                    <td style="width: 100px; height: 21px">
                                        <asp:Label ID="Label7" runat="server" Font-Bold="true" Style="position: relative"
                                            Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                    <td style="width: 100px; height: 21px">
                                        <ew:NumericBox ID="txtSubTotal" onFocus="this.blur();" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                    <td style="width: 100px; height: 21px">
                                        <asp:Label ID="Label12" runat="server" Font-Bold="True" Style="position: relative"
                                            Text="Inv. Total"></asp:Label></td>
                                    <td style="width: 100px; height: 21px">
                                        <ew:NumericBox ID="txtSITotal" onFocus="this.blur();" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                            Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                            </table>
                            </asp:Panel>
                        </td>
                    </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save"  CssClass="button" OnClick="btnSave_Click" />
                    <input id="btnBack" class="button" onclick="document.location.href='ServiceInvoice.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>
