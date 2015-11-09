package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.EventBoardVO;
import kickoff.model.beans.RowNumVO;
 

public interface EventBoardDAO {
	public boolean eventinsert(EventBoardVO eventboardVO); // 이벤트 게시판 글 입력
	public List<EventBoardVO> eventListAll(RowNumVO rowNumVO); //공지사항 글 리스트
	public int eventCount(); //이벤트 게시판  글 갯수 조회 
	public EventBoardVO eventDetail(int eventno); // 이벤트 상세보기
	public int eventUpdate(EventBoardVO eventboardVO); //이벤트 글 수정
	public int eventDelete(EventBoardVO eventboardVO); //이벤트 글 삭제
}
