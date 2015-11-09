package kickoff.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kickoff.model.DAO.NoticeDAO;
import kickoff.model.DAO.QnADAO;
import kickoff.model.DAO.ReplyDAO;
import kickoff.model.DAO.ReplyQnADAO;
import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.ReplyVO;

@Controller
public class ReplyController {

	@Autowired
	private NoticeDAO notice;
	@Autowired
	private QnADAO qna;
	@Autowired
	private ReplyDAO replyDAO;
	@Autowired
	private ReplyQnADAO replyqnaDAO;

	// 공지사항 댓글 입력처리
	@RequestMapping(value = "noticeReply", method = RequestMethod.POST)
	public String noticeReplyinsert(ReplyVO replyVO, HttpServletRequest req) {

		replyDAO.NoticeReply(replyVO);
		int noticeno = Integer.parseInt(req.getParameter("noticeno"));
		notice.minusHit(noticeno);
		return "redirect:noticeDetail?noticeno=" + replyVO.getWriteNum();

	}

	// 공지사항 댓글 개별 삭제
	@RequestMapping(value = "noticeReplyDelete", method = RequestMethod.GET)
	public String noticeReplydelete(ReplyVO replyVO, @RequestParam(value = "noticeno") int noticeno,
			HttpServletRequest req) {
		replyDAO.deleteReply(replyVO);
		return "redirect:noticeDetail?noticeno=" + noticeno;
	}
	
	// QnA 댓글 입력처리
		@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
		public String qnaReplyinsert(ReplyVO replyVO, HttpServletRequest req) {

			replyqnaDAO.QnAReply(replyVO);
			int qnano = Integer.parseInt(req.getParameter("qnano"));
			qna.minusHit(qnano);
			return "redirect:qnaDetail?qnano=" + replyVO.getWriteNum();

		}

		// QnA 댓글 개별 삭제
		@RequestMapping(value = "qnaReplyDelete", method = RequestMethod.GET)
		public String qnaReplydelete(ReplyVO replyVO, @RequestParam(value = "qnano") int qnano,
				HttpServletRequest req) {
			replyqnaDAO.QnAdeleteReply(replyVO);
			return "redirect:qnaDetail?qnano=" + qnano;
		}
}
