package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.ArticlefileVO;

public interface ArticlefileDAO {
	public boolean insertArticlefile(ArticlefileVO articlefileVO);
	public boolean updateArticlefile(ArticlefileVO articlefileVO);
	public int deleteArticlefile(ArticlefileVO articlefileVO);
	public List<ArticlefileVO> selectArticlefile(int articleNum);
}
