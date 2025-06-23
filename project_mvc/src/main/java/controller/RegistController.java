package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.User;

@WebServlet("/regist")
public class RegistController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/RegisterForm.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		User	u = new User(id, pwd, name);
		UserDao dao = new UserDao(req.getServletContext());
		int res = dao.insert(u);
		dao.close();
		if(res==1) resp.sendRedirect("login");
		else req.getRequestDispatcher("/RegisterForm.jsp?registerError=error").forward(req, resp);
		
	}
}
