<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ProductMaster.aspx.cs" Inherits="ProductMaster" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2" style="height: 37px">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Product Entry</asp:Label>
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
                            &nbsp;Product &nbsp;Detail</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Product ID</td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtProductID" runat="server" Columns="8" Enabled="False" MaxLength="10"
                                Style="position: relative" CssClass="INPUTblack" Width="113px"></asp:TextBox></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Product &nbsp;Name&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <asp:TextBox ID="txtProName" runat="server" Columns="50" MaxLength="50" Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td nowrap style="font-weight: bold; height: 23px;"  align="left">
                            Product Specification&nbsp;</td>
                        <td style="width: 500px; height: 23px;" align="left">
                            <asp:TextBox ID="txtProSpec" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="50"
                                Style="position: relative"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            Product Group <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="width: 500px">
                            <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="INPUTblack" Style="position: relative"
                                Width="129px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            Manufacturer</td>
                        <td align="left" style="width: 500px">
                            <asp:DropDownList ID="ddlManufacturer" runat="server" CssClass="INPUTblack" Style="position: relative"
                                Width="129px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px; height: 23px">
                            Unit of Measure <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="width: 500px; height: 23px">
                            <asp:TextBox ID="txtUOM" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="10"
                                Style="position: relative"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px; height: 17px">
                            ReOrder Level <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="width: 500px; height: 17px">
                            <ew:numericbox id="txtReorderLevel" runat="server" cssclass="INPUTblack" maxlength="12"
                                positivenumber="True" width="223px"></ew:numericbox>
                            </td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold">
                        </td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='Product.aspx'" value="back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

