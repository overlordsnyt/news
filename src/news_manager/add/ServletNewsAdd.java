package news_manager.add;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;
import common.Userinfo;

/**
 * Servlet implementation class ServletNewsAdd
 */
@WebServlet("/ServletNewsAdd")
public class ServletNewsAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNewsAdd() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constant.CHARSET);
		response.setContentType(Constant.HEADTYPE);
//		System.out.println(request.getSession().getId());
//		System.out.println(((Userinfo)request.getSession().getAttribute("userinfo")).getUsername());
		NewsAdd na=new NewsAdd(request);
		if(!na.judgePublish()){
			response.sendRedirect("./content/sub_frame/news_manager/add/newsAdd_err.jsp");
			return;
		}
		PrintWriter out=response.getWriter();
		//在页面添加执行javascript代码：弹出警告框“发布成功”，并且在名为content的frame中打开newsAdd.jsp页面
		out.print("<script type=\"text/javascript\">alert(\"发布成功\");"
				+ "window.open(\"./content/sub_frame/news_manager/add/newsAdd.jsp\",\"content\")</script>");
	}

}
