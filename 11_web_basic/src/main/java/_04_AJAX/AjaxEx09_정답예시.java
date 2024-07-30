package _04_AJAX;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx09_정답예시")
public class AjaxEx09_정답예시 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Random ran = new Random();
		int authenticationNumber = ran.nextInt(9000) + 1000;
		
		request.setAttribute("authenticationNumber" , authenticationNumber);
		
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx09_정답예시.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tryAuthentication = Integer.parseInt(request.getParameter("tryAuthentication"));
		int authenticationNumber = Integer.parseInt(request.getParameter("authenticationNumber"));
		
		String isAuthentication = "N";
		if (tryAuthentication ==  authenticationNumber) {
			isAuthentication = "Y";
		}
		
		PrintWriter out = response.getWriter();
		out.print(isAuthentication);
		
	}

}
