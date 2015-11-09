package kickoff.model.beans;

public class OrderVO {
	
	private int buyNum;
	private int memberNum;
	private String subname;
	private String subaddr1;
	private String subaddr2;
	private String subphonenum;
	private int price;
	private String Aname;
	private String buyamount;
	private String Asize;
	private int ArticleNum;
	private String buydate;
	private String buyStatus;
	private String sendContent;
	private int sendNum; //택배 no
	private int sendpackage;  //운송장 번호
	
	public OrderVO(){
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getSubaddr1() {
		return subaddr1;
	}

	public void setSubaddr1(String subaddr1) {
		this.subaddr1 = subaddr1;
	}

	public String getSubaddr2() {
		return subaddr2;
	}

	public void setSubaddr2(String subaddr2) {
		this.subaddr2 = subaddr2;
	}

	public String getSubphonenum() {
		return subphonenum;
	}

	public void setSubphonenum(String subphonenum) {
		this.subphonenum = subphonenum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAname() {
		return Aname;
	}

	public void setAname(String aname) {
		Aname = aname;
	}

	public String getBuyamount() {
		return buyamount;
	}

	public void setBuyamount(String buyamount) {
		this.buyamount = buyamount;
	}

	public String getAsize() {
		return Asize;
	}

	public void setAsize(String asize) {
		Asize = asize;
	}

	public int getArticleNum() {
		return ArticleNum;
	}

	public void setArticleNum(int articleNum) {
		ArticleNum = articleNum;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	public String getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}

	public String getSendContent() {
		return sendContent;
	}

	public void setSendContent(String sendContent) {
		this.sendContent = sendContent;
	}

	public int getSendNum() {
		return sendNum;
	}

	public void setSendNum(int sendNum) {
		this.sendNum = sendNum;
	}

	public int getSendpackage() {
		return sendpackage;
	}

	public void setSendpackage(int sendpackage) {
		this.sendpackage = sendpackage;
	}
	
	
}