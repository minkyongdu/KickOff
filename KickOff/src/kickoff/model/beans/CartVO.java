package kickoff.model.beans;

public class CartVO {
	
	private int ArticleNum;
	private int price;
	private String Aname;
	private String imgFile1;
	private int companyNum;
	private String asize;
	private int amount;
	public int getArticleNum() {
		return ArticleNum;
	}
	public int getPrice() {
		return price;
	}
	public String getAname() {
		return Aname;
	}
	public String getImgFile1() {
		return imgFile1;
	}
	public int getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(int companyNum) {
		this.companyNum = companyNum;
	}
	public String getAsize() {
		return asize;
	}
	public int getAmount() {
		return amount;
	}
	public void setArticleNum(int articleNum) {
		ArticleNum = articleNum;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setAname(String aname) {
		Aname = aname;
	}
	public void setImgFile1(String imgFile1) {
		this.imgFile1 = imgFile1;
	}
	public void setAsize(String asize) {
		this.asize = asize;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	
	
}
