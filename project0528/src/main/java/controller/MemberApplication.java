package controller;

import java.util.ArrayList;
import java.util.Scanner;

import dao.MemberDao;
import dto.Member;

public class MemberApplication {
	static MemberDao dao = new MemberDao();
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		while (run) {
			System.out.println("-----------------------------------------------------------");
			System.out.println("1.회원가입 | 2.회원조회 | 3.회원수정 | 4.회원탈퇴 | 5.로그인 | 6.종료 ");
			System.out.println("-----------------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = sc.nextInt();
			sc.nextLine();

			if (selectNo == 1) {
				System.out.print("아이디 : ");
				String id = sc.next();
				if(dao.select(id)!=null) {
					System.out.println("아이디가 중복되었습니다.");
					continue;
				}
				System.out.print("비밀번호 : ");
				String pwd = sc.next();
				System.out.print("이름 : ");
				String name = sc.next();
				System.out.print("이메일 : ");
				String email = sc.next();
				Member m = new Member(id, pwd, name, email);
				int res = dao.insert(m);
				if (res == 1) {
					System.out.println("회원가입이 정상적으로 완료되었습니다.");
				} else {
					System.out.println("회원가입을 실패하였습니다. 잠시 후 다시 시도하세요.");
				}
			}else if(selectNo ==2) {
				ArrayList<Member> mlist = dao.selectList();
				for (Member m : mlist) {
					System.out.println(m);
				}
			}else if(selectNo ==3) {
				System.out.print("아이디 : ");
				String id = sc.next();
				System.out.print("비밀번호 : ");
				String pwd = sc.next();
				boolean res = login(id, pwd);
				if(res) {
					System.out.print("변경할 비밀번호 : ");
					pwd = sc.next();
					System.out.print("변경할 이름 : ");
					String name = sc.next();
					System.out.print("변경할 이메일 : ");
					String email = sc.next();
					Member m = new Member(id, pwd, name, email);
					int r = dao.update(m);
					if(r==1) System.out.println("수정이 완료되었습니다.");
					else System.out.println("잠시 후 다시 시도하세요.");
				}else {
					System.out.println("로그인에 실패하였습니다.");
				}
			}else if(selectNo ==4) {
				System.out.print("아이디 : ");
				String id = sc.next();
				System.out.print("비밀번호 : ");
				String pwd = sc.next();
				boolean res = login(id, pwd);
				if(res) {
					int r = dao.delete(id);
					if(r==1)System.out.println("회원 탈퇴하였습니다.");
					else System.out.println("잠시 후 다시 시도하세요.");
				}else {
					System.out.println("로그인에 실패하였습니다.");
				}
			}else if(selectNo ==5) {
				System.out.print("아이디 : ");
				String id = sc.next();
				System.out.print("비밀번호 : ");
				String pwd = sc.next();
				boolean res = login(id, pwd);
				if(res) System.out.println("로그인 성공");
				else System.out.println("로그인 실패");
			}else if(selectNo ==6) {
				run = false;
				break;
			}
		}
	}
	static boolean login(String id, String pwd) {
		if(dao.select(id)!=null)
			return id.equals(dao.select(id).getId()) && pwd.equals(dao.select(id).getPwd());
		return false;
	}
}
