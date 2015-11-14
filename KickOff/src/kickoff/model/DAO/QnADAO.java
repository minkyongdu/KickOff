package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.QnAVO;
import kickoff.model.beans.RowNumVO;

public interface QnADAO {
	public boolean qnainsert(QnAVO qnaVO); //공지사항 글 입력
	public List<QnAVO> qnalistAll(RowNumVO rowNumVO); //공지사항 글 리스트
	public QnAVO qnaDetail(int qnano); //공지사항 글 상세보기 
	public int qnaCount(); //공지사항 글 갯수 조회 
	public int qnaUpdate(QnAVO qnaVO); //공지사항 글 수정
	public int qnaDelete(QnAVO qnaVO); //공지사항 글 삭제
	public boolean plusHit(int qnano); // 글 상세보기시 조회수 증가
	public boolean minusHit(int qnano); // 글 수정시 조회수 감소
	public boolean deleteQnAboard(String id); // QnA게시판 아이디 삭제
}
