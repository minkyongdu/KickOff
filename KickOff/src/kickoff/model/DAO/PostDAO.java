package kickoff.model.DAO;

import java.util.List;

import kickoff.model.beans.PostVO;


public interface PostDAO {
	public List<PostVO> getPost(String address);

}

