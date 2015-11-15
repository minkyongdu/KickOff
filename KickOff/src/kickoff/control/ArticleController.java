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
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
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
	
	// 상품 글쓰기 폼
	@RequestMapping("articleWriteForm")
	public String articleWriteForm(Model model) {
		if (!model.containsAttribute("uploadForm")) {
			model.addAttribute("uploadForm", new ArticlefileVO());
		}
		return "articleWriteForm";
	}

	// 상품 글쓰기 처리
	@RequestMapping(value = "articleInsert", method = RequestMethod.POST)
	public String articleInsert(ArticlefileVO articlefile, ArticleVO article, ArticleSizeAmountVO articleSizeAmountVO,
			HttpServletRequest request) throws Exception, IOException {
		List<MultipartFile> files = articlefile.getFiles();
		if (null != files && files.size() > 0) {
			int i = 0;
			for (MultipartFile multipartFile : files) {
				i++;
				String imgFile = multipartFile.getOriginalFilename();
				// 파일이름을 랜덤으로 돌리기
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
		articleDAO.insertArticle(article); // 제품
		
		int articleNum = articleDAO.selectArticleMax();
		articlefile.setArticleNum(articleNum);

		for (int i = 0; i < 10; i++) {
			String asize = request.getParameter("asize" + i);  // 사이즈+추가 버튼 클릭시 값 받아오기
			if (asize != null) { // 사이즈 이름이 null이 아니면
				articleSizeAmountVO.setArticleNum(articleNum);
				articleSizeAmountVO.setAsize(asize);
				int amount = Integer.parseInt(request.getParameter("amount" + i));
				articleSizeAmountVO.setAmount(amount);
				articlesizeamountDAO.insertSizeAmount(articleSizeAmountVO);
			}
		}
		
		articlefileDAO.insertArticlefile(articlefile); // 파일

		return "redirect:comRegiSelect";
	}

	// 영어 사이즈 : 최신등록순(신상품순)
	@RequestMapping("articleListFormDate")
	public String articleListDate(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArtielc(groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}

	// 영어 사이즈 : 높은 가격순 정렬
	@RequestMapping("articleListFormHigh")
	public String articleListHigh(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArticleListHigh(groupNum);
		request.setAttribute("groupNums", groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}
	
	// 영어 사이즈 : 낮은 가격순 정렬
	@RequestMapping("articleListFormLow")
	public String articleListLow(@RequestParam int groupNum, HttpServletRequest request) {
		List<ArticleVO> list = articleDAO.selectArticleListLow(groupNum);
		request.setAttribute("articleList", list);
		return "articleListForm";
	}
	private final int PAGESIZE = 5;
	private final int PAGEGROUP = 10;
	
	// 상품 상세보기
	@RequestMapping("articleDetail")
	public String articleEngDetalis(@RequestParam int articleNum, Model model, String pageNumber, HttpSession session) {
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
	      model.addAttribute("findCompanyName", articleDAO.findCompanyName(articleNum));
	      return "articleDetail";
	}

	// 상품 분류 번호 뿌리기
	@RequestMapping("articleGroup")
	public String articleGroupList(HttpServletRequest request) {
		List<ArticlegroupVO> list = articlegroupDAO.selectListgroup();
		request.setAttribute("groupList", list);

		return "articleGroup";
	}
		//주문하는 폼
		@RequestMapping("articleOrderForm")
		public String aritcleOrder(@RequestParam int articleNum, @RequestParam String Asize,
									@RequestParam int amount, Model model, 
				HttpServletRequest req, HttpServletResponse response)throws IOException{
			response.setContentType("text/html; charset=UTF-8");
	        req.setCharacterEncoding("UTF-8");
	        
	        PrintWriter writer = response.getWriter();
	        String[] result = Asize.split(" : "); //수량을 가져오면 230 : 23 이므로 split으로 짜름
	        String sr= result[1];
			Map map = new HashMap();
			map.put("articleNum", articleNum);
			map.put("Asize", sr);
			int count = orderDAO.orderProductCount(map);
			if(count > amount){
				model.addAttribute("article", articleDAO.articleDetail(articleNum));
				model.addAttribute("amount", amount);
				model.addAttribute("Asize",sr);
				if(amount == 0)
				{
					writer.println("<script>alert('수량을 올바르게 입력해 주세요.');");
					writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
		            writer.flush();
					return "articleDetail?articleNum="+articleNum;
				}
				return "articleOrder";
			}
			else if (count < amount)
			{
				writer.println("<script>alert('재고가 부족합니다.');");
				writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
	            writer.flush();
				return "articleDetail?articleNum="+articleNum;
			}
			else{
				writer.println("<script>alert( '" + count + "이상으로만 주문이 가능합니다.');");
				writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
	            writer.flush();
				return "articleDetail?articleNum="+articleNum;
			}
		}
		//제품 수정폼 띄우기
				@RequestMapping("articleFix")
				public String articleFix(Model model,@RequestParam int articleNum, ArticlefileVO articlefileVO)
				{
				      model.addAttribute("article", articleDAO.articleDetail(articleNum)); 
				      List<ArticleSizeAmountVO> list = articlesizeamountDAO.selectArticleList(articleNum);
				      model.addAttribute("articleSize", list);
				      
				      
					return "articleFix";
				}
				
				//제품 업데이트(수정)
				@RequestMapping("articleFixUpdate")
				public String articleUpdate(Model model, ArticleVO articleVO, ArticlefileVO articlefile, ArticleSizeAmountVO articleSizeAmountVO,
					HttpServletRequest request, @RequestParam int articleNum) throws Exception, IOException
				{
					
					List<MultipartFile> files = articlefile.getFiles();
					if (null != files && files.size() > 0) {
						int i = 0;
						for (MultipartFile multipartFile : files) {
							i++;
							String imgFile = multipartFile.getOriginalFilename();
							// 파일이름을 랜덤으로 돌리기
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
					
					for (int i = 0; i < 10; i++) {
						String asize = request.getParameter("asize" + i);  
						if (asize != null) { // 사이즈 이름이 null이 아니면
							articleSizeAmountVO.setArticleNum(articleNum);
							articleSizeAmountVO.setAsize(asize);
							int amount = Integer.parseInt(request.getParameter("amount" + i));
							articleSizeAmountVO.setAmount(amount);
							articlesizeamountDAO.updateSizeAmount(articleSizeAmountVO);
						}
					}
		/*		    int resultNum = Integer.parseInt(request.getParameter("articleNums"));
				    System.out.println(resultNum);
				    List<ArticlefileVO> list = articlefileDAO.selectArticlefile(resultNum);
				    model.addAttribute("imgFiles", list);*/
					
					articleDAO.updateArticle(articleVO);
					articlefileDAO.updateArticlefile(articlefile);
					return "redirect:comCompanyArticleList?companyNum=" + request.getParameter("companyNums");
				}
				
				//제품 삭제
				@RequestMapping("articleDelete")
				public String articledelete(Model model, ArticleVO articleVO,ArticlefileVO articlefileVO, 
						ArticleSizeAmountVO articleSizeAmountVO, EpilogueVO epilogueVO, HttpServletRequest request,
						@RequestParam String filename, @RequestParam String filename2, @RequestParam String filename3,
						@RequestParam String filename4, @RequestParam String filename5, @RequestParam String companyNum, HttpSession session) throws IOException
				{
					String path = request.getSession().getServletContext().getRealPath("/img/" + filename);
					String path2 = request.getSession().getServletContext().getRealPath("/img/" + filename2);
					String path3 = request.getSession().getServletContext().getRealPath("/img/" + filename3);
					String path4 = request.getSession().getServletContext().getRealPath("/img/" + filename4);
					String path5 = request.getSession().getServletContext().getRealPath("/img/" + filename5);
					File file = new File(path);
					File file2 = new File(path2);
					File file3 = new File(path3);
					File file4 = new File(path4);
					File file5 = new File(path5);
					
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
					if (file4.exists() == true) {
						file4.delete();
					}
					if (file5.exists() == true) {
						file5.delete();
					}		      
					articleDAO.deleteArticle(articleVO);
					articlefileDAO.deleteArticlefile(articlefileVO);
					epilogueDAO.deleteArticleReply(articleVO);//제품 상세보기에 들어있는 articleReply지우기
					articlesizeamountDAO.deleteSizeAmount(articleSizeAmountVO);
					
					return "redirect:comCompanyArticleList?companyNum=" + companyNum;
				}
				
				@RequestMapping("comCompanyArticleList")
				public String articlecompanylist(RowNumVO rownumVO, ArticlefileVO articlefileVO, String pageNumber, Model model,@RequestParam int companyNum)
				{
					int PAGESIZE = 10;
				    	int PAGEGROUP = 10;
					int pageNum = 1;
					if (pageNumber != null)
						pageNum = Integer.parseInt(pageNumber);

					// 게시글 전체수 변수 초기화
					int totalCount = articleDAO.companyArticleListCount(companyNum);

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
					rowNumVO.setCompanyNum(companyNum);
					
					List<ArticleVO> list = articleDAO.companyArticleList(rowNumVO);
					model.addAttribute("totalPageCount", totalPageCount);
					model.addAttribute("startPage", startPage);
					model.addAttribute("endPage", endPage);
					model.addAttribute("companyArticleList", list);
					model.addAttribute("reqCompanyNum", companyNum);
					return "comCompanyArticleList";
				}
				@RequestMapping("articlecartOrder")
				public String aritclecartOrder(@RequestParam int articleNum, @RequestParam String aasize,
											@RequestParam int amount, Model model, 
						HttpServletRequest req, HttpServletResponse response)throws IOException{
					response.setContentType("text/html; charset=UTF-8");
			        req.setCharacterEncoding("UTF-8");
			        
			        PrintWriter writer = response.getWriter();
			        String[] result = aasize.split(" : "); //수량을 가져오면 230 : 23 이므로 split으로 짜름
			        String sr= result[1];
					Map map = new HashMap();
					map.put("articleNum", articleNum);
					map.put("Asize", sr);
					writer.println("<script>alert('1234');</script>");
					int count = orderDAO.orderProductCount(map);
					if(count >= amount){
						model.addAttribute("article", articleDAO.articleDetail(articleNum));
						model.addAttribute("amount", amount);
						model.addAttribute("Asize",sr);
						return "redirect:cartinsert";
					}
					else if (count < amount)
					{
						writer.println("<script>alert('재고가 부족합니다.');");
						writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
			            writer.flush();
						return "articleDetail?articleNum="+articleNum;
					}
					else{
						writer.println("<script>alert( '" + count + "이하로만 주문이 가능합니다.');");
						writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
			            writer.flush();
						return "articleDetail?articleNum="+articleNum;
					}
				}	
	
}
