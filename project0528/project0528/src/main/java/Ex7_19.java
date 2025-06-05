
public class Ex7_19 {
	public static void main(String[] args) {
		Buyer b = new Buyer();
		b.buy(new Tv());
		b.buy(new Computer());
		b.buy(new Tv());
		b.buy(new Audio());
		b.buy(new Computer());
		b.buy(new Computer());
		b.buy(new Computer());

		b.summary();
	}
}

class Buyer {
	int money = 1000;
	Product[] cart = new Product[3];
	int i = 0;

	void buy(Product p) {
		if (money < p.price) {
			System.out.println("잔액이 부족하여 " + p.toString() + "를 구매할 수 없습니다.");
			return;
		}
		money = money - p.price;
		add(p);
	}

	void add(Product p) {
		if (i > cart.length) {
			Product[] tmp = new Product[cart.length * 2];
			System.arraycopy(cart, 0, tmp, 0, cart.length);
			cart = tmp;
		}
		cart[i] = p;
		i++;
	}

	void summary() {
		String list = "";
		int m = 0;
		for (int i = 0; i < cart.length; i++) {
			if (cart != null) {
				list = list + cart[i].toString() + " , ";
				m += cart[i].price;
			}
		}
		System.out.println("구입한 물건 : " + list);
		System.out.println("사용한 금액 : " + m);
		System.out.println("남은 금액 : " + money);
	}
}

class Product {
	int price;

	Product(int price) {
		this.price = price;
	}
}

class Tv extends Product {
	Tv() {
		super(100);
	}

	public String toString() {
		return "Tv";
	}
}

class Computer extends Product {
	Computer() {
		super(200);
	}

	public String toString() {
		return "Computer";
	}
}

class Audio extends Product {
	Audio() {
		super(50);
	}

	public String toString() {
		return "Audio";
	}
}
