<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DeliveryNote.aspx.cs" Inherits="DeliveryNote" Title="Untitled Page" %>
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
                            Delivery Note</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>  
            <td align= "left" valign="top">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader" style="height: 18px">
                        Delivery Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="Delivery No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                    </td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtDVN" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Delivery Date" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                <cc1:GMDatePicker ID="txtDVNDate" runat="server" 
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
                                    <asp:Label ID="Label2" runat="server"  Text="Proforma Inv. No." Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:DropDownList ID="ddlProformaInvNo" runat="server" CssClass="INPUTblack" Style="position: relative" Width="227px" AutoPostBack="True" OnSelectedIndexChanged="ddlProformaInvNo_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    </td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Customer" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtCustomer" runat="server" CssClass="INPUTblack" MaxLength="100"
                                        Style="position: relative" Columns="50" Enabled="False" ReadOnly="True"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td  valign="top" nowrap>
                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Shipping Address"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                </td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtShippingAddress" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="200" Style="position: relative" Width="227px" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                                <td nowrap valign="top">
                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Despatch Mode"></asp:Label>
                                    &nbsp; <span style="color: #ff3300"><strong>*</strong></span>
                                </td>
                                <td style="width: 45%" valign="top">
                                <asp:DropDownList ID="ddlModeofDespatch" runat="server" CssClass="INPUTblack" 
                                Width="227px">
                                    <asp:ListItem Selected="True" Value="-1">---Select One---</asp:ListItem>
                                    <asp:ListItem Value="Road">Road</asp:ListItem>
                                    <asp:ListItem>Rail</asp:ListItem>
                                    <asp:ListItem>Ship</asp:ListItem>
                                    <asp:ListItem>Air</asp:ListItem>
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="City" Font-Bold="True"></asp:Label>
                                    </td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtShippingCity" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="50" Style="position: relative" Width="227px"></asp:TextBox></td>
                                <td  valign="top" align="left">
<asp:Label  id="Label7" runat="server" Font-Bold="True" Text="Delivered By"></asp:Label>                                
                                </td>
                                <td style="width: 45%" valign="baseline">
                                    <asp:TextBox ID="txtDeliveredBy" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="50" Style="position: relative" Width="227px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Pin"></asp:Label></td>
                                <td style="width: 25%" valign="top">
                                    <asp:TextBox ID="txtShippingPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="15"
                                        Style="position: relative" Width="227px"></asp:TextBox></td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Vehicle No"></asp:Label>&nbsp;&nbsp; &nbsp;&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:TextBox ID="txtVehicleNo" runat="server" Columns="30" CssClass="INPUTblack"
                                        MaxLength="30" Style="position: relative" Width="227px"></asp:TextBox></td>
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
                                    <asp:TextBox ID="txtRemarks" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="200" Style="position: relative; top: 2px;" Rows="10" TextMode="MultiLine" Width="75%" Height="58px"></asp:TextBox></td>
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
                     CellPadding="1" CssClass="gridMain" GridLines="Horizontal" Width="100%" OnItemDataBound="dgGrid_ItemDataBound" OnItemCommand="dgGrid_ItemCommand">
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
									    <asp:CheckBox ID="chk" runat="server" />
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
                                        <ew:NumericBox ID="txtDelQty"   runat="server" Width="60px" CssClass="INPUTblack" PositiveNumber="True"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.DeliveryQty") %>' 
                                         TextAlign="Right"></ew:NumericBox>
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
                                                                    <ew:NumericBox ID="txtLiftQty" Width="60px" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                                    TextAlign="Right" 
                                                                    Text='<%# DataBinder.Eval(Container, "DataItem.LiftQty") %>'></ew:NumericBox>
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
                    </td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save"  CssClass="button" OnClick="btnSave_Click" />
                    <input id="btnBack" class="button" onclick="document.location.href='DeliveryNoteList.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>
