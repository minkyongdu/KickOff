package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.ArticlegroupVO;

public class ArticlegroupDAOImpl implements ArticlegroupDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ArticlegroupVO> selectListgroup() {
		return sqlSession.selectList("article.articleListGroup");
	}
	
}
