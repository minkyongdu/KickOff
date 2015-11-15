package kickoff.control;



import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kickoff.model.DAO.ArticleDAO;
import kickoff.model.DAO.ArticleSizeAmountDAO;
import kickoff.model.DAO.ArticlefileDAO;
import kickoff.model.DAO.ArticlegroupDAO;
import kickoff.model.DAO.EpilogueDAO;
import kickoff.model.DAO.OrderDAO;
import kickoff.model.beans.CartVO;



@Controller
public class CartController {
   @Autowired
   private ArticleDAO articleDAO;

   @Autowired
   private OrderDAO orderDAO;
   
   
   @RequestMapping("cart")   
   public String cart(@RequestParam String aasize, HttpServletRequest request,HttpServletResponse response,CartVO cartvo, Model model,HttpSession session)throws Exception{
	   
	   response.setContentType("text/html; charset=UTF-8");
       request.setCharacterEncoding("UTF-8");
       
       PrintWriter writer = response.getWriter();
	   
      String articleNum = request.getParameter("articleNum");
      String price = request.getParameter("price");
      String aname = request.getParameter("aname");
      String imgFile = request.getParameter("imgFile");
      String companyNum = request.getParameter("companyNum");
      String amount = request.getParameter("AAmount");
       String[] result = aasize.split(":"); //�닔�웾�쓣 媛��졇�삤硫� 230 : 23 �씠誘�濡� split�쑝濡� 吏쒕쫫
       String sr= result[1].trim();      
      int Amount = Integer.parseInt(amount);
      cartvo.setArticleNum(Integer.parseInt(articleNum));// = 
      cartvo.setPrice(Integer.parseInt(price));
      cartvo.setAname(aname);
      cartvo.setImgFile1(imgFile);
      cartvo.setCompanyNum(Integer.parseInt(companyNum));
      cartvo.setAmount(Integer.parseInt(amount));
      cartvo.setAsize(sr);
      

      /*cartvo.setAmount(Integer.parseInt(amount));*/
            
      List<CartVO> list = (List<CartVO>) session.getAttribute("list");
      if(list==null){
         list = new ArrayList<CartVO>();
      }else if(list!=null){
         for(int i = 0; i <list.size(); i++){
            if(list.get(i).getAname().equals(aname) && list.get(i).getAsize().equals(sr)){
               list.remove(list.get(i));
            }
         }
      }
      list.add(cartvo);    
     
      	Map map = new HashMap();
		map.put("articleNum", articleNum);
		map.put("Asize", sr);
		int count = orderDAO.orderProductCount(map);
		if(count > Amount){
			session.setAttribute("list",list);  
			if(Amount == 0)
			{
				writer.println("<script>alert('수량을 올바르게 입력해 주세요.');");
				writer.println("location.href = 'articleDetail?articleNum=" + articleNum + "'</script>");
	            writer.flush();
				return "articleDetail?articleNum="+articleNum;
			}
			 return "redirect:cartinsert";
		}
		else if (count < Amount)
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
   @RequestMapping("cartSelectDelete")
   public String deleteCart(HttpSession session, HttpServletRequest request)
   {
      
      int result = Integer.parseInt(request.getParameter("hiddenNum"));
      List<CartVO> list =  (List<CartVO>) session.getAttribute("list");
      
      list.remove(result);
      return "redirect:cartinsert";
   }
      @RequestMapping("cartinsert")//, method = RequestMethod.POST)
      public String add(){
         return "cartList";
      }
      @RequestMapping("cartCheck")//, method = RequestMethod.POST)
      public String cartCheck(@RequestParam String notChk,HttpSession session,HttpServletResponse response,HttpServletRequest req) throws IOException{
         response.setContentType("text/html; charset=UTF-8");
           req.setCharacterEncoding("UTF-8");
           PrintWriter writer = response.getWriter();
         String notChks[]=notChk.split(",");
         List<CartVO> list =  (List<CartVO>) session.getAttribute("list");
         
         for(int i = 0; i<list.size(); i++){
            Map map = new HashMap();
           // String size= list.get(i).getAsize().trim();
            map.put("articleNum", list.get(i).getArticleNum());
            map.put("Asize", list.get(i).getAsize());
            int count = orderDAO.orderProductCount(map);

            if(count > list.get(i).getAmount()){
               for(int s=0; s<notChks.length; s++){   
                     list.remove(Integer.parseInt(notChks[s]));
                   }
               return "articleOrderCart";
            }else{
               writer.println("<script>alert( '" + count + "이하로만 주문이 가능합니다.');");
                  writer.println("location.href = 'cartinsert'</script>");
                  writer.flush();
               return "redirect:cartinsert";
            }
         }
         
          session.setAttribute("list", list);
         return "articleOrderCart";
         
      }
      @RequestMapping("cartAllCheck")
      public String cartAllCheck(HttpSession session,CartVO cartVO,HttpServletResponse response,HttpServletRequest req) throws IOException{
          response.setContentType("text/html; charset=UTF-8");
           req.setCharacterEncoding("UTF-8");
           PrintWriter writer = response.getWriter();
         
           List<CartVO> list =  (List<CartVO>) session.getAttribute("list");
           for(int i = 0; i<list.size(); i++){
            Map map = new HashMap();
            //String size= list.get(i).getAsize().trim();
            map.put("articleNum", list.get(i).getArticleNum());
            map.put("Asize", list.get(i).getAsize());
            int count = orderDAO.orderProductCount(map);

            if(count > list.get(i).getAmount()){
               return "articleOrderCart";
            }else{
               writer.println("<script>alert( '" + count + "이하로만 주문이 가능합니다.');");
                  writer.println("location.href = 'cartinsert'</script>");
                  writer.flush();
               return "redirect:cartinsert";
            }
         }
         session.setAttribute("list", list);
         return "articleOrderCart";
      }
      
}