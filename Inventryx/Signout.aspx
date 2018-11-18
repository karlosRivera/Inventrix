<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Signout.aspx.cs" Inherits="Signout" %>

<%@ Register Assembly="SpacerControl" Namespace="PeterBlum.SpacerControl" TagPrefix="Spc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" Runat="Server">
    <table border="0" style="width: 100%; position: relative; height: 100%">
        <tr>
            <td align="center" colspan="2"><Spc:SpacerImage ID="SpacerImage3" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><Spc:SpacerImage ID="SpacerImage4" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
        </tr>
        
        
        <tr>
        <td colspan="2" align="center" valign="top">
        <table border="0" class=tdhTable  style="width: 70%; position: relative; height: 100%">
        <tr>
            <th colspan="2" class=tdh  style="width: 100%; position: relative;">
                <Spc:SpacerImage ID="SpacerImage1" runat="server" Style="position: relative" Height="10px" Width="5px" />
            
            </th>
        </tr>
        <tr>
                <td colspan="2">
                    <Spc:SpacerImage ID="SpacerImage2" runat="server" Style="position: relative" Height="10px" Width="5px" /></td>
        </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#FF6666" Style="position: relative"
                        Text="Successfully Sign Out"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
        </table>
        </td>
        </tr>
    </table>
</asp:Content>

