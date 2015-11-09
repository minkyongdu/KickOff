package kickoff.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kickoff.model.DAO.EpilogueDAO;
import kickoff.model.beans.EpilogueVO;

@Controller
public class EpilogueController {
	
	@Autowired
	private EpilogueDAO epilogueDAO;
	
	@RequestMapping(value = "epilogueReply", method = RequestMethod.POST)
	public String epilogueReplyinsert(EpilogueVO epilogueVO, HttpServletRequest req) {
		epilogueDAO.EpilogueReply(epilogueVO);
		return "redirect:articleDetail?articleNum="+epilogueVO.getArticleNum();

	}
	
	@RequestMapping(value = "epilogueReplyDelete", method = RequestMethod.GET)
	public String epilogueReplyDelete(EpilogueVO epilogueVO, @RequestParam(value="buyepliNum") int buyepliNum,
			HttpServletRequest req)
	{
		epilogueDAO.deleteEpilogueReply(epilogueVO);
		return "redirect:articleDetail?articleNum="+epilogueVO.getArticleNum();
	}
}
