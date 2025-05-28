package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Board;
import dto.Member;
import util.JdbcConnection;

public class MemberDao extends JdbcConnection {
	public Member select(int num) {
		Member m = null;
		try {
			String sql = "select * from member where num = ?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));
				m.setRegDate(rs.getTimestamp(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}
	
	public ArrayList<Member> selectList() {
		ArrayList<Member> mlist = new ArrayList<>();
		try {
			String sql = "select * from member";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));
				m.setRegDate(rs.getTimestamp(5));
				mlist.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mlist;
	}
	
	//insert
		public int insert(Member m) {
			int cnt = 0;
			try {
				String sql = "insert into member(id, pwd, name, email) values(?,?,?,?)";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, m.getId());
				psmt.setString(2, m.getPwd());
				psmt.setString(3, m.getName());
				psmt.setString(4, m.getEmail());
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return cnt;
		}
		//update
		public int update(Member m) {
			int cnt = 0;
			try {
				String sql = "update member set pwd = ?, name = ?, email = ? where id = ? ";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, m.getPwd());
				psmt.setString(2, m.getName());
				psmt.setString(3, m.getEmail());
				psmt.setString(4, m.getId());
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return cnt;
		}
		//delete
		public int delete(String id) {
			int cnt = 0;
			try {
				String sql = "delete from member where id = ?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return cnt;
		}
	
}
