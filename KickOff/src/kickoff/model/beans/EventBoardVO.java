package kickoff.model.beans;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventBoardVO {
	
	private int eventno;
	private String title;
	private String contents;
	private String fileName;
	private String fileName2;
	private String fileName3;
	private String writer;
	private int hit;
	private String eventDate;
	private int boardNum;
	private List<MultipartFile> files;
	
	public EventBoardVO() {
		// TODO Auto-generated constructor stub
	}
	public int getEventno() {
		return eventno;
	}
	public void setEventno(int eventno) {
		this.eventno = eventno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getFileName3() {
		return fileName3;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
}
