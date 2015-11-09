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

	// ȸ������ �� ����
	@RequestMapping("register")
	public String openRgister() {
		return "memRegister";
	}

	// ȸ������ �� : ������� + ����ó ó�� + ȸ������ ó��
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

	// �α��� �� ó��
	@RequestMapping("loginForm")
	public String loginForm() {
		return "Login";
	}

	// �α��� ó��
	@RequestMapping(value = "loginProcess", method = RequestMethod.POST)
	public String loginProcess(MemberVO member, CompanyVO company, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String[] selectmember = request.getParameterValues("selectDIV");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		if (selectmember[0].equals("member")) {
			MemberVO loginUser = loginDAO.findByUserIdAndPassword(member.getId(), member.getPassword());
			// select���� member�� ��� ���� loginUser�� ������
			if (loginUser != null) {
				// ��������
				session.setAttribute("userLoginInfo", loginUser);
				return "redirect:main";
			} else {
				writer.println("<script>alert('" + "���̵� �������� �ʰų�, ��й�ȣ�� �ٸ��ϴ�." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
		} else if (selectmember[0].equals("company")) {
			CompanyVO comloginUser = loginDAO.findByComUserIdAndPassword(company.getId(), company.getPassword());
			// select���� member�� ��� ���� loginUser�� ������
			if (comloginUser != null) {
				// ��������
				session.setAttribute("comLoginInfo", comloginUser);
				return "redirect:main";
			}

			else {
				writer.println("<script>alert('" + "���̵� �������� �ʰų�, ��й�ȣ�� �ٸ��ϴ�." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
		} else {
			return "redirect:loginForm";
		}

	}

	// �α׾ƿ� ó��
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("userLoginInfo") != null) {
			session.removeAttribute("userLoginInfo");
		} else if (session.getAttribute("comLoginInfo") != null) {
			session.removeAttribute("comLoginInfo");
		}
		return "redirect:loginForm";
	}
	// ȸ�� ���� �� ���̵� üũ ��
	@RequestMapping("memPasswordCheckForm")
	public String pwdResultForm()
	{
		return "memPwdCheckForm";
	}
	// ȸ�� ���� �� ���̵� üũ
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
				writer.println("<script>alert('��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');");
				writer.println("location.href='memPasswordCheckForm'; </script>");
				writer.flush();
				return "redirect:memPasswordCheckForm";
			}
		else
		{
			writer.println("<script>alert('�����Ǿ����ϴ�.');");
			writer.println("location.href='upRegisterForm'; </script>");
			writer.flush();
			return "redirect:upRegisterForm";
		}
	}
	// ID üũ ��� �� ����
	@RequestMapping("memIDCheck")
	public String idResult(Model model, HttpServletRequest request) {
		String id = request.getParameter("id");
		String resultMessage = "";
		if (id.equals("")) {
			resultMessage = "���̵� �Է����� �����̽��ϴ�.";
		} else if (id.length() < 7) {
			resultMessage = "���̵� 7���� �̻� �ۼ��� �ּ���.";
		} else {
			boolean check = dao.idSearch(id);
			if (check) {
				resultMessage = "���̵� �����մϴ�.";
			} else {
				resultMessage = "����� �� �ִ� ID�Դϴ�.";
			}
		}
		model.addAttribute("resultChecks", resultMessage);
		return "memIDCheck";
	}

	// �����ȣ �˻���
	@RequestMapping(value = "post", method = RequestMethod.GET)
	public String postForm() {
		return "post";
	}

	// �����ȣ ó����
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
			result.addObject("nullResult", "�˻����ּ���.");
			result.setViewName("post");
			return result;
		}
	}

	// ȸ������ ������ ó��
	@RequestMapping("upRegisterForm")
	public String updateResult() {
		return "memUpRegister";
	}

	// ȸ������ ����
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

	// ���̵� & ��й�ȣ ã�� ��
	@RequestMapping("findIdPwd")
	public String idAccounts() {
		return "findIdPwd";
	}

	// ���̵� ã�� ó��
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
				writer.println("<script>alert('ȸ�������� ���ų� ���̵�� �̸����� �ùٸ��� �Է����ּ���.');</script>");
				writer.flush();
				return "findIdPwd";
			} 
			else {
				writer.println("<script>alert('" + "ȸ������ ���̵�� " + dao.accountsId(map) + " �Դϴ�." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
	}

	// ��й�ȣ ã�� ó��
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
				writer.println("<script>alert('���̵� ���ų� ��й�ȣ ������ �亯�� �ùٸ��� �Է����ּ���.');</script>");
				writer.flush();
				return "findIdPwd";
			} else {
				writer.println("<script>alert('" + "ȸ������ ��й�ȣ�� " + dao.accountsPwd(map) + " �Դϴ�." + "');");
				writer.println("location.href='loginForm'" + "</script>");
				writer.flush();
				return "redirect:loginForm";
			}
	}
}
