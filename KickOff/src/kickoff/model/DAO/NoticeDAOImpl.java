package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.RowNumVO;

public class NoticeDAOImpl implements NoticeDAO{
	
	@Autowired
	private SqlSession sqlSession;

	//공지사항 글 입력
		@Override
		public boolean noticeinsert(NoticeVO noticeVO) {
			int result = sqlSession.insert("notice.noticeinsert", noticeVO);
			if(result > 0) return true;
			return false;
		}
		
		//공지사항 글 상세보기
		@Override
		public NoticeVO noticeDetail(int noticeno) {
			return sqlSession.selectOne("notice.noticeDetail", noticeno);
		}
		
		//공지사항 글 리스트
		@Override
		public List<NoticeVO> noticelistAll(RowNumVO rowNumVO) {
			// TODO Auto-generated method stub
			return sqlSession.selectList("notice.noticeselectAll",rowNumVO);
		}
		
		//공지사항 글 갯수 조회
		@Override
		public int noticeCount() {
			int count = 0;
			count = sqlSession.selectOne("notice.noticeCount");
			return count;
		}
		
		//공지사항 글 수정
		@Override
		public int noticeUpdate(NoticeVO noticeVO) {
			int update = 0;
			update = sqlSession.update("notice.noticeUpdate", noticeVO);
			return update;
		}
		
		//공지사항 글 삭제
		@Override
		public int deleteNotice(NoticeVO noticeVO) {
			// TODO Auto-generated method stub
			int del = 0;
			del = sqlSession.delete("notice.deleteNotice", noticeVO);
			return del;
		}

		@Override
		public boolean plusHit(int noticeno) {
			int result = sqlSession.update("notice.plusHit",noticeno);
			if(result > 0) return true;
			return false;
		}

		@Override
		public boolean minusHit(int noticeno) {
			int result = sqlSession.update("notice.minusHit",noticeno);
			if(result > 0) return true;
			return false;
		}
		
}
