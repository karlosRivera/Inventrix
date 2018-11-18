<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AccessRightMaster.aspx.cs" Inherits="AccessRightMaster" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">User Access Rights Entry</asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left" valign="top" style="width: 740px; height: 56px">
                <table id="tblEntry" class="entryBox" border="0" cellpadding="2" cellspacing="0" >
                    <tr>
                        <td colspan="2" align="left" class="entryBoxHeader">
                            User Access Rights Entry</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold; height: 17px;"  align="left">
                            User Name <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; height: 17px;" align="left">
                            <asp:DropDownList ID="ddlUserName" runat="server" Style="position: relative" CssClass="INPUTblack">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList>&nbsp;<asp:Button ID="btnSrch" runat="server" CssClass="button"
                                OnClick="btnSrch_Click" Style="left: 29px; position: relative; top: 0px" Text=" Go " />
                            <asp:Button ID="btnEditRight" runat="server" CssClass="button" OnClick="btnEditRight_Click"
                                Style="left: 32px; position: relative; top: 0px" Text="Edit Rights" /></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px"><Spc:SpacerImage ID="SpacerImage4" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                        <td align="left" style="width: 500px"><Spc:SpacerImage ID="SpacerImage5" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td align="left" colspan="2" style="font-weight: bold">
                            <asp:DataGrid ID="dgList" runat="server"  AutoGenerateColumns="False"
                                CellPadding="3" CssClass="gridMain" GridLines="Horizontal" OnItemDataBound="dgList_ItemDataBound" 
                                Style="position: relative" Width="100%">
                                <SelectedItemStyle CssClass="gridSelectedRow" />
                                <AlternatingItemStyle CssClass="gridAlternetRow" />
                                <ItemStyle CssClass="gridItemRow" />
                                <HeaderStyle BorderWidth="1px" CssClass="gridHeader" Font-Bold="True" Wrap="False" />
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Module Name" >
                                        <HeaderStyle Font-Bold="True" Width="70%" Wrap="False" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblModuleID" Visible=false runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.OptionID") %>'>
											</asp:Label>
                                        
                                            <asp:Label ID="lblModuleName" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.TreeOptionName") %>'>
											</asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="View">
                                        <HeaderStyle Font-Bold="True" Width="10%" Wrap="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkView" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateColumn>

                                    <asp:TemplateColumn HeaderText="Add">
                                        <HeaderStyle Font-Bold="True" Width="10%" Wrap="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkAdd" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateColumn>

                                    <asp:TemplateColumn HeaderText="Edit">
                                        <HeaderStyle Font-Bold="True" Width="10%" Wrap="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkEdit" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateColumn>

                                    <asp:TemplateColumn HeaderText="Delete">
                                        <HeaderStyle Font-Bold="True" Width="10%" Wrap="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkDelete" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateColumn>
                                    
                                </Columns>
                            </asp:DataGrid></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 2px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />&nbsp;
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


