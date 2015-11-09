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
	
	//�������� ��� ����
	@Override
	public List<ReplyVO> NoticeSelect(Map map) {
	
		return sqlSession.selectList("notice.ReplySelect",map);
	}

	//�������� ��� �Է�
	@Override
	public boolean NoticeReply(ReplyVO replyVO) {
		int result = sqlSession.insert("notice.ReplyInsert", replyVO);
		if(result > 0) return true;
		return false;
	}
	
	//�������� ��� ������ȸ
	@Override
	public int NoticeReplyCount(int writeNum) {
		// TODO Auto-generated method stub
		int count = 0;
		count = sqlSession.selectOne("notice.ReplyCount",writeNum);
		return count;
	}

	//�������� ��� ����
	@Override
	public boolean deleteReply(ReplyVO replyVO) {
		int result = sqlSession.delete("notice.ReplyDelete", replyVO);
		if(result > 0) return true;
		return false;
	}

	//�������� ��� ����(1�� �� ������ 1���� �ش��ϴ� ��� ����)
	@Override
	public int deleteNoticeReply(int writeNum) {
		int num = 0;
		num = sqlSession.delete("notice.ReplyNoticeDelete",writeNum);
		return num;
	}
}
