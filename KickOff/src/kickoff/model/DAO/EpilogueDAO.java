package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import kickoff.model.beans.ArticleVO;
import kickoff.model.beans.EpilogueVO;

public interface EpilogueDAO {
	
	public List<EpilogueVO> EpilogueSelect(Map map);  //에필로그(후기)댓글 보기
	public boolean EpilogueReply(EpilogueVO epilogueVO); //에필로그(후기)댓글 입력
	public int EpilogueReplyCount(int articleNum); //에필로그(후기)댓글 갯수 확인 
	public boolean deleteEpilogueReply(EpilogueVO epilogueVO); //에필로그(후기)게시판별 개인 댓글 삭제
	public boolean deleteArticleReply(ArticleVO articleVO);// 에필로그 게시판별 삭제
}
