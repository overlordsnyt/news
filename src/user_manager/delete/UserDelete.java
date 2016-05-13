package user_manager.delete;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;

public class UserDelete {
	private String username;
	public UserDelete(HttpServletRequest request){
		String[][] res=(String[][])request.getSession().getAttribute("userResult");
		int seq=Integer.valueOf(request.getParameter("sequence"));
		username=res[seq][0];
	}
	public boolean delete(){
		boolean b=false;
		String sql="delete from userinfo where username='"+username+"';";
		if(DBHandle.executeUpdate(sql)==1)b=true;
		return b;
	}

}
