package control;
import model.UserInfo;
import model.UserInfoDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAndLogout
 */
@WebServlet("/LoginAndLogout")
public class LoginAndLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAndLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String account=request.getParameter("account");
		String password=request.getParameter("password");
		String action=request.getParameter("action");		
		
		if(action !=null && action.equals("login")) {
			UserInfo userInfo=UserInfoDao.getUserInfo(account, password);
			if(userInfo!=null) {
				request.getSession().setAttribute("userInfo", userInfo);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("loginStatus", "無此帳號或密碼");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		if(action !=null && action.equals("logout")) {
			request.getSession().removeAttribute("userInfo");
			response.sendRedirect("index.jsp");
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
