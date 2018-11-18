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

public partial class Transactions_DeliveryNoteView : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("DeliveryNoteView.aspx");
        }
        CheckQString();

        if (!IsPostBack)
        {
            if (Request["Action"] == "V")
            {
                lblTitle.Text = "View Delivery Note";
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
        oSqlDataReader = BLL.Transaction.StockTransfer.FetchData(objArr, "TrnDeliveryNoteGrid_Select");

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
                    lblProformaInvNo.Text= oSqlDataReader["ProformaInvNo"].ToString();
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
                    lblDespatchMode.Text= oSqlDataReader["DespatchMode"].ToString();
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

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Redirect("../ViewReport.aspx?ModID=" + GetModuleID() + "&Tag=1&ID=" + lblDVNNo.Text.Trim());
    }
}
