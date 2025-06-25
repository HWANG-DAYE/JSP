package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import dto.Comment;
import util.JDBConnect;

public class CommentDao extends JDBConnect {
	public CommentDao(ServletContext application) {
		super(application);
	}
	
	public int count(String bno) {
		int res = 0;
		try {
			String sql = "select count(*) from comment where bno=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bno);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(Comment dto) {
		int res = 0;
		try {
			String sql = "delete from comment where cno = ? and commenter =?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getCno());
			psmt.setString(2, dto.getCommenter());
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int insert(Comment c) {
		int res = 0;
		try {
			String sql = "insert into comment(bno, comment, commenter) values(?, ?, ?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, c.getBno());
			psmt.setString(2, c.getComment());
			psmt.setString(3, c.getCommenter());
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<Comment> selectAll(String bno) {
		ArrayList<Comment> dtos = new ArrayList<Comment>();
		try {
			String sql = "select cno, bno, comment, commenter, regDate from comment where bno=? order by cno ASC";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bno);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Comment dto = new Comment();
				dto.setCno(rs.getString(1));		
				dto.setBno(rs.getString(2));		
				dto.setComment(rs.getString(3));		
				dto.setCommenter(rs.getString(4));		
				dto.setRegDate(rs.getTimestamp(5));
				
				dtos.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public Comment select(String cno) {
		Comment dto = null;
		try {
			String sql = "select cno, bno, comment, commenter, regdate from comment where cno=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, cno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new Comment();
				dto.setCno(rs.getString(1));
				dto.setBno(rs.getString(2));
				dto.setComment(rs.getString(3));
				dto.setCommenter(rs.getString(4));
				dto.setRegDate(rs.getTimestamp(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int update(Comment dto) {
		int res = 0;
		try {
			String sql = "update comment set comment =?, regDate = now() where cno=?and commenter=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getComment());;
			psmt.setString(2, dto.getCno());
			psmt.setString(3, dto.getCommenter());
			
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
}
