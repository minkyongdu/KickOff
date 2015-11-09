package kickoff.model.DAO;

import java.util.Map;

import kickoff.model.beans.CompanyVO;

public interface CompanyDAO {
	public boolean insertCompany(CompanyVO company);
	public boolean comidSearch(String id);
	public boolean comidUpdate(CompanyVO company);
	public String certifyComID(Map map);
}
