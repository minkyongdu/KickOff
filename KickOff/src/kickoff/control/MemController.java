package kickoff.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kickoff.model.DAO.CompanyDAO;
import kickoff.model.DAO.LoginDAO;
import kickoff.model.DAO.MemberDAO;
import kickoff.model.DAO.PostDAO;
import kickoff.model.beans.CompanyVO;
import kickoff.model.beans.MemberVO;
import kickoff.model.beans.PostVO;

@Controller
public class MemController {

	@Autowired
	private MemberDAO dao;
	@Autowired
	private CompanyDAO comdao;
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private PostDAO postDAO;

	private static final Logger logger = LoggerFactory.getLogger(MemController.class);

	// 회원가입 폼 띄우기
	@RequestMapping("register")
	public String openRgister() {
		return "memRegister";
	}

	// 회원가입 폼 : 생년월일 + 연락처 처리 + 회원가입 처리
	@RequestMapping("resultRegister")
	public String successReigster(MemberVO member, HttpServletRequest request, Model model) {
		String phone = request.getParameter("phonenum1") + "-" + request.getParameter("phonenum2") + "-"
				+ request.getParameter("phonenum3");

		String birth = request.getParameter("year") + "-" + request.getParameter("month") + "-"
				+ request.getParameter("day");

		String email = request.getParameter("email1") + request.getParameter("email2");

		String addr2 = request.getParameter("addr2") + " " + request.getParameter("addr3");

		member.setPhonenum(phone);
		member.setBirthday(birth);
		member.setEmail(email);
		member.setAddr2(addr2);

		if (dao.meminsert(member)) {
			model.addAttribute("success", member);
		}
		return "main";
	}

	// 로그인 폼 처리
	@RequestMapping("loginForm")
	public String loginForm() {
		return "Login";
	}

