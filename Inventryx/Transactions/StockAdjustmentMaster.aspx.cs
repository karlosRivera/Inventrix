

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

public partial class Transactions_StockAdjustmentMaster : BasePage
{

    # region Global variables
    int iBookStock = 0;
    # endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("StockAdjustmentMaster.aspx");
        }
        CheckQString();
        if (!Page.IsPostBack)
        {
            PopulateCombo(ddlStockPoint, "StockPointName", "StockPointID", "MstStockPointName_Select", "T", "");

            if (Request["Action"] == "A")
            {
                
            }
            else
            {
                this.btnProduct.Enabled = false;
                ddlStockPoint_SelectedIndexChanged(sender, e);
                LoadData(Request["ID"]);
            }
        }
    }
    #endregion Page_Load

    # region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName, string sTrack, string sStockPointID)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        if (sTrack == "T")
        {
            if (Request["Action"] == "E")
            {
                //objArrVal.Add(sStockPointID.Trim());
            }
            else
            {
                //objArrVal.Add("");
            }
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add("");
           // objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        }
        else
        {
            objArrVal.Add(sStockPointID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
            objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        }

        oDr = BLL.Transaction.StockAdjustment.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

    #region ddlStockPoint_SelectedIndexChanged
    protected void ddlStockPoint_SelectedIndexChanged(object sender, EventArgs e)
    {

        this.btnProduct.Enabled = true;
        PopulateCombo(ddlProduct, "ProductName", "ProductID", "TrnPopulateProduct_Select","",ddlStockPoint.SelectedValue.ToString().Trim());
    }
    #endregion ddlStockPoint_SelectedIndexChanged

    #region btnProduct_Click
    protected void btnProduct_Click(object sender, EventArgs e)
    {
        SqlDataReader oSqlDataReader=null;
        DataSet oDS = new DataSet();
        ArrayList arrList = new ArrayList();
        arrList.Add(ddlProduct.SelectedValue);
        arrList.Add(ddlStockPoint.SelectedValue);

        oSqlDataReader = BLL.Transaction.StockAdjustment.FetchData(arrList, "TrnStockAdjustmentProductPopulate_Select");
        dgStockAdjustment.DataSource = oSqlDataReader;
        dgStockAdjustment.DataBind();
        this.txtBookStock.Text = iBookStock.ToString();
        ClientScript.RegisterHiddenField("hdnTotalRows", Convert.ToString(dgStockAdjustment.Items.Count));
    }
    #endregion btnProduct_Click

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
            string sMsg="";
            //sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList arrSave = new ArrayList();
                if (Request["Action"] == "A")
                {
                    arrSave.Add("");
                }
                else
                {
                    arrSave.Add(this.txtDVN.Text.Trim());
                }

                arrSave.Add(txtDVNDate.Date.ToString().Trim());
                arrSave.Add(ddlStockPoint.SelectedValue.ToString());
                arrSave.Add(ddlProduct.SelectedValue.ToString());
                arrSave.Add(txtBookStock.Text.ToString().Trim());
                arrSave.Add(txtPhysicalStock.Text.ToString().Trim());
                arrSave.Add(txtRemarks.Text.ToString().Trim());
                arrSave.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
                arrSave.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
                arrSave.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
                arrSave.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
                arrSave.Add(BuildXMLForDetail());

                object tmpMsg = BLL.Transaction.StockAdjustment.Operate(arrSave, Request["Action"].ToString());
                Response.Redirect("StockAdjustmentView.aspx?Action=V&ID=" + tmpMsg.ToString());
            }
            else
            {
                Utility.ShowMessage(this, sMsg);
            }
    }
    #endregion btnSave_Click

    #region dgStockAdjustment_ItemDataBound
    protected void dgStockAdjustment_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            ((TextBox)e.Item.FindControl("tbPhysicalStock")).Attributes.Add("onchange", "CalculateTotalAmount();");
            iBookStock = iBookStock + Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "BookStockQty"));
        }
    }
    #endregion dgStockAdjustment_ItemDataBound

    #region BuildXMLForDetail
    private string BuildXMLForDetail()
    {
        string sStockInDtlID = "", sProductID = "", sBookStockQty = "", sPhysicalStockQty = "";
        decimal sAdjustStockQty = 0;
        string sXML = "";
        DataRow dr = null;

        DataTable dtDetail = new DataTable();
        dtDetail.TableName = "StockAdjustmentDtl";

        dtDetail.Columns.Add("StockInDtlID");
        dtDetail.Columns.Add("ProductID");
        dtDetail.Columns.Add("BookStockQty");
        dtDetail.Columns.Add("PhysicalStockQty");
        dtDetail.Columns.Add("AdjustStockQty");

        for (int i = 0; i < dgStockAdjustment.Items.Count; i++)
        {
            sStockInDtlID = ((Label)dgStockAdjustment.Items[i].FindControl("lbStockInDtlID")).Text.ToString();
            sProductID = ddlProduct.SelectedValue.ToString();
            sBookStockQty = ((Label)dgStockAdjustment.Items[i].FindControl("lbBookStock")).Text.ToString();
            //decimal iBookStockQty = Convert.ToDecimal(sBookStockQty);
            sPhysicalStockQty = ((eWorld.UI.NumericBox)dgStockAdjustment.Items[i].FindControl("tbPhysicalStock")).Text.ToString();
            //decimal iPhysicalStockQty = Convert.ToDecimal(sPhysicalStockQty);
            sAdjustStockQty = Convert.ToDecimal(sBookStockQty) - Convert.ToDecimal(sPhysicalStockQty);
            //sAdjustStockQty = iAdjustedStock.ToString();
        }

        dr = dtDetail.NewRow();
        dr["StockInDtlID"] = sStockInDtlID;
        dr["ProductID"] = sProductID;
        dr["BookStockQty"] = sBookStockQty;
        dr["PhysicalStockQty"] = sPhysicalStockQty;
        dr["AdjustStockQty"] = sAdjustStockQty;
        dtDetail.Rows.Add(dr);

        DataSet DS = new DataSet();
        DS.Tables.Add(dtDetail);
        sXML = DS.GetXml().ToString();
        return sXML;
    }
    #endregion BuildXMLForDetail

    #region LoadData
    #region Info
    //THIS FUNCTION WILL FETCH DATA FROM HEADER AND DETAIL TABLE AND POPULATE THIS FORM
    #endregion
    private void LoadData(string sStockAdjustmentNo)
    {

        ArrayList objArrVal = new ArrayList();

        //objArrVal.Add("");
        objArrVal.Add(sStockAdjustmentNo);
        objArrVal.Add("E");
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        SqlDataReader oDr = BLL.Transaction.StockAdjustment.FetchData(objArrVal,"TrnStockAdjustment_Select");
        while (oDr.Read())
        {
            if (oDr["StockAdjustmentNo"] != DBNull.Value)
            {
                this.txtDVN.Text = oDr["StockAdjustmentNo"].ToString();
            }
            if (oDr["StockAdjustmentDate"] != DBNull.Value)
            {
                this.txtDVNDate.Date = Convert.ToDateTime(oDr["StockAdjustmentDate"].ToString());
            }

            if (oDr["StockPointName"] != DBNull.Value)
            {
                this.ddlStockPoint.SelectedValue = oDr["StockPointID"].ToString();
            }

            PopulateCombo(ddlProduct, "ProductName", "ProductID", "TrnPopulateProduct_Select", "", ddlStockPoint.SelectedValue.ToString().Trim());

            if (oDr["ProductID"] != DBNull.Value)
            {
               this.ddlProduct.SelectedValue = oDr["ProductID"].ToString();
            }

            if (oDr["Remarks"] != DBNull.Value)
            {
                this.txtRemarks.Text = oDr["Remarks"].ToString();
            }
            if (oDr["BookStockQty"] != DBNull.Value)
            {
                this.txtBookStock.Text = oDr["BookStockQty"].ToString();
            }

            if (oDr["PhysicalStockQty"] != DBNull.Value)
            {
                this.txtPhysicalStock.Text = oDr["PhysicalStockQty"].ToString();
            }
        }
        oDr.NextResult();
        dgStockAdjustment.DataSource = oDr;
        dgStockAdjustment.DataBind();
        oDr.Close();
    }
    #endregion

}
