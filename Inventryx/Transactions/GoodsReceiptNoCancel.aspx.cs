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

public partial class Transactions_GoodsReceiptNoCancel : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("GoodsReceiptNoCancel.aspx");
        }

        CheckQString();

        if (!IsPostBack)
        {
            lblGrnNo.Text = Request["ID"];
            LoadData(Request["ID"]);
        }
    }

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
            }
        }
        oDr.NextResult();

        dgList.DataSource = oDr;
        dgList.DataBind();
        oDr.Close();
    }
    #endregion

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion

        if (Request["Action"] == "C")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(lblGrnNo.Text.Trim());
                objArr.Add(lblPoNo.Text.Trim());
                objArr.Add(lblStockPoint.Text.Trim());
                objArr.Add(txtCancelReason.Text.Trim());
                objArr.Add(txtCancelDate.Date.ToShortDateString().Trim());
                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

                object tmpMsg = BLL.Transaction.GoodsReceiptNote.Operate(objArr, Request["Action"].ToString());
                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    //Response.Redirect("GoodsReceiptNoteView.aspx?Action=V&ID=" + tmpMsg.ToString());
                    btnSave.Enabled = false;
                    Utility.ShowMessage(this, "GRN Successfully cancel");
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }
    }
    #endregion
    #region ValidateInput
    private string ValidateInput()
    {
        #region INFO
        //THIS FUNCTION WILL VALIDATE DATA BEFORE INSERTING OR UPDATION DATA TO THE TABLE
        #endregion
        int i = 0;
        string sMsg = "";
        if (txtCancelReason.Text.Trim() == "")
        {
            sMsg = "Sorry Cancel reason can not be blank";
            return sMsg;
        }
        if (dgList.Items.Count <= 0)
        {
            sMsg = "Sorry can not cancel because detail part is missing";
            return sMsg;
        }
        return sMsg;
    }
     #endregion

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion

        string sProduct = "";
        decimal decQty = 0, decRcpQty = 0, decRate = 0;
        int i = 0;
        DataTable tbl = new DataTable();
        tbl.TableName = "GRNDetail";
        DataRow dr = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("BalancePOQty");
        tbl.Columns.Add("ReceiptQty");
        tbl.Columns.Add("Rate");

        for (i = 0; i <= dgList.Items.Count - 1; i++)
        {
                if (((Label)dgList.Items[i].FindControl("lblProdID")).Text != "")
                {
                    sProduct = ((Label)dgList.Items[i].FindControl("lblProdID")).Text.Trim();
                }

                if (((Label)dgList.Items[i].FindControl("lblQty")).Text.Trim() != "")
                {
                    decQty = Convert.ToDecimal(((Label)dgList.Items[i].FindControl("lblQty")).Text.Trim());
                }

                if (((Label)dgList.Items[i].FindControl("lblRcvQty")).Text.Trim() != "")
                {
                    decRcpQty = Convert.ToDecimal(((Label)dgList.Items[i].FindControl("lblRcvQty")).Text.Trim());
                }

                if (((Label)dgList.Items[i].FindControl("lblRate")).Text.Trim() != "")
                {
                    decRate = Convert.ToDecimal(((Label)dgList.Items[i].FindControl("lblRate")).Text.Trim());
                }

                if (sProduct.Trim() != "" && decQty > 0 && decRcpQty > 0 && decRate > 0)
                {
                    dr = tbl.NewRow();
                    dr["ProductID"] = sProduct;
                    dr["BalancePOQty"] = decQty;
                    dr["ReceiptQty"] = decRcpQty;
                    dr["Rate"] = decRate;
                    tbl.Rows.Add(dr);
                }
        }

        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        return oDS.GetXml().ToString();
    }
    #endregion

   

}
