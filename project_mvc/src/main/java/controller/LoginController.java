package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dto.User;

@WebServlet("/login")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String rememberId = request.getParameter("rememberId");
		
		UserDao dao = new UserDao(request.getServletContext());
		User user = dao.select(id);
		if(user!=null && user.getId().equals(id) && user.getPwd().equals(pwd)) {
			if(rememberId != null) {
			Cookie cookie = new Cookie("cid", id);
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(24*60*60);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("cid", "");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		response.sendRedirect("main");
	}else {
		request.getRequestDispatcher("/Login.jsp?loginError=error").forward(request, response);
	}
	dao.close();
}
}