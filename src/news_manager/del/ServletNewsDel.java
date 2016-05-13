package news_manager.del;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletNewsDel
 */
@WebServlet("/newsDel")
public class ServletNewsDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNewsDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newsid=request.getParameter("newsid");
		response.setContentType(Constant.HEADTYPE);
		if(NewsDel.judgeDel(newsid)){
			response.getWriter().print("<script type=\"text/javascript\">alert(\"删除成功！\");window.location='./content/sub_frame/news_manager/query/newsQuery.jsp';</script>");
			return;
		}
		response.sendRedirect("./content/sub_frame/news_manager/del/newsDel_err.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
