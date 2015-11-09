package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.ReplyVO;

public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//공지사항 댓글 보기
	@Override
	public List<ReplyVO> NoticeSelect(Map map) {
	
		return sqlSession.selectList("notice.ReplySelect",map);
	}

	//공지사항 댓글 입력
	@Override
	public boolean NoticeReply(ReplyVO replyVO) {
		int result = sqlSession.insert("notice.ReplyInsert", replyVO);
		if(result > 0) return true;
		return false;
	}
	
	//공지사항 댓글 갯수조회
	@Override
	public int NoticeReplyCount(int writeNum) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("notice.ReplyCount",writeNum);
		return count;
	}

	//공지사항 댓글 삭제
	@Override
	public boolean deleteReply(ReplyVO replyVO) {
		int result = sqlSession.delete("notice.ReplyDelete", replyVO);
		if(result > 0) return true;
		return false;
	}

	//공지사항 댓글 삭제(1번 글 삭제시 1번에 해당하는 댓글 삭제)
	@Override
	public int deleteNoticeReply(int writeNum) {
		int num = 0;
		num = sqlSession.delete("notice.ReplyNoticeDelete",writeNum);
		return num;
	}
}
