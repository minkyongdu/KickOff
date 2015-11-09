package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.MemberVO;

public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean meminsert(MemberVO member) {
		int result = sqlSession.insert("member.insertmember", member);
		if(result > 0) return true;
		return false;
	}
	@Override
	public boolean idSearch(String id) {
		List list = sqlSession.selectList("member.searchID", id);
		boolean result = false;
		if(list == null || list.size() == 0)
			{
				result = false;
			}
		else
		{
			result = true;
		}
		return result;
	}
	////////////////////////////////////////////////////
	@Override
	public boolean updateMember(MemberVO member) {
		int result = sqlSession.update("member.updateID", member);
		if(result > 0) return true;
		return false;
	}
	@Override
	public boolean deleteMember(MemberVO member) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public String memberAddr(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String accountsId(Map map) {
		return sqlSession.selectOne("member.accountsID", map);
	}
	@Override
	public String accountsPwd(Map map) {
		return sqlSession.selectOne("member.accountsPwd", map);
	}
	@Override
	public String certifyID(Map map) {
		return sqlSession.selectOne("member.certifyID", map);
	}
}
