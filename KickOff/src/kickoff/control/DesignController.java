package kickoff.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kickoff.model.DAO.ArticleDAO;
import kickoff.model.beans.ArticleVO;

@Controller
public class DesignController {
	@Autowired
	private ArticleDAO articleDAO;
	
	//메인
	@RequestMapping("")
	public String mainHome(Model model)
	{
		List<ArticleVO> list = articleDAO.mainArticleList();
		model.addAttribute("NewArticleList", list);
		return "main";
	}
	//메인 헤더
	@RequestMapping("header")
	public String header()
	{
		return "main/header";
	}
	//회원가입 선택 폼
	@RequestMapping("selectRegister")
	public String selectRegister()
	{
		return "selectRegister";
	}
	// 일반회원 약관
	@RequestMapping("regterm")
	public String regterm()
	{
		return "regterm";
	}
	// 기업회원 약관
	@RequestMapping("comregterm")
	public String comregterm()
	{
		return "comregterm";
	}
}