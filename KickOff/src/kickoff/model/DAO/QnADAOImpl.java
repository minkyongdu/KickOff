package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.RowNumVO;

public class QnADAOImpl implements QnADAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean qnainsert(QnAVO qnaVO) {
		int result = sqlSession.insert("qna.qnainsert",qnaVO);
		if(result > 0) return true;
		return false;
	}

	@Override
	public List<QnAVO> qnalistAll(RowNumVO rowNumVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qna.qnaselectAll",rowNumVO);
	}

	@Override
	public QnAVO qnaDetail(int qnano) {
		return sqlSession.selectOne("qna.qnaDetail", qnano);
	}

	@Override
	public int qnaCount() {
		int count = 0;
		count = sqlSession.selectOne("qna.qnaCount");
		return count;
	}

	@Override
	public int qnaUpdate(QnAVO qnaVO) {
		int update = 0;
		update = sqlSession.update("qna.qnaUpdate", qnaVO);
		return update;
	}

	@Override
	public int qnaDelete(QnAVO qnaVO) {
		int del = 0;
		del = sqlSession.delete("qna.qnaDelete", qnaVO);
		return del;
	}

	@Override
	public boolean plusHit(int qnano) {
		int result = sqlSession.update("qna.plusHit",qnano);
		if(result > 0) return true;
		return false;
	}

	@Override
	public boolean minusHit(int qnano) {
		int result = sqlSession.update("qna.minusHit",qnano);
		if(result > 0) return true;
		return false;
	}
	@Override
	public boolean deleteQnAboard(String id) {
		int result = sqlSession.delete("qna.QnADeleteID",id);
		if(result > 0)return true;
		return false;
	}
}
