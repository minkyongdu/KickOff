package kickoff.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kickoff.model.DAO.CompanyDAO;
import kickoff.model.beans.CompanyVO;
import kickoff.model.beans.MemberVO;

@Controller
public class ComController {
	
	@Autowired
	private CompanyDAO companyDAO;
	
	// 회사 회원가입 폼
		@RequestMapping("comRegister")
		public String comRegiForm()
		{
			return "comRegister";
		}
		// 회사 회원가입 처리
		@RequestMapping("comResultregister")
		public String successcomReigster(CompanyVO company, HttpServletRequest request, Model model)
		{
			String combusinnum = request.getParameter("combusinnum1") + "-"
					+ request.getParameter("combusinnum2") + "-" + request.getParameter("combusinnum3");
			
			String comphonenum = request.getParameter("comphonenum1") + "-" 
					+ request.getParameter("comphonenum2") + "-" + request.getParameter("comphonenum3");
			
			String addr2 = request.getParameter("addr2") + " " + request.getParameter("addr3");
			
			String comemail = request.getParameter("comemail1") + request.getParameter("comemail2");
			
			company.setCombusinnum(combusinnum);
			company.setComphonenum(comphonenum);
			company.setComemail(comemail);
			company.setAddr2(addr2);
			
			if(companyDAO.insertCompany(company))
			{
				model.addAttribute("company" , company);
			}
			return "main";
		}
		// 회사 수정 전 아이디 체크 폼
			@RequestMapping("comPasswordCheckForm")
			public String pwdResultForm()
			{
				return "comPwdCheckForm";
			}
			// 회원 수정 전 아이디 체크
			@RequestMapping("comPasswordCheck")
			public String pwdResult(Model model, HttpServletRequest request, HttpServletResponse response, CompanyVO company) throws IOException
			{
				response.setContentType("text/html; charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				PrintWriter writer = response.getWriter();
				
				String id =  request.getParameter("id");
				String password = request.getParameter("password");
				Map<String, String> map = new HashMap<String, String>();
				map.put("id", id);
				map.put("password", password);
				if(companyDAO.certifyComID(map) == null)
					{
						writer.println("<script>alert('비밀번호가 올바르지 않습니다.');");
						writer.println("location.href='comPasswordCheckForm'; </script>");
						writer.flush();
						return "redirect:comPasswordCheckForm";
					}
				else
				{
					writer.println("<script>alert('인증되었습니다.');");
					writer.println("location.href='comupRegisterForm'; </script>");
					writer.flush();
					return "redirect:comupRegisterForm";
				}
			}
	
			// 회사 아이디 중복 체크
			@RequestMapping("comidCheck")
			public String comidResult(Model model, HttpServletRequest request)
			{
				String id = request.getParameter("id");
				boolean check = companyDAO.comidSearch(id);
				   if (check==false) { 
					   model.addAttribute("checkId", ""); 
			       } else { 
			    	   model.addAttribute("checkId", check);
			      } 
				return "comidCheck";
			}
			// 기업 회원 회원수정 폼
			@RequestMapping("comupRegisterForm")
			public String updateComRegiForm()
			{
				return "comUpRegister";
			}
			// 기업 회원 회원수정 처리
			@RequestMapping("comUpRegi")
			public String updateComRegi(HttpSession session, CompanyVO company, HttpServletRequest request)
			{
				String comphonenum = request.getParameter("comphonenum1") + "-"
							+ request.getParameter("comphonenum2") + "-" + request.getParameter("comphonenum3");
				
				String comemail = request.getParameter("comemail1") + "@"
						+ request.getParameter("comemail2");
				
				String addr2 = request.getParameter("addr2") + " " 
						+ request.getParameter("addr3");
				
				company.setComphonenum(comphonenum);
				company.setComemail(comemail);
				company.setAddr2(addr2);
				
				companyDAO.comidUpdate(company);
				session.removeAttribute("comLoginInfo");
				
				return "redirect:loginForm";
			}
	}
