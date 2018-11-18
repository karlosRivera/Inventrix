<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewReport.aspx.cs" Inherits="ViewReport" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" cellpadding="1" cellspacing="1" style="width: 100%; position: relative">
            <tr>
                <td style="width: 100px">
                    <CR:CrystalReportViewer ID="rptViewer" runat="server" AutoDataBind="true"
                    ReuseParameterValuesOnRefresh="True" Style="position: relative" HasCrystalLogo="False" 
                     EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
                    />
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
