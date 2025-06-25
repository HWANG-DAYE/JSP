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

@WebServlet("/delete")
public class DeleteController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String num = req.getParameter("num");
		BoardDao dao = new BoardDao(req.getServletContext());
		Board dto = dao.select(num);
		if(req.getSession().getAttribute("id")==null || !((req.getSession().getAttribute("id")+"").equals(dto.getId()))) {
			JSFunction.alertLocation("잘못된 접근입니다.", "list", resp);
			return;
		}
		
		dto = new Board();
		dto.setId(req.getSession().getAttribute("id")+"");
		dto.setNum(num);
		int res = dao.delete(dto);
		dao.close();
		if(res==1) JSFunction.alertLocation("삭제 완료", "list", resp);
		else JSFunction.alertBack("잠시 후 다시 시도하세요.", resp);
	}
}
