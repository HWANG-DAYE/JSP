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
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/Login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String rememberId = req.getParameter("rememberId");

		UserDao dao = new UserDao(req.getServletContext());
		User u = dao.select(id);
		if (u != null && u.getId().equals(id) && u.getPwd().equals(pwd)) {
			if (rememberId != null) {
				Cookie cookie = new Cookie("cid", id);
				cookie.setMaxAge(60 * 60 * 24);
				cookie.setPath(req.getContextPath());
				resp.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("cid", "");
				cookie.setMaxAge(0);
				cookie.setPath(req.getContextPath());
				resp.addCookie(cookie);
			}
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			resp.sendRedirect("main");
		} else {
			req.getRequestDispatcher("/Login.jsp?loginError=error").forward(req, resp);
		}
	}
}
