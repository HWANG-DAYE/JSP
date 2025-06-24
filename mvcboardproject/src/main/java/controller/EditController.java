package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dto.Board;
import util.JSFunction;

@WebServlet("/edit")
public class EditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(req.getSession().getAttribute("id")==null) {
			JSFunction.alertLocation("로그인 후 이용하세요.", "login", resp);
			return;
		}
		
		String num = req.getParameter("num");
		BoardDao dao = new BoardDao(req.getServletContext());
		Board dto = dao.select(num);
		System.out.println(dto);
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/Edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getSession().getAttribute("id")+"";
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String num = req.getParameter("num");
		Board dto = new Board(num, title, content, id);
		BoardDao dao = new BoardDao(req.getServletContext());
		int res = dao.update(dto);
		dao.close();
		if(res==1) JSFunction.alertLocation("수정 완료", "view?num="+num, resp);
		else {
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/Edit.jsp").forward(req, resp);
		}
	}
}
