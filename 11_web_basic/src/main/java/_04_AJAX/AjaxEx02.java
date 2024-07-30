package _04_AJAX;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxEx02")
public class AjaxEx02 extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("04_jQuery/chapter04_AJAX/ajaxEx02.jsp");
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		  	let sendData = { // 한 개의 압축 파일
				"testData1" : $("testData1").val(),
				"testData2" : $("testData2").val()
			}
		*/
		
		request.setCharacterEncoding("utf-8");
		
		String testData1 = request.getParameter("testData1");
		String testData2 = request.getParameter("testData2");
		
		System.out.println("testData1 : " + testData1);
		System.out.println("testData2 : " + testData2);
		System.out.println();
	}
	

}
