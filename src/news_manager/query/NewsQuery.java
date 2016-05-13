package news_manager.query;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;
import common.Userinfo;

public class NewsQuery {
	private String username,title;
	public NewsQuery(HttpServletRequest request){
		username=request.getParameter("username");
		title=request.getParameter("title");
		if(judgeQueryContent()==3)username=((Userinfo)(request.getSession().getAttribute("userinfo"))).getUsername();
	}
	public String[][] queryResult(){
		String[][] news = null;
		String subSql=null;
		switch(judgeQueryContent()){
		case 0:subSql="userid='"+username+"'";break;
		case 1:subSql="title='"+title+"'";break;
		case 2:subSql="userid='"+username+"' and title='"+title+"'";break;
		case 3:subSql="userid='"+username+"'";break;
		default:return news;
		}
		String sql="select * from news where "+subSql+";";
		int line=DBHandle.executeInt(sql);
		if(line>0)news=DBHandle.executeResult(sql, line, 5);
		return news;
	}
	private byte judgeQueryContent(){
		byte b=-1;
		boolean usernameNull=username.isEmpty(),
				titleNull=title.isEmpty();
		if(!usernameNull&&titleNull)b=0;//仅有用户名输入
		if(usernameNull&&!titleNull)b=1;//仅有标题输入
		if(!usernameNull&&!titleNull)b=2;//用户名标题均有输入
		if(usernameNull&&titleNull)b=3;//用户名标题均无输入
		return b;
	}

}
