package controller;

import java.util.ArrayList;
import java.util.Scanner;

import dao.BoardDao;
import dto.Board;

public class BoardApplication {
	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		while (run) {
			System.out.println("----------------------------------------------------------");
			System.out.println("1.글작성 | 2.글목록 | 3.글수정 | 4.글삭제 | 5.종료");
			System.out.println("----------------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = sc.nextInt();
			sc.nextLine();
			
			if (selectNo == 1) {
				System.out.print("작성자 : ");
				String writer = sc.next();
				sc.nextLine();
				System.out.print("제목 : ");
				String title = sc.next();
				System.out.print("내용 : ");
				String content = sc.nextLine();
				Board b = new Board(title, content, writer);
				int res = dao.insert(b);
				if(res==1) {
					System.out.println("글이 정상적으로 등록되었습니다.");
				}else {
					System.out.println("글 작성을 실패하였습니다. 잠시 후 다시 시도하세요.");
				}
				
			} else if (selectNo == 2) {
				ArrayList<Board> blist = dao.selectList();
				for(Board b : blist) {
					System.out.println(b);
				}
			} else if (selectNo == 3) {
				System.out.print("번호 : ");
				int num = sc.nextInt();
				sc.nextLine();
				System.out.print("작성자 : ");
				String writer = sc.next();
				sc.nextLine();
				System.out.print("제목 : ");
				String title = sc.nextLine();
				System.out.print("내용 : ");
				String content = sc.nextLine();
				Board b = new Board(num, title, content, writer);
				int res = dao.update(b);
				if(res==1) {
					System.out.println("글이 정상적으로 수정되었습니다.");
				}else {
					System.out.println("글 수정에 실패했습니다. 잠시 후 다시 시도하세요.");
				}
			} else if(selectNo == 4) {
				System.out.print("번호 : ");
				int num = sc.nextInt();
				sc.nextLine();
				int res = dao.delete(num);
				if(res==1) {
					System.out.println("글이 정상적으로 삭제되었습니다.");
				}else {
					System.out.println("글 삭제에 실패했습니다. 잠시후 다시 시도 부탁드립니다.");
				}
			} else if(selectNo == 5) {
				run = false;
			}
		}
		System.out.println("프로그램 종료");
	}
}
