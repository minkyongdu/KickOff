package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import kickoff.model.beans.ArticleSizeAmountVO;
import kickoff.model.beans.OrderVO;
import kickoff.model.beans.RowNumVO;

public interface OrderDAO {
	
	public boolean orderinsert(OrderVO order);//주문하기
	public int orderProductCount(Map map); //주문 수량 갯수 확인
	public int updateorder(ArticleSizeAmountVO articleSizeAmountVO);// 주문수량 제외 업데이트
	public List<OrderVO> orderlist(RowNumVO rownumVO); //주문 관리 리스트
	public int orderlistcount(); //주문 갯수 조회
}
