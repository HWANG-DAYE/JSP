package dao;

import java.util.ArrayList;

import javax.servlet.ServletContext;

import dto.User;
import util.JDBConnect;

public class UserDao extends JDBConnect{
	/*
	 * public MemberDao(){
	 * 	super(); 생성자를 정의하지 x 
	 * }
	 */
	
	public UserDao(ServletContext application) {
		super(application);
	} // 기본생성자를 생성 x 
	
	/*
	 * insert, update, delete => int ( 처리된 행의 수 )
	 * psmt.executeUpdate()
	 * 
	 * select -> Resultset ( java.sql)
	 * psmt.executeQuery();
	 * 
	 * 
	 */
	
	public int insert(User u) {
		//0. 반환값을 저장할 변수 선언
		int res = 0;
		try {
			//1. sql문 작성
			String sql = "insert into user(id, pwd, name) values(?, ?, ?)";
			//2. psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//3. ?채우기
			psmt.setString(1, u.getId());
			psmt.setString(2, u.getPwd());
			psmt.setString(3, u.getName());
			//4. 실행
			res = psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
		
	}
	// 로그인 함수
	public User select(String id) {
		User u = null;
		try {
			String sql = "select id, pwd, name, regDate from user where id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				u = new User();
				u.setId(rs.getString(1));
				u.setPwd(rs.getString(2));
				u.setName(rs.getString(3));
				u.setRegDate(rs.getTimestamp(4));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	
}
