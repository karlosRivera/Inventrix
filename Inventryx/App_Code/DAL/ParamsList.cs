using System;
using System.Data;


namespace Components.DAL
{
	public class ParamsList
	{
        #region Notes
        //THIS CLASS WILL BE USED FOR STORING STOREPROCEDURE PARAMS RELATED INFO
        #endregion Notes

		private string mParamName;
		private object mParamvalue;
		private SqlDbType mParamType;
		private ParameterDirection mParamDirection;

		public ParamsList(string ParamName, object Paramvalue, SqlDbType ParamType, ParameterDirection ParamDirection)
		{
			mParamName = ParamName;
			mParamvalue = Paramvalue;
			mParamType = ParamType;
			mParamDirection = ParamDirection;
		}

		public ParamsList()
		{
			mParamName = "";
			mParamvalue = "";
			mParamType = SqlDbType.VarChar;
			mParamDirection = ParameterDirection.Input;
		}

		public string ParamName 
		{
			get 
			{
				return mParamName;
			}
			set 
			{
				mParamName = value;
			}
		}

		public object ParamValue 
		{
			get 
			{
				return mParamvalue;
			}
			set 
			{
				mParamvalue = value;
			}
		}

		public SqlDbType ParamType 
		{
			get 
			{
				return mParamType;
			}
			set 
			{
				mParamType = value;
			}
		}

		public ParameterDirection ParamDirection 
		{
			get 
			{
				return mParamDirection;
			}
			set 
			{
				mParamDirection = value;
			}
		}
	}
}
