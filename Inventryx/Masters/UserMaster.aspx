<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserMaster.aspx.cs" Inherits="UserMaster" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">User Entry</asp:Label>
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
                            User Entry</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User ID <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtUserID" runat="server" Columns="8" MaxLength="12"
                                Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserID"
                                Display="Dynamic" ErrorMessage="Required" Font-Bold="True" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User Name&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <asp:TextBox ID="txtUserName" runat="server" Columns="50" MaxLength="40" Style="position: relative" CssClass="INPUTblack"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName"
                                Display="Dynamic" ErrorMessage="Required" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            User Password <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="font-weight: bold; width: 500px">
                            <asp:TextBox ID="txtPwd" runat="server" Columns="50" CssClass="INPUTblack" MaxLength="200"
                                Style="position: relative"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPwd"
                                Display="Dynamic" ErrorMessage="Required" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User Type&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:DropDownList ID="ddlUserType" runat="server" Style="position: relative" CssClass="INPUTblack">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="W">Warehouse</asp:ListItem>
                                <asp:ListItem Value="V">Van</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlUserType"
                                Display="Dynamic" ErrorMessage="Required" Font-Bold="True" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            Disable</td>
                        <td align="left" style="width: 500px">
                            <asp:CheckBox ID="chkDisable" runat="server" Style="position: relative" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            <asp:Button ID="btnSave" runat="server" Style="position: relative; left: 0px; top: 0px;" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="53px" />
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='UserList.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


