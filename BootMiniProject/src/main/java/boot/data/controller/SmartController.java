package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.dto.SmartDto;
import boot.data.service.SmartService;

@Controller
@RequestMapping("/smart")
public class SmartController {
	
	@Autowired
	SmartService service;

	@GetMapping("/form")
	public String form() {
		return "/smart/smartform";
	}
	
	@PostMapping("/insert")
	public String insertData(SmartDto dto) {
		service.insertShop(dto);
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();

		int totalCount=service.getTotalCount();
		
	      int totalPage; 
	      int startPage; 
	      int endPage; 
	      int start; 
	      int perPage=10; 
	      int perBlock=5; 
	           
	      //총 페이지 갯수
	      totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	      
	      //각 블럭의 시작 페이지 
	      startPage=(currentPage-1)/perBlock*perBlock+1;
	      endPage=startPage+perBlock-1;
	          
	      if(endPage>totalPage)
	         endPage=totalPage;
	       
	       //각 페이지에서 불러 올 시작번호
	       start=(currentPage-1)*perPage; 
	       
	       List<SmartDto> list=service.getShopList(start, perPage);
	       
	       int no=totalCount-(currentPage-1)*perPage;
	       
	       
	       //출력에 필요한 변수를 model에 저장
	       model.addObject("totalCount", totalCount);
	       model.addObject("list", list);
	       model.addObject("totalPage", totalPage);
	       model.addObject("startPage", startPage);
	       model.addObject("endPage", endPage);
	       model.addObject("perBlock", perBlock);
	       model.addObject("currentPage", currentPage);
	       model.addObject("no", no);
		
		model.addObject("totalCount", totalCount);
		
		model.setViewName("/smart/smartlist");
		return model;
	}
	
	@GetMapping("/detail")
	public ModelAndView getData(int num, int currentPage) {
		ModelAndView model=new ModelAndView();
		
		SmartDto dto= service.getData(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/smart/detail");
		return model;
	}
	
}
