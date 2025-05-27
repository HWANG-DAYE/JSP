package dto;

import java.util.Date;

public class Board {
	private int num;
	private String title;
	private String content;
	private Date regDate;
	private String writer;
	
	//1) getter, setter
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	// 2) 생성자 - 기본생성자, insert, update
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Board(String title, String content, String writer) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	// 3) tostring()
	@Override
	public String toString() {
		return "Board [num=" + num + ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", writer="
				+ writer + "]";
	}
	public Board(int num, String title, String content, String writer) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	
	
	
}
