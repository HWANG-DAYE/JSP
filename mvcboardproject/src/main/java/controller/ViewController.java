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

@WebServlet("/view")
public class ViewController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String num = req.getParameter("num");
		BoardDao dao = new BoardDao(req.getServletContext());
		int res = dao.updateViewCnt(num);
		
		if(res==1) {
			Board b = dao.select(num);
			req.setAttribute("dto", b);
		}else {
			JSFunction.alertLocation("잠시 후 다시 시도하세요.", "list", resp);
			return;
		}
		dao.close();
		req.getRequestDispatcher("/View.jsp").forward(req, resp);
	}
}
