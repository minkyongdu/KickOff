package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> NoticeSelect(Map map);  //공지사항 댓글 보기
	public boolean NoticeReply(ReplyVO replyVO); //공지사항 댓글 입력
	public int NoticeReplyCount(int writeNum); //공지사항 댓글 갯수 확인  
	public boolean deleteReply(ReplyVO replyVO); //공지사항 댓글 삭제
	public int deleteNoticeReply(int writeNum); //공지사항 댓글 삭제
}
