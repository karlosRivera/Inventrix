<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="StockTransferView.aspx.cs" Inherits="Transactions_StockTransferView" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/DeliveryNote.js"></script>

<table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" 
                            Style="position: relative" ForeColor="White" Font-Size="1.1em">
                            Stock Transfer View</asp:Label>
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
                        Transfer Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="StockTransfer No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    &nbsp;<asp:Label ID="lblStTrnNo" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="StockTransfer Date" Font-Bold="True" style="position: relative" Width="111px"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    &nbsp;<asp:Label ID="lblStTrnDate" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td nowrap valign="top" style="height: 21px">
                                    <asp:Label ID="Label2" runat="server"  Text="Stock Point From" Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    &nbsp;<asp:Label ID="lblStPointName" runat="server" Style="position: relative"></asp:Label></td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Stock Point To" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:Label ID="lblStTrnTo" runat="server" Style="position: relative"></asp:Label></td>
                            </tr>
                            <tr>
                                <td  valign="top" nowrap>
                                    &nbsp;
                                    &nbsp;&nbsp;
                                </td>
                                <td style="width: 25%" valign="top">
                                    </td>
                                <td nowrap valign="top">
                                    &nbsp; &nbsp; &nbsp;&nbsp;
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
                            <tr>
                                <td style="width: 15%; height: 25px" valign="top">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Date"></asp:Label></td>
                                <td colspan="3" style="width: 25%; height: 25px" valign="top">
                                    <asp:Label ID="lblCancelDate" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 15%; height: 41px" valign="top">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Cancel Reason"></asp:Label></td>
                                <td colspan="3" style="width: 25%; height: 41px" valign="top">
                                    <asp:Label ID="lblCancelReason" runat="server" Height="52px" Width="457px"></asp:Label></td>
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
                    <!-- grid -->
                     <asp:DataGrid ID="dgGrid" runat="server" AutoGenerateColumns="False" 
                     CellPadding="1" CssClass="gridMain" GridLines="Horizontal" Width="100%" OnItemDataBound="dgGrid_ItemDataBound">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
							<Columns>
								<asp:TemplateColumn>
									<ItemTemplate>
										<table border="0">
											<tr>
												<td><asp:ImageButton id="btnExpand" ImageUrl="../images/Plus.gif" CommandName="Collapse" 
												Runat="server"></asp:ImageButton></td>
												<td><DIV id="mydiv" runat="server"></DIV>
												</td>
											</tr>
										</table>
									</ItemTemplate>
								</asp:TemplateColumn>

								<asp:TemplateColumn HeaderText="Select">
								    <HeaderStyle HorizontalAlign="left" Font-Bold="True" />
									<ItemStyle HorizontalAlign="left"></ItemStyle>
									<ItemTemplate>
									    <asp:CheckBox ID="chk" Checked="true" runat="server" />
									</ItemTemplate>
								</asp:TemplateColumn>
														
                                <asp:TemplateColumn HeaderText="Product">
                                    <HeaderStyle HorizontalAlign="left" Font-Bold="True" Wrap="False" Width="30%" />
                                    <ItemStyle HorizontalAlign="left"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblProdID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductID") %>'
                                            Visible="false"></asp:Label>
                                        <asp:Label ID="lblProductName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

                                <asp:TemplateColumn HeaderText="Unit">
                                    <HeaderStyle HorizontalAlign="right" Font-Bold="True" Wrap="False" Width="15%" />
                                    <ItemStyle HorizontalAlign="right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblUnit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Unit") %>' >
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Rate">
                                    <HeaderStyle HorizontalAlign="right" Font-Bold="True" Wrap="False" Width="10%" />
                                    <ItemStyle HorizontalAlign="right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblRate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="P.Inv. Qty">
                                    <HeaderStyle HorizontalAlign="right" Font-Bold="True" Wrap="False" Width="10%" />
                                    <ItemStyle HorizontalAlign="right"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBalinvQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BalQty") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Delivered Qty">
                                    <HeaderStyle HorizontalAlign="right" Font-Bold="True" Wrap="False" Width="10%" />
                                    <ItemStyle HorizontalAlign="right"></ItemStyle>
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtDelQty" ReadOnly="true"  runat="server" Width="60px" CssClass="INPUTblack" PositiveNumber="True"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.TransferQty") %>' TextAlign="Right"></ew:NumericBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>

								<asp:TemplateColumn>
									<ItemStyle></ItemStyle>
									<ItemTemplate>
	    							</TD>
									</TR>
									<tr>
									<td>&nbsp;</td>
									<td colspan="6">
									<!-- Inner Grid -->
                                                    <asp:DataGrid ID="dgInner" runat="server" AutoGenerateColumns="False"
                                                    CellPadding="1" CssClass="gridMain" GridLines="Horizontal" Width="100%">
                                                    <SelectedItemStyle CssClass="gridSelectedRow" />
                                                    <AlternatingItemStyle CssClass="gridAlternetRow" />
                                                    <ItemStyle CssClass="gridItemRow" Wrap="True" />
                                                    <HeaderStyle BorderWidth="1px" CssClass="entryBoxHeader"
                                                    Font-Bold="True" Wrap="False" />
                                                    
                                                        <Columns>
                                                            <asp:TemplateColumn Visible=false>
                                                                <HeaderStyle Font-Bold="True" Wrap="False" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStockInDtlID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StockInDtlID") %>'
                                                                        Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc Type">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInDocType" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocType") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc No.">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInDocNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocNo") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc Date.">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="right" />
                                                                <ItemStyle HorizontalAlign="right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDocDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocDate","{0:dd/MM/yyyy}") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Stock Point">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStockPoint" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StockPointID") %>'
                                                                        Visible="false">
                                                                    </asp:Label>
                                                                    <asp:Label ID="lblStockPointName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StockPointName") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Balance Qty">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Right" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBalQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BalQty") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Lift Qty">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" HorizontalAlign="Right" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <ew:NumericBox ID="txtLiftQty" ReadOnly="true" Width="60px" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                                    TextAlign="Right" Text='<%# DataBinder.Eval(Container, "DataItem.LiftQty") %>'></ew:NumericBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                    
                                    <!-- Inner Grid -->												
									</ItemTemplate> 
									</asp:TemplateColumn> 
									</Columns> 
									</asp:DataGrid>
                            
                    <!-- grid -->    
                    </td>
                </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 15px; text-align: left">
                            <asp:Panel ID="pnlInvCancel" runat="server" Visible="False">
                <table id="tblSearch2" class="searchBox" align="center" border="0" cellpadding="2" cellspacing="0" style="height: 1px" >
                    <tr style="font-weight: bold; color: #000000">
                        <td style="height: 17px" class="entryBoxHeader" colspan="2">
                            Stock Transfer Cancellation</td>
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
               </asp:Panel></td>
                    </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                    </td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnCancel" runat="server" CssClass="button" OnClick="btnCancel_Click"
                        Style="left: -6px; position: relative; top: 0px" Text="Cancel" />
                    <asp:Button ID="btnPrint" runat="server" CssClass="button" Style="position: relative"
                        Text="Print" OnClick="btnPrint_Click" />
                    &nbsp;<input id="btnBack" class="button" onclick="document.location.href='StockTransfer.aspx'"
                        style="left: 0px; position: relative" type="button" value="Back" />
                    </td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>








