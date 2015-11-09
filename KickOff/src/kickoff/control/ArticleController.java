package kickoff.control;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kickoff.model.DAO.ArticleDAO;
import kickoff.model.DAO.ArticleSizeAmountDAO;
import kickoff.model.DAO.ArticlefileDAO;
import kickoff.model.DAO.ArticlegroupDAO;
import kickoff.model.DAO.EpilogueDAO;
import kickoff.model.DAO.OrderDAO;
import kickoff.model.beans.ArticleSizeAmountVO;
import kickoff.model.beans.ArticleVO;
import kickoff.model.beans.ArticlefileVO;
import kickoff.model.beans.ArticlegroupVO;
import kickoff.model.beans.EpilogueVO;
import kickoff.model.beans.RowNumVO;

@Controller
public class ArticleController {
	@Autowired
	private ArticleDAO articleDAO;
	@Autowired
	private ArticlefileDAO articlefileDAO;
	@Autowired
	private ArticlegroupDAO articlegroupDAO;
	@Autowired
	private ArticleSizeAmountDAO articlesizeamountDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private EpilogueDAO epilogueDAO;
	
	// ��ǰ �۾��� ��
	@RequestMapping("articleWriteForm")
	public String articleWriteForm(Model model) {
		if (!model.containsAttribute("uploadForm")) {
			model.addAttribute("uploadForm", new ArticlefileVO());
		}
		return "articleWriteForm";
	}

	// ��ǰ �۾��� ó��
	@RequestMapping(value = "articleInsert", method = RequestMethod.POST)
	public String articleInsert(ArticlefileVO articlefile, ArticleVO article, ArticleSizeAmountVO articleSizeAmountVO,
			HttpServletRequest request) throws Exception, IOException {
		List<MultipartFile> files = articlefile.getFiles();
		if (null != files && files.size() > 0) {
			int i = 0;
			for (MultipartFile multipartFile : files) {
				i++;
				String imgFile = multipartFile.getOriginalFilename();
				// �����̸��� �������� ������
				if (!"".equals(imgFile)) {
					imgFile = UUID.randomUUID().toString().replaceAll("-", "") + imgFile;
					String path = request.getSession().getServletContext().getRealPath("/img/" + imgFile);
					File f = new File(path);
					multipartFile.transferTo(f);
					if (i == 1) {
						articlefile.setImgFile1(imgFile);
					} else if (i == 2) {
						articlefile.setImgFile2(imgFile);
					} else if (i == 3) {
						articlefile.setImgFile3(imgFile);
					} else if (i == 4) {
						articlefile.setImgFile4(imgFile);
					} else if (i == 5) {
						articlefile.setImgFile5(imgFile);
					}
				}
			}
		}
		int companyNum = Integer.parseInt(request.getParameter("companyNum"));
		article.setCompanyNum(companyNum);
		articleDAO.insertArticle(article); // ��ǰ
		
		int articleNum = articleDAO.selectArticleMax();
		articlefile.setArticleNum(articleNum);

		for (int i = 0; i < 10; i++) {
			String asize = request.getParameter("asize" + i);  // ������+�߰� ��ư Ŭ���� �� �޾ƿ���
			if (asize != null) { // ������ �̸��� null�� �ƴϸ�
				articleSizeAmountVO.setArticleNum(articleNum);
				articleSizeAmountVO.setAsize(asize);
				int amount = Integer.parseInt(request.getParameter("amount" + i));
				articleSizeAmountVO.setAmount(amount);
				articlesizeamountDAO.insertSizeAmount(articleSizeAmountVO);
			}
		}
		
		articlefileDAO.insertArticlefile(articlefile); // ����

		return "redirect:articleListFormLow?groupNum=1";
	}

