package modify_pw;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;
import common.Userinfo;

public class ModifyPassword {
	private String username,originalPW,newPW;
	ModifyPassword(HttpServletRequest request){
		originalPW=request.getParameter("originalPW");
		newPW=request.getParameter("newPW");
		username=((Userinfo)request.getSession().getAttribute("userinfo")).getUsername();
	}
	public boolean renewPW(){
		String sql="update userinfo set password='"
				+newPW+ "' where username='"
				+username+ "' and password='"
				+originalPW+ "';";
		if(DBHandle.executeUpdate(sql)==1)return true;
		return false;
	}

}
