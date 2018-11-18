<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="ChangePwd" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">Change Password</asp:Label>
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
                            Change Password</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            Old Password &nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtOldPwd" runat="server" Columns="100" CssClass="INPUTblack" Enabled="False"
                                MaxLength="200" Style="position: relative"></asp:TextBox></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            New Password&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px; font-weight: bold;" align="left">
                            <asp:TextBox ID="txtNewPwd" runat="server" Columns="100" CssClass="INPUTblack" MaxLength="200"
                                Style="position: relative"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPwd"
                                Display="Dynamic" ErrorMessage="Required" Style="position: relative"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="font-weight: bold" nowrap  align="left">
                            Confirm Password&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:TextBox ID="txtConfirmPwd" runat="server" Columns="100" CssClass="INPUTblack" MaxLength="200"
                                Style="position: relative"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtConfirmPwd"
                                Display="Dynamic" ErrorMessage="Required" Font-Bold="True" Style="position: relative"></asp:RequiredFieldValidator></td>
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
                            <input id="btnBack" style="position: relative" type="button" onclick="document.location.href='index.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

