package dto;

import java.util.Date;

public class Comment {
	private String cno;
	private String bno;
	private String comment;
	private String commenter;
	private Date regDate;
	public Comment(String cno, String bno, String comment, String commenter) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.comment = comment;
		this.commenter = commenter;
	}
	public Comment(String bno, String comment, String commenter) {
		super();
		this.bno = bno;
		this.comment = comment;
		this.commenter = commenter;
	}
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCno() {
		return cno;
	}
	public void setCno(String cno) {
		this.cno = cno;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Comment [cno=" + cno + ", bno=" + bno + ", comment=" + comment + ", commenter=" + commenter
				+ ", regDate=" + regDate + "]";
	}
	
	
}
