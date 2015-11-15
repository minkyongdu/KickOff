package kickoff.model.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.ArticleSizeAmountVO;
import kickoff.model.beans.OrderVO;
import kickoff.model.beans.RowNumVO;

public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	// 주문 테이블에 넣기
	@Override
	public boolean orderinsert(OrderVO order) {
		int result = sqlSession.insert("order.insertOrder", order);
		if (result > 0)
			return true;
		return false;
	}

	// 주문시에 수량 감소
	@Override
	public int updateorder(ArticleSizeAmountVO articleSizeAmountVO) {
		int update = 0;
		update = sqlSession.update("order.updateOrder", articleSizeAmountVO);
		return update;
	}

	// 주문시 수량 확인
	@Override
	public int orderProductCount(Map map) {
		int count = 0;
		count = sqlSession.selectOne("order.selectSizeSelect", map);
		return count;
	}

	
	
	// 주문 관리 리스트(추가)
	@Override
	public List<OrderVO> orderlist(RowNumVO rownumVO) {
		return sqlSession.selectList("order.selectOrderList", rownumVO);
	}

	// 주문리스트 카운트(추가)
	@Override
	public int orderlistcount() {
		int count = 0;
		count = sqlSession.selectOne("order.OrderCount");
		return count;
	}

	//개인주문 리스트(추가)
	@Override
	public List<OrderVO> buylist(String id ) {
		return sqlSession.selectList("order.selectOrderMember", id);
	}

	//주문상태 업데이트(추가)
	@Override
	public int updateBuyStatus(OrderVO orderVO) {
		int update = 0;
		update = sqlSession.update("order.StatusOrderUpdate",orderVO);
		return update;
	}
	
	//컴퍼니별 리스트(추가)
	   @Override
	   public List<OrderVO> companylist(RowNumVO rownumVO) {
	      return sqlSession.selectList("order.selectOrderCompany", rownumVO);
	   }

	@Override
	public List<OrderVO> selectbuyID(int buyNum) {
		return sqlSession.selectList("order.selectbuyID", buyNum);
	}

	@Override
	public List<OrderVO> selectOrderMemberPage(Map map) {
		return sqlSession.selectList("order.selectOrderMemberPage",map);
	}

	@Override
	public int orderMemberlistcount(String id) {
		int count = 0;
		count = sqlSession.selectOne("order.OrderMemberCount", id);
		return count;
	}

	@Override
	public int updateSendpackage(OrderVO orderVO) {
		int result = 0;
		result = sqlSession.update("order.SendpackageUpdate", orderVO);
		return result;
	}

	@Override
	public int existbuyOrder(Map map) {
		int result = 0;
		result = sqlSession.selectOne("order.existbuyOrder", map);
		return result;
	}
	   
}