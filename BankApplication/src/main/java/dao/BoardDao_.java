package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Board_;
import util.JdbcConnection;

public class BoardDao_ extends JdbcConnection{
	//select
	public Board_ select(int num) {
		Board_ b = null;
		try {
			String sql = "select * from board where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				b = new Board_();
				b.setNum(rs.getInt(1));
				b.setTitle(rs.getString(2));
				b.setContent(rs.getString(3));
				b.setRegDate(rs.getTimestamp(4));
				b.setWriter(rs.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	//BoardList
	public ArrayList<Board_> selectList() {
		ArrayList<Board_> blist = new ArrayList<>();
		try {
			String sql = "select * from board";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Board_ b = new Board_();
				b.setNum(rs.getInt(1));
				b.setTitle(rs.getString(2));
				b.setContent(rs.getString(3));
				b.setRegDate(rs.getTimestamp(4));
				b.setWriter(rs.getString(5));
				blist.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return blist;
	}
	//insert
	public int insert(Board_ b) {
		int cnt = 0;
		try {
			String sql = "insert into board(title, content, writer) values(?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setString(3, b.getWriter());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	//update
	public int update(Board_ b) {
		int cnt = 0;
		try {
			String sql = "update board set title = ?, content = ? where num = ? and writer = ? ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setInt(3, b.getNum());
			psmt.setString(4, b.getWriter());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	//delete
	public int delete(int num) {
		int cnt = 0;
		try {
			String sql = "delete from board where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
//	select * from board where num = ?;
//	select * from board;
//	insert into board(title, content, writer) values('제목1', '내용1', 'asdf');
//	update board set title='변경', content ='변경' where num = 1 and writer = 'asdf';
//	delete from board where num = 1;
}
