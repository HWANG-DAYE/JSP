package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;

import dto.Member;
import utill.JDBConnect;

public class MemberDao extends JDBConnect {
	public MemberDao(ServletContext application) {
		super(application);
	}
	
	public int insert(Member m) {
		int res = 0;
		
		try {
			String sql = "insert into member(id, pwd, name, email, birth, sns) "
					+ "values(?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, m.getId());
			psmt.setString(2, m.getPwd());
			psmt.setString(3, m.getName());
			psmt.setString(4, m.getEmail());
			psmt.setDate(5, m.getBirth());
			psmt.setString(6, m.getSns());
			
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
		
	}
	
	public int delete(String id) {
		int res = 0;
		
		try {
			String sql = "delete from member where id = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int update(Member m) {
		int res = 0;
		
		try {
			String sql = "update member set pwd = ?, name=?, email= ?, birth=?, sns=? where id=?;"
					+ "values(?, ?, ?, ?, ?, ?)";
					
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, m.getPwd());
			psmt.setString(2, m.getName());
			psmt.setString(3, m.getEmail());
			psmt.setDate(4, m.getBirth());
			psmt.setString(5, m.getSns());
			psmt.setString(6, m.getId());
			
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public Member select(String id) {
		Member m = null;
		try {
			String sql = "select id, pwd, name, email, birth, sns, reg_date from member where id = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));
				m.setBirth(rs.getDate(5));
				m.setSns(rs.getString(6));
				m.setReg_date(rs.getTimestamp(7));
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
			String sql = "select id, pwd, name, email, birth, sns, reg_date from member";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString(1));
				m.setPwd(rs.getString(2));
				m.setName(rs.getString(3));
				m.setEmail(rs.getString(4));
				m.setBirth(rs.getDate(5));
				m.setSns(rs.getString(6));
				m.setReg_date(rs.getTimestamp(7));
				
				mlist.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mlist;
	}

}
