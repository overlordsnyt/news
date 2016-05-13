package reg;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Register rg=new Register(request);
		/*if(rg.saveToDatabase()){
			response.getWriter().println("<h1>注册成功！</h1>");
			return;
		}
		response.getWriter().println("<h1 style=\"color:red;\">注册失败！</h1>");*/
		/*if(!rg.noSameUser()){
			request.getSession().setAttribute("error", "存在相同的用户名！");
			response.sendRedirect("/news2015-10-27/regweb/register_err.jsp");
			System.out.println("1");
			return;
		}*/
		if(!rg.saveToDatabase()){
			request.getSession().setAttribute("error", "存入数据库失败！");
			response.sendRedirect("./regweb/register_err.jsp");
			return;
		}
		request.getSession().setAttribute("info", rg);
		response.sendRedirect("./regweb/register_succ.jsp");
	}

}
