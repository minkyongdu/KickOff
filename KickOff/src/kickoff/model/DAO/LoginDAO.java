package kickoff.model.DAO;

import kickoff.model.beans.CompanyVO;
import kickoff.model.beans.MemberVO;

public interface LoginDAO {
	public MemberVO findByUserIdAndPassword(String id, String password);
	public CompanyVO findByComUserIdAndPassword(String comid, String compassword);
}
