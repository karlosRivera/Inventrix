
# region DEVELOPED BY
//this Master is developed By Indranil Roy
# endregion

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Branch : BasePage
{

    #region Global variable declaration
    int iPageSize = Convert.ToInt32(ConfigurationManager.AppSettings["RecordsPerPage"]);
    int PageNumber = 1;
    string spName = "PagingQuery";
    string Tables = "vw_MstBranch";
    string PK = "BranchID";
    string Fields = "BranchID,BranchName,CompanyName,Addr,PhoneNo,FaxNo,Email,ContactPerson,HOTag";
    string Filter = "";
    string Group = "";
    string sSortCol = "BranchID";
    string sSortOrder = "ASC";
    #endregion

    # region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.IsUserLoggedIn())
        {
            Utility.RedirectToLoginPage("Branch.aspx");
        }

        if (!IsPostBack)
        {
            lblMsg.Visible = false;

            Utility.FillFilterDropDown(this.ddSearchField1, "SearchFieldDesc", "SearchFieldID", "SF", "Branch");
            Utility.FillFilterDropDown(this.ddSearchCondition1, "FilterDesc", "FilterID", "FC", "Branch");
            Utility.FillFilterDropDown(this.ddSearchCondition2, "FilterDesc", "FilterID", "FC", "Branch");
            Utility.FillFilterDropDown(this.ddSearchCondition3, "FilterDesc", "FilterID", "FC", "Branch");
            Utility.FillFilterDropDown(this.ddSearchField2, "SearchFieldDesc", "SearchFieldID", "SF", "Branch");
            Utility.FillFilterDropDown(this.ddSearchField3, "SearchFieldDesc", "SearchFieldID", "SF", "Branch");

            PagerCtrl1.CurrentIndex = 1;
            PagerCtrl2.CurrentIndex = 1;
            BuildSql(0);
        }
    }
    # endregion

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
            cFilter = " BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "'";
        }
        else
        {
            cFilter = cFilter + " and BranchID='" + ((User)((ArrayList)HttpContext.Current.Session["ProfileInfo"])[0]).BranchID + "'";
        }

        DataSet ds = BLL.Master.Branch.BindGrid(spName, new object[] { Tables, PK, sSortCol, PageNumber, iPageSize, Fields, cFilter, Group, sSortOrder });
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

        if (e.Item.ItemType == ListItemType.Item | e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (e.CommandName == "Del")
            {
                object tmpMsg = BLL.Master.Branch.Delete(((Label)e.Item.FindControl("lblBranchID")).Text.Trim(), "D");
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
                sGotoUrl = "BranchAdmin.aspx?Action=E&ID=" + ((Label)e.Item.FindControl("lblBranchID")).Text.Trim();
                Response.Redirect(sGotoUrl);
            }
            else if (e.CommandName == "View")
            {
                string sGotoUrl;
                sGotoUrl = "BranchView.aspx?Action=V&ID=" + e.CommandArgument.ToString();
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

    # region btnFilter_Click
    protected void btnFilter_Click(object sender, EventArgs e)
    {
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

        ////if (PagerCtrl1.CurrentIndex <= 1)
        ////    iPageNo = 0;
        ////else
        ////    iPageNo = PagerCtrl1.CurrentIndex;

        BuildSql(0);
    }
    # endregion

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

    # region btnClearFilter_Click
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
        BuildSql(PagerCtrl1.CurrentIndex);
    }
    # endregion
}
