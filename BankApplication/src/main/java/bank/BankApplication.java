package bank;

import java.util.Scanner;

public class BankApplication {
	private static Account[] accountArray = new Account[100];
	private static Scanner sc = new Scanner(System.in);
	private static int cnt = 0;

	public static void main(String[] args) {
		boolean run = true;
		while (run) {
			System.out.println("----------------------------------------------------------");
			System.out.println("1.계좌생성 | 2.계좌목록 | 3.예금 | 4.출금 | 5.종료");
			System.out.println("----------------------------------------------------------");
			System.out.print("선택> ");

			int selectNo = sc.nextInt();

			if (selectNo == 1) {
				createAccount();
			} else if (selectNo == 2) {
				accountList();
			} else if (selectNo == 3) {
				deposit();
			} else if (selectNo == 4) {
				withdraw();
			} else if (selectNo == 5) {
				run = false;
			}
		}
		System.out.println("프로그램 종료");
	}

	private static void createAccount() {
		System.out.print("계좌번호 : ");
		String ano = sc.next();
		System.out.print("계좌주 : ");
		String owner = sc.next();
		System.out.print("초기입금액 : ");
		int bal = sc.nextInt();
		accountArray[cnt] = new Account(ano, owner, bal);
		cnt++;
		System.out.println("성공적으로 계좌가 생성되었습니다.");
	}

	private static void accountList() {
		for (int i = 0; i < cnt; i++) {
			System.out.println(accountArray[i]);
		}
	}

	private static void deposit() {
		System.out.print("계좌번호 : ");
		String ano = sc.next();
		Account ac = findAccount(ano);
		if (ac == null) {
			System.out.println("입력을 다시 확인해주세요.");
			return;
		}
		System.out.print("예금액 : ");
		int n = sc.nextInt();
		ac.setBal(ac.getBal() + n);
		System.out.println("예금이 완료되었습니다.");
	}

	private static void withdraw() {
		System.out.print("계좌번호 : ");
		String ano = sc.next();
		Account ac = findAccount(ano);
		if (ac == null) {
			System.out.println("입력을 다시 확인해주세요.");
			return;
		}
		System.out.print("출금액 : ");
		int n = sc.nextInt();
		ac.setBal(ac.getBal() - n);
		System.out.println("출금이 완료되었습니다.");
	}

	private static Account findAccount(String ano) {
		for (int i = 0; i < cnt; i++) {
			if (accountArray[i].getAno().equals(ano)) {
				return accountArray[i];
			}
		}
		return null;
	}
}