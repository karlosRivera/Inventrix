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

public partial class Transactions_GoodsReceiptNoteView : BasePage
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("GoodsReceiptNoteView.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            lblGrnNo.Text = Request["ID"];
            LoadData(Request["ID"]);
        }
    }
    #endregion

    #region LoadData
    protected void LoadData(string sGRNNo)
    {
        #region INFO
        // THIS FUNCTION WILL POPULATE THIS FORM WITH DATA WHEN THIS PAGE WILL BE OPENED IN A EDIT MODE
        #endregion

        ArrayList oArr = new ArrayList();
        oArr.Add(sGRNNo);
        SqlDataReader oDr = BLL.Transaction.GoodsReceiptNote.FetchData(oArr, "TrnGRNNo_Select");
        if (oDr.HasRows)
        {
            while (oDr.Read())
            {
                if (oDr["GRNDate"] != DBNull.Value)
                {
                    lblGrnDate.Text = DateTime.Parse(oDr["GRNDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oDr["PurchaseOrderNo"] != DBNull.Value)
                {
                    lblPoNo.Text = oDr["PurchaseOrderNo"].ToString();
                }

                if (oDr["PurchaseOrderDate"] != DBNull.Value)
                {
                    lblPodate.Text = DateTime.Parse(oDr["PurchaseOrderDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oDr["StockPointID"] != DBNull.Value)
                {
                    lblStockPoint.Text = oDr["StockPointID"].ToString();
                }

                if (oDr["RefDeliveryNoteNo"] != DBNull.Value)
                {
                    lblSupDnno.Text = oDr["RefDeliveryNoteNo"].ToString();
                }

                if (oDr["RefDeliveryNoteDate"] != DBNull.Value)
                {
                    lblSupDnDate.Text = DateTime.Parse(oDr["RefDeliveryNoteDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oDr["DeliveredBy"] != DBNull.Value)
                {
                    lblDeliveredBy.Text = oDr["DeliveredBy"].ToString();
                }

                if (oDr["VehicleNo"] != DBNull.Value)
                {
                    lblVehicleNo.Text = oDr["VehicleNo"].ToString();
                }

                if (oDr["Remarks"] != DBNull.Value)
                {
                    lblRemarks.Text = oDr["Remarks"].ToString();
                }

                if (oDr["SupplierName"] != DBNull.Value)
                {
                    lblSupplier.Text = oDr["SupplierName"].ToString();
                }

                pnlCancel.Visible = false;
                if (oDr["GRNStatus"] != DBNull.Value)
                {
                    if (oDr["GRNStatus"].ToString().Trim() == "CAN")
                    {
                        pnlCancel.Visible = true;

                        if (oDr["CancelDate"] != DBNull.Value)
                        {
                            lblCancelDate.Text = DateTime.Parse(oDr["CancelDate"].ToString()).ToString("dd/MM/yyyy");
                        }

                        if (oDr["CancelReason"] != DBNull.Value)
                        {
                            lblCancelReason.Text = oDr["CancelReason"].ToString();
                        }

                    }
                }
            }
        }

        oDr.NextResult();

        dgList.DataSource = oDr;
        dgList.DataBind();

        oDr.Close();
    }
    #endregion
    #region btnPrint_Click
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblGrnNo.Text.Trim());
    }
    #endregion
}
