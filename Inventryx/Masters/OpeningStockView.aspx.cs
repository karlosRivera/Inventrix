

# region DEVELOPED By
    // Indranil Roy
# endregion

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

public partial class Masters_OpeningStockView : BasePage
{

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (!Utility.IsUserLoggedIn())
            {
                Utility.RedirectToLoginPage("OpeningStockView.aspx");
            }
            else
            {
                CheckQString();
            }
            if (!IsPostBack)
            {
                string OpeningStockID = "";
                if (Request["Action"] == "V")
                {
                    if (Request["ID"] != null && Request["ID"] != "")
                    {
                        OpeningStockID = Request["ID"];
                        LoadData(OpeningStockID);
                    }
                }
            }
        }
    }
    # endregion

    # region LoadData

    private void LoadData(string OpeningStockID)
    {

        ArrayList ObjArrVal=new ArrayList();
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).UserID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID);
        ObjArrVal.Add(((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear);
        ObjArrVal.Add("V");
        SqlDataReader oDr = BLL.Master.OpeningStock.GetDataForViewPage(ObjArrVal);

        while (oDr.Read())
        {
            if (oDr["OpeningStockID"] != DBNull.Value)
            {
                this.lblOpeningStockD.Text = oDr["OpeningStockID"].ToString();
            }

            if (oDr["GRNNo"] != DBNull.Value)
            {
                this.lblGRNNo.Text = oDr["GRNNo"].ToString();
            }

            if (oDr["GRNDate"] != DBNull.Value)
            {
                this.lblGRNDate.Text = oDr["GRNDate"].ToString();
            }

            if (oDr["EffectiveDate"] != DBNull.Value)
            {
                this.lblEffectiveDate.Text = oDr["EffectiveDate"].ToString();
            }

            if (oDr["ProductName"] != DBNull.Value)
            {
                this.lblProduct.Text = oDr["ProductName"].ToString();
            }
            if (oDr["StockPointName"] != DBNull.Value)
            {
                this.lblStockPoint.Text = oDr["StockPointName"].ToString();
            }

            if (oDr["OpeningQty"] != DBNull.Value)
            {
                this.lblOpeningQty.Text = oDr["OpeningQty"].ToString();
            }

        }
        oDr.Close();
    }
    # endregion

}
