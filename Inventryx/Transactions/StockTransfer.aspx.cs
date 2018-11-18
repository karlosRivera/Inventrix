using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Masters_StockTransfer : BasePage
{
    #region Global variable declaration
    int iPageSize = Convert.ToInt32(ConfigurationManager.AppSettings["RecordsPerPage"]);
    int PageNumber = 1;
    string spName = "PagingQuery";
    string Tables = "vw_TrnStockTransferList";
    string PK =     "StockTransferNo";
    string Fields = "StockTransferNo,StockTransferDate,StockPointFrom,StockPointTo";
    string Filter = "";
    string Group = "";
    string sSortCol = "StockTransferNo";
    string sSortOrder = "ASC";
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("StockTransfer.aspx");
        }

        if (!IsPostBack)
        {
            lblMsg.Visible = false;

            Utility.FillFilterDropDown(this.ddSearchField1, "SearchFieldDesc", "SearchFieldID", "SF", "Customer");
            Utility.FillFilterDropDown(this.ddSearchCondition1, "FilterDesc", "FilterID", "FC", "Customer");
            Utility.FillFilterDropDown(this.ddSearchCondition2, "FilterDesc", "FilterID", "FC", "Customer");
            Utility.FillFilterDropDown(this.ddSearchCondition3, "FilterDesc", "FilterID", "FC", "Customer");
            Utility.FillFilterDropDown(this.ddSearchField2, "SearchFieldDesc", "SearchFieldID", "SF", "Customer");
            Utility.FillFilterDropDown(this.ddSearchField3, "SearchFieldDesc", "SearchFieldID", "SF", "Customer");

            PagerCtrl1.CurrentIndex = 1;
            PagerCtrl2.CurrentIndex = 1;
            BuildSql(0);
        }
    }
    #endregion Page_Load

    #region BuildSql
    private void BuildSql(int PageNo)
    {
        #region INFO
        //THIS FUNCTION WILL CALL A FUNCTION WHICH RETURN DATA AND THE RESULTSET WILL BE BIND WITH
        //DATA GRID
        #endregion

        string cFilter = "";
        SetFilter();
        cFilter = Filter;
        if (PageNo > 0)
        {
            PageNumber = PageNo;
        }
        else
        {
            PagerCtrl1.CurrentIndex = PageNumber;
            PagerCtrl2.CurrentIndex = PageNumber;
        }

        if (cFilter.Trim() == "")
        {
            cFilter = " CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID + "'";
        }
        else
        {
            cFilter = cFilter + " And CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).HOBranchID + "'";
        }

        DataSet ds = BLL.Transaction.StockTransfer.BindGrid(spName, new object[] { Tables, PK, sSortCol, PageNumber, iPageSize, Fields, cFilter, Group, sSortOrder });
        int i = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

        PagerCtrl1.PageSize = iPageSize;
        PagerCtrl1.CompactedPageCount = iPageSize;
        PagerCtrl2.PageSize = iPageSize;
        PagerCtrl2.CompactedPageCount = iPageSize;

        PagerCtrl1.ItemCount = i;
        PagerCtrl2.ItemCount = i;

        this.dgList.DataSource = ds.Tables[1];
        this.dgList.DataBind();

        if (this.dgList.Items.Count > 0)
        {
            lblMsg.Text = "";
            lblMsg.Visible = false;
        }
        else
        {
            lblMsg.Text = "No Records Exist...";
            lblMsg.Visible = true;
        }
    }
    #endregion

    #region btnFilter_Click
    protected void btnFilter_Click(object sender, EventArgs e)
    {

    }
    #endregion btnFilter_Click

    #region btnClearFilter_Click
    protected void btnClearFilter_Click(object sender, EventArgs e)
    {

    }
    #endregion btnClearFilter_Click

    #region dgList_ItemCommand
    protected void dgList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (e.CommandName == "View")
            {
                string sStockTransferNo = ((Label)e.Item.FindControl("lblStockTransferID")).Text.ToString().Trim();
                Response.Redirect("StockTransferView.aspx?Action=V&ID=" + sStockTransferNo);
            }

            if (e.CommandName == "Del")
            {
                string sGotoUrl = "";
                sGotoUrl = "StockTransferView.aspx?Action=C&ID=" + ((Label)e.Item.FindControl("lblStockTransferID")).Text.ToString().Trim();
                Response.Redirect(sGotoUrl);
            }
        }
    }
    #endregion dgList_ItemCommand

    #region dgList_ItemCreated
    protected void dgList_ItemCreated(object sender, DataGridItemEventArgs e)
    {

    }
    #endregion dgList_ItemCreated

    #region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //if ((string)(DataBinder.Eval(e.Item.DataItem, "status")) == "CAN")
            //{
            //    ((ImageButton)e.Item.FindControl("btnEdit")).Attributes.Add("onclick", "javascript:alert('Sorry Delivery note can not be modified');return false;");
            //    ((ImageButton)e.Item.FindControl("btnDel")).Attributes.Add("onclick", "javascript:alert('This Delivery note is already Canceled');return false;");
            //}
            //else
            //{
                ((ImageButton)e.Item.FindControl("btnDel")).Attributes.Add("onclick", "javascript:return confirm('Are you sure that you want to cancel this Stock Transfer')");
            //}
        }
    }
    #endregion dgList_ItemDataBound

    #region dgList_SortCommand
    protected void dgList_SortCommand(object source, DataGridSortCommandEventArgs e)
    {

    }
    #endregion dgList_SortCommand

    #region PagerCtrl1_Command
    protected void PagerCtrl1_Command(object sender, CommandEventArgs e)
    {

    }
    #endregion PagerCtrl1_Command

    #region PagerCtrl2_Command
    protected void PagerCtrl2_Command(object sender, CommandEventArgs e)
    {

    }
    #endregion PagerCtrl2_Command

    # region SetFilter
    private void SetFilter()
    {
        #region INFO
        //HERE WE GENERATE WHERE CLAUSE FOR FILTER AND ACCORDING TO THAT WE FETCH DATA AND FILL DATAGRID
        #endregion

        bool bFlag = false;
        string sWhereClause = "";
        ArrayList LVColumns = new ArrayList();
        ArrayList LVSerachValues = new ArrayList();

        LVSerachValues.Clear();
        LVColumns.Clear();

        LVColumns.Insert(0, "SearchField");
        LVColumns.Insert(1, "FilterCondition");
        LVColumns.Insert(2, "ConditionData");
        LVColumns.Insert(3, "MatchCase");

        if (this.chkSearch1.Checked == true)
        {
            LVSerachValues.Insert(0, this.ddSearchField1.SelectedValue);
            LVSerachValues.Insert(1, this.ddSearchCondition1.SelectedValue);
            LVSerachValues.Insert(2, this.txtCriteriaType1.Text.Trim());
            LVSerachValues.Insert(3, this.chkMC1.Checked);
            bFlag = true;
        }
        if (this.chkSearch2.Checked == true)
        {
            LVSerachValues.Insert(4, this.ddSearchField2.SelectedValue);
            LVSerachValues.Insert(5, this.ddSearchCondition2.SelectedValue);
            LVSerachValues.Insert(6, this.txtCriteriaType2.Text.Trim());
            LVSerachValues.Insert(7, this.chkMC2.Checked);
            bFlag = true;
        }
        if (this.chkSearch3.Checked == true)
        {
            LVSerachValues.Insert(8, this.ddSearchField3.SelectedValue);
            LVSerachValues.Insert(9, this.ddSearchCondition3.SelectedValue);
            LVSerachValues.Insert(10, this.txtCriteriaType3.Text.Trim());
            LVSerachValues.Insert(11, this.chkMC3.Checked);
            bFlag = true;
        }

        if (bFlag)
        {
            sWhereClause = Utility.GenerateWhereClause(LVColumns, LVSerachValues);
            Filter = sWhereClause.Replace("Where", string.Empty);

        }
    }
    # endregion
}
