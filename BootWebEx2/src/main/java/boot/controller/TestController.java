package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", "최보현");
		model.addObject("addr", "관악");
		model.addObject("hp", "010-2343-3445");
		
		model.setViewName("redirect:sist/home");
		return model;
	}
}
