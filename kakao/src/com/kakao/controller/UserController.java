package com.kakao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kakao.user.service.UserService;
import com.kakao.user.service.LoginServiceImpl;


@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public UserController() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doAction(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		UserService service = null;

		if(command.equals("/login.user")) {
			request.getRequestDispatcher("user_login.jsp").forward(request, response);

		}else if(command.equals("/loginForm.user") ) {

			service = new LoginServiceImpl();
			int result = service.execute(request, response);
			if(result==0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();

				out.println("<script>");
				out.println("alert('아이디 비번 확인하세요')");
				out.println(" location.href='index.jsp'  ");
				out.println("</script>");

			}
		}
	}
}