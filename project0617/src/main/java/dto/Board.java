package dto;

import java.sql.Date;

public class Board {
	private String num;
	private String title;
	private String content;
	private String id;
	private Date postDate;
	private int viewCnt;
	private String name;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Board(String title, String content, String id) {
		super();
		this.title = title;
		this.content = content;
		this.id = id;
	}
	public Board(String num, String title, String content, String id) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
	}
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Board [num=" + num + ", title=" + title + ", content=" + content + ", id=" + id + ", postDate="
				+ postDate + ", viewCnt=" + viewCnt + ", name=" + name + "]";
	}
	
	
	
	
	
}
