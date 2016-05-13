package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Constant;
import common.Userinfo;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		Login log=new Login(request);
		//判断是否登录失败
		if(!log.judgeLogin()){
			response.sendRedirect("./logweb/login_err.jsp");
			return;
		}
		//获取用户信息并保存到session中
		Userinfo userinfo=new Userinfo();
		userinfo.setInfoByUsername(request.getParameter("username"));
		request.getSession().setAttribute("userinfo", userinfo);
		//判断登录的账户类型
//		System.out.println(request.getSession().getId());
//		System.out.println(((Userinfo)request.getSession().getAttribute("userinfo")).getUsername());
//		System.out.println(request.getSession().getId());
		if(("0").equals(userinfo.getType())){
			response.sendRedirect("./content/main_admin.jsp");
			return;
		}
		if(("1").equals(userinfo.getType())){
			response.sendRedirect("./content/main_user.jsp");
			return;
		}
	}

}
