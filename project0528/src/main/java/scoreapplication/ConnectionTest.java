package scoreapplication;

import java.util.ArrayList;

public class ConnectionTest {
	public static void main(String[] args) {
		ScoreDao dao = new ScoreDao();
		ArrayList<Student> slist = dao.selectList();
		for(Student s : slist) {
			System.out.println(s);
		}
		
		ArrayList<Score> list = dao.selectScore();
		for(Score s : list) {
			System.out.println(s);
		}
	}
}
