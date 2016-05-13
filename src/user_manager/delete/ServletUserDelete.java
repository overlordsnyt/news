package user_manager.delete;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletUserDelete
 */
@WebServlet("/userDelete")
public class ServletUserDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUserDelete() {
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
		UserDelete ud=new UserDelete(request);
		if(ud.delete()){
			response.getWriter().print("<script type=\"text/javascript\">");
			response.getWriter().print("alert(\"成功删除用户！\");");
			response.getWriter().print("window.location=\"./content/sub_frame/user_manager/query/userQuery.jsp\";");
			response.getWriter().print("</script>");
			return;
		}
		response.sendRedirect("./content/sub_frame/user_manager/delete/userDelete_err.jsp");
		
	}

}
