package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.ReplyQnAVO;
import kickoff.model.beans.ReplyVO;

public class ReplyQnADAOImpl implements ReplyQnADAO{
	@Autowired
	private SqlSession sqlSession;
	
	//QnA 댓글 보기
	@Override
	public List<ReplyQnAVO> QnASelect(Map map) {
		return sqlSession.selectList("qna.ReplySelect",map);
	}
	//QnA 댓글 입력
	@Override
	public boolean QnAReply(ReplyVO replyVO) {
		int result = sqlSession.insert("qna.ReplyInsert", replyVO);
		if(result > 0) return true;
		return false;
	}
	//QnA 댓글 갯수조회
	@Override
	public int QnAReplyCount(int writeNum) {
		// TODO Auto-generated method stub
				int count = 0;
				count = sqlSession.selectOne("qna.ReplyCount",writeNum);
				return count;
	}
	//QnA 댓글 삭제
	@Override
	public boolean QnAdeleteReply(ReplyVO replyVO) {
		int result = sqlSession.delete("qna.ReplyDelete", replyVO);
		if(result > 0) return true;
		return false;
	}
	//QnA 댓글 삭제(1번 글 삭제시 1번에 해당하는 댓글 삭제)
	@Override
	public int QnAdeleteNoticeReply(int writeNum) {
		int num = 0;
		num = sqlSession.delete("qna.ReplyQnADelete",writeNum);
		return num;
	}
	@Override
	public boolean deleteQnAReplyID(String id) {
		int result = sqlSession.delete("qna.ReplyQnADeleteID", id);
		if(result > 0) return true;
		return false;
	}
}	