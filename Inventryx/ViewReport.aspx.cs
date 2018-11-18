using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

public partial class ViewReport : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("ViewReport.aspx");
        }

        BuildReport();
    }

    private void BuildReport()
    {
        ReportDocument oRptObject=new ReportDocument();
        string sReportTitle = "";
        SqlDataReader oDr = null;
        DataTable oTable = null;
        DataTable oSubTable = null;

        if(Request.QueryString["ModID"] == "0102")
        {
            //Developed By : Tridip Bhattacharjee

            if (Request.QueryString["Tag"] == "1")
            {
                sReportTitle = "Stock Point";
                oDr = BLL.Master.StockPoint.GetDataForViewPage(Request.QueryString["ID"]);
                oTable=Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oRptObject.Load(Server.MapPath("Reports/StockPoint.rpt"));
                oRptObject.SetDataSource(oTable);
            }
        }

        if(Request.QueryString["ModID"] == "0302")
        {
            //Developed By : Tridip Bhattacharjee

            if (Request.QueryString["Tag"] == "1")
            {
                sReportTitle = "Purcase Order Details";
                oRptObject.Load(Server.MapPath("Reports/PurchaseOrderHdr.rpt"));
                oDr = BLL.Transaction.PurchaseOrder.GetPurchaseOrderDetailForReport(Request.QueryString["ID"], "rptPurchaseOrder_Select");
                oTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oDr = BLL.Transaction.PurchaseOrder.GetPurchaseOrderDetailForReport(Request.QueryString["ID"], "rptPurcsaseOrderDtl_Select");
                oSubTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oRptObject.Subreports["subPurchaseOrderDtl"].SetDataSource(oSubTable);
                oRptObject.SetDataSource(oTable);
            }
        }

        if (Request.QueryString["ModID"] == "0401")
        {
            //Developed By : Indranil Roy

            if (Request.QueryString["Tag"] == "1")
            {
                sReportTitle = "Proforma Invoice Details";
                oRptObject.Load(Server.MapPath("Reports/ProformaInvoice.rpt"));
                oDr = BLL.Transaction.ProformaInvoice.GetProformaInvoiceDetailForReport(Request.QueryString["ID"], "rptProformaInv_Select");
                oTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oDr = BLL.Transaction.ProformaInvoice.GetProformaInvoiceDetailForReport(Request.QueryString["ID"], "rptProformaInvDtl_Select");
                oSubTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oRptObject.Subreports["Product Details"].SetDataSource(oSubTable);
                oRptObject.SetDataSource(oTable);
            }
        }

        if (Request.QueryString["ModID"] == "0303")
        {
            //Developed By : Tridip Bhattacharjee

            if (Request.QueryString["Tag"] == "1")
            {
                sReportTitle = "Goods Receipt Note Details";
                oRptObject.Load(Server.MapPath("Reports/GoodsReceiptNo_Hdr.rpt"));
                oDr = BLL.Transaction.GoodsReceiptNote.GetGRNDetailForReport(Request.QueryString["ID"], "rptGRNHdr_Select");
                oTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oDr = BLL.Transaction.GoodsReceiptNote.GetGRNDetailForReport(Request.QueryString["ID"], "rptGRNDtl_Select");
                oSubTable = Utility.ConvertDataReaderToDataSet(oDr).Tables[0];
                oRptObject.Subreports["SubGoodsReceiptNoDtl"].SetDataSource(oSubTable);
                oRptObject.SetDataSource(oTable);
            }
        }

        oRptObject.SetParameterValue("pCompanyName",((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyName);
        oRptObject.SetParameterValue("pBranchName", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchName);
        oRptObject.SummaryInfo.ReportTitle = sReportTitle;
        rptViewer.ReportSource = oRptObject;
    }
}
