package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import bank.Account;
import util.JdbcConnection;

public class AccountDao extends JdbcConnection {
//	insert
	public int insert(Account c) {
		//1) 반환값 저장할 변수 선언
		int cnt = 0;
		try {
			//2) sql문 작성
			String sql = "insert into bank values(?,?,?)";
			//3) psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, c.getAno());
			psmt.setString(2, c.getOwner());
			psmt.setInt(3, c.getBal());
			//5)실행
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}
	
	//update
	public int update(Account c) {
		//1) 반환값 저장할 변수 선언
		int cnt = 0;
		try {
			//2) sql문 작성
			String sql = "update bank set bal = ? where ano = ?";
			//3) psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setInt(1, c.getBal());
			psmt.setString(2, c.getAno());
			//5)실행
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<Account> selectList() {
		//1) 반환값 저장할 변수 선언
		ArrayList<Account> alist = new ArrayList<>();
		try {
			//2) sql문 작성
			String sql = "select * from bank";
			//3) psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			
			//5)실행
			rs = psmt.executeQuery();
			while(rs.next()) {
				Account c = new Account();
				c.setAno(rs.getString(1));
				c.setOwner(rs.getString(2));
				c.setBal(rs.getInt(3));
				alist.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return alist;
	}
	
	public Account select(String ano) {
		//1) 반환값 저장할 변수 선언
		Account ac = null;
		try {
			//2) sql문 작성
			String sql = "select * from bank where ano = ?";
			//3) psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, ano);
			//5)실행
			rs = psmt.executeQuery();
			while(rs.next()) {
				Account c = new Account();
				c.setAno(rs.getString(1));
				c.setOwner(rs.getString(2));
				c.setBal(rs.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ac;
	}
//	select * from bank;
//	select * from bank where ano = ?;
//	insert into bank values('111-111', '홍길동', 150000);
//	update bank set bal = 20000 where ano = '111-111';
}
