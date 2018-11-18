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

public partial class Masters_Manufacturer : BasePage
{

    #region Global variable declaration
    int iPageSize = Convert.ToInt32(ConfigurationManager.AppSettings["RecordsPerPage"]);
    int PageNumber = 1;
    string spName = "PagingQuery";
    string Tables = "mstManufacturer";
    string PK = "ManufacturerID";
    string Fields = "ManufacturerID,ManufacturerName";
    string Filter = "";
    string Group = "";
    string sSortCol = "ManufacturerID";
    string sSortOrder = "ASC";
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("Masters/Manufacturer.aspx");
        }

        if (!IsPostBack)
        {
            lblMsg.Visible = false;
            Utility.FillFilterDropDown(this.ddSearchField1, "SearchFieldDesc", "SearchFieldID", "SF", "Manufacturer");
            Utility.FillFilterDropDown(this.ddSearchCondition1, "FilterDesc", "FilterID", "FC", "Manufacturer");
            Utility.FillFilterDropDown(this.ddSearchCondition2, "FilterDesc", "FilterID", "FC", "Manufacturer");
            Utility.FillFilterDropDown(this.ddSearchCondition3, "FilterDesc", "FilterID", "FC", "Manufacturer");
            Utility.FillFilterDropDown(this.ddSearchField2, "SearchFieldDesc", "SearchFieldID", "SF", "Manufacturer");
            Utility.FillFilterDropDown(this.ddSearchField3, "SearchFieldDesc", "SearchFieldID", "SF", "Manufacturer");

            ReadPageState("Manufacturer", out PageNumber, out sSortCol, out sSortOrder);

            if (PageNumber > 1)
            {
                PagerCtrl1.CurrentIndex = PageNumber;
                PagerCtrl2.CurrentIndex = PageNumber;
                BuildSql(PageNumber);
                KillSession("Manufacturer");
            }
            else
            {
                PagerCtrl1.CurrentIndex = 1;
                PagerCtrl2.CurrentIndex = 1;
                BuildSql(0);
            }
        }
    }

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
            cFilter = " CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "'";
        }
        else
        {
            cFilter = cFilter + " And CompanyID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).CompanyID + "' and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "'";
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


    protected void btnFilter_Click(object sender, EventArgs e)
    {
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
    protected void btnClearFilter_Click(object sender, EventArgs e)
    {

    }
    protected void dgList_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE THE CLICK EVENT FOR EDIT AND DELETE BUTTON 
        #endregion
        if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (e.CommandName == "Del")
            {
                object tmpMsg = BLL.Master.Manufacturer.Delete(((Label)e.Item.FindControl("lblManufacturerID")).Text.Trim(), "D");
                Utility.ShowMessage(this, (string)tmpMsg);
                int cPageNo;
                int RecNo = e.Item.ItemIndex;
                if (int.Parse(PagerCtrl1.CurrentIndex.ToString()) == 1)
                {
                    PageNumber = 1;
                    BuildSql(0);
                }
                else
                {
                    if (RecNo > 0)
                    {
                        PageNumber = Convert.ToInt32(PagerCtrl1.CurrentIndex);
                        BuildSql(PageNumber);
                    }
                    else if (RecNo == 0)
                    {
                        cPageNo = Convert.ToInt32(PagerCtrl1.CurrentIndex.ToString());
                        cPageNo = cPageNo - 1;
                        PageNumber = cPageNo;
                        BuildSql(cPageNo);
                    }
                }
            }
            else if (e.CommandName == "Edit")
            {
                string sGotoUrl;
                StorePageState("Manufacturer", PagerCtrl1.CurrentIndex, sSortCol, sSortOrder);
                sGotoUrl = "ManufacturerMaster.aspx?Action=E&ID=" + ((Label)e.Item.FindControl("lblManufacturerID")).Text.Trim();
                Response.Redirect(sGotoUrl);
            }
            else if (e.CommandName == "View")
            {
                string sGotoUrl;
                StorePageState("Manufacturer", PagerCtrl1.CurrentIndex, sSortCol, sSortOrder);
                sGotoUrl = "ManufacturerView.aspx?Action=V&ID=" + ((Label)e.Item.FindControl("lblManufacturerID")).Text.Trim();
                Response.Redirect(sGotoUrl);
            }
        }
    }
    protected void dgList_ItemCreated(object sender, DataGridItemEventArgs e)
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
    protected void dgList_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        #region INFO
        //HERE WE CAPTURE CLICK EVENT FOR PAGER BUTTON
        #endregion

        //if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        //{
        //    if (DataBinder.Eval(e.Item.DataItem, "StockPointType").ToString() == "W")
        //    {
        //        ((Label)e.Item.FindControl("lblStockPointType")).Text = "Ware House";
        //    }
        //    else if (DataBinder.Eval(e.Item.DataItem, "StockPointType").ToString() == "V")
        //    {
        //        ((Label)e.Item.FindControl("lblStockPointType")).Text = "Van";
        //    }
        //}
    }
    protected void dgList_SortCommand(object source, DataGridSortCommandEventArgs e)
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
    protected void PagerCtrl1_Command(object sender, CommandEventArgs e)
    {

    }
    protected void PagerCtrl2_Command(object sender, CommandEventArgs e)
    {

    }

    #region SetFilter
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
    #endregion
}
