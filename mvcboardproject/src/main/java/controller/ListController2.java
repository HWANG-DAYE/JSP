package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dto.Board;
import util.PageHandler2;
import util.SearchCondition;

@WebServlet("/list2")
public class ListController2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// DAO를 생성해 DB에 연결
		BoardDao dao = new BoardDao(req.getServletContext());
		Map<String, String> map = new HashMap<>();
		String searchWord = req.getParameter("searchWord");
		String searchField = req.getParameter("searchField");
		SearchCondition sc = null;
		
		String pageStr = req.getParameter("page");
		int pageNum = pageStr == null ? 1 : Integer.parseInt(pageStr);
		
		if (searchWord != null) {
			map.put("searchWord", searchWord);
			map.put("searchField", searchField);
			sc = new SearchCondition(searchField, searchWord, pageNum, 10);
		}else {
			sc = new SearchCondition(pageNum, 10);
		}

		int totalcnt = dao.selectCount(map);
		PageHandler2 ph = new PageHandler2(sc, totalcnt);
		int offset = sc.getOffset(pageNum);
		map.put("offset", offset + "");
		map.put("pageSize", sc.getPageSize()+"");
		
		ArrayList<Board> blist = dao.selectList(map);
		System.out.println(blist);
		req.setAttribute("blist", blist);
		req.setAttribute("ph", ph);
		req.setAttribute("tday", new Date());
		
		dao.close();
		req.getRequestDispatcher("/List2.jsp").forward(req, resp);
	}
}
