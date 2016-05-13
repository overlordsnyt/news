package login;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;

public class Login {
	private String username,password;
	public Login(HttpServletRequest request){
		username=request.getParameter("username");
		password=request.getParameter("password");
	}
	/**
	 * 判断登陆是否成功
	 * @return	判断结果
	 */
	public boolean judgeLogin(){
		boolean b=false;
		String sql=""
				+ "select username,password from userinfo where username='"
				+username+ "' and password='"
				+password+ "';";
		if(DBHandle.executeInt(sql)>0)b=true;
		return b;
	}
}
