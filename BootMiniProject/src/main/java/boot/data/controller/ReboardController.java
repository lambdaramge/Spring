package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
public class ReboardController {

	@Autowired
	ReboardService service;
	
	@GetMapping("/reboard/list")
	public ModelAndView l(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc, 
			@RequestParam(value = "searchword",required = false) String sw) {
		
		ModelAndView model=new ModelAndView();
		
		int totalCount=service.getTotalCount(sc, sw);

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
	       
	       List<ReboardDto> list=service.getPagingList(sc, sw, start, perPage);
	       
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
		
		model.setViewName("/reboard/list");
		return model;
	}
	
	@GetMapping("/reboard/write")
	public String form(@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model
			) {
		
		//답글일 때 넘어오는 값, 새글일 때는 모두 null이므로 defaultValue값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		//제목에 새글일 경우 "",답글일 경우 해당 제목을 넣어보자
		String subject="";
		
		if(num>0) {
			subject=service.getData(num).getSubject();
		}
		model.addAttribute("subject", subject);
		
		return "/reboard/writeform";
	}
	
	@PostMapping("/reboard/insert")
	public String insert(ReboardDto dto,
			ArrayList<MultipartFile> upload,
			HttpSession session,
			int currentPage) {
		
		String path=session.getServletContext().getRealPath("/photo");
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			dto.setPhoto("no");
		}else {
			String photo="";
			int idx=1;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile multi:upload) {
				String newName=idx++ +"_"+sdf.format(new Date())+multi.getOriginalFilename();
				photo+=newName+",";
				
				try {
					multi.transferTo(new File(path+"\\"+newName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			photo=photo.substring(0,photo.length()-1);
			
			dto.setPhoto(photo);
		}
		
		service.insertReboard(dto);
		
		return "redirect:list?currentPage="+currentPage;
	}
}
