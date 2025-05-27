package bank;

public class Account {
		private String ano;
		private String owner;
		private int bal;
		
		public String getAno() {
			return ano;
		}
		public void setAno(String ano) {
			this.ano = ano;
		}
		public String getOwner() {
			return owner;
		}
		public void setOwner(String owner) {
			this.owner = owner;
		}
		public int getBal() {
			return bal;
		}
		public void setBal(int bal) {
			this.bal = bal;
		}
		public Account() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Account(String ano, String owner, int bal) {
			super();
			this.ano = ano;
			this.owner = owner;
			this.bal = bal;
		}
		@Override
		public String toString() {
			return String.format("%s\t%s\t%d", ano, owner, bal);
		}
		
		
		
		
	
}
