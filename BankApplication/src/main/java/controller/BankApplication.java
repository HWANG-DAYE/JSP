package controller;

import java.util.ArrayList;
import java.util.Scanner;

import bank.Account;
import dao.AccountDao;

public class BankApplication {
	public static void main(String[] args) {
		AccountDao dao = new AccountDao();
		Scanner sc = new Scanner(System.in);
		boolean run = true;
		while (run) {
			System.out.println("----------------------------------------------------------");
			System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
			System.out.println("----------------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = sc.nextInt();

			if (selectNo == 1) {
				System.out.print("계좌번호 : ");
				String ano = sc.next();
				System.out.print("계좌주 : ");
				String owner = sc.next();
				System.out.print("초기입금액 : ");
				int bal = sc.nextInt();
				Account ac = new Account(ano, owner, bal);
				int res = dao.insert(ac);
				if(res==1) {
					System.out.println("정상적으로 등록되었습니다.");
				}else {
					System.out.println("잠시 후 다시 시도하십시오.");
				}
			} else if (selectNo == 2) {
				ArrayList<Account> alist = dao.selectList();
				for(Account ac : alist) {
					System.out.println(ac);
				}
			} else if (selectNo == 3) {
				System.out.print("계좌번호 : ");
				String ano = sc.next();
				Account ac = dao.select(ano);
				if(ac==null) {
					System.out.println("등록된 회원 정보가 없습니다.");
					continue;
				}
				System.out.println("예금액 : ");
				int n = sc.nextInt();
				ac.setBal(ac.getBal()+n);
				int res = dao.update(ac);
				if(res==1) {
					System.out.println("정상적으로 예금되었습니다.");
				}else {
					System.out.println("잠시 후 다시 시도하십시오.");
				}
				
			} else if (selectNo == 4) {
				System.out.print("계좌번호 : ");
				String ano = sc.next();
				Account ac = dao.select(ano);
				if(ac==null) {
					System.out.println("등록된 회원 정보가 없습니다.");
					continue;
				}
				System.out.println("출금액 : ");
				int n = sc.nextInt();
				ac.setBal(ac.getBal()-n);
				int res = dao.update(ac);
				if(res==1) {
					System.out.println("정상적으로 출금되었습니다.");
				}else {
					System.out.println("잠시 후 다시 시도하십시오.");
				}
			} else if (selectNo == 5) {
				run = false;
			}
		}
		System.out.println("프로그램 종료");
	}
	

}