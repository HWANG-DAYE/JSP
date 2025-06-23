package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one")
public class FrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastslash = uri.lastIndexOf("/");
		String commandstr = uri.substring(lastslash);
		
		if("/regist.one".equals(commandstr)) registFun(req);
		else if("/login.one".equals(commandstr)) loginFunc(req);
		else if("/freeboard.one".equals(commandstr)) freeboardFunc(req);
		
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandstr);
		req.getRequestDispatcher("/hello/FrontController.jsp").forward(req, resp);
	}

	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판<h4>");
	}

	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인<h4>");
	}

	void registFun(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입<h4>");
	}

}
