package kickoff.model.DAO;

import java.util.Map;

import kickoff.model.beans.MemberVO;

public interface MemberDAO {
	public boolean meminsert(MemberVO member);
	public boolean idSearch(String id);
	public String certifyID(Map<String, String> map);
	
	public String accountsId(Map map);
	public String accountsPwd(Map map);
	
	///////////////////////////////////////////////////
	public boolean updateMember(MemberVO member);
	public boolean deleteMember(MemberVO member);
	
	public String memberAddr(MemberVO member); // �ֹ��ϱ⿡�� �ּ� ��� �ö�.
	
	public String searchIdPassword(Map map);
	public boolean updatePassword(MemberVO member);
}
