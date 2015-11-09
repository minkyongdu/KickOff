package kickoff.model.DAO;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.CompanyVO;
import kickoff.model.beans.MemberVO;

public class LoginDAOImpl implements LoginDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberVO findByUserIdAndPassword(String id, String password) {
		Map<String, String> paramMap = new HashMap<String, String>();
        paramMap.put("id", id);
        paramMap.put("password", password);

        return (MemberVO) sqlSession.selectOne("member.selectLoginUser", paramMap);
        }

	@Override
	public CompanyVO findByComUserIdAndPassword(String comid, String compassword) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", comid);
		paramMap.put("password", compassword);
		return (CompanyVO) sqlSession.selectOne("company.selectLoginComUser",paramMap);
	}
}
