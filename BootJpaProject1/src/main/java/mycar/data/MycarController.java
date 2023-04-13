package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/")
	public String index() {
		return "redirect:car/list";
	}
	
	@GetMapping("/car/carform")
	public String form() {
		return "mycar/caraddform";
	}
	
	//insert
	@PostMapping("/car/insert")
	public String insertData(@ModelAttribute MyCarDto dto) {
		dao.insertCar(dto);
		return "redirect:list";
	}
	
	@GetMapping("/car/list")
	public ModelAndView getData() {
		
		ModelAndView mview=new ModelAndView();
		
		List<MyCarDto>list=dao.getList();
		mview.addObject("list", list);
		mview.addObject("tCount", list.size());
		
		mview.setViewName("mycar/carlist");
		return mview;
	}
	
	//delete
	@GetMapping("/car/delete")
	public String deleteData(long num) {
		dao.deleteCar(num);
		
		return "redirect:list";
	}
	
	//updateform으로
	@GetMapping("/car/updateform")
	public String getData(long num, Model model) {
		MyCarDto dto=dao.getData(num);
		model.addAttribute("dto", dto);
		
		return "mycar/carupdateform";
	}
	
	//update
	@PostMapping("/car/update")
	public String updateData(MyCarDto dto) {
		dao.updateCar(dto);
		
		return "redirect:list";
	}
}
