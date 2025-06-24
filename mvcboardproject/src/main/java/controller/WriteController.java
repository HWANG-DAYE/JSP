package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dto.Board;
import util.JSFunction;

@WebServlet("/write")
public class WriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("id")==null) {
			JSFunction.alertLocation("로그인 후 이용하세요.", "login", resp);
		}
		req.getRequestDispatcher("/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String id = req.getSession().getAttribute("id")+"";
		
		Board b = new Board(title, content, id);
		BoardDao dao = new BoardDao(req.getServletContext());
		int res = dao.insert(b);
		if(res==1) JSFunction.alertLocation("작성 완료", "list", resp);
		else {
			req.setAttribute("board", b);
			req.getRequestDispatcher("/Write.jsp?writeError==error").forward(req, resp);
		}
		
	}
}
