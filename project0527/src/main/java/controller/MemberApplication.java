package controller;

import java.util.ArrayList;
import java.util.Scanner;

import dao.MemberDao;
import dto.Board;
import dto.Member;

public class MemberApplication {
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		while (run) {
			System.out.println("-----------------------------------------------------------------");
			System.out.println("1.회원가입 | 2.회원목록조회 | 3.회원탈퇴 | 4.로그인 | 5.회원정보수정 | 6.종료 ");
			System.out.println("-----------------------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = sc.nextInt();
			sc.nextLine();

			if (selectNo == 1) {
				System.out.print("아이디 : ");
				String id = sc.next();
				sc.nextLine();
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

			} else if (selectNo == 2) {
				ArrayList<Member> mlist = dao.selectList();
				for (Member m : mlist) {
					System.out.println(m);
				}
			} else if (selectNo == 3) {
				System.out.print("아이디 : ");
				String id = sc.nextLine();
				sc.nextLine();
				int res = dao.delete(id);
				if (res == 1) {
					System.out.println("회원탈퇴가 정상적으로 완료되었습니다.");
				} else {
					System.out.println("회원탈퇴에 실패했습니다. 잠시 후 다시 시도하세요.");
				}
			} else if (selectNo == 4) {
				
			} else if (selectNo == 5) {
				System.out.print("아이디 : ");
				String id = sc.next();
				sc.nextLine();
				System.out.print("비밀번호 : ");
				String pwd = sc.next();
				System.out.print("이름 : ");
				String name = sc.next();
				System.out.print("이메일 : ");
				String email = sc.next();
				Member m = new Member(id, pwd, name, email);
				int res = dao.update(m);
				if(res==1) {
					System.out.println("회원정보가 정상적으로 수정되었습니다.");
				}else {
					System.out.println("회원정보 수정에 실패했습니다. 잠시 후 다시 시도하세요.");
				}
			} else if (selectNo == 6) {
				run = false;
			}
			System.out.println("프로그램 종료");
		}
	}
}
