package kickoff.model.DAO;

import java.util.List;

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
	//제품 파일 업데이트
		@Override
		public boolean updateArticlefile(ArticlefileVO articlefileVO) {
			int update = sqlSession.update("article.updateArticleFile", articlefileVO);
			if(update > 0)return true;
			return false;
		}

		//제품 파일 삭제
		@Override
		public int deleteArticlefile(ArticlefileVO articlefileVO) {
			int delete = 0;
			delete = sqlSession.delete("article.deleteArticleFile",articlefileVO);
			return delete;
		}

		@Override
		public List<ArticlefileVO> selectArticlefile(int articleNum) {
			return sqlSession.selectOne("article.selectCompanyimgFile", articleNum);
		}
	
}	
