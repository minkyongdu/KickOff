package kickoff.control;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.rewrite.RewriteAppender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.multipart.MultipartFile;
import kickoff.model.DAO.NoticeDAO;
import kickoff.model.DAO.ReplyDAO;
import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.ReplyVO;
import kickoff.model.beans.RowNumVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO noticeDAO;

	@Autowired
	private ReplyDAO replyDAO;

	// 공지사항 글쓰기 폼
		@RequestMapping(value = "noticeWriteForm", method = RequestMethod.GET)
		public String NoticeWriteForm(Model model) {
			if (!model.containsAttribute("uploadForm")) {
				model.addAttribute("uploadForm", new NoticeVO());
			}
			return "noticeWrite";
		}

		// 공지사항 글쓰기 처리(이미지첨부 처리)
		@RequestMapping(value = "noticeinsert", method = RequestMethod.POST)
		public String Notice(NoticeVO noticeVo, HttpServletRequest req) throws Exception {

			List<MultipartFile> files = noticeVo.getFiles();

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
							noticeVo.setFileName(fileName);
						} else if (i == 2) {
							noticeVo.setFileName2(fileName);
						} else if (i == 3) {
							noticeVo.setFileName3(fileName);
						}
					}
				}
			}
			noticeDAO.noticeinsert(noticeVo);
			return "redirect:noticeListForm";

		}

		// 페이지 사이즈, 페이지 그룹
		private final int PAGESIZE = 10;
		private final int PAGEGROUP = 10;

		// 공지사항 List폼
		@RequestMapping("noticeListForm")
		public String NoticeListForm(Model model, String pageNumber) {
			// 현재 클릭 페이지
			int pageNum = 1;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);

			// 게시글 전체수 변수 초기화
			int totalCount = noticeDAO.noticeCount();

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

			List<NoticeVO> list = noticeDAO.noticelistAll(rowNumVO);

			model.addAttribute("totalPageCount", totalPageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("NoticeList", list);
			return "noticeList";
		}

		// 공지사항 상세보기 처리
		@RequestMapping("noticeDetail")
		public String noticeDetail(@RequestParam int noticeno, Model model, String pageNumber, HttpServletRequest req) {
			// 현재 클릭 페이지
			int pageNum = 1;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);
			// 게시글 전체수 변수 초기화
			int totalCount = replyDAO.NoticeReplyCount(noticeno); ///////////////////////////////////
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

			Map map = new HashMap();
			RowNumVO rowNumVO = new RowNumVO();
			rowNumVO.setStartRow(startRow);
			rowNumVO.setEndRow(endRow);
			
			map.put("writeNum", noticeno);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			noticeDAO.plusHit(noticeno);
			
			model.addAttribute("NoticeDetail", noticeDAO.noticeDetail(noticeno)); // 공지사항
																					// 상세보기
																					// 처리
			List<ReplyVO> list = replyDAO.NoticeSelect(map); // 공지사항 댓글 보기처리

			model.addAttribute("NoticeReply", list);
			model.addAttribute("totalPageCount", totalPageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "noticeDetail";
		}
	
		// 공지사항 업데이트 폼
		@RequestMapping("noticeUpdateForm")
		public String noticeUpdateForm(@RequestParam int noticeno, Model model) {

			model.addAttribute("NoticeUpdate", noticeDAO.noticeDetail(noticeno));

			return "noticeUpdate"; 
		}
		// 공지사항 업데이트 처리
		@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
		public String noticeUpdateForm(NoticeVO noticeVo, HttpServletRequest req) throws Exception {

			List<MultipartFile> files = noticeVo.getFiles();

			if (null != files && files.size() > 0) {
				int i = 0;
				for (MultipartFile multipartFile : files) {
					i++;
					String fileName = multipartFile.getOriginalFilename();
					if (!"".equals(fileName)) {
						fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;// 파일이름을 랜덤으로 돌리기
						String path = req.getSession().getServletContext().getRealPath("/img/" + fileName);
						// C:\java_maven\mywork_ee\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\KickOff\img\filename
						File f = new File(path);
						multipartFile.transferTo(f);
						if (i == 1) {
							noticeVo.setFileName(fileName);
						} else if (i == 2) {
							noticeVo.setFileName2(fileName);
						} else if (i == 3) {
							noticeVo.setFileName3(fileName);
						}
					}
				}
			}
			int noticeno = Integer.parseInt(req.getParameter("noticeno"));
			noticeDAO.minusHit(noticeno);
			noticeDAO.noticeUpdate(noticeVo);
			return "redirect:noticeDetail?noticeno=" + noticeVo.getNoticeno();
		}

		// 게시글 삭제
		@RequestMapping("noticeDelete")
		public ModelAndView delete(@ModelAttribute NoticeVO noticeVo, @RequestParam String filename,
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
			int result = noticeDAO.deleteNotice(noticeVo);
			replyDAO.deleteNoticeReply(noticeVo.getNoticeno());// 게시글 내부의 코맨트 삭제
			if (result != 1) {
				PrintWriter out = res.getWriter();
				out.println("<script>history.go(-1);</script>");
				return null;
			} else {
				return new ModelAndView("redirect:noticeListForm");
			}
		}
	}
