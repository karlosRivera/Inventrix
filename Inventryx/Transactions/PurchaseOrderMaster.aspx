<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="PurchaseOrderMaster.aspx.cs" Inherits="PurchaseOrderMaster" Title="Untitled Page" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
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
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Purchase Order Details</asp:Label>
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
                                    <asp:TextBox ID="txtPoNo" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td style="width: 15%; height: 21px;" valign="top">
                                    </td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label2" runat="server"  Text="Supplier" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%" valign="top">
                                    <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px" AutoPostBack="True" OnSelectedIndexChanged="ddlSupplier_SelectedIndexChanged">
                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                        <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                        <asp:ListItem Value="V">Van</asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="P.O. Date" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%" valign="top">
                                    <cc1:GMDatePicker ID="txtPoDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" >
		                                <CalendarDayStyle Font-Size="9pt" />
		                                <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
		                                <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
		                                <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                        <CalendarFont Names="Arial" />
	                                </cc1:GMDatePicker>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="Product Group" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%" valign="top"><asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                    <asp:ListItem Value="V">Van</asp:ListItem>
                                </asp:DropDownList>
                                    </td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label4" runat="server" 
                                        Text="Date of Delivery" Font-Bold="True" style="position: relative"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%" valign="baseline">
                                <cc1:GMDatePicker ID="txtdateofdelivery" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" style="position: relative" CssClass="INPUTblack" >
                                    <CalendarDayStyle Font-Size="9pt" />
                                    <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                    <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                    <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                    <CalendarFont Names="Arial" />
                                </cc1:GMDatePicker>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label7" runat="server"  Text="Department" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%" valign="top"><asp:DropDownList ID="ddlDepartment" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                    <asp:ListItem Value="V">Van</asp:ListItem>
                                </asp:DropDownList>
                                    </td>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Style="position: relative"
                                        Text="Payment Terms"></asp:Label>&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:TextBox ID="txtPaymentTerm" runat="server" Columns="10" CssClass="INPUTblack" MaxLength="100" Style="position: relative" Width="170px"></asp:TextBox></td>
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
                        <asp:Button ID="btnAddNewRow" runat="server" Style="position: relative" Text="Add New Row" OnClick="btnAddNewRow_Click" CssClass="button" />
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server" ShowFooter="false"  AutoGenerateColumns="False"
                            CellPadding="3" GridLines="Horizontal" Width="100%"
                            OnItemCommand="dgList_ItemCommand" OnItemDataBound="dgList_ItemDataBound"
                            CssClass="gridMain" OnSelectedIndexChanged="dgList_SelectedIndexChanged">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle  CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />                                                            
                            <Columns>
                                <asp:TemplateColumn HeaderText="Select" >
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" Width="5%" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            
                                <asp:BoundColumn HeaderText="Sl No">
                                    <ItemStyle Width="5%" Wrap="False" Font-Bold="True" HorizontalAlign="Center" />
                                    <HeaderStyle Font-Bold="True" Wrap="False" Width="5%" HorizontalAlign="Center" />
                                </asp:BoundColumn>                        
                                <asp:TemplateColumn HeaderText="Product" >
                                    <HeaderStyle Font-Bold="True" Width="30%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlProduct" AutoPostBack="true" OnSelectedIndexChanged="GridCboSelectedIndexChanged" CssClass="INPUTblack" runat="server">
                                            <asp:ListItem Value="-1">---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Unit" >
                                    <HeaderStyle Font-Bold="True" Width="15%" Wrap="False" HorizontalAlign="Right" />
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtUnit"  Text='<%# DataBinder.Eval(Container, "DataItem.Unit") %>' runat="server" ReadOnly="true" CssClass="INPUTblack" Style="position: relative"></asp:TextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    <Spc:SpacerImage style="POSITION: relative" id="SpacerImage17" runat="server" Width="5px" Height="10px"></Spc:SpacerImage><br/>
                                        &nbsp;
                                    </FooterTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Rate"  >
                                    <HeaderStyle Font-Bold="True" Width="15%" HorizontalAlign="Right"/>
                                    <ItemTemplate>
                                    <ew:NumericBox TextAlign="Right" style="POSITION: relative" id="txtRate"  runat="server" 
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'
                                    CssClass="INPUTblack" PositiveNumber="True"
                                    
                                    ></ew:NumericBox>                                
                                    
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    <Spc:SpacerImage style="POSITION: relative" id="SpacerImage155" runat="server" Width="5px" Height="10px"></Spc:SpacerImage>&nbsp;
                                    </FooterTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Qty"  >
                                    <HeaderStyle Font-Bold="True" Width="10%" HorizontalAlign="Right"/>
                                    <ItemTemplate>
                                    <ew:NumericBox TextAlign="Right" style="POSITION: relative" id="txtQty"  runat="server" 
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Qty") %>'
                                    CssClass="INPUTblack" PositiveNumber="True"
                                    
                                    ></ew:NumericBox>                                
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <table border="0" cellpadding="1" style="width: 100%; position: relative; height: 100%">
                                            <tr>
                                                <td style="width: 90%">
                                                    <Spc:SpacerImage ID="SpacerImage9" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                                <td style="width: 10%">
                                                    <Spc:SpacerImage ID="SpacerImage177" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90%" align="right">
                                                    &nbsp;</td>
                                                <td style="width: 10%">
                                                    <Spc:SpacerImage ID="SpacerImage677" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90%" align="right">
                                                    &nbsp;</td>
                                                <td style="width: 10%">
                                                    <Spc:SpacerImage ID="SpacerImage855" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 90%">
                                                    &nbsp;</td>
                                                <td style="width: 10%">
                                                    <Spc:SpacerImage ID="SpacerImage104" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Amount"> 
                                    <HeaderStyle Font-Bold="True" Width="15%" HorizontalAlign="Right" />
                                    <ItemTemplate>
                                    <ew:NumericBox  TextAlign="Right" style="POSITION: relative" id="txtAmount"  runat="server" 
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Amount") %>'
                                    CssClass="INPUTblack" PositiveNumber="True"
                                    
                                    ></ew:NumericBox>                                
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <table border="0" cellpadding="1" style="width: 100%; position: relative; height: 100%">
                                            <tr>
                                                <td style="width: 100px">
                                                    <Spc:SpacerImage ID="SpacerImage1023" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                    </td>
                                            </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Remove">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="5%" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                    <ItemTemplate>
                                    <asp:ImageButton ID="btnDel" runat="server" 
                                    CommandName="Del" ImageUrl="../images/Delete.gif"  ToolTip="Delete this record" title="Delete this record" />
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
                                                    <ew:NumericBox ID="txtSubVatRate" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 100px">
                                                <asp:Label ID="Label11" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                Vat Amount&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtSubVatAmt" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 100px">
                                                    <asp:Label ID="Label9" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                    Sub Total&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtSubTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 100px">
                                                <asp:Label ID="Label12" Font-Bold="true" runat="server" Style="position: relative" Text="Label">
                                                P.O. Total&nbsp;</asp:Label></td>
                                <td style="width: 100px">
                                                    <ew:NumericBox ID="txtPOTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save" OnClick="btnSave_Click" CssClass="button" />
                    <input id="btnBack" class="button" onclick="document.location.href='PurchaseOrder.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>