	// 로그인 처리
	@RequestMapping(value = "loginProcess", method = RequestMethod.POST)
	public String loginProcess(MemberVO member, CompanyVO company, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String[] selectmember = request.getParameterValues("selectDIV");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		if (selectmember[0].equals("member")) {
			MemberVO loginUser = loginDAO.findByUserIdAndPassword(member.getId(), member.getPassword());
			// select한후 member의 모든 값을 loginUser에 저장함
			if (loginUser != null) {
				// 세션저장
				session.setAttribute("userLoginInfo", loginUser);
				return "redirect:main";
			} else {
				writer.println("<script>alert('" + "아이디가 존재하지 않거나, 비밀번호가 다릅니다." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
		} else if (selectmember[0].equals("company")) {
			CompanyVO comloginUser = loginDAO.findByComUserIdAndPassword(company.getId(), company.getPassword());
			// select한후 member의 모든 값을 loginUser에 저장함
			if (comloginUser != null) {
				// 세션저장
				session.setAttribute("comLoginInfo", comloginUser);
				return "redirect:main";
			}

			else {
				writer.println("<script>alert('" + "아이디가 존재하지 않거나, 비밀번호가 다릅니다." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
		} else {
			return "redirect:loginForm";
		}

	}

	// 로그아웃 처리
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("userLoginInfo") != null) {
			session.removeAttribute("userLoginInfo");
		} else if (session.getAttribute("comLoginInfo") != null) {
			session.removeAttribute("comLoginInfo");
		}
		return "redirect:loginForm";
	}
	// 회원 수정 전 아이디 체크 폼
	@RequestMapping("memPasswordCheckForm")
	public String pwdResultForm()
	{
		return "memPwdCheckForm";
	}
	// 회원 수정 전 아이디 체크
	@RequestMapping("memPasswordCheck")
	public String pwdResult(Model model, HttpServletRequest request, HttpServletResponse response, MemberVO member) throws IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		String id =  request.getParameter("id");
		String password = request.getParameter("password");
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		if(dao.certifyID(map) == null)
			{
				writer.println("<script>alert('비밀번호가 올바르지 않습니다.');");
				writer.println("location.href='memPasswordCheckForm'; </script>");
				writer.flush();
				return "redirect:memPasswordCheckForm";
			}
		else
		{
			writer.println("<script>alert('인증되었습니다.');");
			writer.println("location.href='upRegisterForm'; </script>");
			writer.flush();
			return "redirect:upRegisterForm";
		}
	}
	// ID 체크 결과 폼 띄우기
	@RequestMapping("memIDCheck")
	public String idResult(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String resultMessage = "";
		if (id.equals("")) {
			resultMessage = "아이디를 입력하지 않으셨습니다.";
		} else if (id.length() < 7) {
			resultMessage = "아이디를 7글자 이상 작성해 주세요.";
		} else {
			boolean check = dao.idSearch(id);
			if (check) {
				resultMessage = "아이디가 존재합니다.";
			} else {
				resultMessage = "사용할 수 있는 ID입니다.";
			}
		}
		model.addAttribute("resultChecks", resultMessage);
		return "memIDCheck";
	}

	// 우편번호 검색폼
	@RequestMapping(value = "post", method = RequestMethod.GET)
	public String postForm() {
		return "post";
	}

	// 우편번호 처리폼
	@RequestMapping(value = "post", method = RequestMethod.POST)
	public ModelAndView post(Locale locale, HttpServletRequest request,
			@RequestParam(value = "address", required = false) String address) {

		logger.info("Post page", locale);
		logger.info("post page value :" + address, locale);

		ModelAndView result = new ModelAndView();
		if (address != "") {
			List<PostVO> postList = postDAO.getPost(address);

			result.addObject("result", postList);
			result.setViewName("post");
			logger.info("search success", locale);
			return result;

		} else {
			result.addObject("nullResult", "검색해주세요.");
			result.setViewName("post");
			return result;
		}
	}

	// 회원정보 수정폼 처리
	@RequestMapping("upRegisterForm")
	public String updateResult() {
		return "memUpRegister";
	}

	// 회원정보 수정
	@RequestMapping("upRegister")
	public String updateRegister(MemberVO member, HttpServletRequest request, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		String phone = request.getParameter("phonenum1") + "-" + request.getParameter("phonenum2") + "-"
				+ request.getParameter("phonenum3");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		member.setPhonenum(phone);
		member.setEmail(email);
		dao.updateMember(member);
		session.removeAttribute("userLoginInfo");
		return "redirect:loginForm";
	}

	// 아이디 & 비밀번호 찾기 폼
	@RequestMapping("findIdPwd")
	public String idAccounts() {
		return "findIdPwd";
	}

	// 아이디 찾기 처리
	@RequestMapping("IDfindhandel")
	public String findID(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			String name = request.getParameter("name");
			String email = request.getParameter("email");

			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("email", email);
			if (dao.accountsId(map) == null) {
				writer.println("<script>alert('회원정보가 없거나 아이디와 이메일을 올바르게 입력해주세요.');</script>");
				writer.flush();
				return "findIdPwd";
			} 
			else {
				writer.println("<script>alert('" + "회원님의 아이디는 " + dao.accountsId(map) + " 입니다." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
	}

	// 비밀번호 찾기 처리
	@RequestMapping("passwordfindhandel")
	public String findPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
			String id = request.getParameter("id");
			String pwdQ = request.getParameter("pwdQ");
			String pwdA = request.getParameter("pwdA");

			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwdQ", pwdQ);
			map.put("pwdA", pwdA);
			if (dao.accountsPwd(map) == null) {
				writer.println("<script>alert('아이디가 없거나 비밀번호 질문과 답변을 올바르게 입력해주세요.');</script>");
				writer.flush();
				return "findIdPwd";
			} else {
				writer.println("<script>alert('" + "회원님의 비밀번호는 " + dao.accountsPwd(map) + " 입니다." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
	}
}
