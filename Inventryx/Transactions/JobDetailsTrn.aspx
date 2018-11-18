<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="JobDetailsTrn.aspx.cs" Inherits="Transactions_JobDetailsTrn" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc"%>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

<script language="javascript" type="text/javascript" src="../Includes/Common.js"></script>
<script language="javascript" type="text/javascript" src="../Includes/JobDetails.js"></script>

    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0" style="width: 810px">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Job Details</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
        <tr>  
            <td align= "left" valign="top" style="height: 481px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" style="width: 810px" >
                <tr>
                    <td colspan="2" align="left" class="entryBoxHeader">
                        Job Details</td>
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
                                <td style="width: 14%; height: 21px;" valign="top">
                                    <asp:Label ID="Label1" runat="server"  Text="Job No." Font-Bold="True"></asp:Label>&nbsp;</td>
                                <td style="width: 45%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtJobNo" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="15" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                                <td rowspan="3" style="width: 12%" valign="top">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Job Address" Width="70px"></asp:Label>
                                    <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td rowspan="3" style="width: 32%" valign="top">
                                    <asp:TextBox ID="txtJobAddress" runat="server" Columns="50" CssClass="INPUTblack" Height="71px"
                                        MaxLength="200" Rows="10" Style="left: 1px; position: relative; top: 0px" TextMode="MultiLine"
                                        Width="251px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 14%; height: 21px" valign="top">
                                    <asp:Label ID="Label3" runat="server" 
                                        Text="Job Start Date" Font-Bold="True" style="position: relative" Width="83px"></asp:Label>
                                    <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%; height: 21px" valign="top">
                                    <cc1:GMDatePicker ID="txtJobStartDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" Width="180px" >
                                        <CalendarFont Names="Arial" />
                                        <CalendarOtherMonthDayStyle BackColor="WhiteSmoke" />
                                        <CalendarTodayDayStyle BorderWidth="1px" 
			                                BorderColor="DarkRed" Font-Bold="True" />
                                        <CalendarTitleStyle BackColor="#E0E0E0" 
			                                Font-Names="Arial" Font-Size="9pt" />
                                        <CalendarDayStyle Font-Size="9pt" />
                                    </cc1:GMDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 14%" valign="top">
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Customer Name"></asp:Label>
                                    <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 45%" valign="top">
                                    <asp:DropDownList ID="ddCustomer" runat="server" CssClass="INPUTblack" Style="position: relative; top: 1px;" Width="180px">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                    <asp:ListItem Value="V">Van</asp:ListItem>
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 14%" valign="top">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Customer Name"></asp:Label>&nbsp;</td>
                                <td style="width: 45%" valign="top">
                                    <asp:TextBox ID="txtCustomerName" runat="server" Columns="50" CssClass="INPUTblack"
                                        MaxLength="50" Style="left: 0px; position: relative" TabIndex="9" Width="180px"></asp:TextBox></td>
                                <td rowspan="1" style="width: 12%" valign="top">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Job City" Width="70px"></asp:Label>
                                    <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td rowspan="1" style="width: 32%" valign="top">
                                    <asp:TextBox ID="txtJobCity" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                        Style="left: 0px; position: relative" TabIndex="9" Width="251px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td rowspan="5" style="width: 14%" valign="top">
                                    <asp:Label ID="Label8" runat="server" Style="position: relative" Text="Remarks" Font-Bold="True"></asp:Label></td>
                                <td rowspan="5" style="width: 45%" valign="top">
                                    <asp:TextBox ID="txtRemarks" runat="server" Columns="50" CssClass="INPUTblack" Height="76px"
                                        MaxLength="200" Rows="10" Style="left: 1px; position: relative; top: 0px" TextMode="MultiLine"
                                        Width="98%"></asp:TextBox></td>
                                <td rowspan="1" style="width: 12%" valign="top">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Job Pin" Width="70px"></asp:Label>
                                    <span style="color: #ff3300"><strong>*</strong></span></td>
                                <td rowspan="1" style="width: 32%" valign="top">
                                    <asp:TextBox ID="txtJobPin" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                        Style="left: 0px; position: relative" TabIndex="9" Width="251px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 74px;" valign="top" colspan="2" rowspan="2">
                                    </td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td colspan="2" rowspan="1" style="width: 74px; height: 31px" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" rowspan="1" style="width: 74px" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" rowspan="2" valign="top">
                                </td>
                                <td colspan="1" rowspan="2" valign="top">
                                </td>
                            </tr>
                            <tr>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
                <tr>
                    <td align="left" class="entryBoxHeader">
                        Labour Work Details</td>
                    <td align="right" class="entryBoxHeader">
                        <asp:Button ID="btnAddNewRow" runat="server" Style="position: relative; left: 4px;" Text="Add New Row" OnClick="btnAddNewRow_Click" CssClass="button" />&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <asp:DataGrid ID="dgList" runat="server"  AutoGenerateColumns="False"
                            CellPadding="3" GridLines="Horizontal" Width="100%"
                            OnItemCommand="dgList_ItemCommand" OnItemDataBound="dgList_ItemDataBound"
                            CssClass="gridMain" Height="170px">
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
                                <asp:TemplateColumn HeaderText="Labour" >
                                    <HeaderStyle Font-Bold="True" Width="35%" Wrap="False" />
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddLabourCategory" AutoPostBack="true" CssClass="INPUTblack" runat="server" OnSelectedIndexChanged="ddLabourCategory_SelectedIndexChanged" Width="127px">
                                            <asp:ListItem Value="-1">---Select---</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Work Date">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" />
                                    <ItemTemplate>
                                        <cc1:GMDatePicker ID="txtWorkDate" runat="server"
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
                                <asp:TemplateColumn HeaderText="Rate"  >
                                    <HeaderStyle Font-Bold="True" Width="15%" HorizontalAlign="Right" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"/>
                                    <ItemTemplate>
                                    <ew:NumericBox style="POSITION: relative" id="txtRate" TextAlign="Right" runat="server"
                                    Text='<%# DataBinder.Eval(Container, "DataItem.Rate") %>'
                                    CssClass="INPUTblack" PositiveNumber="True" Width="69px">
                                    </ew:NumericBox>
                                    
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    <Spc:SpacerImage style="POSITION: relative" id="SpacerImage155" runat="server" Width="5px" Height="10px"></Spc:SpacerImage>&nbsp;
                                    </FooterTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="No. Of Lab."  >
                                    <HeaderStyle Font-Bold="True" Width="5%" HorizontalAlign="Right" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False"/>
                                    <ItemTemplate>
                                    <ew:NumericBox style="POSITION: relative" id="txtNoOfLabour" TextAlign="Right" runat="server"
                                    Text='<%# DataBinder.Eval(Container, "DataItem.NoOfLabour") %>'
                                    CssClass="INPUTblack" PositiveNumber="True" Width="68px"
                                    ></ew:NumericBox>                                
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" HorizontalAlign="Right" Wrap="False" />
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderText="Working Hour">
                                    <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" />
                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                        Font-Underline="False" Wrap="False" HorizontalAlign="Right" Width="10%" />
                                    <ItemTemplate>
                                        <ew:NumericBox ID="txtWorkingHour" runat="server" CssClass="INPUTblack" PositiveNumber="True"
                                        Text='<%# DataBinder.Eval(Container, "DataItem.WorkingHour") %>'
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
                    <td align="center" colspan="2" style="height: 15px; text-align: left">
                        <table border="0" cellpadding="1" style="width: 100%; position: relative; top: 0px;">
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
                                                <asp:Label ID="Label12" Font-Bold="True" runat="server" Style="position: relative; left: -1px; top: 0px;" Text="Labour Work Total" Width="113px"></asp:Label></td>
                                <td align="right" style="height: 1px">
                                                    <ew:NumericBox ID="txtJobSubTotal" runat="server" CssClass="INPUTblack" PositiveNumber="True"
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
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px;" Text="Save" OnClick="btnSave_Click" CssClass="button" />
                    <input id="btnBack" class="button" onclick="document.location.href='JobDetails.aspx'"
                        style="left: 3px; position: relative" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
                <input id="hdnTotalRow" type="hidden" style="width: 4px; height: 1px" runat=server /></td>
        </tr>
    </table>
</asp:Content>