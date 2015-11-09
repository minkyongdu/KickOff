package kickoff.model.beans;

public class MemberVO {
	   private int memberNum;
	   private String id;
	   private String password;
	   private String name;
	   private String birthday;
	   private String addr1;
	   private String addr2;
	   private String phonenum;
	   private String email;
	   
	   private int memGrade;
	   private String joindate;
	   private String pwdQ;
	   private String pwdA;
	 
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}   
	 	   
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMemGrade() {
		return memGrade;
	}
	public void setMemGrade(int memGrade) {
		this.memGrade = memGrade;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getPwdQ() {
		return pwdQ;
	}
	public void setPwdQ(String pwdQ) {
		this.pwdQ = pwdQ;
	}
	public String getPwdA() {
		return pwdA;
	}
	public void setPwdA(String pwdA) {
		this.pwdA = pwdA;
	}
}
