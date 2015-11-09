package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.ArticleVO;
import kickoff.model.beans.ArticlefileVO;

public class ArticleDAOImpl implements ArticleDAO{
 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertArticle(ArticleVO articleVO) {
		int result = sqlSession.insert("article.insertArticle", articleVO);
		if(result > 0) return true;
		return false;
	}

	
		// 가격 높은 순으로 정렬
		@Override
		public List<ArticleVO> selectArticleListHigh(int groupNum) {
			return sqlSession.selectList("article.articleHigh", groupNum);
		}

		// 가격 낮은 순으로 정렬
		@Override
		public List<ArticleVO> selectArticleListLow(int groupNum) {
			return sqlSession.selectList("article.articleLow", groupNum);
		}

		// 날짜 최신 순서로 정렬
		@Override
		public List<ArticleVO> selectArtielc(int groupNum) {
			return sqlSession.selectList("article.articleDate", groupNum);
		}

		@Override
		public int selectArticleMax() {
			int max = 0;
			max = sqlSession.selectOne("article.articleMax");
			return max;
		}
		
		@Override
		public ArticleVO articleDetail(int articleNum) {
			return sqlSession.selectOne("article.articleDetailList", articleNum);
		}


		@Override
		public List<ArticleVO> mainArticleList() {
			return sqlSession.selectList("article.articleMain");
		}
}
