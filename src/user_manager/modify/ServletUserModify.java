package user_manager.modify;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletUserModify
 */
@WebServlet("/userModify")
public class ServletUserModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUserModify() {
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
		UserModify um=new UserModify(request);
		if(um.saveModifyToDatabase()){
			request.getSession().removeAttribute("queryUsers");
			response.sendRedirect("./content/sub_frame/user_manager/modify/userModify_succ.jsp");
			return;
		}
	}

}
