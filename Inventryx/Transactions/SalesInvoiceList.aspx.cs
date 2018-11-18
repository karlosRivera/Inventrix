/*
Developer :- Tridip Bhattacharjee
*/
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
using System.Text.RegularExpressions;

public partial class Transactions_SalesInvoiceList : BasePage
{
    #region Global variable declaration
    int iPageSize = Convert.ToInt32(ConfigurationManager.AppSettings["RecordsPerPage"]);
    int PageNumber = 1;
    string spName = "PagingQuery";
    string Tables = "vw_TrnSalesInvList";
    string PK = "InvoiceNo";
    string Fields = "*";
    string Filter = "";
    string Group = "";
    string sSortCol = "InvoiceDate";
    string sSortOrder = "DESC";
    #endregion

    #region Page_Load
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Info
        // HERE WE CHEK IF THE USER NOT LOGIN OR SESSION OUT THEN USER WILL BE REDIRECTED TO THE LOGIN
        // PAGE AND AGAIN USER WILL BE REDIRECTED TO THE PAGE FROM WHERE HE COMES AFTER SUCCESSFULLY
        // LOGIN

        //HERE WE ALSO POPULATE DROPDOWNS FOR DYNAMIC SEARCH
        #endregion

        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("SalesInvoiceList.aspx");
        }

        if (!IsPostBack)
        {
            lblMsg.Visible = false;

            Utility.FillFilterDropDown(this.ddSearchField1, "SearchFieldDesc", "SearchFieldID", "SF", "SalesInvoiceList");
            Utility.FillFilterDropDown(this.ddSearchCondition1, "FilterDesc", "FilterID", "FC", "SalesInvoiceList");
            Utility.FillFilterDropDown(this.ddSearchCondition2, "FilterDesc", "FilterID", "FC", "SalesInvoiceList");
            Utility.FillFilterDropDown(this.ddSearchCondition3, "FilterDesc", "FilterID", "FC", "SalesInvoiceList");
            Utility.FillFilterDropDown(this.ddSearchField2, "SearchFieldDesc", "SearchFieldID", "SF", "SalesInvoiceList");
            Utility.FillFilterDropDown(this.ddSearchField3, "SearchFieldDesc", "SearchFieldID", "SF", "SalesInvoiceList");

            ReadPageState("SalesInvoiceList", out PageNumber, out sSortCol, out sSortOrder);
            if (PageNumber > 1)
            {
                PagerCtrl1.CurrentIndex = PageNumber;
                PagerCtrl2.CurrentIndex = PageNumber;
                BuildSql(PageNumber);
                KillSession("SalesInvoiceList");
            }
            else
            {
                PagerCtrl1.CurrentIndex = 1;
                PagerCtrl2.CurrentIndex = 1;
                BuildSql(0);
            }
        }
    }
    #endregion

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
            cFilter = " CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "' and FinYearID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear + "'";
        }
        else
        {
            cFilter = cFilter + " And CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "' and FinYearID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).FinYear + "'";
        }

        DataSet ds = BLL.Master.StockPoint.BindGrid(spName, new object[] { Tables, PK, sSortCol, PageNumber, iPageSize, Fields, cFilter, Group, sSortOrder });
        int i = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

        PagerCtrl1.PageSize = iPageSize;
        PagerCtrl1.CompactedPageCount = iPageSize;
        PagerCtrl2.PageSize = iPageSize;
        PagerCtrl2.CompactedPageCount = iPageSize;

        PagerCtrl1.ItemCount = i;
        PagerCtrl2.ItemCount = i;

        dgList.DataSource = ds.Tables[1];
        dgList.DataBind();

        if (dgList.Items.Count > 0)
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

    #region dgList_ItemCreated
    protected void dgList_ItemCreated(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
    {
        #region INFO
        //HERE WE ARE SETTING STYLE FOR MOUSE OVER.
        #endregion

        if (e.Item.ItemType == ListItemType.Item)
        {
            e.Item.Attributes.Add("onmouseover", "this.style.cursor='hand';this.style.backgroundColor='" + ConfigurationManager.AppSettings["Item_onmouseover"] + "'");
            e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor='" + ConfigurationManager.AppSettings["Item_onmouseout"] + "'");
        }
        else if (e.Item.ItemType == ListItemType.AlternatingItem)
        {
            e.Item.Attributes.Add("onmouseover", "this.style.cursor='hand';this.style.backgroundColor='" + ConfigurationManager.AppSettings["AlternateItem_onmouseover"] + "'");
            e.Item.Attributes.Add("onmouseout", "this.style.backgroundColor='" + ConfigurationManager.AppSettings["AlternateItem_onmouseout"] + "'");
        }
    }
    #endregion

    #region dgList_SortCommand
    protected void dgList_SortCommand(object source, System.Web.UI.WebControls.DataGridSortCommandEventArgs e)
    {
        #region INFO
        //HERE WE ARE CODING DATAGRID SORTING RELATED STATEMENT
        #endregion

        string tmpCOL = (ViewState["COL"] == null ? "" : ViewState["COL"].ToString());
        string tmpORDER = (ViewState["ORDER"] == null ? "" : ViewState["ORDER"].ToString());

        if (tmpCOL == e.SortExpression)
        {
            if (tmpORDER == "ASC")
            {
                ViewState["ORDER"] = "DESC";
            }
            else
            {
                ViewState["ORDER"] = "ASC";
            }
        }
        else
        {
            ViewState["COL"] = e.SortExpression;
            ViewState["ORDER"] = "ASC";
        }
        sSortCol = ViewState["COL"].ToString();
        sSortOrder = ViewState["ORDER"].ToString();
        Utility.HandleSorting(dgList, sSortCol, sSortOrder);
        BuildSql(PagerCtrl1.CurrentIndex);
    }
    #endregion

    #region dgList_ItemCommand
    protected void dgList_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE THE CLICK EVENT FOR EDIT AND DELETE BUTTON 
        #endregion
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (e.CommandName == "Del")
            {
                string sGotoUrl;
                StorePageState("SalesInvoiceList", PagerCtrl1.CurrentIndex, sSortCol, sSortOrder);
                sGotoUrl = "SalesInvoiceCancel.aspx?Action=C&ID=" + ((Label)e.Item.FindControl("lblInvoiceNo")).Text.Trim();
                Response.Redirect(sGotoUrl);
            }
            //else if (e.CommandName == "Edit")
            //{
            //    string sGotoUrl;
            //    StorePageState("SalesInvoiceList", PagerCtrl1.CurrentIndex, sSortCol, sSortOrder);
            //    sGotoUrl = "SalesInvoice.aspx?Action=E&ID=" + ((Label)e.Item.FindControl("lblDVNNo")).Text.Trim();
            //    Response.Redirect(sGotoUrl);
            //}
            else if (e.CommandName == "View")
            {
                string sGotoUrl;
                StorePageState("SalesInvoiceList", PagerCtrl1.CurrentIndex, sSortCol, sSortOrder);
                sGotoUrl = "SalesInvoiceView.aspx?Action=V&ID=" + ((Label)e.Item.FindControl("lblInvoiceNo")).Text.Trim();
                Response.Redirect(sGotoUrl);
            }

        }
    }
    #endregion

    #region PagerCtrl1_Command
    protected void PagerCtrl1_Command(object sender, CommandEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE CLICK EVENT FOR PAGER BUTTON
        #endregion

        int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
        PagerCtrl1.CurrentIndex = currnetPageIndx;
        PagerCtrl2.CurrentIndex = currnetPageIndx;
        BuildSql(currnetPageIndx);

    }
    #endregion

    #region PagerCtrl2_Command
    protected void PagerCtrl2_Command(object sender, CommandEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE CLICK EVENT FOR PAGER BUTTON
        #endregion

        int currnetPageIndx = Convert.ToInt32(e.CommandArgument);
        PagerCtrl1.CurrentIndex = currnetPageIndx;
        PagerCtrl2.CurrentIndex = currnetPageIndx;
        BuildSql(currnetPageIndx);
    }
    #endregion

    #region dgList_ItemDataBound
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE SUPPLIER ID AND DEPARTMENT ID AND ACCORDINGLY WE FETCH SUPPLIER AND DEPARTMENT
        //NAME AND DISPLAY THOSE NAME IN A LABLE OF THE GRID
        #endregion
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {

            if ((string)(DataBinder.Eval(e.Item.DataItem, "status")) == "CAN")
            {
                ((ImageButton)e.Item.FindControl("btnDel")).Attributes.Add("onclick", "javascript:alert('This sales invoice is already Canceled');return false;");
            }
            else
            {
                ((ImageButton)e.Item.FindControl("btnDel")).Attributes.Add("onclick", "javascript:return confirm('Are you sure that you want to cancel this this sales invoice')");
            }
        }
    }
    #endregion

    #region btnFilter_Click
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        #region INFO
        //HERE WE CHECK ALL THE CHECKBOXES ARE CHECKED OR NOT FOR DYNAMIC SEARCH
        //IF NO CHECK BOXES ARE CHECKED THEN WE SHOW APPROPRIATE MESSAGE TO THE USER
        #endregion

        int iPageNo = 0;
        bool bFlag = false;

        if (this.chkSearch1.Checked == true)
        {
            bFlag = true;
        }
        if (this.chkSearch2.Checked == true)
        {
            bFlag = true;
        }
        if (this.chkSearch3.Checked == true)
        {
            bFlag = true;
        }

        if (!bFlag)
        {
            Utility.ShowMessage(this, "Please select any search check box");
        }
        BuildSql(0);
    }
    #endregion

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
            LVSerachValues.Add(this.ddSearchField1.SelectedValue);
            LVSerachValues.Add(this.ddSearchCondition1.SelectedValue);
            LVSerachValues.Add(this.txtCriteriaType1.Text.Trim());
            LVSerachValues.Add(this.chkMC1.Checked);
            bFlag = true;
        }
        if (this.chkSearch2.Checked == true)
        {
            LVSerachValues.Add(this.ddSearchField2.SelectedValue);
            LVSerachValues.Add(this.ddSearchCondition2.SelectedValue);
            LVSerachValues.Add(this.txtCriteriaType2.Text.Trim());
            LVSerachValues.Add(this.chkMC2.Checked);
            bFlag = true;
        }
        if (this.chkSearch3.Checked == true)
        {
            LVSerachValues.Add(this.ddSearchField3.SelectedValue);
            LVSerachValues.Add(this.ddSearchCondition3.SelectedValue);
            LVSerachValues.Add(this.txtCriteriaType3.Text.Trim());
            LVSerachValues.Add(this.chkMC3.Checked);
            bFlag = true;
        }

        if (bFlag)
        {
            sWhereClause = Utility.GenerateWhereClause(LVColumns, LVSerachValues);
            Filter = sWhereClause.Replace("Where", string.Empty);

        }
    }

    #region btnClearFilter_Click
    protected void btnClearFilter_Click(object sender, EventArgs e)
    {
        #region btnClearFilter_Click
        //THIS CALL A FUNCTION WHICH WILL CLEAR ALL CONTROL PLACED IN FILTER PANEL
        #endregion btnClearFilter_Click
        Panel oPanel = Utility.FindControlRecursive(this.Master, "pnlFilter") as Panel;
        if (oPanel != null)
        {
            ClearFilterControls(oPanel);
        }
        BuildSql(0);
    }
    #endregion btnClearFilter_Click

}