	// ���� ������ : �ֽŵ�ϼ�(�Ż�ǰ��)
	@RequestMapping("articleListFormDate")
	public String articleListDate(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArtielc(groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}

	// ���� ������ : ���� ���ݼ� ����
	@RequestMapping("articleListFormHigh")
	public String articleListHigh(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArticleListHigh(groupNum);
		request.setAttribute("groupNums", groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}
	
	// ���� ������ : ���� ���ݼ� ����
	@RequestMapping("articleListFormLow")
	public String articleListLow(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArticleListLow(groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}
	private final int PAGESIZE = 5;
	private final int PAGEGROUP = 10;
	
	// ��ǰ �󼼺���
	@RequestMapping("articleDetail")
	public String articleEngDetalis(@RequestParam int articleNum, Model model, String pageNumber) {
	      int pageNum = 1;
	      if (pageNumber != null)
	         pageNum = Integer.parseInt(pageNumber);
	      
	      int totalCount = epilogueDAO.EpilogueReplyCount(articleNum); //////////
	            
	      int totalPageCount = totalCount / PAGESIZE;

	      if (totalCount % PAGESIZE != 0) {
	            totalPageCount++;
	         }
	      // startPage or endPage
	      int startPage = (pageNum - 1) / PAGEGROUP * PAGEGROUP + 1;
	      int endPage = startPage + (PAGEGROUP - 1);
	      if (endPage > totalPageCount) {
	         endPage = totalPageCount;
	         }
	         
	      int endRow = PAGESIZE * pageNum;
	      int startRow = endRow - PAGESIZE + 1;

	      Map map = new HashMap();
	      RowNumVO rowNumVO = new RowNumVO();
	      rowNumVO.setStartRow(startRow);
	      rowNumVO.setEndRow(endRow);
	                  
	      map.put("articleNum", articleNum);
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);
	                        
	      List<EpilogueVO> list2 = epilogueDAO.EpilogueSelect(map);

	      model.addAttribute("EpilogueReply", list2);
	      model.addAttribute("totalPageCount", totalPageCount);
	      model.addAttribute("startPage", startPage);
	      model.addAttribute("endPage", endPage);
	      
	      model.addAttribute("article", articleDAO.articleDetail(articleNum)); 
	      List<ArticleSizeAmountVO> list = articlesizeamountDAO.selectArticleList(articleNum);
	      model.addAttribute("articleSize", list);
	      return "articleDetail";
	}

	// ��ǰ �з� ��ȣ �Ѹ���
	@RequestMapping("articleGroup")
	public String articleGroupList(HttpServletRequest request) {
		List<ArticlegroupVO> list = articlegroupDAO.selectListgroup();
		request.setAttribute("groupList", list);

		return "articleGroup";
	}
		//�ֹ��ϴ� ��
		@RequestMapping("articleOrderForm")
		public String aritcleOrder(@RequestParam int articleNum, @RequestParam String Asize,
									@RequestParam int amount, Model model, 
				HttpServletRequest req, HttpServletResponse response)throws IOException{
			response.setContentType("text/html; charset=UTF-8");
	        req.setCharacterEncoding("UTF-8");
	        
	        PrintWriter writer = response.getWriter();
	        String[] result = Asize.split(" : "); //������ �������� 230 : 23 �̹Ƿ� split���� ¥��
	        String sr= result[1];
			Map map = new HashMap();
			map.put("articleNum", articleNum);
			map.put("Asize", sr);
			int count = orderDAO.orderProductCount(map);
			if(count >= amount){
				model.addAttribute("article", articleDAO.articleDetail(articleNum));
				model.addAttribute("amount", amount);
				model.addAttribute("Asize",sr);
				return "articleOrder";
			}
			else if (count < amount)
			{
				writer.println("<script>alert('��� �����մϴ�.');");
				writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
	            writer.flush();
				return "articleDetail?articleNum="+articleNum;
			}
			else{
				writer.println("<script>alert( '" + count + "���Ϸθ� �ֹ��� �����մϴ�.');");
				writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
	            writer.flush();
				return "articleDetail?articleNum="+articleNum;
			}
		}
}
