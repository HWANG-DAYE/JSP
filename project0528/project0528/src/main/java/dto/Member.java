package dto;

import java.util.Date;

public class Member {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date regDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String id, String pwd, String name, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
	}
	@Override
	public String toString() {
		return String.format("%s\t%s\t%s\t%s\t%s", id, pwd, name, email, regDate.toString());
	}
	
	
}
