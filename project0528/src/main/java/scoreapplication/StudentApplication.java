package scoreapplication;

import java.util.Scanner;

public class StudentApplication {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		boolean run = true;		
		while(run) {
			System.out.println("----------------------------------------------------------");
			System.out.println("1.학생입력| 2.전체학생정보조회 | 3.국,영,수 합/평균 조회 | 4.학생삭제 | 5.종료");
			System.out.println("----------------------------------------------------------");
			System.out.print("선택> ");
			
			int selectNo = sc.nextInt();
			sc.nextLine();
			
			if(selectNo == 1) {		

			}else if(selectNo == 2) {
	
			}else if(selectNo == 3) {

			}else if(selectNo == 4) {

			}else{
				run = false;
			}
		}
	}

}