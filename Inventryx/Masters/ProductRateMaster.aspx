
<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductRateMaster.aspx.cs" Inherits="ProductRateMaster" Title="Untitled Page" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2" Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">

    <table border="0" style="width: 100%">
        <tr>
            <td align="left">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Product Rate</asp:Label>
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
                        Product Rate Details</td>
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
                                    <asp:Label ID="Label1" runat="server"  Text="P.Rate No." Font-Bold="True"></asp:Label>
                                    &nbsp;&nbsp;<span style="color: #ff3300"><strong>*</strong></span>
                                    </td>
                                <td style="width: 38%; height: 21px;" valign="top">
                                    <asp:TextBox ID="txtPRateNo" runat="server" Columns="17" CssClass="INPUTblack" MaxLength="20" Style="position: relative" Enabled="False"></asp:TextBox>
                                    
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label5" runat="server"  Text="Product " Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 38%" valign="top"><asp:DropDownList ID="ddlProduct" runat="server" CssClass="INPUTblack" Style="position: relative" Width="146px">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                    <asp:ListItem Value="V">Van</asp:ListItem>
                                </asp:DropDownList>
                                    </td>
                            </tr>
                            <tr>
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="EffectiveDate"></asp:Label>
                                    &nbsp;<strong><span style="color: #ff3300">*</span></strong></td>
                                <td style="width: 38%" valign="top">
                                     <cc1:GMDatePicker ID="txtEffectiveDate" runat="server" 
		                                CalendarFont-Names="Arial" CalendarTheme="Blue" CssClass="INPUTblack" >
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
                                <td style="width: 15%" valign="top">
                                    <asp:Label ID="Label7" runat="server"  Text="UnitSaleRate" Font-Bold="True"></asp:Label>
                                    &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                                <td style="width: 38%" valign="top">
                                    <ew:NumericBox ID="txtUnitSale" runat="server" CssClass="INPUTblack" MaxLength="12"
                                        PositiveNumber="True" Width="75px"></ew:NumericBox>
                                    </td>
                            </tr>
                        </table><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                </tr>
            <tr>
                <td colspan="2" align="right"  class="entryBoxFooter">
                    <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 3px; top: 3px;" Text="Save" OnClick="btnSave_Click" CssClass="button" />
                    <input id="btnBack" class="button" onclick="document.location.href='ProductRate.aspx'"
                        style="left: 3px; position: relative; top: 3px;" type="button" value="Back" />
                    <input id="Reset1" style="left: 3px; position: relative; top: 3px" type="reset" value="Reset" class="button" /></td>
            </tr>
            </table>
        </td>
        </tr>
    </table>
</asp:Content>

