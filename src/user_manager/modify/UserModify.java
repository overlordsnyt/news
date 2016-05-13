package user_manager.modify;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;
import reg.Register;

public class UserModify extends Register {

	public UserModify(HttpServletRequest request) {
		super(request);
		type=request.getParameter("type");
	}
	public boolean saveModifyToDatabase(){
		boolean b=false;
		//密码有问题，允许空密码
		//应有功能：按照输入是否为空判断是否更改密码
		String sql="update userinfo set "
				+ "password='"+password+"' "
				+ ",sex='"+sex+"' "
				+ ",profession='"+profession+"' "
				+ ",favourite='"+favourite+"' "
				+ ",note='"+note+"' "
				+ ",type='"+type+"' "
				+ "where username='"+username+"';";
		if(DBHandle.executeUpdate(sql)==1){
			b=true;
		}
		return b;
	}
}
