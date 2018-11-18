//Developed By Tridip
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


public partial class DeliveryNote : BasePage 
{
    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("DeliveryNote.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            Utility.PopulateCombo(BLL.Transaction.DeliveryNote.GetComboData("TrnProformaInvNo_Select", ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID, ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear), ddlProformaInvNo, "ProformaInvNo", "", "ProformaInvNo", "");

            if (Request["Action"] == "A")
            {
                lblTitle.Text = "Add New Delivery Note";
                ddlProformaInvNo.Enabled = true;
            }
            else if (Request["Action"] == "E")
            {
                LoadData(Request["ID"]);
                txtDVN.Text = Request["ID"];
                lblTitle.Text = "Modify Delivery Note";
                txtDVNDate.Enabled = false;
                ddlProformaInvNo.Enabled = false;
                txtCustomer.Enabled = false;
                AttachScript();
            }
        }
    }
    #endregion

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
                    txtDVNDate.Date = Convert.ToDateTime(oSqlDataReader["DeliveryNoteDate"].ToString());
                }

                if (oSqlDataReader["ProformaInvNo"] != DBNull.Value)
                {
                    ddlProformaInvNo.SelectedIndex = -1;
                    ddlProformaInvNo.Items.FindByValue(oSqlDataReader["ProformaInvNo"].ToString()).Selected = true;
                }

                if (oSqlDataReader["CustomerName"] != DBNull.Value)
                {
                   txtCustomer.Text= oSqlDataReader["CustomerName"].ToString();
                }

                if (oSqlDataReader["ShippingAddress"] != DBNull.Value)
                {
                    txtShippingAddress.Text = oSqlDataReader["ShippingAddress"].ToString();
                }

                if (oSqlDataReader["DespatchMode"] != DBNull.Value && oSqlDataReader["DespatchMode"].ToString().Trim()!="")
                {
                    ddlModeofDespatch.SelectedIndex = -1;
                    ddlModeofDespatch.Items.FindByValue(oSqlDataReader["DespatchMode"].ToString().Trim()).Selected = true ;
                }

                if (oSqlDataReader["ShippingCity"] != DBNull.Value)
                {
                    txtShippingCity.Text = oSqlDataReader["ShippingCity"].ToString();
                }

                if (oSqlDataReader["ShippingPin"] != DBNull.Value)
                {
                    txtShippingPin.Text = oSqlDataReader["ShippingPin"].ToString();
                }

                if (oSqlDataReader["DeliveredBy"] != DBNull.Value)
                {
                    txtDeliveredBy.Text = oSqlDataReader["DeliveredBy"].ToString();
                }

                if (oSqlDataReader["VehicleNo"] != DBNull.Value)
                {
                    txtVehicleNo.Text = oSqlDataReader["VehicleNo"].ToString();
                }

                if (oSqlDataReader["Remarks"] != DBNull.Value)
                {
                    txtRemarks.Text = oSqlDataReader["Remarks"].ToString();
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

                    e.Item.Cells[7].Visible = false;
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

                e.Item.Cells[7].Visible = true;
                oDivClientId = ((HtmlGenericControl)e.Item.FindControl("mydiv")).ClientID;
                ((ImageButton)e.Item.FindControl("btnExpand")).ImageUrl = "../images/Minus.gif";
                ((ImageButton)e.Item.FindControl("btnExpand")).CommandName = "Expand";
                

                ((eWorld.UI.NumericBox)e.Item.FindControl("txtDelQty")).ReadOnly = true;
                //((eWorld.UI.NumericBox)((DataGrid)e.Item.FindControl("dgInner")).FindControl("txtLiftQty")).ReadOnly = true;
            }
        }
    }
    #endregion

    #region ddlProformaInvNo_SelectedIndexChanged
    #region Info
    //WHENEVER USER SELECT PROFORMA INVOICE NO THEN DETAIL WILL BE POPULATED
    #endregion
    protected void ddlProformaInvNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Request["Action"] == "A")
        {
            if (ddlProformaInvNo.SelectedIndex > 0)
            {
                ArrayList oArr = new ArrayList();
                oArr.Add(ddlProformaInvNo.SelectedValue);
                SqlDataReader oDr = BLL.Transaction.DeliveryNote.FetchData(oArr, "TrnDeliveryNoteDtl_Select");
                if (oDr.HasRows)
                {
                    while (oDr.Read())
                    {
                        if (oDr["CustomerName"] != DBNull.Value)
                        {
                            txtCustomer.Text = oDr["CustomerName"].ToString();
                        }

                        if (oDr["ShippingAddress"] != DBNull.Value)
                        {
                            txtShippingAddress.Text = oDr["ShippingAddress"].ToString();
                        }

                        if (oDr["ShippingCity"] != DBNull.Value)
                        {
                            txtShippingCity.Text = oDr["ShippingCity"].ToString();
                        }

                        if (oDr["ShippingPin"] != DBNull.Value)
                        {
                            txtShippingPin.Text = oDr["ShippingPin"].ToString();
                        }

                    }

                    oDr.NextResult();

                    dgGrid.DataSource = oDr;
                    dgGrid.DataBind();
                    AttachScript();
                }
                oDr.Close();
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
                ((eWorld.UI.NumericBox)dgGrid.Items[j].FindControl("txtDelQty")).Attributes.Add("onblur", "javascript:DistributeQty(" + i + "," + ((DataGrid)dgGrid.Items[j].FindControl("dgInner")).Items.Count + ","+(j+2)+");");
                //((eWorld.UI.NumericBox)((DataGrid)dgGrid.Items[j].FindControl("dgInner")).FindControl("txtLiftQty")).Attributes.Add("onblur", "javascript:DistributeQty(" + i + "," + ((DataGrid)dgGrid.Items[j].FindControl("dgInner")).Items.Count + "," + (j + 2) + ");");
            }
        }
    }
    #endregion

   

    #region dgGrid_ItemCommand
    protected void dgGrid_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        ExpandedCollapse(e.CommandName, e.Item.ItemIndex);
    }
    #endregion

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
                    dgGrid.Items[i].Cells[7].Visible = true;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Minus.gif";
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Expand";
                    string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='';");
                }
                else if (CommandName == "Expand")
                {
                    dgGrid.Items[i].Cells[7].Visible = false;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Plus.gif";
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Collapse";
                    string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                    ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='&nbsp;Loading.....';");
                }
            }
            else
            {
                dgGrid.Items[i].Cells[7].Visible = false;
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).ImageUrl = "../images/Plus.gif";
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).CommandName = "Collapse";
                string oDivClientId = ((HtmlGenericControl)(dgGrid.Items[i].FindControl("mydiv"))).ClientID;
                ((ImageButton)(dgGrid.Items[i].FindControl("btnExpand"))).Attributes.Add("onclick", "javascript:document.getElementById('" + oDivClientId + "').innerHTML='&nbsp;Loading.....';");
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
        string sProduct="",sRate="",sBalinvQty="",sDelQty="",sStockInDtlID="";
        string sInDocType="",sInDocNo="",sDocDate="",sStockPointID="",sBalQty="",sLiftQty="";
        int i=0,j=0;
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

    #region btnSave_Click
    protected void btnSave_Click(object sender, EventArgs e)
    {
        #region INFO
        // THIS FUNCTION WILL ACTUALLY INSERT DATA AND UPDATE DATA IN THE TABLE THROUGH STORE PROCEDURE
        #endregion

        if (Request["Action"] == "A" || Request["Action"] == "E")
        {
            string sMsg;
            sMsg = ValidateInput();
            if (sMsg == "")
            {
                ArrayList objArr = new ArrayList();
                if (Request["Action"] == "A")
                {
                    objArr.Add("");
                    objArr.Add(txtDVNDate.Date.ToShortDateString().Trim());
                    objArr.Add(ddlProformaInvNo.SelectedValue);
                    objArr.Add(txtShippingAddress.Text.Trim());
                    objArr.Add(ddlModeofDespatch.SelectedValue);
                    objArr.Add(txtShippingCity.Text.Trim());
                    objArr.Add(txtShippingPin.Text.Trim());
                    objArr.Add(txtDeliveredBy.Text.Trim());
                    objArr.Add(txtVehicleNo.Text.Trim());
                    objArr.Add(txtRemarks.Text.Trim());
                    objArr.Add(BuildXmlForDetail());
                }
                else
                {
                    objArr.Add(txtDVN.Text);
                    objArr.Add(txtShippingAddress.Text.Trim());
                    objArr.Add(txtShippingCity.Text.Trim());
                    objArr.Add(txtShippingPin.Text.Trim());
                    objArr.Add(ddlModeofDespatch.SelectedValue);
                    objArr.Add(txtDeliveredBy.Text.Trim());
                    objArr.Add(txtVehicleNo.Text.Trim());
                    objArr.Add(txtRemarks.Text.Trim());
                }


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
                    Response.Redirect("DeliveryNoteView.aspx?Action=V&ID=" + tmpMsg.ToString());
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
        if (ddlProformaInvNo.SelectedIndex <=0)
        {
            sMsg = "Please select proforma invoice no";
            return sMsg;
        }

        if (txtCustomer.Text == "")
        {
            sMsg = "Please enter customer name";
            return sMsg;
        }

        if (txtShippingAddress.Text == "")
        {
            sMsg = "Please enter shipping address";
            return sMsg;
        }

        if (ddlModeofDespatch.SelectedIndex<=0)
        {
            sMsg = "Please select mode of despatch";
            return sMsg;
        }

        bool flag = true, chkFlag = false;
        bool bLiftDetail = false;
        DataGrid _dgInner = null;
        decimal pQty = 0, cQty = 0;
        if (Request["Action"] == "A")
        {
            for (i = 0; i <= dgGrid.Items.Count - 1; i++)
            {
                if (((CheckBox)dgGrid.Items[i].FindControl("chk")).Checked)
                {
                    chkFlag = true;
                    if (Convert.ToDecimal(((eWorld.UI.NumericBox)dgGrid.Items[i].FindControl("txtDelQty")).Text.Trim()) <= 0)
                    {
                        sMsg = "[Error in row : " + (i + 1) + "] Delivery qty can't be 0";
                        flag = false;
                        return sMsg;
                    }

                    if (Convert.ToDecimal(((eWorld.UI.NumericBox)dgGrid.Items[i].FindControl("txtDelQty")).Text) > Convert.ToDecimal(((Label)dgGrid.Items[i].FindControl("lblBalinvQty")).Text))
                    {
                        sMsg = "[Error in row : " + (i + 1) + "] Delivery qty can't be more than P.Inv.Qty";
                        flag = false;
                        return sMsg;
                    }
                    pQty = Convert.ToDecimal(((eWorld.UI.NumericBox)dgGrid.Items[i].FindControl("txtDelQty")).Text.Trim());
                    cQty = 0;
                    bLiftDetail = false;

                    _dgInner = ((DataGrid)dgGrid.Items[i].FindControl("dgInner"));
                    for (int j = 0; j <= _dgInner.Items.Count - 1; j++)
                    {
                        /*
                        if (Convert.ToDecimal(((Label)_dgInner.Items[j].FindControl("lblBalQty")).Text) > 0)
                        {
                            if (Convert.ToDecimal(((eWorld.UI.NumericBox)_dgInner.Items[j].FindControl("txtLiftQty")).Text) <= 0)
                            {
                                sMsg = "[Error in row : " + (j + 1) + "] Lift qty can't be 0";
                                return sMsg;
                            }
                        }*/
                        if (Convert.ToDecimal(((eWorld.UI.NumericBox)_dgInner.Items[j].FindControl("txtLiftQty")).Text) > Convert.ToDecimal(((Label)_dgInner.Items[j].FindControl("lblBalQty")).Text))
                        {
                            sMsg = "[Error in row : " + (j + 1) + "] Lift qty can't be more than Balance Qty";
                            return sMsg;
                        }

                        cQty = cQty + Convert.ToDecimal(((eWorld.UI.NumericBox)_dgInner.Items[j].FindControl("txtLiftQty")).Text);
                        bLiftDetail = true;
                    }

                    if (!bLiftDetail)
                    {
                        sMsg = "[Error in row : " + (i + 1) + "] Sufficient stock not available for this product";
                        flag = false;
                        return sMsg;
                    }

                    if (pQty != cQty)
                    {
                        sMsg = "[Error in row : " + (i + 1) + "] Lift qty and delivery qty should be equal";
                        flag = false;
                        return sMsg;
                    }
                }
            }

            if (!chkFlag)
            {
                sMsg = "No Rows are checked...";
            }
        }
        return sMsg;
    }
    #endregion
}
