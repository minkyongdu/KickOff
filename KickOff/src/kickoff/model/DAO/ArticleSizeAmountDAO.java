package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import kickoff.model.beans.ArticleSizeAmountVO;

public interface ArticleSizeAmountDAO {
	public boolean insertSizeAmount(ArticleSizeAmountVO articleSizeAmount);
	public List<ArticleSizeAmountVO> selectArticleList(int articleNum);
	public boolean updateSizeAmount(ArticleSizeAmountVO articleSizeAmountVO);
	public boolean deleteSizeAmount(ArticleSizeAmountVO articleSizeAmountVO);
}
