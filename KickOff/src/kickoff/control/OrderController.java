package kickoff.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kickoff.model.DAO.OrderDAO;
import kickoff.model.beans.ArticleSizeAmountVO;
import kickoff.model.beans.OrderVO;
import kickoff.model.beans.RowNumVO;

@Controller
public class OrderController {

	@Autowired
	private OrderDAO orderDAO;

	@RequestMapping(value = "articleOrder", method = RequestMethod.POST)
	public String articleOrderinsert(OrderVO orderVO, ArticleSizeAmountVO sizeVO, HttpServletRequest req , 
			HttpServletResponse response, @RequestParam int buyamount, @RequestParam String id) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
		int articleNum = Integer.parseInt(req.getParameter("articleNum"));
		int amount =Integer.parseInt(req.getParameter("amount"));
		String Asize = req.getParameter("Asize");
		Map map = new HashMap();
		map.put("articleNum", articleNum);
		map.put("Asize", Asize);
		int count = orderDAO.orderProductCount(map);
		if(count >= buyamount){
			orderVO.setId(id);
			orderDAO.orderinsert(orderVO);
			sizeVO.setAmount(buyamount);
			orderDAO.updateorder(sizeVO);
			return "articleOrderSuccess";
		}else{
	         writer.println("<script>alert( '" + count + "이하로만 주문이 가능합니다.');");
	         writer.println("location.href = 'articleOrderForm?articleNum=" + articleNum + "&Asize="+ Asize +"&amount="+ amount +"'</script>");
	         writer.flush();
	         return "articleOrderForm?articleNum="+ articleNum + "&Asize="+ Asize +"&amount="+ amount;
	      }
			
	}

	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 10;
	
	
	//주문한 관리자용 총 리스트 (추가)
	@RequestMapping("orderList")
	public String orderlist(Model model, String pageNumber)
	{
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);
		
		int totalCount = orderDAO.orderlistcount(); //////////
				
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
						
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		List<OrderVO> list = orderDAO.orderlist(rowNumVO);
		model.addAttribute("orderlist", list);
		return "orderList";
	}
	
	   //회사 관리 리스트 (추가)
	   @RequestMapping("comOrderList")
	   public String companylist(Model model, @RequestParam int companyNum, String pageNumber)
	   {
	      int pageNum = 1;
	      if (pageNumber != null)
	         pageNum = Integer.parseInt(pageNumber);
	      
	      int totalCount = orderDAO.orderlistcount(); //////////
	            
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
	      rowNumVO.setCompanyNum(companyNum);
	                  
	      map.put("startRow", startRow);
	      map.put("endRow", endRow);
	      map.put("companyNum", companyNum);
	      
	      model.addAttribute("totalPageCount", totalPageCount);
	      model.addAttribute("startPage", startPage);
	      model.addAttribute("endPage", endPage);
	      
	      List<OrderVO> list = orderDAO.companylist(rowNumVO);
	      model.addAttribute("companylist", list);
	      return "comOrderList";
	   }
	
	//관리자용 리스트 배송상태 업데이트 (추가)
	@RequestMapping(value="orderListUpdate", method = RequestMethod.POST)
	public String orderListUpdate(OrderVO orderVO, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException
	{
		orderDAO.updateBuyStatus(orderVO);
		response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        writer.println("<script>alert('해당 제품의 상태가 업데이트 되었습니다.');");
        writer.println("location.href='orderList';</script>");
        writer.flush();
		return "redirect:orderList";
	}
	
	//회사용 리스트 배송상태 업데이트 (추가)
	@RequestMapping(value="orderCompanyUpdate", method = RequestMethod.POST)
	public String orderCompanyUpdate(OrderVO orderVO)
	{ 
		orderDAO.updateBuyStatus(orderVO);
		return "redirect:comOrderList?companyNum="+orderVO.getCompanyNum();
	}
	// 배송번호 업데이트
	@RequestMapping(value = "updateSendpackage", method = RequestMethod.POST)
	public String updateSendpackage(OrderVO orderVO)
	{
		orderDAO.updateSendpackage(orderVO);
		return "redirect:comOrderList?companyNum="+orderVO.getCompanyNum();
	}
	//아이디 클릭시 정보 조회
	@RequestMapping("comOrderSelectID")
	public String comOrderselectID(@RequestParam int buyNum, HttpServletRequest request)
	{
		List<OrderVO> list = orderDAO.selectbuyID(buyNum);
		request.setAttribute("buyID", list);
		return "comOrderSelectID";
	}
	
	// 개인 주문내역 페이징 리스트
	@RequestMapping("memOrderList")
	public String selectOrderMember(@RequestParam String id, Model model, String pageNumber, HttpServletRequest req)
	{
		int pageNum = 1;
		if (pageNumber != null)
			pageNum = Integer.parseInt(pageNumber);

		// 게시글 전체수 변수 초기화
		int totalCount = orderDAO.orderMemberlistcount(id);

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
		
		Map map = new HashMap();
		map.put("id", id);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<OrderVO> list = orderDAO.selectOrderMemberPage(map);
		model.addAttribute("buyMemberlist", list); 
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "memOrderList";
	}

}
