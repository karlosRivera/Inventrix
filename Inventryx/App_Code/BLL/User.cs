//Developed By : Tridip Bhattacharjee

using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Components.DAL;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    #region Notes
    //THIS CLASS WILL BE USED TO STORE USER RELATED PERSONAL INFORMATION.
    #endregion Notes

    private string m_UserID = "";
    private string m_UserName = "";
    private string m_UserTypeID = "";
    private string m_CompanyID = "";
    private string m_BranchID = "";
    private string m_FinYr = "";
    private string m_CompanyName = "";
    private string m_BranchName = "";
    private string m_HOBranchID = "";

    public User() { }

    public User(string UserID, string UserName, string UserTypeID, string CompanyID, string BranchID,string HOBranchID,string CompanyName,string BranchName,string FinYr)
	{
        m_UserID = UserID;
        m_UserName = UserName;
        m_UserTypeID = UserTypeID;
        m_CompanyID = CompanyID;
        m_BranchID = BranchID;
        m_CompanyName = CompanyName;
        m_BranchName = BranchName;
        m_FinYr = FinYr;
        m_HOBranchID = HOBranchID;
	}

    public string UserID
    {
        get
        {
            return m_UserID;
        }
        set
        {
            m_UserID = value;
        }
    }

    public string FinYear
    {
        get
        {
            return m_FinYr;
        }
        set
        {
            m_FinYr = value;
        }
    }

    public string UserName
    {
        get
        {
            return m_UserName;
        }
        set
        {
            m_UserName = value;
        }
    }

    public string UserTypeID
    {
        get
        {
            return m_UserTypeID;
        }
        set
        {
            m_UserTypeID = value;
        }
    }

    public string CompanyID
    {
        get
        {
            return m_CompanyID;
        }
        set
        {
            m_CompanyID = value;
        }
    }

    public string BranchID
    {
        get
        {
            return m_BranchID;
        }
        set
        {
            m_BranchID = value;
        }
    }

    public string HOBranchID
    {
        get
        {
            return m_HOBranchID;
        }
        set
        {
            m_HOBranchID = value;
        }
    }

    public string CompanyName
    {
        get
        {
            return m_CompanyName;
        }
        set
        {
            m_CompanyName = value;
        }
    }

    public string BranchName
    {
        get
        {
            return m_BranchName;
        }
        set
        {
            m_BranchName = value;
        }
    }

    #region Login
    #region Notes
    //THIS FUNCTION WILL PASS USER ID AND PWD TO ANOTHER FUNCTION FOR CHECKING USER CREDENTIAL
    #endregion
    public object Login(string userName, string password)
    {
        object _object = null;

        if (userName != "" && password != "")
        {
            ArrayList objArr = new ArrayList();
            objArr.Add(userName);
            objArr.Add(password);
            _object=Operate("", objArr);
        }
        return _object;
    }
    #endregion

    #region Operate
    #region Notes
    //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
    #endregion
    public static object Operate(string OperationMode, ArrayList arrLst)
    {
        object _object = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        objArrParams = DBUtils.GetInstance.GetSPParams("MstUserCheckCredential_Select");
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        _object=DBUtils.GetInstance.HandleDataWithReturnParams(objArrFields, "MstUserCheckCredential_Select");
        return _object;
    }
    #endregion

    #region GetComboData
    #region Notes
    //THIS FUNCTION WILL FETCH DATA THROUGH STORE PROCEDURE AND POPULATE DATAREADER AND RETURN
    //DATAREADER TO ITS CALLING ENVIRONMENT FOR POPULATING COMBO
    #endregion
    public SqlDataReader GetComboData(string SpName)
    {
        SqlDataReader oDr = Components.DAL.DBUtils.GetInstance.ExecuteSqlReader("", SpName);
        return oDr;
    }
    #endregion

    #region FetchData
    #region Notes
    //THIS FUNCTION WILL FETCH DATA BASED ON USER ID
    #endregion
    public static SqlDataReader FetchData(ArrayList arrLst, string SpName)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        oSqlDataReader = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
        return oSqlDataReader;
    }
    #endregion

    #region GetData
    #region Notes
    //THIS FUNCTION WILL FETCH DATA BASED ON USER ID
    #endregion
    public SqlDataReader GetData(ArrayList arrLst, string SpName)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        oSqlDataReader = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
        return oSqlDataReader;
    }
    #endregion

    #region LoadRights
    #region Notes
    //THIS FUNCTION WILL FETCH DATA BASED ON USER ID
    #endregion
    public SqlDataReader LoadRights(ArrayList arrLst, string SpName)
    {
        SqlDataReader oSqlDataReader = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        objArrParams = DBUtils.GetInstance.GetSPParams(SpName);
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        oSqlDataReader = DBUtils.GetInstance.HandleDataWithDataReader(objArrFields, SpName);
        return oSqlDataReader;
    }
    #endregion

    #region Operate
    #region Notes
    //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
    #endregion
    public object Operate(ArrayList arrLst, string OperationMode)
    {
        string sSpName = "";
        object _object = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        if (OperationMode == "A")
        {
            sSpName = "MstUser_Insert";
        }
        else if (OperationMode == "E")
        {
            sSpName = "MstUser_Update";
        }
        else if (OperationMode == "D")
        {
            sSpName = "MstUser_Delete";
        }
        else if (OperationMode == "U")
        {
            sSpName = "MstUserPwd_Update";
        }

        objArrParams = DBUtils.GetInstance.GetSPParams(sSpName);
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        _object = DBUtils.GetInstance.HandleDataWithReturnParams(objArrFields, sSpName);
        return _object;
    }
    #endregion

    #region Operate
    #region Notes
    //THIS FUNCTION WILL CALL STORE PROCEDURE AND PASS USER ID AND PWD THERE FOR CHECKING USER CREDENTIAL
    #endregion
    public object Operate(ArrayList arrLst)
    {
        string sSpName = "";
        object _object = null;
        ArrayList objArrFields = new ArrayList();
        ArrayList objArrParams = new ArrayList();
        int i;
        sSpName = "MstRights_Update";

        objArrParams = DBUtils.GetInstance.GetSPParams(sSpName);
        for (i = 0; i <= objArrParams.Count - 1; i++)
        {
            objArrFields.Add(new ParamsList(((ParamsList)(objArrParams[i])).ParamName, arrLst[i], ((ParamsList)(objArrParams[i])).ParamType, ((ParamsList)(objArrParams[i])).ParamDirection));
        }
        _object = DBUtils.GetInstance.HandleDataWithReturnParams(objArrFields, sSpName);
        return _object;
    }
    #endregion
}
