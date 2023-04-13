package boot.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.model.PersonDto;

@Controller
@RequestMapping("/sist")
public class FormController {
	
	@GetMapping("/form1")
	public String form1() {
		return "form/form1";
	}
	
	@GetMapping("/form2")
	public String form2() {
		return "form/form2";
	}
	
	@GetMapping("/form3")
	public String form3() {
		return "form/form3";
	}
	
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam int java,
			@RequestParam int spring) {
		
		ModelAndView model=new ModelAndView();
		
		model.addObject("name", name);
		model.addObject("java", java);
		model.addObject("spring", spring);
		model.addObject("tot", java+spring);
		model.addObject("avg", (java+spring)/2.0);
		
		model.setViewName("result/result1");
		return model;
	}
	
	@PostMapping("/read2")
	public String read2(@ModelAttribute PersonDto dto) {
		
		return "result/result2";
	}
	
	@PostMapping("/read3")
	//map으로 읽을 경우 폼의 name값이 key, 입력값이 value값으로 저장
	public ModelAndView read3(@RequestParam Map<String, String> map){
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", map.get("name"));
		mview.addObject("blood", map.get("blood"));
		mview.addObject("hp", map.get("hp"));
		
		mview.setViewName("result/result3");
		return mview;
	}
}
