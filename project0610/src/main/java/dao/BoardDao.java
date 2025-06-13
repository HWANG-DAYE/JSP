package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import dto.Board;
import util.JDBConnect;

public class BoardDao extends JDBConnect {
	public BoardDao(ServletContext application) {
		super(application);
}

public int selectCount(Map<String, String>map) {
	int totalCount = 0;
	
	String query = "SELECT COUNT(*) FROM board";
	if(map.get("searchWord") != null) {
		query += " WHERE " + map.get("searchField") + " "
				+ " LIKE '%" + map.get("searchWord") + "%' ";
	}
	//query += " ORDER BY num DESC ";
	
	try {
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		rs.next();
		totalCount = rs.getInt(1);
	}
	catch(Exception e) {
		System.out.println("게시물 수를 구하는 중 예외 발생");
		e.printStackTrace();
	}
	return totalCount;
}

public ArrayList<Board> selectList(Map<String, String>map) {
	ArrayList<Board> blist = new ArrayList<Board>();

	String query = "SELECT * FROM board";
	if(map.get("searchWord") != null) {
		query += " WHERE " + map.get("searchField") + " "
				+ " LIKE '%" + map.get("searchWord") + "%' ";
	}
	query += " ORDER BY num DESC ";
	System.out.println("쿼리문 : " + query);
	
	try {
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			Board b = new Board();
			b.setNum(rs.getInt("num"));
			b.setTitle(rs.getString("title"));
			b.setContent(rs.getString("content"));
			b.setId(rs.getString("id"));
			b.setPostDate(rs.getTimestamp("postdate"));
			b.setViewCnt(rs.getInt("viewCnt"));
			blist.add(b);
		}
	}
	catch(Exception e) {
		System.out.println("게시물 조회 중 예외 발생");
		e.printStackTrace();
	}
	return blist;
}
	
}
