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
			HttpServletResponse response, @RequestParam int buyamount) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
		int articleNum = Integer.parseInt(req.getParameter("articleNum"));
		String Asize = req.getParameter("Asize");
		Map map = new HashMap();
		map.put("articleNum", articleNum);
		map.put("Asize", Asize);
		int count = orderDAO.orderProductCount(map);
		if(count >= buyamount){
			orderDAO.orderinsert(orderVO);
			sizeVO.setAmount(buyamount);
			orderDAO.updateorder(sizeVO);
			return "articleOrderSuccess";
		}else{
			writer.println("<script>alert('" + count + "이하로만 주문이 가능합니다.');</script>");
            writer.flush();
			return "articleOrderForm?articleNum="+articleNum;
		}
			
	}
	@RequestMapping("myOrderList")
	public String myorderlist()
	{
		return null;
	}
	
	
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 10;
	
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
}
