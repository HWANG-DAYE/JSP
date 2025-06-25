package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import dto.Board;
import util.JDBConnect;

public class BoardDao extends JDBConnect{
	public BoardDao(ServletContext application) {
		super(application);
	}
	
	//검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, String> map) {
        int totalCount = 0; // 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        System.out.println(query);
        try {
            psmt = con.prepareStatement(query);   // 쿼리문 생성
            rs = psmt.executeQuery();  // 쿼리 실행
            rs.next();  // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  // 첫 번째 칼럼 값을 가져옴
        }
        catch (Exception e) {
            System.out.println("게시물 수를 구하는 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public ArrayList<Board> selectList(Map<String, String> map) { 
    	ArrayList<Board> bbs = new ArrayList<Board>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM board "; 
        if (map.get("searchWord") != null ) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 
        query += " limit "+ map.get("offset")+","+map.get("pageSize");
    	System.out.println("쿼리문 : " + query);
        
        try {
            psmt = con.prepareStatement(query);   // 쿼리문 생성
            rs = psmt.executeQuery();  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                Board dto = new Board(); 

                dto.setNum(rs.getString("num"));          // 일련번호
                dto.setTitle(rs.getString("title"));      // 제목
                dto.setContent(rs.getString("content"));  // 내용
                dto.setPostDate(rs.getTimestamp("postdate"));  // 작성일
                dto.setId(rs.getString("id"));            // 작성자 아이디
                dto.setViewCnt(rs.getInt("viewCnt"));  // 조회수
                dto.setCommentCnt(rs.getInt("commentCnt"));
                
                bbs.add(dto);  // 결과 목록에 저장
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return bbs;
    }
    
    public int insert(Board b) {
    	//1) 반환값을 저장할 변수 선언
    	int res = 0;
    	try {
			//2) Sql작성
			String sql ="insert into board(title, content, id)  "
					+ "values(?, ?, ?)";
			//3) psmt 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setString(3, b.getId());
			//5) 실행
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return res;
    }
    
    public Board select(String num) {
    	//1) 반환값 저장할 변수 선언
    	Board b = null;
    	try {
			//2) sql문 작성
			String sql = "select b.*, u.name "
					+ "from board b "
					+ "left outer join user u "
					+ "on b.id = u.id "
					+ "where num =?";
			//3) psmt 객체 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, num);
			//5) 실행 - executeQuery() -> rs 
			rs = psmt.executeQuery();
			if(rs.next()) {
				b = new Board();
				b.setNum(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setContent(rs.getString(3));
				b.setId(rs.getString(4));
				b.setPostDate(rs.getTimestamp(5));
				b.setViewCnt(rs.getInt(6));
				b.setCommentCnt(rs.getInt(7));
				b.setName(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return b;
    }
    
    public int updateViewCnt(String num) {
    	//1) 반환값을 저장할 변수 선언
    	int res = 0;
    	try {
			//2) Sql작성
			String sql ="update board set viewCnt = viewCnt + 1 where num =? ";
			//3) psmt 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, num);
			//5) 실행
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return res;
    }
    
    public int updateCommentCnt(String bno, int commentCnt) {
    	//1) 반환값을 저장할 변수 선언
    	int res = 0;
    	try {
			//2) Sql작성
			String sql ="update board set commentCnt = commentCnt + ? where num =? ";
			//3) psmt 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setInt(1, commentCnt);
			psmt.setString(2,  bno);
			//5) 실행
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return res;
    }
    
    public int update(Board b) {
    	//1) 반환값을 저장할 변수 선언
    	int res = 0;
    	try {
			//2) Sql작성
			String sql ="update board set title = ? , content = ? where num =  ? and id =? ";
			//3) psmt 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, b.getTitle());
			psmt.setString(2, b.getContent());
			psmt.setString(3, b.getNum());
			psmt.setString(4, b.getId());
			//5) 실행
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return res;
    }
    public int delete(Board b) {
    	//1) 반환값을 저장할 변수 선언
    	int res = 0;
    	try {
			//2) Sql작성
			String sql ="delete from board where num = ? and id = ?";
			//3) psmt 생성
			psmt = con.prepareStatement(sql);
			//4) ? 채우기
			psmt.setString(1, b.getNum());
			psmt.setString(2, b.getId());
			//5) 실행
			res = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return res;
    }
}
