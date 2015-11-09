package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.EventBoardVO;
import kickoff.model.beans.RowNumVO;

public class EventBoardDAOImpl implements EventBoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean eventinsert(EventBoardVO eventboardVO) {
		int result = sqlSession.insert("eventBoard.eventInsert", eventboardVO);
		if(result > 0) return true;
		return false;
	}
	
	@Override
	public List<EventBoardVO> eventListAll(RowNumVO rowNumVO) {
		return sqlSession.selectList("eventBoard.eventselectAll",rowNumVO);
	}

	@Override
	public int eventCount() {
		int count = 0;
		count = sqlSession.selectOne("eventBoard.eventCount");
		return count;
	}

	@Override
	public EventBoardVO eventDetail(int eventno) {
		return sqlSession.selectOne("eventBoard.eventDetail", eventno);
	}

	@Override
	public int eventUpdate(EventBoardVO eventboardVO) {
		int update = 0;
		update = sqlSession.update("eventBoard.eventUpdate", eventboardVO);
		return update;
	}

	@Override
	public int eventDelete(EventBoardVO eventboardVO) {
		int del = 0;
		del = sqlSession.delete("eventBoard.eventDelete", eventboardVO);
		return del;
	}
	

}
