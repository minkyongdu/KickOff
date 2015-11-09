package kickoff.model.DAO;

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

	// �ֹ����̺� �ֱ�
	@Override
	public boolean orderinsert(OrderVO order) {
		int result = sqlSession.insert("order.insertOrder", order);
		if (result > 0)
			return true;
		return false;
	}

	// �ֹ��ÿ� ���� ����
	@Override
	public int updateorder(ArticleSizeAmountVO articleSizeAmountVO) {
		int update = 0;
		update = sqlSession.update("order.updateOrder", articleSizeAmountVO);
		return update;
	}

	// �ֹ��� ���� Ȯ��
	@Override
	public int orderProductCount(Map map) {
		int count = 0;
		count = sqlSession.selectOne("order.selectSizeSelect", map);
		return count;
	}

	// �ֹ� ���� ����Ʈ
	@Override
	public List<OrderVO> orderlist(RowNumVO rownumVO) {
		return sqlSession.selectList("order.selectOrderList", rownumVO);
	}

	// �ֹ�����Ʈ ī��Ʈ
	@Override
	public int orderlistcount() {
		int count = 0;
		count = sqlSession.selectOne("order.OrderCount");
		return count;
	}
}