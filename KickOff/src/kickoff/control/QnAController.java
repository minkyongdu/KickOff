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

import kickoff.model.DAO.QnADAO;
import kickoff.model.DAO.ReplyDAO;
import kickoff.model.DAO.ReplyQnADAO;
import kickoff.model.beans.NoticeVO;
import kickoff.model.beans.QnAVO;
import kickoff.model.beans.ReplyQnAVO;
import kickoff.model.beans.RowNumVO;

@Controller
public class QnAController {
	@Autowired
	private QnADAO qnaDAO;
	@Autowired
	private ReplyQnADAO replyqnaDAO;
	
		// QnA �۾��� ��
		@RequestMapping(value = "qnaWriteForm", method = RequestMethod.GET)
		public String NoticeWriteForm(Model model) {
			if (!model.containsAttribute("uploadForm")) {
				model.addAttribute("uploadForm", new NoticeVO());
			}
			return "qnaWriteForm";
		}
		// QnA �۾��� ó��
		@RequestMapping(value = "qnainsert", method = RequestMethod.POST)
		public String Notice(QnAVO qnaVo, HttpServletRequest req) throws Exception {

			List<MultipartFile> files = qnaVo.getFiles();

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
							qnaVo.setFileName(fileName);
						} else if (i == 2) {
							qnaVo.setFileName2(fileName);
						} else if (i == 3) {
							qnaVo.setFileName3(fileName);
						}
					}
				}
			}
			qnaDAO.qnainsert(qnaVo);
			return "redirect:qnaListForm";
		}
		// ������ ������, ������ �׷�
		private final int PAGESIZE = 10;
		private final int PAGEGROUP = 10;
		
		// QnA�Խ���  List��
		@RequestMapping("qnaListForm")
		public String NoticeListForm(Model model, String pageNumber) {
			// ���� Ŭ�� ������
			int pageNum = 1;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);

			// �Խñ� ��ü�� ���� �ʱ�ȭ
			int totalCount = qnaDAO.qnaCount();

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

			List<QnAVO> list = qnaDAO.qnalistAll(rowNumVO);

			model.addAttribute("totalPageCount", totalPageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("QnAList", list);
			return "qnaListForm";
		}
		// QnA�Խ��� �󼼺��� ó��
		@RequestMapping("qnaDetail")
		public String qnaDetail(@RequestParam int qnano, Model model, String pageNumber, HttpServletRequest req) {
			// ���� Ŭ�� ������
			int pageNum = 1;
			if (pageNumber != null)
				pageNum = Integer.parseInt(pageNumber);
			// �Խñ� ��ü�� ���� �ʱ�ȭ
			int totalCount = replyqnaDAO.QnAReplyCount(qnano); ///////////////////////////////////
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
			
			map.put("writeNum", qnano);
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			
			qnaDAO.plusHit(qnano);
			model.addAttribute("QnADetail", qnaDAO.qnaDetail(qnano)); // 
																					// �󼼺���
																					// ó��
			List<ReplyQnAVO> list = replyqnaDAO.QnASelect(map); //  ��� ����ó��

			model.addAttribute("QnAReply", list);
			model.addAttribute("totalPageCount", totalPageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			return "qnaDetail";
		}
		// QnA ������Ʈ ��
		@RequestMapping("qnaUpdateForm")
		public String noticeUpdateForm(@RequestParam int qnano, Model model) {

			model.addAttribute("qnaUpdateForm", qnaDAO.qnaDetail(qnano));

			return "qnaUpdateForm";
		}
		// QnA ������Ʈ ó��
		@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
		public String noticeUpdateForm(QnAVO qnaVO, HttpServletRequest req) throws Exception {

			List<MultipartFile> files = qnaVO.getFiles();

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
							qnaVO.setFileName(fileName);
						} else if (i == 2) {
							qnaVO.setFileName2(fileName);
						} else if (i == 3) {
							qnaVO.setFileName3(fileName);
						}
					}
				}
			}
			int qnano =Integer.parseInt(req.getParameter("qnano"));
			qnaDAO.minusHit(qnano);
			qnaDAO.qnaUpdate(qnaVO);
			return "redirect:qnaDetail?qnano=" + qnaVO.getQnano();
		}

		// QnA ����
		@RequestMapping("qnaDelete")
		public ModelAndView delete(@ModelAttribute QnAVO qnaVO, @RequestParam String filename,
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
			int result = qnaDAO.qnaDelete(qnaVO);
			replyqnaDAO.QnAdeleteNoticeReply(qnaVO.getQnano());// �Խñ� ������ �ڸ�Ʈ ����
			if (result != 1) {
				PrintWriter out = res.getWriter();
				out.println("<script>history.go(-1);</script>");
				return null;
			} else {
				return new ModelAndView("redirect:qnaListForm");
			}
		}
}
