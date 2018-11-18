<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StockAdjustmentMaster.aspx.cs" Inherits="Transactions_StockAdjustmentMaster" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<%--<script language="javascript" type="text/javascript" src="../Includes/DeliveryNote.js"></script>--%>
<script language="javascript" type="text/javascript">
    function CalculateTotalAmount()
    {
            var iRow=0;
            iRow=parseInt(document.getElementById('hdnTotalRows').value);
            for(i=2;i<eval(iRow+2);i++)
            {
                var total=0;
                ctrlPhysicalStockID='ctl00_mainContent_dgStockAdjustment_ctl0'+i+'_tbPhysicalStock';
                //alert(document.getElementById(ctrlPhysicalStockID).value);
                total=total+eval(document.getElementById(ctrlPhysicalStockID).value);
               // alert(total);
                document.getElementById('ctl00_mainContent_txtPhysicalStock').value=total;   
            }
    }
    
    function Test()
    {
        alert('aaaa');
        var iRow=0;
        iRow=parseInt(document.getElementById('hdnTotalRows').value);
        for(i=2;i<eval(iRow+2);i++)
        {
            var Total=0;
            ctrlBookStockID='ctl00_mainContent_dgStockAdjustment_ctl0'+i+'_lbBookStock';
            
            total=total+eval(document.getElementById(ctrlPhysicalStockID).value);
            alert(total);
            document.getElementById('ctl00_mainContent_txtBookStock').value=total;
        }
    }
</script>


<table border="0">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" 
                            Style="position: relative" ForeColor="White" Font-Size="1.1em">Stock Adjustment</asp:Label>
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
                        Stock &nbsp;Details</td>
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
                                <td style="width: 149px; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Stock Adjustment No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                    </td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtDVN" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td style="width: 56%; height: 21px;" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Stock Adjustment Date" Font-Bold="True" style="position: relative"></asp:Label>
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
                                <td valign="top" style="height: 21px; width: 149px;">
                                    <asp:Label ID="Label2" runat="server"  Text="Stock Point" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 25%; height: 21px;" valign="top">
                                    <asp:DropDownList ID="ddlStockPoint" runat="server" CssClass="INPUTblack" Style="position: relative" Width="205px" AutoPostBack="True" OnSelectedIndexChanged="ddlStockPoint_SelectedIndexChanged" >
                                    </asp:DropDownList>
                                    </td>
                                <td style="width: 56%; height: 21px;" valign="top">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Product"></asp:Label>
                                    &nbsp;&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                <asp:DropDownList ID="ddlProduct" runat="server" CssClass="INPUTblack" Style="position: relative" Width="227px" AutoPostBack="True">
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td nowrap="nowrap" style="width: 149px; height: 21px" valign="top">
                                </td>
                                <td style="width: 25%; height: 21px" valign="top">
                                </td>
                                <td style="width: 56%; height: 21px" valign="top">
                                </td>
                                <td style="width: 45%; height: 21px" valign="top">
                                    <asp:Button ID="btnProduct" runat="server" Text="Populate Product Detail" CssClass="button" OnClick="btnProduct_Click" /></td>
                            </tr>
                            <tr>
                                <td style="width: 149px; height: 41px;" valign="top">
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
                    <asp:DataGrid ID="dgStockAdjustment" runat="server" CellPadding="1" CssClass="gridMain" GridLines="Horizontal" Width="100%" AutoGenerateColumns="False" OnItemDataBound="dgStockAdjustment_ItemDataBound">
                     <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />
                        <Columns>
                        
                            <asp:TemplateColumn HeaderText="StockInDtlID">
                            <ItemTemplate>
                            <asp:Label ID="lbStockInDtlID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"StockInDtlID")%>'></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Width="15%" Wrap="False" />
                            </asp:TemplateColumn>
       
                            <asp:TemplateColumn HeaderText="Doc Type">
                            <ItemTemplate>
                            <asp:Label ID="lbDocType" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"InDocType")%>'></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Width="15%" Wrap="False" />
                            </asp:TemplateColumn>
                            
                            <asp:TemplateColumn HeaderText="Doc No">
                            <ItemTemplate>
                            <asp:Label ID="lbDocNo" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"InDocNo")%>'></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Width="15%" Wrap="False" />
                            </asp:TemplateColumn>
                            
                            <asp:TemplateColumn HeaderText="Doc Date">
                            <ItemTemplate>
                            <asp:Label ID="lbDocDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"InDocDate")%>'></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" Width="10%" Wrap="False" />
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Book Stock">
                            <ItemTemplate>
                            <asp:Label ID="lbBookStock" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"BookStockQty") %>'></asp:Label>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" HorizontalAlign="Right" Width="15%" Wrap="False" />
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Physical Stock">
                            <ItemTemplate>
                            <ew:NumericBox ID="tbPhysicalStock" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                            Style="position: relative" TextAlign="Right" Text='<%#DataBinder.Eval(Container.DataItem,"PhysicalStockQty") %>'></ew:NumericBox>
                            <%--<asp:TextBox ID="tbPhysicalStock" runat="server" CssClass="INPUTblack"></asp:TextBox>--%>
                            </ItemTemplate>
                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                    Font-Underline="False" HorizontalAlign="Right" Width="15%" Wrap="False" />
                            </asp:TemplateColumn>
                            
                        </Columns>
                    
                    </asp:DataGrid>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative">
                            <tr>
                                <td style="width: 76px; height: 21px;">
                                        </td>
                                <td style="width: 100px; height: 21px;">
                                                    </td>
                                <td style="width: 100px; height: 21px;">
                                                </td>
                                <td style="width: 100px; height: 21px;">
                                                    </td>
                                <td style="width: 73px; height: 21px;">
                                                    <asp:Label ID="Label9" Font-Bold="True" runat="server" Style="position: relative" Text="Book Stock                                               "></asp:Label></td>
                                <td style="width: 43px; height: 21px;">
                                                    <ew:NumericBox ID="txtBookStock" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                                <td style="width: 47px; height: 21px;">
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative; left: 0px;" Text="Physical Stock" Width="81px"></asp:Label></td>
                                <td style="width: 100px; height: 21px;">
                                                    <ew:NumericBox ID="txtPhysicalStock" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative" TextAlign="Right">0.0</ew:NumericBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save"  CssClass="button" OnClick="btnSave_Click"/>
                    <input id="btnBack" class="button" onclick="document.location.href='StockAdjustment.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>

