package news_manager.add;


import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;
import common.Userinfo;

public class NewsAdd {
	private String title,content,userid;
	private Timestamp pubtime;
	public NewsAdd(HttpServletRequest request){
		title=request.getParameter("title");
		content=request.getParameter("content");
		userid=((Userinfo)request.getSession().getAttribute("userinfo")).getUsername();
		pubtime=new Timestamp(new Date().getTime());
	}
	public boolean judgePublish(){
		boolean b=false;
		String sql="insert into news (title,content,userid,pubtime) values ('"
				+title+ "','"
				+content+ "','"
				+userid+ "','"
				+pubtime+ "');";
		b=DBHandle.executeUpdate(sql)>0;
		return b;
	}

}
