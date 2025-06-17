package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;

import dto.Board;
import utill.JDBConnect;

	public class BoardDao extends JDBConnect {
		public BoardDao(ServletContext application) {
			super(application);
	}
		
	public int selectCount(Map<String, String>map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board";
		if(map.get("serchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (SQLException e) {
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
				b.setNum(rs.getString("num"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setPostDate(rs.getDate("postdate"));
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
	
	public int insert(Board b) {
		int res = 0;
		try {
			String sql = "insert into board(title, content, id) "
					+ "values(?, ?, ?)";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setString(3, b.getId());
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public Board select(int num) {
		Board b = null;
		try {
			String sql = "select b.*, u.name from board b "
					+ "inner join user u "
					+ "on b.id = u.id "
					+ "where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				b = new Board();
				b.setNum(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setContent(rs.getString(3));
				b.setId(rs.getString(4));
				b.setPostDate(rs.getDate(5));
				b.setViewCnt(rs.getInt(6));
				b.setName(rs.getString(7));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	public int updateViewCnt(int num) {
		int res = 0;
		try {
			String sql = "update board set viewCnt = viewCnt + 1 where num = ?";
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, num);
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int update(Board b) {
		int res = 0;
		try {
			String sql = "update board set title = ?, content = ? where num = ? and id = ?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setString(3, b.getNum());
			psmt.setString(4, b.getId());
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(Board b) {
		int res = 0;
		try {
			String sql = "delete from board where num = ? and id = ?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, b.getNum());
			psmt.setString(2, b.getId());
			
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
}
