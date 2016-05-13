package user_manager.query;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;

public class UserQuery {
	private String username;
	public UserQuery(HttpServletRequest request){
		username=request.getParameter("username");
	}
	public String[][] queryResult(){
		String subsql="";
		if(!username.isEmpty())subsql=" where username='"+username+"'";
		String sql="select * from userinfo"+subsql+";";
		return DBHandle.executeResult(sql, DBHandle.executeInt(sql), 7);
	}

}
