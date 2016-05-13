package news_manager.query;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletNewsQuery
 */
@WebServlet("/ServletNewsQuery")
public class ServletNewsQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNewsQuery() {
        super();
        // TODO Auto-generated constructor stub
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
		NewsQuery newsquery=new NewsQuery(request);
		String[][] res=newsquery.queryResult();
		if(res==null){
			response.sendRedirect("./content/sub_frame/news_manager/query/newsQuery_err.jsp");
			return;
		}
		request.getSession().setAttribute("queryResult", res);
		response.sendRedirect("./content/sub_frame/news_manager/query/newsQuery.jsp");
	}

}
