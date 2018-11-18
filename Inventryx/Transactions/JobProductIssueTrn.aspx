<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="JobProductIssueTrn.aspx.cs" Inherits="Transactions_JobProductIssueTrn" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc"%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/JobProductIssueDetails.js"></script>

    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0" style="width: 810px">
                    <tr>
                        <td align="left" style="height: 3px">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Job Product Issue Details</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>
            <td align= "left" valign="top" style="height: 481px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" width="810" style="width: 810px" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader">
                        Job Product Issue Details</td>
                </tr>

                <tr>
                    <td colspan="2">
                        <Spc:SpacerImage ID="SpacerImage1741" runat="server" Style="position: relative" Height="10px" Width="5px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" cellspacing="0" style="width: 803px">
                            <tr>
                                <td style="width: 12%; height: 3px" valign="top">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Job No." Width="124px"></asp:Label></td>
                                <td style="width: 45%; height: 3px" valign="top">
                                    <asp:DropDownList ID="ddJobNo" runat="server" CssClass="INPUTblack" Style="position: relative;
                                        top: 1px" Width="180px" AutoPostBack="True" OnSelectedIndexChanged="ddJobNo_SelectedIndexChanged">
                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                        <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                        <asp:ListItem Value="V">Van</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 12%; height: 8px" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Job Start Date" Font-Bold="True" style="position: relative" Width="83px"></asp:Label></td>
                                <td style="width: 45%; height: 8px" valign="top">
                                    <asp:Label ID="lblJobStartDate" runat="server" Width="152px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 12%; height: 1px;" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Customer Name"></asp:Label></td>
                                <td style="width: 45%; height: 1px;" valign="top">
                                    <asp:Label ID="lblCustomerName" runat="server" Width="216px"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 12%; height: 1px;" valign="top">
                                    </td>
                                <td style="width: 45%; height: 1px;" valign="top">
                                    </td>
                            </tr>
                            <tr>
                                <td rowspan="5" style="width: 12%" valign="top">
                                    </td>
                                <td rowspan="5" style="width: 45%" valign="top">
                                    </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="left" class="entryBoxHeader">
                        Material Issue Details</td>
                    <td align="right" class="entryBoxHeader">
                        <asp:Button ID="btnAddNewRow" runat="server" Style="position: relative; left: 4px;" Text="Add New Row" OnClick="btnAddNewRow_Click" CssClass="button" />&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server"  AutoGenerateColumns="False"
                            CellPadding="3" GridLines="Horizontal" Width="100%"
                            OnItemCommand="dgList_ItemCommand" OnItemDataBound="dgList_ItemDataBound"
                            CssClass="gridMain">
                            <SelectedItemStyle CssClass="gridSelectedRow" />
                            <AlternatingItemStyle  CssClass="gridAlternetRow" />
                            <ItemStyle CssClass="gridItemRow" Wrap="True" />
                            <HeaderStyle BorderWidth="1px" CssClass="entryGridHeader" Font-Bold="True" Wrap="False" />                                                            
                            <Columns>
                                <asp:TemplateColumn HeaderText="Job Product ID" SortExpression="JobProductIssueDtlID"
                                    Visible="False">
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtJobProductID" runat="server" CssClass="INPUTblack"
                                            PositiveNumber="True" ReadOnly="True" Style="position: relative" Text='<%# DataBinder.Eval(Container, "DataItem.JobProductIssueDtlID") %>'
                                            TextAlign="Right" Width="190px"></ew:NumericBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
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
                                <asp:TemplateColumn HeaderText="Issue Date">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                        <cc1:GMDatePicker ID="txtIssuekDate" runat="server"
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" Width="180px" >
                                            <CalendarFont Names="Arial" />
                                            <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                            <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                            <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                            <CalendarDayStyle Font-Size="9pt" />
                                        </cc1:GMDatePicker>
                                    </ItemTemplate>
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" Width="10%" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Stock Point" >
                                    <HeaderStyle Font-Bold="True" Width="20%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddStockPoint" CssClass="INPUTblack" runat="server" Width="104px">
                                            <asp:ListItem Value="-1">---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Product">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddProduct" AutoPostBack="true" CssClass="INPUTblack" runat="server" OnSelectedIndexChanged="ddProduct_SelectedIndexChanged" Width="101px">
                                            <asp:ListItem Value="-1">---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Width="20%" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Rate"  >
                                    <HeaderStyle Font-Bold="True" Width="15%" HorizontalAlign="Right" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"/>
                                    <ItemTemplate>
                                    <ew:NumericBox style="POSITION: relative" id="txtRate" TextAlign="Right" runat="server"
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'
                                    CssClass="INPUTblack" PositiveNumber="True" Width="69px" ReadOnly="True"></ew:NumericBox>
                                    
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    <Spc:SpacerImage style="POSITION: relative" id="SpacerImage155" runat="server" Width="5px" Height="10px"></Spc:SpacerImage>&nbsp;
                                    </FooterTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Balance Qty."  >
                                    <HeaderStyle Font-Bold="True" Width="5%" HorizontalAlign="Right" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"/>
                                    <ItemTemplate>
                                    <ew:NumericBox style="POSITION: relative" id="txtBalanceQty" TextAlign="Right" runat="server"
                                    Text='<%# DataBinder.Eval(Container, "DataItem.BalanceQty") %>'
                                    CssClass="INPUTblack" PositiveNumber="True" Width="68px"
                                    ></ew:NumericBox>                                
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Issue Qty.">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" Width="10%" />
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtIssueQty" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.IssueQty") %>'
                                        Style="position: relative"  TextAlign="Right" Width="59px"></ew:NumericBox>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Amount"> 
                                    <HeaderStyle Font-Bold="True" Width="15%" HorizontalAlign="Right" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                    <ew:NumericBox style="POSITION: relative" id="txtAmount" TextAlign="Right" runat="server" 
                                    CssClass="INPUTblack" PositiveNumber="True" Width="96px"
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Amount") %>'
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
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Remove">
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="5%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                    <asp:ImageButton ID="btnDel" runat="server" 
                                    CommandName="Del" ImageUrl="~/images/Delete.gif"  ToolTip="Delete this record" title="Delete this record" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid></td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 11px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative; top: 0px; left: 0px;">
                            <tr>
                                <td style="width: 76px; height: 1px;">
                                        </td>
                                <td style="width: 100px; height: 1px;">
                                                    </td>
                                <td style="width: 100px; height: 1px;">
                                                </td>
                                <td style="width: 100px; height: 1px;">
                                                    </td>
                                <td style="width: 73px; height: 1px;">
                                                    </td>
                                <td style="width: 100px; height: 1px;">
                                                    </td>
                                <td style="width: 223px; height: 1px;" align="right">
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative; left: -1px; top: 0px;" Text="Product Total" Width="113px"></asp:Label></td>
                                <td align="right" style="height: 1px">
                                                    <ew:NumericBox ID="txtProductTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                                        Style="position: relative; left: 1px; top: 0px;" TextAlign="Right">0.0</ew:NumericBox></td>
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
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save" OnClick="btnSave_Click" CssClass="button" />
                    <input id="btnBack" class="button" onclick="document.location.href='JobProductIssue.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
                <input id="hdnTotalRow" type="hidden" style="width: 4px; height: 1px" runat=server /></td>
        </tr>
    </table>
</asp:Content>