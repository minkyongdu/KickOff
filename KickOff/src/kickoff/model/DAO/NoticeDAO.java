package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.RowNumVO;

public interface NoticeDAO {
	public boolean noticeinsert(NoticeVO noticeVO); //공지사항 글 입력
	public List<NoticeVO> noticelistAll(RowNumVO rowNumVO); //공지사항 글 리스트
	public NoticeVO noticeDetail(int noticeno); //공지사항 글 상세보기 
	public int noticeCount(); //공지사항 글 갯수 조회 
	public int noticeUpdate(NoticeVO noticeVO); //공지사항 글 수정
	public int deleteNotice(NoticeVO noticeVO); //공지사항 글 삭제
	public boolean plusHit(int noticeno);
	public boolean minusHit(int noticeno);
}
