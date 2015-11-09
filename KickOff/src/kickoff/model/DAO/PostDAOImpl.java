package kickoff.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.PostVO;

public class PostDAOImpl implements PostDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<PostVO> getPost(String address) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("post.getPost",address);
	}

}
