<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="UserMasterView.aspx.cs" Inherits="UserMasterView" Title="Untitled Page" %>
<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table align="center" border="0" cellpadding="1" cellspacing="0" style="position: relative" width="100%">
        <tr>
            <td align="left" colspan="2">
                <table id="tblHead1" class="topHeading" border="0" cellpadding="2" cellspacing="0">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Style="position: relative" ForeColor="White" Font-Size="1.1em">User View</asp:Label>
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
                            User View</td>
                    </tr>
                    <tr>
                        <td style="width: 110px">
                        </td>
                        <td align="left" style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User ID</td>
                        <td style="width: 500px" align="left">
                            <asp:Label ID="lblUserID" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr >
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User Name&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px;" align="left">
                            <asp:Label ID="lblUserName" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            User Password <span style="color: #ff3300"><strong>*</strong></span></td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblPwd" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"  align="left">
                            User Type&nbsp;<span style="color: #ff3300"><strong>*</strong></span></td>
                        <td style="width: 500px" align="left">
                            <asp:Label ID="lblUserType" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="font-weight: bold; width: 110px">
                            Disable</td>
                        <td align="left" style="width: 500px">
                            <asp:Label ID="lblDisable" runat="server" Style="position: relative"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width: 110px; font-weight: bold"><Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
                        <td style="width: 500px">
                            <Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" />
                        </td>
                    </tr>
                    <tr> 
                        <td colspan="2" align="right" class="entryBoxFooter">
                            &nbsp;<input id="btnBack" style="position: relative" type="button" onclick="document.location.href='UserList.aspx'" value="Back" class="button" />
                            <input id="Reset1" style="left: 0px; position: relative; top: 0px" type="reset" value="Reset" class="button" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>


