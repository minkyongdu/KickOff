package kickoff.model.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.ArticlefileVO;

public class ArticlefileDAOImpl implements ArticlefileDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertArticlefile(ArticlefileVO articlefileVO) {
		int result = sqlSession.insert("article.insertArticleFile", articlefileVO);
		if(result > 0) return true;
		return false;
	}
	
}	
