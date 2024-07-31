package _04_AJAX;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx08_연습")
public class AjaxEx08_연습 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx08_연습.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderQty = request.getParameter("orderQty");
		String productId = request.getParameter("productId");
		
		String sql = "UPDATE ORDER";
			   sql += "SET ORDER_QTY = " + orderQty;
			   sql += " WHERE PRODUCT_ID = " + productId;
	    System.out.println(sql);
		
		PrintWriter out = response.getWriter();
		out.print(orderQty);
	}

}
