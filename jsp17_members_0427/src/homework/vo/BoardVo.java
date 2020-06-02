package homework.vo;

import java.sql.Date;

public class BoardVo {

	int num;
	String title;
	String writer;
	String content;
	Date regdate;
	String email;

	public BoardVo() {}//디폴트 생성자
	
	public BoardVo(int num, String title, String writer, String content, Date regdate, String email) {
		super(); //부모클래스의 생성자를 생성해라
		this.num=num;
		this.title=title;
		this.writer=writer;
		this.content=content;
		this.regdate=regdate;
		this.email=email;
	}
	
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
