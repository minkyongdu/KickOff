package kickoff.model.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kickoff.model.beans.CompanyVO;

public class CompanyDAOImpl implements CompanyDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean insertCompany(CompanyVO company) {
		int result = sqlSession.insert("company.insertCom", company);
		if(result > 0) return true;
		return false;
	}

	@Override
	public boolean comidSearch(String id) {
		List list = sqlSession.selectList("company.comsearchID", id);
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

	@Override
	public boolean comidUpdate(CompanyVO company) {
		int result = sqlSession.update("company.updateComID", company);
		if(result > 0) return true;
		return false;
	}

	@Override
	public String certifyComID(Map map) {
		return sqlSession.selectOne("company.certifyComID", map);
	}
	
	
}
