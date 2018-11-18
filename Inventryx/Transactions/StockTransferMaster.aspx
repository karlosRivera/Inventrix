<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="StockTransferMaster.aspx.cs" Inherits="Masters_StockTransferMaster" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/StockTransfer.js"></script>
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em" Width="210px">StockTransfer Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="2" align="left" class="entryBoxHeader">
                            StockTransfer &nbsp;Detail</td>
                        <td align="left" class="entryBoxHeader" colspan="1" style="width: 2248px">
                        </td>
                        <td align="left" class="entryBoxHeader" colspan="1" style="width: 555px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 6494px">
                        </td>
                        <td align="left" style="width: 5441px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative; left: 1px; top: 0px;" Height="10px" Width="5px" /></td>
                        <td align="left" style="width: 2248px">
                        </td>
                        <td align="left" style="width: 555px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 6494px; font-weight: bold"  align="left">
                            StockTransfer ID</td>
                        <td style="width: 5441px" align="left">
                            <asp:TextBox ID="txtManufacturerID" runat="server" Columns="10" Enabled="False" MaxLength="10"
                                Style="position: relative" CssClass="INPUTblack"></asp:TextBox></td>
                        <td align="left" style="width: 2248px">
                        </td>
                        <td align="left" style="width: 555px">
                        </td>
                    </tr>
                    <tr >
                        <td style="width: 6494px; font-weight: bold; height: 19px;"  align="left">
                            StockTransfer Date&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="width: 5441px; height: 19px;">
                            <cc1:gmdatepicker id="txtVATRegDate" runat="server" calendarfont-names="Arial"
                                calendartheme="Blue" cssclass="INPUTblack"> <CALENDARDAYSTYLE Font-Size="9pt" /><CALENDARTODAYDAYSTYLE Font-Bold="True" BorderColor="DarkRed" BorderWidth="1px" /><CALENDAROTHERMONTHDAYSTYLE BackColor="WhiteSmoke" /><CALENDARTITLESTYLE Font-Size="9pt" Font-Names="Arial" BackColor="#E0E0E0" /><CALENDARFONT Names="Arial" /></cc1:gmdatepicker></td>
                        <td align="left" style="font-weight: bold; width: 2248px; height: 19px">
                            <asp:Label ID="Label1" runat="server" Text="List of product" Visible="False"></asp:Label>
                            <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 555px" rowspan="5" valign="top">
                            <asp:CheckBoxList ID="lstchkProduct" runat="server" CssClass="INPUTblack" Height="34px"
                                Width="220px">
                            </asp:CheckBoxList></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 6494px; height: 23px">
                            Transfer From <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 5441px">
                            <asp:DropDownList ID="ddlStockTransferFrom" runat="server" Width="150px" OnSelectedIndexChanged="ddlStockTransferFrom_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td align="left" style="width: 2248px" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 6494px; height: 23px">
                            Transfer To <span style="color: #ff3300">*</span></td>
                        <td align="left" style="width: 5441px">
                            <asp:DropDownList ID="ddlStockTransferTo" runat="server" Width="152px" AutoPostBack="True">
                            </asp:DropDownList></td>
                        <td align="left" style="width: 2248px" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 6494px; height: 23px" valign="top">
                            Remarks</td>
                        <td align="left" colspan="3">
                            <asp:TextBox ID="txtRemarks" runat="server" CssClass="INPUTblack" TextMode="MultiLine"
                                Width="323px" Height="52px"></asp:TextBox></td>
                    </tr>
                    
                    <tr>
                        <td style="width: 6494px; font-weight: bold; height: 17px;">
                        </td>
                        <td style="width: 5441px; height: 17px;">
                            &nbsp;</td>
                        <td style="width: 2248px; height: 17px">
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 6494px; height: 17px">
                        </td>
                        <td style="width: 5441px; height: 17px">
                        </td>
                        <td style="width: 2248px; height: 17px">
                        </td>
                        <td align="left" rowspan="1" style="width: 555px" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 21px" align="right" colspan="4" valign="middle">
                            <asp:Button ID="btnPopulateProduct" runat="server" CssClass="button" OnClick="btnPopulateProduct_Click"
                                Style="left: 0px; position: relative; top: 0px" Text="Populate Products" Width="156px" /></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; width: 6494px; height: 17px">
                        </td>
                        <td style="width: 5441px; height: 17px">
                        </td>
                        <td style="width: 2248px; height: 17px">
                        </td>
                        <td align="left" rowspan="1" style="width: 555px" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold; height: 17px" colspan="4">
                            <asp:DataGrid ID="dgGrid" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                CssClass="gridMain" GridLines="Horizontal" OnItemCommand="dgGrid_ItemCommand"
                                OnItemDataBound="dgGrid_ItemDataBound" Width="100%">
                                <SelectedItemStyle CssClass="gridSelectedRow" />
                                <AlternatingItemStyle CssClass="gridAlternetRow" />
                                <ItemStyle CssClass="gridItemRow" Wrap="True" />
                                <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
                                <Columns>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <table border="0">
                                                <tr>
                                                    <td>
                                                        <asp:ImageButton ID="btnExpand" runat="server" CommandName="Collapse" ImageUrl="../images/Plus.gif" /></td>
                                                    <td>
                                                        <div id="mydiv" runat="server">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Select">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chk" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Product">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Width="30%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblProdID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductID") %>'
                                                Visible="false"></asp:Label>
                                            <asp:Label ID="lblProductName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.ProductName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Unit">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="10%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lbUnit" runat="server"  Text='<%#DataBinder.Eval(Container,"DataItem.ProductUOM") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Balance Qty">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="15%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnit" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StockINQty") %>'>
                                        </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="Transffered Qty">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="10%" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Right" />
                                        <ItemTemplate>
                                            <ew:numericbox id="txtDelQty" runat="server" cssclass="INPUTblack" positivenumber="True"
                                                 textalign="Right"
                                                width="60px"></ew:numericbox>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            </TD> </TR>
                                            <tr>
                                            </tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td colspan="6">
                                                </td>
                                                    <!-- Inner Grid -->
                                                    <asp:DataGrid ID="dgInner" runat="server" AutoGenerateColumns="False" CellPadding="1"
                                                        CssClass="gridMain" GridLines="Horizontal" Width="100%">
                                                        <SelectedItemStyle CssClass="gridSelectedRow" />
                                                        <AlternatingItemStyle CssClass="gridAlternetRow" />
                                                        <ItemStyle CssClass="gridItemRow" Wrap="True" />
                                                        <HeaderStyle BorderWidth="1px" CssClass="entryBoxHeader" Font-Bold="True" Wrap="False" />
                                                        <Columns>
                                                            <asp:TemplateColumn Visible="false">
                                                                <HeaderStyle Font-Bold="True" Wrap="False" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStockInDtlID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.StockInDtlID") %>'
                                                                        Visible="false"></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc Type">
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInDocType" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocType") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc No.">
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblInDocNo" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocNo") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Doc Date.">
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="right" Wrap="False" />
                                                                <ItemStyle HorizontalAlign="right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDocDate" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.InDocDate","{0:dd/MM/yyyy}") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Stock Point">
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" Wrap="False" />
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
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBalQty" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.BalQty") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Lift Qty">
                                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Wrap="False" />
                                                                <ItemStyle HorizontalAlign="Right" />
                                                                <ItemTemplate>
                                                                    <ew:numericbox id="txtLiftQty" runat="server" cssclass="INPUTblack" positivenumber="True"
                                                                        text='<%# DataBinder.Eval(Container, "DataItem.LiftQty") %>' textalign="Right"
                                                                        width="60px"></ew:numericbox>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                    <!-- Inner Grid -->
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                            </td>
                    </tr>
                    <tr> 
                    
                        <td align="right" class="entryBoxFooter" colspan="4">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='StockTransfer.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>