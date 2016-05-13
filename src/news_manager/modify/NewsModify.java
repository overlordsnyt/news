package news_manager.modify;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;
import common.Userinfo;

public class NewsModify {
	private String no,title,content,username;
	private Timestamp date;
	public NewsModify(HttpServletRequest request){
		no=request.getParameter("no");
		title=request.getParameter("title");
		content=request.getParameter("content");
		username=((Userinfo)(request.getSession().getAttribute("userinfo"))).getUsername();
		date=new Timestamp(new Date().getTime());
	}
	public int successLine(){
		String sql="update news set title='"+title
				+ "',content='"+content
				+ "',userid='"+username
				+ "',pubtime='"+date
				+ "' where newsid="+no
				+ ";";
		return DBHandle.executeUpdate(sql);
	}
	public String[] modifiedNews(){
		String[] str={String.valueOf(no),title,content,username,date.toString()};
		return str;
	}

}
