package modify_pw;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;

/**
 * Servlet implementation class ServletModifyPassword
 */
@WebServlet("/ModifyPassword")
public class ServletModifyPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletModifyPassword() {
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
		ModifyPassword mp=new ModifyPassword(request);
		if(mp.renewPW()){
			response.getWriter().print("<script type=\"text/javascript\">alert(\"密码修改成功！\");window.location=\"./content/sub_frame/welcome.jsp\";</script>");
			return;
		}
		response.sendRedirect("./content/sub_frame/modify_pw/modifypw_err.jsp");
	}

}
