package kickoff.model.beans;

public class ReplyVO {
	private int replyNum;
	private String replyid;
	private String replycontent;
	private int writeNum;
	private int boardNum;
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getReplyid() {
		return replyid;
	}
	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public int getWriteNum() {
		return writeNum;
	}
	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
}
