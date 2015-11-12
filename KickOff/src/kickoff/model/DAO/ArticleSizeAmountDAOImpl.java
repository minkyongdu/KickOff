package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.ArticleSizeAmountVO;

public class ArticleSizeAmountDAOImpl implements ArticleSizeAmountDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertSizeAmount(ArticleSizeAmountVO articleSizeAmount) {
		int result = sqlSession.insert("article.insertSizeAmount", articleSizeAmount);
		if(result > 0) return true;
		return false;
	}

	@Override
	public List<ArticleSizeAmountVO> selectArticleList(int articleNum) {
		return sqlSession.selectList("article.articleDetailList1",articleNum);
		
	}

	@Override
	public boolean updateSizeAmount(ArticleSizeAmountVO articleSizeAmountVO) {
		int update = sqlSession.update("article.updateArticleSize", articleSizeAmountVO);
		if(update > 0) return true;
		return false;
	}

	@Override
	public boolean deleteSizeAmount(ArticleSizeAmountVO articleSizeAmountVO) {
		int delete = sqlSession.delete("article.deleteArticleSize", articleSizeAmountVO);
		if(delete > 0) return true;
		return false;
	}
}

