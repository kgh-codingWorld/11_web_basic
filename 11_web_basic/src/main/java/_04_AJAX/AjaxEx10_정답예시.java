package _04_AJAX;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx10_정답예시")
public class AjaxEx10_정답예시 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx10_정답예시.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int count = 0;
		if (request.getParameter("likeCnt") != null) {
			count = Integer.parseInt(request.getParameter("likeCnt"));		
		}
		if (request.getParameter("dislikeCnt") != null) {
			count = Integer.parseInt(request.getParameter("dislikeCnt"));		
		}
		count++;
		
		PrintWriter out = response.getWriter();
		out.print(count);
		
	}

}
