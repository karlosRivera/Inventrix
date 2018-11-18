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

public partial class Transactions_DeliveryNoteCancel : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("DeliveryNoteCancel.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            if (Request["Action"] == "C")
            {
                lblTitle.Text = "Cancel Delivery Note";
                lblDVNNo.Text = Request["ID"];
                LoadData(Request["ID"]);
            }
        }
    }

    #region LoadData
    #region Info
    //THIS FUNCTION WILL BE CALLED WHEN USER EDIT THIS FORM
    //THE MAIN OBJECTIVE OF THIS FUNCTION IS TO POPULATE THIS FORM
    #endregion
    protected void LoadData(string DeliveryNoteNo)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArr = new ArrayList();
        objArr.Add(DeliveryNoteNo);
        oSqlDataReader = BLL.Transaction.DeliveryNote.FetchData(objArr, "TrnDeliveryNoteGrid_Select");

        if (oSqlDataReader.HasRows)
        {
            while (oSqlDataReader.Read())
            {
                if (oSqlDataReader["DeliveryNoteDate"] != DBNull.Value)
                {
                    lblDVNDate.Text = DateTime.Parse(oSqlDataReader["DeliveryNoteDate"].ToString()).ToString("dd/MM/yyyy");
                }

                if (oSqlDataReader["ProformaInvNo"] != DBNull.Value)
                {
                    lblProformaInvNo.Text = oSqlDataReader["ProformaInvNo"].ToString();
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                    lblCustomer.Text = oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["ShippingAddress"] != DBNull.Value)
                {
                    lblShippingAddress.Text = oSqlDataReader["ShippingAddress"].ToString();
                }

                if (oSqlDataReader["DespatchMode"] != DBNull.Value)
                {
                    lblDespatchMode.Text = oSqlDataReader["DespatchMode"].ToString();
                }

                if (oSqlDataReader["ShippingCity"] != DBNull.Value)
                {
                    lblCity.Text = oSqlDataReader["ShippingCity"].ToString();
                }

                if (oSqlDataReader["ShippingPin"] != DBNull.Value)
                {
                    lblPin.Text = oSqlDataReader["ShippingPin"].ToString();
                }

                if (oSqlDataReader["DeliveredBy"] != DBNull.Value)
                {
                    lblDeliveryBy.Text = oSqlDataReader["DeliveredBy"].ToString();
                }

                if (oSqlDataReader["VehicleNo"] != DBNull.Value)
                {
                    lblVehichleNo.Text = oSqlDataReader["VehicleNo"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    lblRemarks.Text = oSqlDataReader["Remarks"].ToString();
                }
            }

            oSqlDataReader.NextResult();

            dgGrid.DataSource = oSqlDataReader;
            dgGrid.DataBind();
        }
        oSqlDataReader.Close();
    }
    #endregion

    #region dgGrid_ItemDataBound
    protected void dgGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        string oDivClientId = "";
        string DeliveryNoteNo = "";
        string DeliveryNoteDtlID = "";

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {

            DeliveryNoteNo = DataBinder.Eval(e.Item.DataItem, "DeliveryNoteNo").ToString();
            DeliveryNoteDtlID = DataBinder.Eval(e.Item.DataItem, "DeliveryNoteDtlID").ToString();

            ArrayList oArr = new ArrayList();
            oArr.Add(DeliveryNoteNo);
            oArr.Add(DeliveryNoteDtlID);
            SqlDataReader oDr = BLL.Transaction.DeliveryNote.FetchData(oArr, "TrnDeliveryNoteGridDtl_Select");
            ((DataGrid)e.Item.FindControl("dgInner")).DataSource = oDr;
            ((DataGrid)e.Item.FindControl("dgInner")).DataBind();
            if (((DataGrid)e.Item.FindControl("dgInner")).Items.Count <= 0)
                ((DataGrid)e.Item.FindControl("dgInner")).Visible = false;
            oDr.Close();

            e.Item.Cells[7].Visible = true;
            oDivClientId = ((HtmlGenericControl)e.Item.FindControl("mydiv")).ClientID;
            ((ImageButton)e.Item.FindControl("btnExpand")).ImageUrl = "../images/Minus.gif";
            ((ImageButton)e.Item.FindControl("btnExpand")).CommandName = "Expand";
        }
    }
    #endregion
    #region btnCancel_Click
    #region Info
    //THIS ROUTINE CANCEL A DELIVERY NOTE AS A RESULT STOCK WILL BE REVERSE
    #endregion
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request["Action"] == "C")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                objArr.Add(lblDVNNo.Text);
                objArr.Add(lblDVNDate.Text.Trim());
                objArr.Add(lblProformaInvNo.Text);
                objArr.Add(lblShippingAddress.Text.Trim());
                objArr.Add(lblDespatchMode.Text);
                objArr.Add(lblCity.Text.Trim());
                objArr.Add(lblPin.Text.Trim());
                objArr.Add(lblDeliveryBy.Text.Trim());
                objArr.Add(lblVehichleNo.Text.Trim());
                objArr.Add(lblRemarks.Text.Trim());
                objArr.Add(BuildXmlForDetail());

                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
                object tmpMsg = BLL.Transaction.DeliveryNote.Operate(objArr, Request["Action"].ToString());

                if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
                {
                    Utility.ShowMessage(this, tmpMsg.ToString());
                }
                else
                {
                    Response.Redirect("DeliveryNoteList.aspx");
                }
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
        }

    }
    #endregion

    #region BuildXmlForDetail
    private string BuildXmlForDetail()
    {
        #region INFO
        //THIS FUNCTION WILL GENERATE AND RETURN XML FOR DETAIL GRID PORTION
        #endregion
        string sXMLDetail = "";
        string sProduct = "", sRate = "", sBalinvQty = "", sDelQty = "", sStockInDtlID = "";
        string sInDocType = "", sInDocNo = "", sDocDate = "", sStockPointID = "", sBalQty = "", sLiftQty = "";
        int i = 0, j = 0;
        DataGrid _dgInner = null;
        DataTable tbl = new DataTable();
        DataTable tblLift = new DataTable();
        tbl.TableName = "DeliveryDetail";
        tblLift.TableName = "LiftDetail";
        DataRow dr = null;
        DataRow drLift = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Rate");
        tbl.Columns.Add("BalinvQty");
        tbl.Columns.Add("DelQty");

        tblLift.Columns.Add("ProductID");
        tblLift.Columns.Add("StockInDtlID");
        tblLift.Columns.Add("InDocType");
        tblLift.Columns.Add("InDocNo");
        tblLift.Columns.Add("DocDate");
        tblLift.Columns.Add("StockPointID");
        tblLift.Columns.Add("BalQty");
        tblLift.Columns.Add("LiftQty");

        for (i = 0; i <= dgGrid.Items.Count - 1; i++)
        {
            if (((CheckBox)dgGrid.Items[i].FindControl("chk")).Checked)
            {
                sProduct = ((Label)dgGrid.Items[i].FindControl("lblProdID")).Text.Trim();
                sRate = ((Label)dgGrid.Items[i].FindControl("lblRate")).Text.Trim();
                sBalinvQty = ((Label)dgGrid.Items[i].FindControl("lblBalinvQty")).Text.Trim();
                sDelQty = ((eWorld.UI.NumericBox)dgGrid.Items[i].FindControl("txtDelQty")).Text.Trim();

                dr = tbl.NewRow();
                dr["ProductID"] = sProduct;
                dr["Rate"] = sRate;
                dr["BalinvQty"] = sBalinvQty;
                dr["DelQty"] = sDelQty;
                tbl.Rows.Add(dr);

                _dgInner = ((DataGrid)dgGrid.Items[i].FindControl("dgInner"));

                for (j = 0; j <= _dgInner.Items.Count - 1; j++)
                {
                    sStockInDtlID = ((Label)_dgInner.Items[j].FindControl("lblStockInDtlID")).Text.Trim();
                    sInDocType = ((Label)_dgInner.Items[j].FindControl("lblInDocType")).Text.Trim();
                    sInDocNo = ((Label)_dgInner.Items[j].FindControl("lblInDocNo")).Text.Trim();
                    sDocDate = ((Label)_dgInner.Items[j].FindControl("lblDocDate")).Text.Trim();
                    sStockPointID = ((Label)_dgInner.Items[j].FindControl("lblStockPoint")).Text.Trim();
                    sBalQty = ((Label)_dgInner.Items[j].FindControl("lblBalQty")).Text.Trim();
                    sLiftQty = ((eWorld.UI.NumericBox)_dgInner.Items[j].FindControl("txtLiftQty")).Text.Trim();

                    drLift = tblLift.NewRow();
                    drLift["ProductID"] = sProduct;
                    drLift["StockInDtlID"] = sStockInDtlID;
                    drLift["InDocType"] = sInDocType;
                    drLift["InDocNo"] = sInDocNo;
                    drLift["DocDate"] = sDocDate;
                    drLift["StockPointID"] = sStockPointID;
                    drLift["BalQty"] = sBalQty;
                    drLift["LiftQty"] = sLiftQty;
                    tblLift.Rows.Add(drLift);
                }
            }
        }
        DataSet oDS = new DataSet();
        oDS.Tables.Add(tbl);
        oDS.Tables.Add(tblLift);
        DataRelation oDRel = new DataRelation("ProdDtl",
            oDS.Tables["DeliveryDetail"].Columns["ProductID"],
            oDS.Tables["LiftDetail"].Columns["ProductID"]);
        oDRel.Nested = true;
        oDS.Relations.Add(oDRel);
        sXMLDetail = oDS.GetXml().ToString();
        return sXMLDetail;
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

        if (txtCancelDate.Date.ToString() == "")
        {
            sMsg = "Please enter cancel";
            return sMsg;
        }

        if (txtCancelReason.Text == "")
        {
            sMsg = "Please enter cancel reason";
            return sMsg;
        }

        return sMsg;
    }
    #endregion
}
