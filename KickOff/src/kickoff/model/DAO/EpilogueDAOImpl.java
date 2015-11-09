package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.EpilogueVO;

public class EpilogueDAOImpl implements EpilogueDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//에필로그(후기)리스트
	@Override
	public List<EpilogueVO> EpilogueSelect(Map map) {
		return sqlSession.selectList("epilogue.epilogueSelect",map);
	}

	//에필로그(후기)넣기
	@Override
	public boolean EpilogueReply(EpilogueVO epilogueVO) {
		int result = sqlSession.insert("epilogue.epilogueInsert", epilogueVO);
		if(result > 0) return true;
		return false;
	}

	//에필로그(후기)페이지별 카운트
	@Override
	public int EpilogueReplyCount(int articleNum) {
		int count = 0;
		count = sqlSession.selectOne("epilogue.epilogueCount",articleNum);
		return count;
	}

	//에필로그(후기)테이블별 댓글 삭제
	@Override
	public boolean deleteEpilogueReply(EpilogueVO epilogueVO) {
		int result = sqlSession.delete("epilogue.epilogueDelete", epilogueVO);
		if(result > 0) return true;
		return false;
	}
}
