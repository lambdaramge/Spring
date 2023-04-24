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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardDto;
import boot.data.service.BoardService;
import boot.data.service.MemberService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mservice;

	@GetMapping("/board/list")
	public ModelAndView lst(@RequestParam(value = "currentPage",defaultValue = "1") int currentPage) {
		
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
	       
	       List<BoardDto> list=service.getList(start, perPage);
	       
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
		
		model.setViewName("/board/boardlist");
		return model;
	}
	
	@GetMapping("/board/form")
	public String form() {
		return "/board/writeform";
	}
	
	@PostMapping("/board/insert")
	public String insertData(BoardDto dto,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/photo");	
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//업로드 안한경우
		if(dto.getUpload().getOriginalFilename().equals("")) {
			dto.setUploadfile("no");
		}else {
			//업로드 한경우
			
			String uploadfile="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			
			dto.setUploadfile(uploadfile);
			
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 id 얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//memberservice에서 이름 얻어서 dto에 저장
		String name=mservice.getName(myid);
		dto.setName(name);
		
		service.insertBoard(dto);
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/board/content")
	public ModelAndView content(String num,
			@RequestParam(defaultValue = "1") int currentPage) {
		
		ModelAndView model=new ModelAndView();
		
		BoardDto dto=service.getData(num);
		
		//업로드파일의 확장자
		int dotLoc=dto.getUploadfile().lastIndexOf('.'); //마지막 .의 위치
		String ext=dto.getUploadfile().substring(dotLoc+1); //.의 다음글자부터 끝까지 추출
		
		//System.out.println(dotLoc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg") || ext.equalsIgnoreCase("gif")
				|| ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpeg")) {
			model.addObject("bupload", true);
		}else {
			model.addObject("bupload", false);
		}
		
		service.updatereadcount(num);
		
		model.addObject("dto", dto);
		model.addObject("currentPage", currentPage);
		
		model.setViewName("/board/content");
		return model;
	}
}
