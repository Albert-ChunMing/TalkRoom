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
 * Servlet implementation class RegisterAndUpdate
 */
@WebServlet("/RegisterAndUpdate")
public class RegisterAndUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAndUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String  account=request.getParameter("account");
		String  pass=request.getParameter("pass");
		String  name=request.getParameter("name");
		String  birth=request.getParameter("birth");
		String  phone=request.getParameter("phone");
		String  action=request.getParameter("action");		
		
		if(action!=null && action.equals("add")) {
			if(UserInfoDao.getUserInfoByAccount(account)!=null) {
				request.setAttribute("result", "該帳號已存在 請改用其他帳號");
			}else {
				UserInfo user=new UserInfo(account,pass,name,birth,phone);			
				if(UserInfoDao.addUser(user)) {
					request.setAttribute("result", "註冊成功 3秒後自動返回首頁");
				}else {
					request.setAttribute("result", "註冊失敗");
				}				
			}
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}		
		if(action!=null && action.equals("update")) {
			UserInfo userNew=new UserInfo(account,pass,name,birth,phone);
			if(UserInfoDao.update(account, userNew)) {
				request.setAttribute("result", "更新成功");
			}else {
				request.setAttribute("result", "更新失敗");
			}
			request.getRequestDispatcher("update.jsp").forward(request, response);		
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
