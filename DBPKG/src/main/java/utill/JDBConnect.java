package utill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletContext;

public class JDBConnect {
	// 데이터베이스와 연결 담당
    public Connection con;
    // 정적 쿼리문을 실행할 때
    public Statement stmt;
    // 동적 쿼리문을 실행할 때 
    public PreparedStatement psmt;
    // select 쿼리문의 결과를 저장할 때 
    public ResultSet rs;

    // 기본 생성자
    public JDBConnect() {
        try {
            // JDBC 드라이버 로드
        	// 객체 생성
            Class.forName("com.mysql.jdbc.Driver");

            // DB에 연결
            String url = "jdbc:mysql://localhost:3306/jsp0619";  
            String id = "root";
            String pwd = "0000"; 
            con = DriverManager.getConnection(url, id, pwd); 

            System.out.println("DB 연결 성공(기본 생성자)");
        }
        catch (Exception e) {     
        	System.out.println("에러 발생");
            e.printStackTrace();
        }
    }
}