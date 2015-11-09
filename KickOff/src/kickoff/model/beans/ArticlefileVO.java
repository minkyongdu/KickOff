package kickoff.model.beans;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ArticlefileVO {
	private int ArticleNum;
	private String imgFile1;
	private String imgFile2;
	private String imgFile3;
	private String imgFile4;
	private String imgFile5;
	private List<MultipartFile> files;
	
	public ArticlefileVO() {
		// TODO Auto-generated constructor stub
	}
	public int getArticleNum() {
		return ArticleNum;
	}
	public void setArticleNum(int articleNum) {
		ArticleNum = articleNum;
	}
	public String getImgFile1() {
		return imgFile1;
	}
	public void setImgFile1(String imgFile1) {
		this.imgFile1 = imgFile1;
	}
	public String getImgFile2() {
		return imgFile2;
	}
	public void setImgFile2(String imgFile2) {
		this.imgFile2 = imgFile2;
	}
	public String getImgFile3() {
		return imgFile3;
	}
	public void setImgFile3(String imgFile3) {
		this.imgFile3 = imgFile3;
	}
	public String getImgFile4() {
		return imgFile4;
	}
	public void setImgFile4(String imgFile4) {
		this.imgFile4 = imgFile4;
	}
	public String getImgFile5() {
		return imgFile5;
	}
	public void setImgFile5(String imgFile5) {
		this.imgFile5 = imgFile5;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
}
