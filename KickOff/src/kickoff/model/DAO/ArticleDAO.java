package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.ArticleVO;
import kickoff.model.beans.RowNumVO;

public interface ArticleDAO {
	public boolean insertArticle(ArticleVO articleVO);
	public ArticleVO articleDetail(int articleNum);
	public List<ArticleVO> selectArticleListHigh(int groupNum);
	public List<ArticleVO> selectArticleListLow(int groupNum); 
	public List<ArticleVO> selectArtielc(int groupNum);
	public int selectArticleMax();  
	public List<ArticleVO> mainArticleList();
	public boolean updateArticle(ArticleVO articleVO);// 제품 업데이트
	public boolean deleteArticle(ArticleVO articleVO);// 제품 내용삭제
	public List<ArticleVO> companyArticleList(RowNumVO rownumVO);// 회사 등록 물품리스트
	public int companyArticleListCount(int companyNum);//회사 등록제품 리스트 카운트
	public String findCompanyName(int articleNum); // 상품 상세보기에서 만든 회사 보여주기
}
