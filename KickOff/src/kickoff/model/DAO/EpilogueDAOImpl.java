package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.EpilogueVO;

public class EpilogueDAOImpl implements EpilogueDAO{

	@Autowired
	private SqlSession sqlSession;
	
	//���ʷα�(�ı�)����Ʈ
	@Override
	public List<EpilogueVO> EpilogueSelect(Map map) {
		return sqlSession.selectList("epilogue.epilogueSelect",map);
	}

	//���ʷα�(�ı�)�ֱ�
	@Override
	public boolean EpilogueReply(EpilogueVO epilogueVO) {
		int result = sqlSession.insert("epilogue.epilogueInsert", epilogueVO);
		if(result > 0) return true;
		return false;
	}

	//���ʷα�(�ı�)�������� ī��Ʈ
	@Override
	public int EpilogueReplyCount(int articleNum) {
		int count = 0;
		count = sqlSession.selectOne("epilogue.epilogueCount",articleNum);
		return count;
	}

	//���ʷα�(�ı�)���̺� ��� ����
	@Override
	public boolean deleteEpilogueReply(EpilogueVO epilogueVO) {
		int result = sqlSession.delete("epilogue.epilogueDelete", epilogueVO);
		if(result > 0) return true;
		return false;
	}
}
