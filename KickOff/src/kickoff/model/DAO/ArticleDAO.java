package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.ArticleVO;

public interface ArticleDAO {
	public boolean insertArticle(ArticleVO articleVO);
	public ArticleVO articleDetail(int articleNum);
	public List<ArticleVO> selectArticleListHigh(int groupNum);
	public List<ArticleVO> selectArticleListLow(int groupNum); 
	public List<ArticleVO> selectArtielc(int groupNum);
	public int selectArticleMax(); 
	public List<ArticleVO> mainArticleList();
}
