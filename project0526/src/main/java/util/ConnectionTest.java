package util;

import dao.testMemberDao;

public class ConnectionTest {
	public static void main(String[] args) throws Exception {
		testMemberDao dao = new testMemberDao();
		dao.select("asdf");
		
	}
}
