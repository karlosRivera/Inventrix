//Developed By : Tridip Bhattacharjee

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ProfileInfo
/// </summary>
public class ProfileInfo
{
    #region Notes
    //THIS CLASS WILL BE USED TO STORE USER RELATED PERSONAL INFORMATION.
    #endregion Notes

    private string m_UserID = "";
    private string m_UserName = "";
    private string m_UserTypeID = "";
    private string m_CompanyID = "";
    private string m_BranchID = "";
    
    public ProfileInfo() { }

    public ProfileInfo(string UserID,string UserName,string UserTypeID,string CompanyID,string BranchID)
	{
        m_UserID = UserID;
        m_UserName = UserName;
        m_UserTypeID = UserTypeID;
        m_CompanyID = CompanyID;
        m_BranchID = BranchID;
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

    
}
