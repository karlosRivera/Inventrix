<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Supplier.aspx.cs" Inherits="Supplier" %>
<%@ Register Assembly="BusyBoxDotNet" Namespace="BusyBoxDotNet" TagPrefix="busyboxdotnet" %>
<%@ Register TagPrefix="cc2" Namespace="CutePager" Assembly="ASPnetPagerV2netfx2_0" %>

<asp:Content ID="Main" runat="server" ContentPlaceHolderID="mainContent">

<script language=javascript src="../Includes/Common.js"></script>
    <table id="Table5" width="100%">
        <tr>
            <td align="left" colspan="2" style="width: 740px; height: 22px">
                <table id="tblHead1" class="topHeading" align="center" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Supplier Listing</asp:Label>
                        </td>
                        <td align="right">
                            <input id="btnAdd" runat=server name="btnAdd" 
                            onclick="javascript:GotoPage('SupplierMaster.aspx?Action=A');"
                            style="position: relative" type="button" value="Add New Supplier" class="button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>                   
            <td align="left" colspan="2" style="width: 740px; height: 56px">
             <asp:Panel ID="pnlFilter" runat="server">
                <table id="tblSearch2" class="searchBox" align="center" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td align="center" class="searchBoxHeader" >
                            Select</td>
                        <td align="center" class="searchBoxHeader" >
                            Search Field</td>
                        <td align="center" class="searchBoxHeader" >
                            Filter Condition</td>
                        <td align="center" class="searchBoxHeader" >
                            Condition Data</td>
                        <td align="center" class="searchBoxHeader" style="width: 100px" >
                            Match Case</td>
                    </tr>
                    <tr style="font-weight: bold; color: #000000">
                        <td align="center" style="width: 103px; height: 18px">
                            <p >
                                <b>
                                    <asp:CheckBox ID="chkSearch1" runat="server" Font-Size="7pt" Height="11px"
                                        Width="30px" />
                                </b>
                            </p>
                        </td>
                        <td  style="width: 186px; height: 18px">
                            <p>
                                <asp:DropDownList ID="ddSearchField1" runat="server" Width="178px" CssClass="INPUTblack">
                                </asp:DropDownList>&nbsp;</p>
                        </td>
                        <td align="right" style="width: 184px; height: 18px">
                            <p align="left">
                                <asp:DropDownList ID="ddSearchCondition1" runat="server" Width="178px" CssClass="INPUTblack">
                                </asp:DropDownList>&nbsp;
                            </p>
                        </td>
                        <td style="width: 204px; height: 18px">
                            <asp:TextBox ID="txtCriteriaType1" runat="server" Width="197px" CssClass="INPUTblack"></asp:TextBox></td>
                        <td style="height: 18px; width: 100px;" align="center">
                            <asp:CheckBox ID="chkMC1" runat="server" Font-Size="7pt" Width="72px" Font-Bold="True" /></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 103px; height: 18px;">
                            <p >
                                <b>
                                    <asp:CheckBox ID="chkSearch2" runat="server" Font-Size="7pt" Height="27px"
                                        Width="30px" />
                                </b>
                            </p>
                        </td>
                        <td style="width: 186px; height: 18px;">
                            <p>
                                <asp:DropDownList ID="ddSearchField2" runat="server" Width="178px" CssClass="INPUTblack">
                                </asp:DropDownList>&nbsp;</p>
                        </td>
                        <td align="left" style="width: 184px; height: 18px;">
                            <asp:DropDownList ID="ddSearchCondition2" runat="server" Width="178px" CssClass="INPUTblack">
                            </asp:DropDownList></td>
                        <td style="width: 204px; height: 18px;">
                            <asp:TextBox ID="txtCriteriaType2" runat="server" Width="197px" CssClass="INPUTblack"></asp:TextBox></td>
                        <td align="center" style="height: 18px; width: 100px;">
                            <asp:CheckBox ID="chkMC2" runat="server" Font-Bold="True" Font-Size="7pt" Width="78px" /></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 103px; height: 18px">
                            <b><font size="2">
                                <asp:CheckBox ID="chkSearch3" runat="server" Font-Size="7pt" Height="27px"
                                    Width="30px" /></font></b></td>
                        <td style="width: 186px; height: 18px">
                            <asp:DropDownList ID="ddSearchField3" runat="server" Width="178px" CssClass="INPUTblack">
                            </asp:DropDownList></td>
                        <td align="left" style="width: 184px; height: 18px">
                            <asp:DropDownList ID="ddSearchCondition3" runat="server" Width="178px" CssClass="INPUTblack">
                            </asp:DropDownList></td>
                        <td style="width: 204px; height: 18px">
                            <asp:TextBox ID="txtCriteriaType3" runat="server" Width="194px" CssClass="INPUTblack"></asp:TextBox></td>
                        <td style="height: 18px; width: 100px;" align="center">
                            <asp:CheckBox ID="chkMC3" runat="server" CausesValidation="True" Font-Bold="True"
                                Font-Size="7pt" Width="77px" /></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3" class = "searchBoxFooter" style="height: 27px">
                          <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red" Style="position: relative; left: -11px; top: 5px;"></asp:Label><br />
                        </td>
                        <td align="right" colspan="2" class = "gridFooter" style="height: 27px">
                            <asp:Button ID="btnFilter" runat="server"  Style="position: relative; top: 0px; left: -8px;"
                                Text="Filter" Width="90px" CssClass="button" OnClick="btnFilter_Click" /><asp:Button ID="btnClearFilter" runat="server" 
                                    Style="left: -4px; position: relative; top: 0px" Text="Clear Filter" Width="90px" CssClass="button" OnClick="btnClearFilter_Click" /></td>
                    </tr>
                </table>
                </asp:Panel>
            </td>                    
        </tr>
        <tr>
            <td align="left" style="width: 679px">
                &nbsp;<cc2:Pager
                OnCommand="PagerCtrl1_Command"
                ShowFirstLast="true"
                id="PagerCtrl1"
                runat="server" NotCompactedPageCount="15" PageSize="10">
                </cc2:Pager>
                </td>
        </tr>
        <tr>
            <td style="width: 679px; height: 120px;"><br/>
                <table id="TabCurrency" border="0" cellpadding="3" cellspacing="1" class="tabborder"
                    width="100%">
                    <tr>
                        <td valign="top" style="height: 115px">
                            <asp:DataGrid ID="dgList" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                CellPadding="3" GridLines="Horizontal" Width="740px" OnItemCommand="dgList_ItemCommand" 
                                OnItemCreated="dgList_ItemCreated" OnSortCommand="dgList_SortCommand"
                                 CssClass="gridMain">
                                <SelectedItemStyle CssClass="gridSelectedRow" />
                                <AlternatingItemStyle  CssClass="gridAlternetRow" />
                                <ItemStyle CssClass="gridItemRow" />
                                <HeaderStyle BorderWidth="1px" CssClass="gridHeader" Font-Bold="True" Wrap="False" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Supplier ID" SortExpression="SupplierID">
                                        <HeaderStyle Font-Bold="True" Wrap="False" Width="10%" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblSupplierID" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.SupplierID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Width="30%" Wrap="False" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="MobileNo" HeaderText="Mobile No." SortExpression="MobileNo">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Width="5%" Wrap="False" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="Email" SortExpression="Email" DataField="Email">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Width="10%" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn HeaderText="VAT Reg. No." SortExpression="VATRegNo" DataField="VATRegNo">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" Width="10%" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" />
                                    </asp:BoundColumn>
                                    
                                    <asp:TemplateColumn HeaderText="VAT Reg. Date" SortExpression="VATRegDate">
                                        <HeaderStyle Font-Bold="True" Width="5%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblVATRegDate" runat="server" Text='<%# DataBinder.Eval(Container,"DataItem.VATRegDate","{0:dd/MM/yyyy}") %>'>
											</asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    
                                    
                                    <asp:BoundColumn HeaderText="PAN No." SortExpression="PANNo" DataField="PANNo">
                                        <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" Width="5%" />
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" />
                                    </asp:BoundColumn>
                                    
                                    <asp:TemplateColumn HeaderText="Action">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" Width="5%" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Wrap="False" />
                                        <ItemTemplate>
                                        <asp:ImageButton ID="btnView" runat="server" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.SupplierID") %>'
                                        CommandName="View" ImageUrl="../images/View.jpg" title="View this record" />
                                        &nbsp;
                                        <asp:ImageButton ID="btnEdit" runat="server" 
                                        CommandName="Edit" ImageUrl="../images/Edit.gif" title="Edit this record" />
                                        &nbsp;
                                        <asp:ImageButton ID="btnDel" runat="server" 
                                        CommandName="Del" ImageUrl="../images/Delete.gif" title="Delete this record" />
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    
                                    
                                </Columns>
                            </asp:DataGrid>
                         </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left" style="height: 28px; width: 679px;">
                &nbsp;<cc2:Pager
                OnCommand="PagerCtrl2_Command"
                ShowFirstLast="true"
                id="PagerCtrl2"
                runat="server" NotCompactedPageCount="15" PageSize="10">
                </cc2:Pager>

            </td>
                
        </tr>
        <tr>
            <td align= "center" style="width: 679px">
            <busyboxdotnet:BusyBox ID="BusyBox1" runat="server" IncludeScriptsInPage="True" Overlay="False" />
            </td>
        </tr>
    </table>
    
</asp:Content>

