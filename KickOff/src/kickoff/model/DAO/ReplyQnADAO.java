package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.ReplyQnAVO;
import kickoff.model.beans.ReplyVO;

public interface ReplyQnADAO {
	public List<ReplyQnAVO> QnASelect(Map map);  //QnA 댓글 보기
	public boolean QnAReply(ReplyVO replyVO); //QnA 댓글 입력
	public int QnAReplyCount(int writeNum); //QnA 댓글 갯수 확인  
	public boolean QnAdeleteReply(ReplyVO replyVO); //QnA 댓글 삭제
	public int QnAdeleteNoticeReply(int writeNum); //QnA 댓글 삭제
	public boolean deleteQnAReplyID(String id); // QnA 댓글 아이디 삭제
}
