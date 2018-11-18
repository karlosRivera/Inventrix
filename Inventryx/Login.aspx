<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="InventryxLogin.Login" %>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head0" runat="server">
    <title>Inventryx Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <link href="Includes/mysite.css" rel="stylesheet" type="text/css" />
</head>
<body background="images/bg_page.gif">
<form id="Form1" runat = "server">
	<table border="0" cellspacing="0" width= "100%" height= "560">
	<tr>
        	<td align="left" colspan="3" style="height: 14%; padding-left:25px" valign="top" bgcolor="#5678BB" background="images/header.jpg">
		</td>
	</tr>
	<tr >
		<td style="height: 4%" align="right" colspan="3" bgcolor="#AEC3E5">
		</td>
	</tr>
	<tr >
		<td align="left" style="width: 49%; height: 80%" valign="top" background="images/loginmiddle.jpg">
            <table style="width: 100%; height: 100%">
                <tr>
                    <td align="right" style="width: 50%; height: 40%" valign= "middle">
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 50%; height: 20%" valign= "middle">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Inventryx.jpg" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 50%; height: 40%" valign= "middle">
                    </td>
                </tr>
            </table>
        </td>
        <td align= "center" style="width: 2%; height: 80%" valign="middle" background="images/loginmiddle.jpg">
            <asp:Image ID="Image2" runat="server" ImageUrl="Images/loginMiddleVLine.jpg" />
        </td>
		<td align="left" style="width: 49%; height: 80%" valign="top" background="images/loginmiddle.jpg"> 
		    <table style="width: 100%; height: 100%">
                <tr>
                    <td align="Left" style="width: 50%; height: 35%" valign= "middle">
                    </td>
                </tr>
                <tr>
                    <td align="Left" style="width: 50%; height: 30%" valign= "middle">
                        <table style="width: 300px; height: 90px">
                            <tr>
                                <td style="width: 90px; height: 30px;">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="#FFFFFF" Text="User ID"></asp:Label></td>
                                <td style="height: 30px; width: 30px;">
                                    <asp:TextBox ID="txtUserId" runat="server" CssClass="INPUTblack"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 90px; height: 30px">
                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="#FFFFFF" Text="Password"></asp:Label></td>
                                <td style="height: 30px; width: 30px;">
                                    <asp:TextBox ID="txtPwd" runat="server" CssClass="INPUTblack" TextMode="Password"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="width: 90px; height: 30px">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="#FFFFFF" Style="position: relative" Text="Company"></asp:Label></td>
                                <td style="width: 30px; height: 30px"><asp:DropDownList ID="ddlCompany" runat="server" CssClass="INPUTblack" Style="position: relative" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 90px; height: 30px">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="White" Style="position: relative" Text="Branch"></asp:Label></td>
                                <td style="width: 30px; height: 30px"><asp:DropDownList ID="ddlBranch" runat="server" CssClass="INPUTblack" Style="position: relative">
                                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 90px; height: 30px">
                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="White" Style="position: relative" Text="Financial Year"></asp:Label></td>
                                <td style="width: 30px; height: 30px">
                                    <asp:DropDownList ID="ddlFinYr" runat="server" CssClass="INPUTblack" Style="position: relative">
                                        <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="width: 90px; height: 30px">
                                </td>
                                <td  align="top" valign= "middle">
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" BackColor="WhiteSmoke" 
                                    BorderStyle="Outset" Font-Bold="False" Font-Names="Tahoma" OnClick="btnLogin_Click" />
                                    <input id="Reset1"  style="font-family: Tahoma;background-color:WhiteSmoke; left: 47px; top: -24px;" type="reset" value="Reset" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="Left" style="width: 50%; height: 35%" valign= "middle">
                    </td>
                </tr>
            </table>

		</td>   
	</tr>
	<tr>
		<td align="right"colspan="3" style="height: 2%" valign="top" bgcolor="#AEC3E5">
        <a href="http://www.nnkconsulting.com/"><% =ConfigurationManager.AppSettings["FooterMessage"]%></a>
		</td>
	</tr>
	</table>
	</form>
</body>
</html>
