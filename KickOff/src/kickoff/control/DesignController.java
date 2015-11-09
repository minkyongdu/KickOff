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
	
	//����
	@RequestMapping("main")
	public String mainHome(Model model)
	{
		List<ArticleVO> list = articleDAO.mainArticleList();
		model.addAttribute("NewArticleList", list);
		return "main";
	}
	//���� ���
	@RequestMapping("header")
	public String header()
	{
		return "main/header";
	}
	//ȸ������ ���� ��
	@RequestMapping("selectRegister")
	public String selectRegister()
	{
		return "selectRegister";
	}
	// �Ϲ�ȸ�� ���
	@RequestMapping("regterm")
	public String regterm()
	{
		return "regterm";
	}
	// ���ȸ�� ���
	@RequestMapping("comregterm")
	public String comregterm()
	{
		return "comregterm";
	}
}
