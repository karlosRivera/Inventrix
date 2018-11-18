//Developed By Arnab

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

public partial class Masters_StockTransferMaster : BasePage
{

    string sListOfProduct = "";

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PopulateCombo(this.ddlStockTransferFrom, "StockPointName", "StockPointID", "MstStockPointName_Select");
            PopulateCombo(this.ddlStockTransferTo, "StockPointName", "StockPointID", "MstStockPointName_Select");
            
        }
    }
    #endregion Page_Load

    //#region btnSave_Click
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    string sMsg = "";
    //    sMsg = ValidateInput();

    //    Utility.ShowMessage(this, sMsg);

    //    ArrayList objArr = new ArrayList();
    //    objArr.Add(System.DBNull.Value);
    //    objArr.Add(txtVATRegDate.Date.ToShortDateString().Trim());
    //    objArr.Add(ddlStockTransferFrom.SelectedValue.ToString());
    //    objArr.Add(ddlStockTransferTo.SelectedValue.ToString());
    //    objArr.Add(txtRemarks.Text.ToString().Trim());
    //    objArr.Add(BuildXmlForDetail());
    //    objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
    //    objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
    //    objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
    //    objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

    //    object tmpMsg = BLL.Transaction.StockTransfer.Operate(objArr, Request["Action"].ToString());

    //}
    //#endregion btnSave_Click

    #region PopulateCombo
    private void PopulateCombo(DropDownList ddControl, string FieldName, string FieldID, string spName)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();

        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);
        objArrVal.Add("");

        oDr = BLL.Transaction.StockTransfer.GetComboData(spName, objArrVal);
        ddControl.Items.Clear();
        ddControl.Items.Add(new ListItem("-- Select --", "-1"));
        while (oDr.Read())
        {
            ddControl.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    #endregion PopulateCombo

    #region ddlStockTransferFrom_SelectedIndexChanged
    protected void ddlStockTransferFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        PopulateListBox(lstchkProduct, "ProductName", "ProductID", "TrnPopulateProduct_Select", this.ddlStockTransferFrom.SelectedValue.Trim());
        Label1.Visible = true;
    }
    #endregion ddlStockTransferFrom_SelectedIndexChanged

    #region btnPopulateProduct_Click
    protected void btnPopulateProduct_Click(object sender, EventArgs e)
    {
        try
        {
            ArrayList oArr = new ArrayList();

            for (int i = 0; i < lstchkProduct.Items.Count; i++)
            {
                if (lstchkProduct.Items[i].Selected == true)
                    sListOfProduct = sListOfProduct + lstchkProduct.Items[i].Value + ",";
            }
            sListOfProduct = sListOfProduct.Substring(0, (sListOfProduct.Length - 1));
            oArr.Add(sListOfProduct);
            oArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
            oArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID);

            SqlDataReader oDr = BLL.Transaction.StockTransfer.FetchData(oArr, "TrnStockTransferProduct_Select");
            dgGrid.DataSource = oDr;
            dgGrid.DataBind();
            AttachScript();
        }
        catch { }
    }
    #endregion btnPopulateProduct_Click

    #region dgGrid_ItemCommand
    protected void dgGrid_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        ExpandedCollapse(e.CommandName, e.Item.ItemIndex);

    }
    #endregion dgGrid_ItemCommand

    #region dgGrid_ItemDataBound
    protected void dgGrid_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        string sProductID = "";
        string oDivClientId = "";
        string DeliveryNoteNo = "";
        string DeliveryNoteDtlID = "";

        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            if (Request["Action"] == "A")
            {
                if (DataBinder.Eval(e.Item.DataItem, "ProductID") != DBNull.Value)
                {
                    sProductID = DataBinder.Eval(e.Item.DataItem, "ProductID").ToString();
                    ArrayList oArr = new ArrayList();
                    oArr.Add(sProductID);
                    SqlDataReader oDr = BLL.Transaction.DeliveryNote.FetchData(oArr, "TrnProformaInvStockinDtl_Select");
                    ((DataGrid)e.Item.FindControl("dgInner")).DataSource = oDr;
                    ((DataGrid)e.Item.FindControl("dgInner")).DataBind();
                    if (((DataGrid)e.Item.FindControl("dgInner")).Items.Count <= 0)
                        ((DataGrid)e.Item.FindControl("dgInner")).Visible = false;
                    oDr.Close();

                    e.Item.Cells[6].Visible = false;
                    oDivClientId = ((HtmlGenericControl)e.Item.FindControl("mydiv")).ClientID;
                    ((ImageButton)e.Item.FindControl("btnExpand")).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='&nbsp;&nbsp;Loading.....';");
                }
            }
            else if (Request["Action"] == "E")
            {
                DeliveryNoteNo = DataBinder.Eval(e.Item.DataItem, "DeliveryNoteNo").ToString();
                DeliveryNoteDtlID = DataBinder.Eval(e.Item.DataItem, "DeliveryNoteDtlID").ToString();
                ((CheckBox)e.Item.FindControl("chk")).Checked = true;

                ArrayList oArr = new ArrayList();
                oArr.Add(DeliveryNoteNo);
                oArr.Add(DeliveryNoteDtlID);
                SqlDataReader oDr = BLL.Transaction.DeliveryNote.FetchData(oArr, "TrnDeliveryNoteGridDtl_Select");
                ((DataGrid)e.Item.FindControl("dgInner")).DataSource = oDr;
                ((DataGrid)e.Item.FindControl("dgInner")).DataBind();
                if (((DataGrid)e.Item.FindControl("dgInner")).Items.Count <= 0)
                    ((DataGrid)e.Item.FindControl("dgInner")).Visible = false;
                oDr.Close();

                e.Item.Cells[6].Visible = true;
                oDivClientId = ((HtmlGenericControl)e.Item.FindControl("mydiv")).ClientID;
                ((ImageButton)e.Item.FindControl("btnExpand")).ImageUrl = "../images/Minus.gif";
                ((ImageButton)e.Item.FindControl("btnExpand")).CommandName = "Expand";


                ((eWorld.UI.NumericBox)e.Item.FindControl("txtDelQty")).ReadOnly = true;
                //((eWorld.UI.NumericBox)((DataGrid)e.Item.FindControl("dgInner")).FindControl("txtLiftQty")).ReadOnly = true;
            }
        }
    }
    #endregion dgGrid_ItemDataBound

    # region PopulateListBox
    private void PopulateListBox(CheckBoxList lstBox, string FieldName, string FieldID, string spName, string sStockPointID)
    {
        SqlDataReader oDr;
        ArrayList objArrVal = new ArrayList();
        objArrVal.Add(sStockPointID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        oDr = BLL.Transaction.StockTransfer.ListBoxData(spName, objArrVal);
        lstBox.Items.Clear();
        while (oDr.Read())
        {
            lstBox.Items.Add(new ListItem((string)(oDr[FieldName]), (string)(oDr[FieldID])));
            //lstBox.Items.Add(new ListItem((string)(oDr[FieldName]) + " -- -- " + (string)(oDr["StockInQty"]), (string)(oDr[FieldID])));

            if (Request["Action"] == "E")
            {
                lstBox.Items.FindByValue((string)(oDr[FieldID])).Selected = true;
            }
        }
        if (!oDr.IsClosed)
        { oDr.Close(); }
    }
    # endregion

    #region ValidateInput()
    private string ValidateInput()
    {
        string sMsg = "";
        if (Convert.ToInt32(ddlStockTransferFrom.Text.Trim()) == -1)
        {
            sMsg = "Please select a Stock Point From";
            return sMsg;
        }

        if(Convert.ToInt32(ddlStockTransferTo.Text.Trim()) == -1)
        {
            sMsg = "Please select a Stock Point To";
            return sMsg;
        }

        return sMsg;

    }
    #endregion ValidateInput()

    #region ExpandedCollapse
    private void ExpandedCollapse(string CommandName, int sRow)
    {
        int i;
        for (i = 0; i <= dgGrid.Items.Count - 1; i++)
        {
            if (i == sRow)
            {
                if (CommandName == "Collapse")
                {
                    dgGrid.Items[i].Cells[6].Visible = true;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Minus.gif";
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Expand";
                    string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='';");
                }
                else if (CommandName == "Expand")
                {
                    dgGrid.Items[i].Cells[6].Visible = false;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Plus.gif";
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Collapse";
                    string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='&nbsp;Loading.....';");
                }
            }
            else
            {
                dgGrid.Items[i].Cells[6].Visible = false;
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Plus.gif";
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Collapse";
                string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='&nbsp;Loading.....';");
            }
        }
    }
    #endregion

    #region AttachScript
    #region info
    //THIS FUNCTION WILL BASICALLY ATTACHED ATTACHED JAVASCRIPT FUNCTION WITH TEXTBOX
    #endregion
    protected void AttachScript()
    {
        int i = 0, j = 0;
        i = dgGrid.Items.Count;
        for (j = 0; j <= dgGrid.Items.Count - 1; j++)
        {
            if (((DataGrid)dgGrid.Items[j].FindControl("dgInner")).Items.Count > 0)
            {
                ((eWorld.UI.NumericBox)dgGrid.Items[j].FindControl("txtDelQty")).Attributes.Add("onblur", "javascript:DistributeQty(" + i + "," + ((DataGrid)dgGrid.Items[j].FindControl("dgInner")).Items.Count + "," + (j + 2) + ");");
                //((eWorld.UI.NumericBox)((DataGrid)dgGrid.Items[j].FindControl("dgInner")).FindControl("txtDelQty")).Attributes.Add("onblur", "javascript:DistributeQty(" + i + "," + ((DataGrid)dgGrid.Items[j].FindControl("dgInner")).Items.Count + "," + (j + 2) + ");");
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
        string sProduct = "", sBalinvQty = "",sUnit= "" ,sDelQty = "", sTrnQty = "";
        string sStockInDtlID = "", sInDocType = "", sInDocNo = "", sDocDate = "", sStockPointID = "", sBalQty = "", sLiftQty = "";
        int i = 0, j = 0;
        DataGrid _dgInner = null;
        DataTable tbl = new DataTable();
        DataTable tblLift = new DataTable();
        tbl.TableName = "DeliveryDetail";
        tblLift.TableName = "LiftDetail";
        DataRow dr = null;
        DataRow drLift = null;
        tbl.Columns.Add("ProductID");
        tbl.Columns.Add("Unit");
        tbl.Columns.Add("BalinvQty");
        tbl.Columns.Add("TrnQty");

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
                sUnit = ((Label)dgGrid.Items[i].FindControl("lbUnit")).Text.Trim();
                sBalinvQty = ((Label)dgGrid.Items[i].FindControl("lblUnit")).Text.Trim();
                sTrnQty = ((eWorld.UI.NumericBox)dgGrid.Items[i].FindControl("txtDelQty")).Text.Trim();

                dr = tbl.NewRow();
                dr["ProductID"] = sProduct;
                dr["Unit"] = sUnit;
                dr["BalinvQty"] = sBalinvQty;
                dr["TrnQty"] = sTrnQty;
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

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sMsg = "";
        sMsg = ValidateInput();

        Utility.ShowMessage(this, sMsg);

        ArrayList objArr = new ArrayList();
        objArr.Add(System.DBNull.Value);
        objArr.Add(txtVATRegDate.Date.ToShortDateString().Trim());
        objArr.Add(ddlStockTransferFrom.SelectedValue.ToString());
        objArr.Add(ddlStockTransferTo.SelectedValue.ToString());
        objArr.Add(txtRemarks.Text.ToString().Trim());
        objArr.Add(BuildXmlForDetail());
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        objArr.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);

        object tmpMsg = BLL.Transaction.StockTransfer.Operate(objArr, Request["Action"].ToString());

        if (tmpMsg.ToString().ToUpper().StartsWith("ERROR"))
        {
            Utility.ShowMessage(this, tmpMsg.ToString());
        }
        else
        {
            Response.Redirect("StockTransferView.aspx?Action=V&ID=" + tmpMsg.ToString());
        }

    }
    #endregion btnSave_Click
}
