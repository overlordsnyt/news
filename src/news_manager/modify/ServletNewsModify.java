package news_manager.modify;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletNewsModify
 */
@WebServlet("/ServletNewsModify")
public class ServletNewsModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNewsModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(Constant.CHARSET);
		response.setContentType(Constant.HEADTYPE);
		NewsModify nm=new NewsModify(request);
		if(nm.successLine()==1){
			request.getSession().setAttribute("modifiedNews", nm.modifiedNews());
			response.sendRedirect("./content/sub_frame/news_manager/modify/newsModify.jsp?sequence=-1");
			return;
		}
		response.sendRedirect("./content/sub_frame/news_manager/modify/newsModify_err.jsp");
	}

}
