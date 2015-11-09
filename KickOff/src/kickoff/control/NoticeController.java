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

	// �������� �۾��� ��
	@RequestMapping(value = "noticeWriteForm", method = RequestMethod.GET)
	public String NoticeWriteForm(Model model) {
		if (!model.containsAttribute("uploadForm")) {
			model.addAttribute("uploadForm", new NoticeVO());
		}
		return "noticeWrite";
	}

	// �������� �۾��� ó��(�̹���÷�� ó��)
	@RequestMapping(value = "noticeinsert", method = RequestMethod.POST)
	public String Notice(NoticeVO noticeVo, HttpServletRequest req) throws Exception {

		List<MultipartFile> files = noticeVo.getFiles();

		if (null != files && files.size() > 0) {
			int i = 0;
			for (MultipartFile multipartFile : files) {
				i++;
				String fileName = multipartFile.getOriginalFilename(); //���������̸��� fileName�� ����
				if (!"".equals(fileName)) {
					fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;// �����̸��� �������� ����
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

	// ������ ������, ������ �׷�
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 10;

	// �������� List��
	@RequestMapping("noticeListForm")
	public String NoticeListForm(Model model, String pageNumber) {
		// ���� Ŭ�� ������
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);

		// �Խñ� ��ü�� ���� �ʱ�ȭ
		int totalCount = noticeDAO.noticeCount();

		// ������ ����
		int totalPageCount = totalCount / PAGESIZE;

		// 0���� ���� �������� ������� ������ ������ +1�Ѵ�.
		if (totalCount % PAGESIZE != 0) {
			totalPageCount++;
		}

		// startPage or endPage
		int startPage = (pageNum - 1) / PAGEGROUP * PAGEGROUP + 1;
		int endPage = startPage + (PAGEGROUP - 1);
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}

		// ������, ó�� rowNumber ���� �� �ʱ�ȭ
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

	// �������� �󼼺��� ó��
	@RequestMapping("noticeDetail")
	public String noticeDetail(@RequestParam int noticeno, Model model, String pageNumber, HttpServletRequest req) {
		// ���� Ŭ�� ������
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);
		// �Խñ� ��ü�� ���� �ʱ�ȭ
		int totalCount = replyDAO.NoticeReplyCount(noticeno); ///////////////////////////////////
		// ������ ����
		int totalPageCount = totalCount / PAGESIZE;

		// 0���� ���� �������� ������� ������ ������ +1�Ѵ�.
		if (totalCount % PAGESIZE != 0) {
			totalPageCount++;
		}

		// startPage or endPage
		int startPage = (pageNum - 1) / PAGEGROUP * PAGEGROUP + 1;
		int endPage = startPage + (PAGEGROUP - 1);
		if (endPage > totalPageCount) {
			endPage = totalPageCount;
		}

		// ������, ó�� rowNumber ���� �� �ʱ�ȭ
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
		
		model.addAttribute("NoticeDetail", noticeDAO.noticeDetail(noticeno)); // ��������
																				// �󼼺���
																				// ó��
		List<ReplyVO> list = replyDAO.NoticeSelect(map); // �������� ��� ����ó��

		model.addAttribute("NoticeReply", list);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "noticeDetail";
	}
	
	// �������� ������Ʈ ��
	@RequestMapping("noticeUpdateForm")
	public String noticeUpdateForm(@RequestParam int noticeno, Model model) {

		model.addAttribute("NoticeUpdate", noticeDAO.noticeDetail(noticeno));

		return "noticeUpdate"; 
	}
	// �������� ������Ʈ ó��
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdateForm(NoticeVO noticeVo, HttpServletRequest req) throws Exception {

		List<MultipartFile> files = noticeVo.getFiles();

		if (null != files && files.size() > 0) {
			int i = 0;
			for (MultipartFile multipartFile : files) {
				i++;
				String fileName = multipartFile.getOriginalFilename();
				if (!"".equals(fileName)) {
					fileName = UUID.randomUUID().toString().replaceAll("-", "") + fileName;// �����̸��� �������� ������
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

	// �Խñ� ����
	@RequestMapping("noticeDelete")
	public ModelAndView delete(@ModelAttribute NoticeVO noticeVo, @RequestParam String filename,
			@RequestParam String filename2, @RequestParam String filename3, HttpServletResponse res,HttpServletRequest req) throws Exception {
		
		String path = req.getSession().getServletContext().getRealPath("/img/" + filename);
		String path2 = req.getSession().getServletContext().getRealPath("/img/" + filename2);
		String path3 = req.getSession().getServletContext().getRealPath("/img/" + filename3);
		File file = new File(path);
		File file2 = new File(path2);
		File file3 = new File(path3);
		
		//�̹����� �ִٸ� ����
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
		replyDAO.deleteNoticeReply(noticeVo.getNoticeno());// �Խñ� ������ �ڸ�Ʈ ����
		if (result != 1) {
			PrintWriter out = res.getWriter();
			out.println("<script>history.go(-1);</script>");
			return null;
		} else {
			return new ModelAndView("redirect:noticeListForm");
		}
	}
}
