package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop")
public class JpaShopController {
	
	@Autowired
	JpaShopDao dao;

	@GetMapping("/add")
	public String addForm() {
		return "jpashop/shopadd";
	}
	
	@PostMapping("/insert")
	public String insertData(JpaShopDto dto) {
		dao.insertData(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public ModelAndView getList() {
		
		ModelAndView model=new ModelAndView();
		
		List<JpaShopDto>list=dao.getAllDatas();
		model.addObject("list", list);
		
		model.setViewName("jpashop/list");
		return model;
	}
	
	@GetMapping("/content")
	public String detailPage(int num,Model model) {
		
		JpaShopDto dto=dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "jpashop/content";
	}
	
	@GetMapping("/updateform")
	public ModelAndView updateForm(int num) {
		
		ModelAndView model=new ModelAndView();
		
		JpaShopDto dto=dao.getData(num);
		model.addObject("dto", dto);
		
		model.setViewName("jpashop/shopupdate");
		return model;
	}
	
	@PostMapping("/update")
	public String updateData(JpaShopDto dto) {
		dao.updateData(dto);
		
		return "redirect:content?num="+dto.getNum();
	}
	
	@GetMapping("/delete")
	public String deleteData(int num) {

		dao.deleteData(num);
		
		return "redirect:list";
	}
}
