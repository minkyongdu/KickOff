package kickoff.control;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kickoff.model.DAO.EventBoardDAO;
import kickoff.model.beans.EventBoardVO;
import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.ReplyVO;
import kickoff.model.beans.RowNumVO;

@Controller
public class EventController {
	
	@Autowired
	private EventBoardDAO eventboardDAO;
	
	//이벤트 게시판 글쓰기 폼
	@RequestMapping(value = "eventWriteForm", method = RequestMethod.GET)
	public String boardWrite(Model model) 
	{
		if (!model.containsAttribute("uploadForm")) {
			model.addAttribute("uploadForm", new EventBoardVO());
		}
		return "eventBoardWrite";
	}
	
	// 이벤트 게시판 글쓰기 처리
	@RequestMapping(value = "eventinsert", method = RequestMethod.POST)
	public String Notice(EventBoardVO eventVO, HttpServletRequest req) throws Exception {

		List<MultipartFile> files = eventVO.getFiles();

		if (null != files && files.size() > 0) {
			int i = 0;
			for (MultipartFile multipartFile : files) {
				i++;
				String fileName = multipartFile.getOriginalFilename(); //실제파일이름을 fileName에 담음
				if (!"".equals(fileName)) {
					fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;// 파일이름을 랜덤으로 돌림
					String path = req.getSession().getServletContext().getRealPath("/img/" + fileName);
					File f = new File(path);
					multipartFile.transferTo(f);
					if (i == 1) {
						eventVO.setFileName(fileName);
					} else if (i == 2) {
						eventVO.setFileName2(fileName);
					} else if (i == 3) {
						eventVO.setFileName3(fileName);
					}
				}
			}
		}
		eventboardDAO.eventinsert(eventVO);
		return "redirect:eventListForm";
	}
		// 페이지 사이즈, 페이지 그룹
		private final int PAGESIZE = 10;
		private final int PAGEGROUP = 10;
		// 이벤트 게시판 List폼
		@RequestMapping("eventListForm")
		public String eventListForm(Model model, String pageNumber) {
			// 현재 클릭 페이지
			int pageNum = 1;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);

			// 게시글 전체수 변수 초기화
			int totalCount = eventboardDAO.eventCount();

			// 페이지 갯수
			int totalPageCount = totalCount / PAGESIZE;

			// 0으로 나눠 떨어지지 않을경우 페이지 갯수를 +1한다.
			if (totalCount % PAGESIZE != 0) {
				totalPageCount++;
			}

			// startPage or endPage
			int startPage = (pageNum - 1) / PAGEGROUP * PAGEGROUP + 1;
			int endPage = startPage + (PAGEGROUP - 1);
			if (endPage > totalPageCount) {
				endPage = totalPageCount;
			}

			// 마지막, 처음 rowNumber 선언 및 초기화
			int endRow = PAGESIZE * pageNum;
			int startRow = endRow - PAGESIZE + 1;

			RowNumVO rowNumVO = new RowNumVO();
			rowNumVO.setStartRow(startRow);
			rowNumVO.setEndRow(endRow);

			List<EventBoardVO> list = eventboardDAO.eventListAll(rowNumVO);

			model.addAttribute("totalPageCount", totalPageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("eventList", list);
			return "eventBoardList";
		}
		// 이벤트 게시판 상세보기 처리
		@RequestMapping("eventDetail")
		public String noticeDetail(@RequestParam int eventno, Model model) {
			model.addAttribute("eventDetail", eventboardDAO.eventDetail(eventno)); // 공지사항
			return "eventBoardDetail";
		}
		// 이벤트 게시판 수정 폼
		@RequestMapping("eventUpdateForm")
		public String noticeUpdateForm(@RequestParam int eventno, Model model) {

			model.addAttribute("eventUpdateForm", eventboardDAO.eventDetail(eventno));

			return "eventUpdateForm";
		}
		// 이벤트 게시판 수정 처리
		@RequestMapping(value = "eventUpdate", method = RequestMethod.POST)
		public String noticeUpdateForm(EventBoardVO eventboardVo, HttpServletRequest req) throws Exception {

			List<MultipartFile> files = eventboardVo.getFiles();

			if (null != files && files.size() > 0) {
				int i = 0;
				for (MultipartFile multipartFile : files) {
					i++;
					String fileName = multipartFile.getOriginalFilename();
					if (!"".equals(fileName)) {
						fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;// 파일이름을 랜덤으로 돌리기
						String path = req.getSession().getServletContext().getRealPath("/img/" + fileName);
						File f = new File(path);
						multipartFile.transferTo(f);
						if (i == 1) {
							eventboardVo.setFileName(fileName);
						} else if (i == 2) {
							eventboardVo.setFileName2(fileName);
						} else if (i == 3) {
							eventboardVo.setFileName3(fileName);
						}
					}
				}
			}
			eventboardDAO.eventUpdate(eventboardVo);
			return "redirect:eventDetail?eventno=" + eventboardVo.getEventno();
		}
		// 게시글 삭제
		@RequestMapping("eventDelete")
		public ModelAndView delete(@ModelAttribute EventBoardVO eventboardVO, @RequestParam String filename,
				@RequestParam String filename2, @RequestParam String filename3, HttpServletResponse res,HttpServletRequest req) throws Exception {
			
			String path = req.getSession().getServletContext().getRealPath("/img/" + filename);
			String path2 = req.getSession().getServletContext().getRealPath("/img/" + filename2);
			String path3 = req.getSession().getServletContext().getRealPath("/img/" + filename3);
			File file = new File(path);
			File file2 = new File(path2);
			File file3 = new File(path3);
			
			//이미지가 있다면 삭제
			if (file.exists() == true) {
				file.delete();
			}
			if (file2.exists() == true) {
				file2.delete();
			}
			if (file3.exists() == true) {
				file3.delete();
			}
			int result = eventboardDAO.eventDelete(eventboardVO);
			if (result != 1) {
				PrintWriter out = res.getWriter();
				out.println("<script>history.go(-1);</script>");
				return null;
			} else {
				return new ModelAndView("redirect:eventListForm");
			}
		}
}
